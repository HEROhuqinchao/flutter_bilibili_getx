import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:url_launcher/url_launcher.dart';

///启动第三方软件
class LaunchAppUtil {
  ///寻找高德地图
  ///https://lbs.amap.com/api/amap-mobile/guide/android/navigation
  static Future<bool> go2AMap({
    longitude,
    latitude,
    dev = 0,
    style = 2,
  }) async {
    String url = "";
    if (defaultTargetPlatform == TargetPlatform.android) {
      url = 'android';
    } else if (defaultTargetPlatform == TargetPlatform.iOS) {
      url = 'ios';
    }
    url +=
    "amap://navi?sourceApplication=amap&lat=$latitude&lon=$longitude&dev=$dev&style=$style";
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
      return true;
    } else {
      return false;
    }
  }

// /// 腾讯地图
// static Future<bool> gotoTencentMap(longitude, latitude) async {
//   var url =
//       'qqmap://map/routeplan?type=drive&fromcoord=CurrentLocation&tocoord=$latitude,$longitude&referer=IXHBZ-QIZE4-ZQ6UP-DJYEO-HC2K2-EZBXJ';
//   bool canLaunchUrlBool = await canLaunchUrl(Uri.parse(url));
//   if (!canLaunchUrlBool) {
//     SmartDialog.showToast('未检测到腾讯地图~');
//     return false;
//   }
//   await launchUrl(Uri.parse(url));
//   return canLaunchUrlBool;
// }
//
// /// 百度地图
// static Future<bool> gotoBaiduMap(longitude, latitude) async {
//   var url =
//       'baidumap://map/direction?destination=$latitude,$longitude&coord_type=bd09ll&mode=driving';
//   bool canLaunchUrlBool = await canLaunchUrl(Uri.parse(url));
//   if (!canLaunchUrlBool) {
//     SmartDialog.showToast('未检测到百度地图~');
//     return false;
//   }
//   await launchUrl(Uri.parse(url));
//   return canLaunchUrlBool;
// }
//
// /// 苹果地图
// static Future<bool> gotoAppleMap(longitude, latitude) async {
//   var url = 'http://maps.apple.com/?&daddr=$latitude,$longitude';
//   bool canLaunchUrlBool = await canLaunchUrl(Uri.parse(url));
//   if (!canLaunchUrlBool) {
//     SmartDialog.showToast('打开失败~');
//     return false;
//   }
//   await launchUrl(Uri.parse(url));
//   return canLaunchUrlBool;
// }
}
