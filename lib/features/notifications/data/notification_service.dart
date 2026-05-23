import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:timezone/data/latest_all.dart' as tzdata;
import 'package:timezone/timezone.dart' as tz;

import '../../../core/constants/app_constants.dart';
import '../../../core/extensions/date_extensions.dart';
import '../../product/domain/entities/product.dart';

/// PLAN §11 + §15.6 — local notification scheduling for expiry reminders.
class NotificationService {
  NotificationService({FlutterLocalNotificationsPlugin? plugin})
      : _plugin = plugin ?? FlutterLocalNotificationsPlugin();

  final FlutterLocalNotificationsPlugin _plugin;
  bool _initialised = false;

  static const _channelId = 'expiry_reminders';
  static const _channelName = 'Expiry Reminders';

  Future<void> init() async {
    if (_initialised) return;
    tzdata.initializeTimeZones();
    try {
      final localName = await FlutterTimezone.getLocalTimezone();
      tz.setLocalLocation(tz.getLocation(localName));
    } catch (_) {
      tz.setLocalLocation(tz.getLocation('Asia/Kolkata'));
    }

    const android = AndroidInitializationSettings('@mipmap/ic_launcher');
    const ios = DarwinInitializationSettings(
      requestAlertPermission: false,
      requestBadgePermission: false,
      requestSoundPermission: false,
    );
    await _plugin.initialize(
      const InitializationSettings(android: android, iOS: ios),
    );
    _initialised = true;
  }

  /// Requests OS-level permission. Returns true if granted.
  Future<bool> requestPermission() async {
    final ios = _plugin.resolvePlatformSpecificImplementation<
        IOSFlutterLocalNotificationsPlugin>();
    if (ios != null) {
      final granted = await ios.requestPermissions(
          alert: true, badge: true, sound: true);
      return granted ?? false;
    }
    final android = _plugin.resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>();
    if (android != null) {
      final granted = await android.requestNotificationsPermission();
      return granted ?? false;
    }
    return false;
  }

  /// Schedules all reminders for [product]. Returns the generated
  /// notification IDs to persist on the product document.
  Future<List<int>> scheduleForProduct(Product product) async {
    await init();
    await cancelForProduct(product); // avoid duplicates

    final ids = <int>[];
    final base = _baseId(product.id);

    for (var i = 0; i < product.reminderDaysBefore.length; i++) {
      final daysBefore = product.reminderDaysBefore[i];
      final fireDate = product.expiryDate.dateOnly.subtract(
        Duration(days: daysBefore),
      );
      // Fire at 9 AM local on the reminder day.
      final when = tz.TZDateTime(
        tz.local,
        fireDate.year,
        fireDate.month,
        fireDate.day,
        AppConstants.digestHour,
        AppConstants.digestMinute,
      );
      if (when.isBefore(tz.TZDateTime.now(tz.local))) continue; // skip past

      final id = base + i;
      await _plugin.zonedSchedule(
        id,
        _title(product, daysBefore),
        _body(product, daysBefore),
        when,
        const NotificationDetails(
          android: AndroidNotificationDetails(
            _channelId,
            _channelName,
            channelDescription: 'Reminders before your kitchen items expire.',
            importance: Importance.high,
            priority: Priority.high,
          ),
          iOS: DarwinNotificationDetails(),
        ),
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,
        payload: product.id,
      );
      ids.add(id);
    }
    return ids;
  }

  Future<void> cancelForProduct(Product product) async {
    final base = _baseId(product.id);
    // Cancel both the persisted ids and the deterministic id range.
    for (final id in product.notificationIds) {
      await _plugin.cancel(id);
    }
    for (var i = 0; i < 5; i++) {
      await _plugin.cancel(base + i);
    }
  }

  Future<void> cancelAll() => _plugin.cancelAll();

  // Notification copy (PLAN §11).
  String _title(Product p, int daysBefore) {
    if (daysBefore == 0) return '${p.productName} expires today';
    return '${p.productName} expires soon';
  }

  String _body(Product p, int daysBefore) {
    if (daysBefore == 0) {
      return 'Please use or discard it safely.';
    }
    return '${p.productName} expires in $daysBefore day'
        '${daysBefore == 1 ? '' : 's'}. Use it soon to avoid waste.';
  }

  /// Deterministic, collision-resistant base id derived from product id.
  int _baseId(String productId) {
    final hash = productId.hashCode & 0x7fffffff;
    return (hash % 2000000) * 10; // leave room for +0..+4 offsets
  }
}
