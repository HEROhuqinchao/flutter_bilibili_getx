import 'package:get/get.dart';

import 'wx_share_state.dart';

class WxShareLogic extends GetxController {
  final WxShareState state = WxShareState();

  @override
  void onReady() {
    print("onReady");
    super.onReady();
  }

  @override
  void onClose() {
    print("onClose");
    super.onClose();
  }
}
