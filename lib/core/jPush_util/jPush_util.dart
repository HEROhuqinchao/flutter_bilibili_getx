import 'package:bilibili_getx/core/service/utils/constant.dart';
import 'package:jpush_flutter/jpush_flutter.dart';

class JPushUtil {
  ///初始化极光推送
  static void startJPush() {
    JPush jPush = JPush();
    //配置jPush(不要省略）
    //debug就填debug:true，生产环境production:true
    jPush.setup(
      appKey: '7d6d63fa06959ac31ff30914',
      channel: 'developer-default',
      production: true,
      debug: Constant.isDebug,
    );
    //监听jPush(ios必须配置)
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
