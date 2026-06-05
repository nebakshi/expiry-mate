import 'responsive.dart';

/// Scaled spacing tokens.
/// All values auto-scale based on device width via [Responsive].
class AppSpacing {
  AppSpacing._();

  static double get xs => Responsive.spacing(4);
  static double get sm => Responsive.spacing(8);
  static double get md => Responsive.spacing(16);
  static double get lg => Responsive.spacing(24);
  static double get xl => Responsive.spacing(32);
  static double get xxl => Responsive.spacing(48);
}

/// Border radius presets (not scaled — radii stay consistent across devices).
class AppRadius {
  AppRadius._();

  static const double sm = 8;
  static const double md = 12;
  static const double lg = 16;
  static const double xl = 24;
  static const double full = 999;
}
