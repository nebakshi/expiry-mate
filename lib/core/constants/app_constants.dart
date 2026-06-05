import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

/// Centralised, immutable app constants. Keep magic numbers/strings here.
class AppConstants {
  AppConstants._();

  static const String appName = 'Bloom';
  static const String tagline = 'Keep it fresh. Always.';

  // Free-plan limit (see PLAN §21 Monetization).
  static const int freePlanProductLimit = 30;

  // Default reminder schedule in days-before-expiry (PLAN §11).
  static const List<int> defaultReminderDaysBefore = [7, 2, 0];

  // Expiring-soon threshold in days (PLAN §9).
  static const int expiringSoonThresholdDays = 7;

  // Daily digest default time.
  static const int digestHour = 9;
  static const int digestMinute = 0;

  // Open Food Facts (PLAN §16). No API key needed.
  static const String offBaseUrl = 'https://world.openfoodfacts.org/api/v2/product';
  static const String offUserAgent = 'Bloom/1.0 (contact@bloomapp.io)';

  // Firestore collection paths (PLAN §8).
  static const String usersCollection = 'users';
  static const String productsCollection = 'products';
  static const String notificationSettingsCollection = 'notification_settings';
  static const String barcodeCacheCollection = 'barcode_cache';
  static const String appConfigCollection = 'app_config';
}

/// Brand palette — delegates to light-mode tokens for compile-time compat.
/// Prefer `AppColorsData.of(context)` in widgets for dark-mode support.
class AppColors {
  AppColors._();

  static const Color primary = AppLightColors.primary;
  static const Color primaryDark = AppLightColors.primaryDark;
  static const Color accent = AppLightColors.accent;

  static const Color fresh = AppLightColors.fresh;
  static const Color expiringSoon = AppLightColors.expiringSoon;
  static const Color expired = AppLightColors.expired;
  static const Color consumed = AppLightColors.consumed;

  static const Color surface = AppLightColors.surface;
  static const Color card = AppLightColors.card;
  static const Color textPrimary = AppLightColors.textPrimary;
  static const Color textSecondary = AppLightColors.textSecondary;
  static const Color border = AppLightColors.border;
}

/// Spacing scale — fixed values for backward compatibility.
/// For responsive scaling, use `AppSpacing` from `core/theme/app_spacing.dart`.
class AppSpacing {
  AppSpacing._();
  static const double xs = 4;
  static const double sm = 8;
  static const double md = 16;
  static const double lg = 24;
  static const double xl = 32;
  static const double radius = 16;
}
