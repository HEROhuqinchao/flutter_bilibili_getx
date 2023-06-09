import 'package:bilibili_getx/ui/pages/functions/my_we_chat/my_we_chat/wechat_mine/we_chat_setting/we_chat_setting_logic.dart';
import 'package:get/get.dart';

class MyWeChatSettingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => WeChatSettingLogic());
  }
}
