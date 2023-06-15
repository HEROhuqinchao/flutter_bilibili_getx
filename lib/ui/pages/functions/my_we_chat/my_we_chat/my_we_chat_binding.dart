import 'package:bilibili_getx/ui/pages/functions/my_we_chat/my_we_chat/wechat_main/wechat_main_logic.dart';
import 'package:bilibili_getx/ui/pages/functions/my_we_chat/my_we_chat/wechat_mine/wechat_mine_logic.dart';
import 'package:get/get.dart';

import '../chat_room/chat_room_logic.dart';
import 'my_we_chat_logic.dart';

class MyWeChatBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MyWeChatLogic());
    Get.lazyPut(() => ChatRoomLogic());
    Get.lazyPut(() => WechatMainLogic());
    Get.lazyPut(() => WechatMineLogic());
  }
}
