import 'package:bilibili_getx/ui/pages/functions/my_we_chat/my_we_chat/wechat_mine/we_chat_setting/we_chat_setting_logic.dart';
import 'package:get/get.dart';

import '../../my_we_chat_logic.dart';
import '../../wechat_main/wechat_main_logic.dart';

class MyWeChatSettingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => WeChatSettingLogic());
    Get.lazyPut(() => WechatMainLogic());
  }
}
