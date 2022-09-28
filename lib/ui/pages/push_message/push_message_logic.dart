import 'package:get/get.dart';

import '../../../core/jPush_util/jPush_util.dart';
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
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
