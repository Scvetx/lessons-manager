import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../features/users/auth/data/repository/firebase_auth_repo.dart';
import '../../../getit/injection.dart';
import '../../../navigation/constants/default_routes.dart';
import '../../../navigation/routes/app_router.dart';
import '../../../utils/utils.dart';
import 'notification_data.dart';

class NotificationRouting {
  NotificationRouting.fromJson({
    // required this.ref, // for riverpod provider initialization
    required Map<String, dynamic> json,
  }) : data = NotificationData.fromJson(json);

  NotificationRouting.fromData({
    // required this.ref, // for riverpod provider initialization
    required this.data,
  });

  /// for riverpod provider initialization
  // final ProviderRef<Object?> ref;

  final NotificationData data;
  List<PageRouteInfo>? routes;

  /// route to screen when user taps on a notification
  Future<void> handleNotification() async {
    debugPrint('>> in handleNotification');
    routes = await _buildNotificationRoute();
  }

  /// build route basing on params passed in notification payload
  Future<List<PageRouteInfo>> _buildNotificationRoute() async {
    debugPrint('>> in _buildNotificationRoute');

    // route to login page if user is unauthorized
    final loggedIn = getIt<FirebaseAuthRepository>().loggedIn;
    if (!loggedIn) {
      debugPrint(
        '>> user is unauthorized: route notification to sign in screen',
      );
      
      return [DefaultRoutes().onboardingRoute];
    }

    final screenName = data.screenName;
    if (data.isCurrentUser) {
      try {
        if (screenName == '') return [DefaultRoutes().homeRoute];

        final routeName = screenName.replaceAll('Screen', 'Route');

        if (routeName == 'ChatRoute') {
          return _buildRouteChatScreen(routeName);
        }

        final pageRoute = PageRouteInfo(
          routeName,
        );
        return [pageRoute];
      } catch (e, stack) {
        Utils.handleException(e, stack, 
          'Error while routing from push notification',
        );
      }
    }
    // in case if an error occurred while handling notification data
    // or if the notification was sent to another user authorized on the device
    // open default authorized route when user presssed the notification
    return [DefaultRoutes().homeRoute];
  }

   List<PageRouteInfo> _buildRouteChatScreen(
    String routeName,
  ) {
    final pageRoutes = [
      PageRouteInfo(routeName),
    ];

    return pageRoutes;
  }

  Future<void> routeToScreen() async {
    if(routes == null) return;
    getIt<AppRouter>().popUntilRoot();
    await getIt<AppRouter>().popAndPushAll(routes!);
  }
}
