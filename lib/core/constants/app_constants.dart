import 'package:flutter/material.dart';

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

/// Brand palette.
class AppColors {
  AppColors._();

  static const Color primary = Color(0xFF1B8A5A); // fresh green
  static const Color primaryDark = Color(0xFF14633F);
  static const Color accent = Color(0xFFFFB300);

  static const Color fresh = Color(0xFF2E9E5B);
  static const Color expiringSoon = Color(0xFFF59E0B);
  static const Color expired = Color(0xFFE03E36);
  static const Color consumed = Color(0xFF8A8F98);

  static const Color surface = Color(0xFFF7F9F8);
  static const Color card = Colors.white;
  static const Color textPrimary = Color(0xFF1A1D1B);
  static const Color textSecondary = Color(0xFF5E6562);
  static const Color border = Color(0xFFE3E8E5);
}

/// Spacing scale.
class AppSpacing {
  AppSpacing._();
  static const double xs = 4;
  static const double sm = 8;
  static const double md = 16;
  static const double lg = 24;
  static const double xl = 32;
  static const double radius = 16;
}
