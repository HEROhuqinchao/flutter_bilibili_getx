import 'package:get/get.dart';

import 'my_we_chat_state.dart';

class MyWeChatLogic extends GetxController {
  final MyWeChatState state = MyWeChatState();

  updateCurrentIndex(int index) {
    state.currentIndex = index;
    update();
  }
}
