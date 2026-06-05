import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_mlkit_barcode_scanning/google_mlkit_barcode_scanning.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/errors/failures.dart';
import '../../../../shared/models/product_draft.dart';
import '../../../../shared/widgets/common_widgets.dart';
import '../../../product/domain/entities/product_enums.dart';
import '../scanner_providers.dart';
import 'camera_input_image.dart';

class ScanBarcodeScreen extends ConsumerStatefulWidget {
  const ScanBarcodeScreen({super.key});
  @override
  ConsumerState<ScanBarcodeScreen> createState() => _ScanBarcodeScreenState();
}

class _ScanBarcodeScreenState extends ConsumerState<ScanBarcodeScreen> {
  CameraController? _camera;
  bool _initializing = true;
  bool _busy = false;
  bool _processingFrame = false;
  String? _error;
  DateTime _lastScan = DateTime.fromMillisecondsSinceEpoch(0);

  @override
  void initState() {
    super.initState();
    _setup();
  }

  Future<void> _setup() async {
    try {
      final cameras = await availableCameras();
      final back = cameras.firstWhere(
        (c) => c.lensDirection == CameraLensDirection.back,
        orElse: () => cameras.first,
      );
      final controller = CameraController(
        back,
        ResolutionPreset.high,
        enableAudio: false,
        imageFormatGroup: defaultImageFormatGroup,
      );
      await controller.initialize();
      if (!mounted) return;
      setState(() {
        _camera = controller;
        _initializing = false;
      });
      // Debounced live stream scanning.
      await controller.startImageStream(_onFrame);
    } catch (_) {
      if (mounted) {
        setState(() {
          _initializing = false;
          _error = 'Camera unavailable. Check permissions or enter manually.';
        });
      }
    }
  }

  Future<void> _onFrame(CameraImage image) async {
    if (_processingFrame || _busy || _camera == null) return;
    // Debounce: at most ~3 frames/sec (PLAN §performance).
    if (DateTime.now().difference(_lastScan).inMilliseconds < 350) return;
    _processingFrame = true;
    _lastScan = DateTime.now();
    try {
      final input = inputImageFromCameraImage(image, _camera!.description);
      if (input == null) return;
      final barcode = await ref.read(barcodeScannerServiceProvider).scan(input);
      if (barcode != null && mounted && !_busy) {
        await _handleBarcode(barcode);
      }
    } catch (_) {
      // ignore individual frame failures
    } finally {
      _processingFrame = false;
    }
  }

  Future<void> _handleBarcode(String barcode) async {
    setState(() => _busy = true);
    await _camera?.stopImageStream();

    final res = await ref.read(productLookupServiceProvider).lookup(barcode);
    if (!mounted) return;

    late ProductDraft draft;
    switch (res) {
      case Success(:final value):
        draft = ProductDraft(
          barcode: value.barcode,
          productName: value.productName,
          brand: value.brand,
          imageUrl: value.imageUrl,
          category: value.category,
          parsedBy: 'API',
          lookupSource: value.source,
        );
      case Err(:final failure):
        // Not found / offline → still proceed, user enters name (PLAN §16).
        draft = ProductDraft(barcode: barcode, category: ProductCategory.other);
        if (failure is NetworkFailure) {
          showError(context, failure.message);
        }
    }
    context.pushReplacement('/scan-expiry', extra: draft);
  }

  Future<void> _enterManually() async {
    await _camera?.stopImageStream();
    if (mounted) {
      context.pushReplacement('/scan-expiry', extra: ProductDraft.empty());
    }
  }

  @override
  void dispose() {
    _camera?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.white,
        title: const Text('Scan barcode',
            style: TextStyle(color: Colors.white)),
        actions: [
          TextButton(
            onPressed: _enterManually,
            child: const Text('Enter manually',
                style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
      extendBodyBehindAppBar: true,
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    if (_initializing) {
      return const Center(
          child: CircularProgressIndicator(color: Colors.white));
    }
    if (_error != null || _camera == null) {
      return ErrorView(
        message: _error ?? 'Camera unavailable.',
        onRetry: _enterManually,
      );
    }
    return Stack(
      fit: StackFit.expand,
      children: [
        CameraPreview(_camera!),
        const _ScannerOverlay(),
        if (_busy)
          Container(
            color: Colors.black54,
            child: const Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircularProgressIndicator(color: Colors.white),
                  SizedBox(height: 16),
                  Text('Looking up product…',
                      style: TextStyle(color: Colors.white)),
                ],
              ),
            ),
          ),
        Positioned(
          bottom: 40,
          left: 0,
          right: 0,
          child: Center(
            child: Container(
              padding: const EdgeInsets.symmetric(
                  horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.black54,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Text(
                'Point at a product barcode',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _ScannerOverlay extends StatelessWidget {
  const _ScannerOverlay();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final overlayWidth = size.width * 0.72;
    final overlayHeight = overlayWidth * 0.64;
    return Center(
      child: Container(
        width: overlayWidth,
        height: overlayHeight,
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.accent, width: 3),
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}
