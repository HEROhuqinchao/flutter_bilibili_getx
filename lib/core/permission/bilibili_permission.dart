import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../main.dart';
import '../../ui/widgets/widget_factory/abstract_factory/widget_factory_singleton.dart';

///权限获取
class BilibiliPermission with WidgetFactoryPlugin {
  BilibiliPermission._internal();

  static final BilibiliPermission _instance = BilibiliPermission._internal();

  factory BilibiliPermission() => _instance;

  ///权限获取
  Future<bool> requestPhotosPermissions() async {
    var statue = await Permission.photos.status;
    if (statue == PermissionStatus.granted) {
      return true;
    } else {
      statue = await Permission.photos.request();
      if (statue == PermissionStatus.granted) {
        return true;
      } else {
        openAppSetting("访问相册");
        return false;
      }
    }
  }

  ///定位
  Future<bool> requestBaiDuMapLocationPermissions() async {
    var statue = await Permission.location.status;
    if (statue == PermissionStatus.granted) {
      return true;
    } else {
      statue = await Permission.location.request();
      if (statue == PermissionStatus.granted) {
        return true;
      } else {
        openAppSetting("访问定位");
        return false;
      }
    }
  }

  ///蓝牙
  Future<bool> requestBlueToothPermissions() async {
    var statue = await Permission.bluetooth.status;
    if (statue == PermissionStatus.granted) {
      return true;
    } else {
      statue = await Permission.bluetooth.request();
      if (statue == PermissionStatus.granted) {
        return true;
      } else {
        openAppSetting("访问蓝牙");
        return false;
      }
    }
  }

  void openAppSetting(String text) {
    BuildContext? context = navigatorKey.currentState?.overlay?.context;
    wFactory().buildDialog(
      context!,
      child: Container(
        color: Colors.white,
        alignment: Alignment.center,
        width: 200.r,
        height: 200.r,
        child: const Text("Dialog"),
      ),
    );
  }
}
