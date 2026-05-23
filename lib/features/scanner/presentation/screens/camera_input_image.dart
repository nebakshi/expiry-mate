import 'dart:io' show Platform;
import 'dart:ui' show Size;

import 'package:camera/camera.dart';
import 'package:flutter/services.dart' show DeviceOrientation;
import 'package:google_mlkit_commons/google_mlkit_commons.dart';

/// Image format group that yields ML-Kit-compatible frames per platform.
final ImageFormatGroup defaultImageFormatGroup =
    Platform.isAndroid ? ImageFormatGroup.nv21 : ImageFormatGroup.bgra8888;

const _orientations = {
  DeviceOrientation.portraitUp: 0,
  DeviceOrientation.landscapeLeft: 90,
  DeviceOrientation.portraitDown: 180,
  DeviceOrientation.landscapeRight: 270,
};

/// Converts a [CameraImage] streamed frame into an ML Kit [InputImage].
/// Returns null when the frame format is unsupported.
InputImage? inputImageFromCameraImage(
  CameraImage image,
  CameraDescription camera,
) {
  final sensorOrientation = camera.sensorOrientation;
  InputImageRotation? rotation;

  if (Platform.isIOS) {
    rotation = InputImageRotationValue.fromRawValue(sensorOrientation);
  } else if (Platform.isAndroid) {
    var rotationCompensation =
        _orientations[DeviceOrientation.portraitUp] ?? 0;
    if (camera.lensDirection == CameraLensDirection.front) {
      rotationCompensation =
          (sensorOrientation + rotationCompensation) % 360;
    } else {
      rotationCompensation =
          (sensorOrientation - rotationCompensation + 360) % 360;
    }
    rotation = InputImageRotationValue.fromRawValue(rotationCompensation);
  }
  if (rotation == null) return null;

  final format = InputImageFormatValue.fromRawValue(image.format.raw);
  if (format == null) return null;

  // Android NV21 and iOS BGRA produce a single contiguous plane we can use.
  if (image.planes.isEmpty) return null;
  final plane = image.planes.first;

  return InputImage.fromBytes(
    bytes: plane.bytes,
    metadata: InputImageMetadata(
      size: Size(image.width.toDouble(), image.height.toDouble()),
      rotation: rotation,
      format: format,
      bytesPerRow: plane.bytesPerRow,
    ),
  );
}
