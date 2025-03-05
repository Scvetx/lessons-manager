import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

import '../../../getit/injection.dart';
import '../../../utils/utils.dart';
import '../models/notification_data.dart';
import '../models/notification_routing.dart';
import 'local_notifications.dart';

@lazySingleton
class PushNotifications {
  /// for riverpod provider initialization
  // PushNotifications({required this.ref});
  //final ProviderRef<Object?> ref;

  final FirebaseMessaging _messaging = FirebaseMessaging.instance;

  String? _token;

  bool _initialized = false;
  bool _backgroundNotificationsInitialized = false;

  Future<void> ensureInitialized() async {
    if (_initialized) return;
    if(kDebugMode) debugPrint('Initializing push notifications ..');
    final fcmToken = await getToken();
    if(kDebugMode) debugPrint('>>> fcmToken: $fcmToken');

    await _requestNotificationPermission();
    await _setForegroundOptions();
    final NotificationSettings notificationSettings =
        await _messaging.getNotificationSettings();
    if (notificationSettings.authorizationStatus ==
        AuthorizationStatus.authorized) {
      _initForegroundMessageHandler();
      _initAppOpenedFromBackground();
      _initialized = true;
    }
  }

  Future<void> ensureBackgroundNotificationsInitialized() async {
    if (_backgroundNotificationsInitialized) return;

    final NotificationSettings notificationSettings =
        await _messaging.getNotificationSettings();

    if (notificationSettings.authorizationStatus ==
        AuthorizationStatus.authorized) {

      if(kDebugMode) debugPrint('Initializing background notifications');

      _initTerminatedAppOpenedFromBackground();
      _backgroundNotificationsInitialized = true;
    }
  }

  Future<String> getToken() async {
    if (_token != null) return _token!;
    try {
      _token = await _messaging.getToken();
      if(kDebugMode) debugPrint('fcm token: $_token');
      return _token ?? '';
    } catch (e, stack) {
      Utils.handleException(e, stack, 'fcm getToken() error');
    }
    return '';
  }

  Future<void> deleteToken() async {
    try {
      await _messaging.deleteToken();
      _token = null;
    } catch (e, stack) {
      Utils.handleException(e, stack, 'fcm deleteToken() error');
    }
  }

  Future<void> _requestNotificationPermission() async {
    try {
      await _messaging.requestPermission();
    } catch (e, stack) {
      Utils.handleException(e, stack, '_requestNotificationPermission error');
    }
  }

  Future<void> _setForegroundOptions() async {
    try {
      await _messaging.setForegroundNotificationPresentationOptions(
        alert: true,
        badge: true,
        sound: true,
      );
    } catch (e, stack) {
      Utils.handleException(e, stack, 'fcm _setForegroundOptions() error');
    }
  }

  void _initForegroundMessageHandler() {
    FirebaseMessaging.onMessage.listen((message) {
      if(kDebugMode) {
        debugPrint(
          '>>Handling push notification from foreground: app is opened',
        );
        debugPrint('>>Message data: ${message.data}');
      }

      if (message.notification != null) {
        final data = NotificationData.fromJson(message.data);

        //ref.read(localNotificationsProvider).
        getIt<LocalNotifications>().showNotification(
          message.notification!.title ?? '',
          message.notification!.body ?? '',
          data,
        );
      }
    });
  }

  void _initAppOpenedFromBackground() {
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      if(kDebugMode) {
        debugPrint(
          '>>Handling push notification from background: app is opened',
        );
        debugPrint('>>Message data: ${message.data}');
      }

      if (message.notification != null) {
        final data = NotificationData.fromJson(message.data);

        NotificationRouting.fromData(
          // ref: ref, // for riverpod
          data: data,
        ).handleNotification();
      }
    });
  }

  void _initTerminatedAppOpenedFromBackground() {
    _messaging.getInitialMessage().then((message) {
      if (message != null) {
        if(kDebugMode) {
          debugPrint(
            '>>Handling push notification from background: app is terminated',
          );
          debugPrint('>>Message data: ${message.data}');
        }

        if (message.notification != null) {
          final data = NotificationData.fromJson(message.data);

          NotificationRouting.fromData(
            // ref: ref, // for riverpod
            data: data,
          ).handleNotification();
        }
      }
    });
  }
}
