import 'package:get/get.dart';
import 'bilibili_test_state.dart';

class BilibiliTestLogic extends GetxController {
  final BilibiliTestState state = BilibiliTestState();

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void exchangeSmileySwitch(key, value) {
    state.snapToEnd = false;
    state.option[key] = !value;
    update();
  }

  void exchangeIsFav() {
    state.isFav = !state.isFav;
    update();
  }
}
