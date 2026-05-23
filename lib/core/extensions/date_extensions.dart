import 'package:intl/intl.dart';
import '../constants/app_constants.dart';

extension DateTimeX on DateTime {
  /// Date stripped of time component (local midnight).
  DateTime get dateOnly => DateTime(year, month, day);

  /// Whole calendar days from today until this date. Negative if past.
  int get daysFromToday {
    final today = DateTime.now().dateOnly;
    return dateOnly.difference(today).inDays;
  }

  String get displayDate => DateFormat('dd MMM yyyy').format(this);
  String get isoDate => DateFormat('yyyy-MM-dd').format(this);

  /// Human "days left" copy used on product cards.
  String get daysLeftLabel {
    final d = daysFromToday;
    if (d < 0) return '${-d} day${-d == 1 ? '' : 's'} ago';
    if (d == 0) return 'Expires today';
    if (d == 1) return 'Expires tomorrow';
    return '$d days left';
  }
}

extension IntReminderX on int {
  /// Reminder copy for "N days before".
  String get reminderLabel {
    if (this == 0) return 'On expiry day';
    if (this == 1) return '1 day before';
    return '$this days before';
  }
}

/// Used by parser/repository to decide expiring-soon banding.
bool isExpiringSoon(DateTime expiry) {
  final d = expiry.daysFromToday;
  return d >= 0 && d <= AppConstants.expiringSoonThresholdDays;
}

bool isExpired(DateTime expiry) => expiry.daysFromToday < 0;
