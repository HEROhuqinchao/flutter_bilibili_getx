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

  ///定位
  static void requestBaiDuMapLocationPermissions() async {
    Map<Permission, PermissionStatus> statuses = await [
      Permission.location,
    ].request();
  }

  ///权限获取
  static Future requestDownloadPermissions() async {
    Map<Permission, PermissionStatus> statuses = await [
      Permission.storage,
    ].request();
  }

  ///蓝牙
  static Future requestBlueToothPermissions() async {
    Map<Permission, PermissionStatus> statuses = await [
      Permission.bluetooth,
      Permission.bluetoothScan,
      Permission.bluetoothConnect,
      Permission.bluetoothAdvertise,
    ].request();
  }
}