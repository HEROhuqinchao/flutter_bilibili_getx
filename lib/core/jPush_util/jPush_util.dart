import 'package:bilibili_getx/core/service/utils/constant.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:jpush_flutter/jpush_flutter.dart';

///极光推送
///https://www.jiguang.cn/push
class JPushUtil {
  ///初始化极光推送
  static void startJPush() {
    JPush jPush = JPush();
    //配置jPush(不要省略）
    //debug就填debug:true，生产环境production:true
    jPush.setup(
      appKey: Constant.jPushAppKey,
      channel: 'developer-default',
      production: true,
      debug: Constant.isDebug,
    );

    ///用RegistrationID单独给某人发送通知
    jPush
        .getRegistrationID()
        .then((value) => print("Registration id - ${value}"));

    ///是否开启了通知
    jPush.isNotificationEnabled().then((value) {
      if (value) {
        print("已开启");
      } else {
        print("貌似有些故障...");
      }
    });

    ///监听jPush(ios必须配置)
    jPush.applyPushAuthority(
        const NotificationSettingsIOS(sound: true, alert: true, badge: true));
    jPush.addEventHandler(
      onReceiveNotification: (Map<String, dynamic> message) async {
        print('message11:$message');
      },
      onOpenNotification: (Map<String, dynamic> message) async {
        //点击通知栏消息，在此时通常可以做一些页面跳转等
        print('message22:$message');
      },
    );
  }
}
