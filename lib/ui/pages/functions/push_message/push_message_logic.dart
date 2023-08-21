import 'dart:io';

import 'package:get/get.dart';

import '../../../../core/channel/channel_util.dart';
import '../../../../core/jPush_util/jPush_util.dart';
import 'push_message_state.dart';

class PushMessageLogic extends GetxController {
  final PushMessageState state = PushMessageState();

  @override
  void onInit() {
    ///启动极光推送
    // JPushUtil.startJPush();
    super.onInit();
  }

  @override
  void onReady() {
    ///获取手机本地照片
    ChannelUtil().stayAlive?.invokeMethod("battery_optimization").then((value) {
      print(value);
      update();
    });
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void settingPermission() {
    ChannelUtil().stayAlive?.invokeMethod("setting_optimization").then((value) {
      print(value);
      update();
    });
  }

  void startService() async {
    if (Platform.isAndroid) {
      ChannelUtil().startService?.invokeMethod("startService").then((value) {
        print(value);
        update();
      });
    }
  }

  void startJPush() {
    ///启动极光推送
    JPushUtil().startJPush();
  }
}
