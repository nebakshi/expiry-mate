import 'package:flutter/material.dart';

/// Semantic color tokens for light and dark themes.
/// Inspired by NoQ's structured color system — every widget reads from these
/// tokens so dark mode works automatically via Theme.of(context).
class AppLightColors {
  AppLightColors._();

  // Brand
  static const Color primary = Color(0xFF1B8A5A);
  static const Color primaryLight = Color(0xFF2EAD71);
  static const Color primaryDark = Color(0xFF14633F);
  static const Color accent = Color(0xFFFFB300);

  // Backgrounds
  static const Color background = Color(0xFFF7F9F8);
  static const Color surface = Color(0xFFFFFFFF);
  static const Color elevated = Color(0xFFFAFBFA);

  // Typography
  static const Color textPrimary = Color(0xFF1A1D1B);
  static const Color textSecondary = Color(0xFF5E6562);
  static const Color textMuted = Color(0xFF8B9590);

  // Borders
  static const Color border = Color(0xFFE3E8E5);
  static const Color divider = Color(0xFFD4DAD7);

  // Status (product expiry states)
  static const Color fresh = Color(0xFF2E9E5B);
  static const Color expiringSoon = Color(0xFFF59E0B);
  static const Color expired = Color(0xFFE03E36);
  static const Color consumed = Color(0xFF8A8F98);

  // Feedback
  static const Color success = Color(0xFF2E9E5B);
  static const Color warning = Color(0xFFF59E0B);
  static const Color error = Color(0xFFE03E36);
  static const Color info = Color(0xFF4A90E2);

  // Component-specific
  static const Color card = Color(0xFFFFFFFF);
  static const Color shimmer = Color(0xFFE3E8E5);
  static const Color shadow = Color(0x1A1B8A5A);
}

class AppDarkColors {
  AppDarkColors._();

  // Brand
  static const Color primary = Color(0xFF4ADE80);
  static const Color primaryLight = Color(0xFF6EE7A0);
  static const Color primaryDark = Color(0xFF22C55E);
  static const Color accent = Color(0xFFFFD54F);

  // Backgrounds
  static const Color background = Color(0xFF0F1512);
  static const Color surface = Color(0xFF1A2320);
  static const Color elevated = Color(0xFF223330);

  // Typography
  static const Color textPrimary = Color(0xFFF1F7F4);
  static const Color textSecondary = Color(0xFFA8B5B0);
  static const Color textMuted = Color(0xFF6B7E78);

  // Borders
  static const Color border = Color(0xFF2D3D38);
  static const Color divider = Color(0xFF3A4D47);

  // Status (product expiry states)
  static const Color fresh = Color(0xFF4ADE80);
  static const Color expiringSoon = Color(0xFFFBBF24);
  static const Color expired = Color(0xFFFF6B6B);
  static const Color consumed = Color(0xFF6B7E78);

  // Feedback
  static const Color success = Color(0xFF4ADE80);
  static const Color warning = Color(0xFFFBBF24);
  static const Color error = Color(0xFFFF6B6B);
  static const Color info = Color(0xFF60A5FA);

  // Component-specific
  static const Color card = Color(0xFF1A2320);
  static const Color shimmer = Color(0xFF2D3D38);
  static const Color shadow = Color(0x40000000);
}

/// Runtime-resolved color set.
/// Accessed via `AppColors.of(context)` or through the ThemeExtension.
@immutable
class AppColorsData extends ThemeExtension<AppColorsData> {
  const AppColorsData({
    required this.primary,
    required this.primaryLight,
    required this.primaryDark,
    required this.accent,
    required this.background,
    required this.surface,
    required this.elevated,
    required this.textPrimary,
    required this.textSecondary,
    required this.textMuted,
    required this.border,
    required this.divider,
    required this.fresh,
    required this.expiringSoon,
    required this.expired,
    required this.consumed,
    required this.success,
    required this.warning,
    required this.error,
    required this.info,
    required this.card,
    required this.shimmer,
    required this.shadow,
  });

  final Color primary;
  final Color primaryLight;
  final Color primaryDark;
  final Color accent;
  final Color background;
  final Color surface;
  final Color elevated;
  final Color textPrimary;
  final Color textSecondary;
  final Color textMuted;
  final Color border;
  final Color divider;
  final Color fresh;
  final Color expiringSoon;
  final Color expired;
  final Color consumed;
  final Color success;
  final Color warning;
  final Color error;
  final Color info;
  final Color card;
  final Color shimmer;
  final Color shadow;

  static const light = AppColorsData(
    primary: AppLightColors.primary,
    primaryLight: AppLightColors.primaryLight,
    primaryDark: AppLightColors.primaryDark,
    accent: AppLightColors.accent,
    background: AppLightColors.background,
    surface: AppLightColors.surface,
    elevated: AppLightColors.elevated,
    textPrimary: AppLightColors.textPrimary,
    textSecondary: AppLightColors.textSecondary,
    textMuted: AppLightColors.textMuted,
    border: AppLightColors.border,
    divider: AppLightColors.divider,
    fresh: AppLightColors.fresh,
    expiringSoon: AppLightColors.expiringSoon,
    expired: AppLightColors.expired,
    consumed: AppLightColors.consumed,
    success: AppLightColors.success,
    warning: AppLightColors.warning,
    error: AppLightColors.error,
    info: AppLightColors.info,
    card: AppLightColors.card,
    shimmer: AppLightColors.shimmer,
    shadow: AppLightColors.shadow,
  );

  static const dark = AppColorsData(
    primary: AppDarkColors.primary,
    primaryLight: AppDarkColors.primaryLight,
    primaryDark: AppDarkColors.primaryDark,
    accent: AppDarkColors.accent,
    background: AppDarkColors.background,
    surface: AppDarkColors.surface,
    elevated: AppDarkColors.elevated,
    textPrimary: AppDarkColors.textPrimary,
    textSecondary: AppDarkColors.textSecondary,
    textMuted: AppDarkColors.textMuted,
    border: AppDarkColors.border,
    divider: AppDarkColors.divider,
    fresh: AppDarkColors.fresh,
    expiringSoon: AppDarkColors.expiringSoon,
    expired: AppDarkColors.expired,
    consumed: AppDarkColors.consumed,
    success: AppDarkColors.success,
    warning: AppDarkColors.warning,
    error: AppDarkColors.error,
    info: AppDarkColors.info,
    card: AppDarkColors.card,
    shimmer: AppDarkColors.shimmer,
    shadow: AppDarkColors.shadow,
  );

  static AppColorsData of(BuildContext context) {
    return Theme.of(context).extension<AppColorsData>() ?? light;
  }

  @override
  AppColorsData copyWith({
    Color? primary,
    Color? primaryLight,
    Color? primaryDark,
    Color? accent,
    Color? background,
    Color? surface,
    Color? elevated,
    Color? textPrimary,
    Color? textSecondary,
    Color? textMuted,
    Color? border,
    Color? divider,
    Color? fresh,
    Color? expiringSoon,
    Color? expired,
    Color? consumed,
    Color? success,
    Color? warning,
    Color? error,
    Color? info,
    Color? card,
    Color? shimmer,
    Color? shadow,
  }) {
    return AppColorsData(
      primary: primary ?? this.primary,
      primaryLight: primaryLight ?? this.primaryLight,
      primaryDark: primaryDark ?? this.primaryDark,
      accent: accent ?? this.accent,
      background: background ?? this.background,
      surface: surface ?? this.surface,
      elevated: elevated ?? this.elevated,
      textPrimary: textPrimary ?? this.textPrimary,
      textSecondary: textSecondary ?? this.textSecondary,
      textMuted: textMuted ?? this.textMuted,
      border: border ?? this.border,
      divider: divider ?? this.divider,
      fresh: fresh ?? this.fresh,
      expiringSoon: expiringSoon ?? this.expiringSoon,
      expired: expired ?? this.expired,
      consumed: consumed ?? this.consumed,
      success: success ?? this.success,
      warning: warning ?? this.warning,
      error: error ?? this.error,
      info: info ?? this.info,
      card: card ?? this.card,
      shimmer: shimmer ?? this.shimmer,
      shadow: shadow ?? this.shadow,
    );
  }

  @override
  AppColorsData lerp(ThemeExtension<AppColorsData>? other, double t) {
    if (other is! AppColorsData) return this;
    return AppColorsData(
      primary: Color.lerp(primary, other.primary, t)!,
      primaryLight: Color.lerp(primaryLight, other.primaryLight, t)!,
      primaryDark: Color.lerp(primaryDark, other.primaryDark, t)!,
      accent: Color.lerp(accent, other.accent, t)!,
      background: Color.lerp(background, other.background, t)!,
      surface: Color.lerp(surface, other.surface, t)!,
      elevated: Color.lerp(elevated, other.elevated, t)!,
      textPrimary: Color.lerp(textPrimary, other.textPrimary, t)!,
      textSecondary: Color.lerp(textSecondary, other.textSecondary, t)!,
      textMuted: Color.lerp(textMuted, other.textMuted, t)!,
      border: Color.lerp(border, other.border, t)!,
      divider: Color.lerp(divider, other.divider, t)!,
      fresh: Color.lerp(fresh, other.fresh, t)!,
      expiringSoon: Color.lerp(expiringSoon, other.expiringSoon, t)!,
      expired: Color.lerp(expired, other.expired, t)!,
      consumed: Color.lerp(consumed, other.consumed, t)!,
      success: Color.lerp(success, other.success, t)!,
      warning: Color.lerp(warning, other.warning, t)!,
      error: Color.lerp(error, other.error, t)!,
      info: Color.lerp(info, other.info, t)!,
      card: Color.lerp(card, other.card, t)!,
      shimmer: Color.lerp(shimmer, other.shimmer, t)!,
      shadow: Color.lerp(shadow, other.shadow, t)!,
    );
  }
}
