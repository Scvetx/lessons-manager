import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:injectable/injectable.dart';

import '../models/notification_data.dart';
import '../models/notification_routing.dart';

@lazySingleton
class LocalNotifications {
  /// for riverpod provider initialization
  //LocalNotifications({required this.ref});
  // final ProviderRef<Object?> ref;

  final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  bool _initialized = false;

  Future<void> ensureInitialized({
    bool requestAlertPermission = true,
    bool requestBadgePermission = true,
    bool requestSoundPermission = true,
  }) async {
    if (_initialized) return;
    const androidInitializationSettings =
        AndroidInitializationSettings('app_icon');
    final iOSInitializationSettings = DarwinInitializationSettings(
      requestAlertPermission: requestAlertPermission,
      requestBadgePermission: requestBadgePermission,
      requestSoundPermission: requestSoundPermission,
    );
    final initializationSettings = InitializationSettings(
      android: androidInitializationSettings,
      iOS: iOSInitializationSettings,
    );
    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (payload) async {
        debugPrint(
          '>> onDidReceiveNotificationResponse: payload: ${payload.payload}',
        );
        await selectNotification(payload.payload);
      },
    );
    _initialized = true;
  }

  Future onLocalNotificationOpenedWhenAppIsClosed() async {
    debugPrint('>> onLocalNotificationOpenedWhenAppIsClosed');
    bool fromNotification = false;
    final details =
        await flutterLocalNotificationsPlugin.getNotificationAppLaunchDetails();
    if (details != null && details.notificationResponse != null) {
      fromNotification = true;
      await selectNotification(details.notificationResponse!.payload);
    }
    return fromNotification;
  }

  Future selectNotification(String? payload) async {
    debugPrint('>> selectNotification');
    if (payload != null) {
      final dataJSON = json.decode(payload);
      final notificationRouting = NotificationRouting.fromJson(
        //ref: ref, // for riverpod
        json: dataJSON,
      );
      await notificationRouting.handleNotification();
    }
  }

  Future<void> showNotification(
    String title,
    String body,
    NotificationData data,
  ) async {
    debugPrint('>> showNotification');
    const androidPlatformChannelSpecifics = AndroidNotificationDetails(
      'pedantic_general', // channel id
      'General', // channel name
    );
    const iosNotificationDetails = DarwinNotificationDetails();

    const platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
      iOS: iosNotificationDetails,
    );

    final id = DateTime.now().millisecondsSinceEpoch ~/ 1000;
    final payload = json.encode(data.toJson());

    await flutterLocalNotificationsPlugin.show(
      id,
      title,
      body,
      platformChannelSpecifics,
      payload: payload,
    );
  }
}
