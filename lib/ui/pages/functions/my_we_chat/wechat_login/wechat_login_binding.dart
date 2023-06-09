import 'package:bilibili_getx/ui/pages/functions/my_we_chat/my_we_chat/wechat_main/wechat_main_logic.dart';
import 'package:get/get.dart';

import '../my_we_chat/my_we_chat_logic.dart';
import '../my_we_chat/wechat_mine/wechat_mine_logic.dart';
import 'wechat_login_logic.dart';

class WechatLoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => WechatLoginLogic());
    Get.lazyPut(() => WechatMainLogic());
    Get.lazyPut(() => WechatMineLogic());
  }
}
