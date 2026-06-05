import 'package:flutter/material.dart';
import 'responsive.dart';

/// Named text styles scaled via [Responsive].
/// Usage: `AppTypography.h1` or `AppTypography.body`
class AppTypography {
  AppTypography._();

  static TextStyle get h1 => TextStyle(
        fontSize: Responsive.fontSize(28),
        fontWeight: FontWeight.w700,
        height: 1.3,
      );

  static TextStyle get h2 => TextStyle(
        fontSize: Responsive.fontSize(22),
        fontWeight: FontWeight.w700,
        height: 1.35,
      );

  static TextStyle get h3 => TextStyle(
        fontSize: Responsive.fontSize(18),
        fontWeight: FontWeight.w600,
        height: 1.4,
      );

  static TextStyle get body => TextStyle(
        fontSize: Responsive.fontSize(16),
        fontWeight: FontWeight.w400,
        height: 1.5,
      );

  static TextStyle get bodySmall => TextStyle(
        fontSize: Responsive.fontSize(14),
        fontWeight: FontWeight.w400,
        height: 1.45,
      );

  static TextStyle get caption => TextStyle(
        fontSize: Responsive.fontSize(12),
        fontWeight: FontWeight.w500,
        height: 1.35,
      );

  static TextStyle get button => TextStyle(
        fontSize: Responsive.fontSize(16),
        fontWeight: FontWeight.w600,
        height: 1.5,
      );

  static TextStyle get label => TextStyle(
        fontSize: Responsive.fontSize(12),
        fontWeight: FontWeight.w700,
        letterSpacing: 0.6,
        height: 1.35,
      );

  static TextStyle get stat => TextStyle(
        fontSize: Responsive.fontSize(22),
        fontWeight: FontWeight.w800,
        height: 1.2,
      );
}
