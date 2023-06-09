import 'package:get/get.dart';

import '../chat_room/chat_room_logic.dart';
import 'my_we_chat_logic.dart';

class MyWeChatBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MyWeChatLogic());
    Get.lazyPut(() => ChatRoomLogic());
  }
}
