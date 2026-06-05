import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants/app_constants.dart';
import '../../../core/router/app_router.dart';
import '../../../core/theme/responsive.dart';

class _Page {
  const _Page(this.icon, this.title, this.body);
  final IconData icon;
  final String title;
  final String body;
}

const _pages = [
  _Page(Icons.qr_code_scanner_rounded, 'Scan in seconds',
      'Point your camera at a barcode and we identify the product instantly.'),
  _Page(Icons.document_scanner_outlined, 'Read the expiry date',
      'Scan the printed date — our India-first parser handles MFG + best-before too.'),
  _Page(Icons.notifications_active_outlined, 'Never miss an expiry',
      'Get reminders 7 days, 2 days, and on the day an item expires.'),
  _Page(Icons.eco_rounded, 'Waste less food',
      'Track your whole kitchen in one place and use things before they spoil.'),
];

class OnboardingScreen extends ConsumerStatefulWidget {
  const OnboardingScreen({super.key});
  @override
  ConsumerState<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends ConsumerState<OnboardingScreen> {
  final _controller = PageController();
  int _index = 0;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _finish() async {
    await markOnboardingSeen();
    ref.read(onboardingSeenProvider.notifier).state = true;
    if (mounted) context.go('/login');
  }

  @override
  Widget build(BuildContext context) {
    final isLast = _index == _pages.length - 1;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: _finish,
                child: const Text('Skip'),
              ),
            ),
            Expanded(
              child: PageView.builder(
                controller: _controller,
                itemCount: _pages.length,
                onPageChanged: (i) => setState(() => _index = i),
                itemBuilder: (_, i) {
                  final p = _pages[i];
                  final iconSize = Responsive.isSmallDevice ? 48.0 : 72.0;
                  final iconPad = Responsive.isSmallDevice ? 18.0 : 28.0;
                  return Padding(
                    padding: EdgeInsets.all(Responsive.isSmallDevice ? AppSpacing.md : AppSpacing.xl),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.all(iconPad),
                          decoration: BoxDecoration(
                            color: AppColors.primary.withValues(alpha: 0.10),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(p.icon,
                              size: iconSize, color: AppColors.primary),
                        ),
                        SizedBox(height: Responsive.isSmallDevice ? AppSpacing.md : AppSpacing.xl),
                        Text(p.title,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: Responsive.fontSize(22),
                                fontWeight: FontWeight.w800)),
                        const SizedBox(height: AppSpacing.md),
                        Text(p.body,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: Responsive.fontSize(15),
                                color: Theme.of(context).colorScheme.onSurfaceVariant,
                                height: 1.4)),
                      ],
                    ),
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(_pages.length, (i) {
                final active = i == _index;
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 250),
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: active ? 24 : 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: active
                        ? AppColors.primary
                        : AppColors.primary.withValues(alpha: 0.25),
                    borderRadius: BorderRadius.circular(4),
                  ),
                );
              }),
            ),
            Padding(
              padding: const EdgeInsets.all(AppSpacing.lg),
              child: FilledButton(
                onPressed: () {
                  if (isLast) {
                    _finish();
                  } else {
                    _controller.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeOut,
                    );
                  }
                },
                child: Text(isLast ? 'Get started' : 'Next'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
