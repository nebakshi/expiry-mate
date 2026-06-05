import 'dart:ui' as ui;

import 'package:flutter/widgets.dart';

/// Responsive scaling utilities inspired by NoQ's responsive.ts.
/// Scales fonts and spacing relative to a base design width of 375 (iPhone SE/X).
class Responsive {
  Responsive._();

  static const double _baseWidth = 375;
  static const double _baseHeight = 812;

  static double get _screenWidth {
    final view = ui.PlatformDispatcher.instance.implicitView;
    if (view == null) return _baseWidth;
    return view.physicalSize.width / view.devicePixelRatio;
  }

  static double get _screenHeight {
    final view = ui.PlatformDispatcher.instance.implicitView;
    if (view == null) return _baseHeight;
    return view.physicalSize.height / view.devicePixelRatio;
  }

  static double get _widthScale => _screenWidth / _baseWidth;

  /// Scale a spacing/padding value proportionally to screen width.
  static double spacing(double value) => value * _widthScale;

  /// Scale font size with clamping to prevent extremes.
  /// Clamps between 85% and 130% of the design size.
  static double fontSize(double size) {
    final scaled = size * _widthScale;
    final max = size * 1.3;
    final min = size * 0.85;
    return scaled.clamp(min, max);
  }

  /// Width percentage — percentage of screen width.
  static double wp(double percentage) => _screenWidth * percentage / 100;

  /// Height percentage — percentage of screen height.
  static double hp(double percentage) => _screenHeight * percentage / 100;

  static bool get isSmallDevice => _screenWidth < 375;
  static bool get isMediumDevice => _screenWidth >= 375 && _screenWidth <= 414;
  static bool get isLargeDevice => _screenWidth > 414;
}
