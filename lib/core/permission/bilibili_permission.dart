import 'package:permission_handler/permission_handler.dart';

class BilibiliPermission {
  ///权限获取
  static void requestAllPermissions() async {
    Map<Permission, PermissionStatus> statuses = await [
      Permission.phone,
      Permission.storage,
      Permission.location,
      Permission.notification,
    ].request();
  }

  ///权限获取
  static void requestUploadPermissions() async {
    Map<Permission, PermissionStatus> statuses = await [
      Permission.storage,
    ].request();
  }
}