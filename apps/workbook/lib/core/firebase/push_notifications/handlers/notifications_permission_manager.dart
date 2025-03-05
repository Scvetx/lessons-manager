import 'package:flutter/foundation.dart';
import 'package:permission_handler/permission_handler.dart';

class NotificationsPermissionManager {
  static Future<bool> getNotificationPermission() async {
    const Permission permission = Permission.notification;
    final PermissionStatus permissionStatus = await permission.status;
    return _isGranted(permissionStatus);
  }

  static Future<bool> requestNotificationPermission() async {
    const Permission permission = Permission.notification;
    final PermissionStatus permissionStatus = await permission.request();
    debugPrint('>> requestNotificationPermission: $permission');
    return _isGranted(permissionStatus);
  }

  static bool _isGranted(PermissionStatus permissionStatus) =>
      !(permissionStatus.isDenied || permissionStatus.isPermanentlyDenied);
}
