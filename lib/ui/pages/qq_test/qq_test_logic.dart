import 'package:bilibili_getx/core/qq_util/qq_util.dart';
import 'package:get/get.dart';

import 'qq_test_state.dart';

class QqTestLogic extends GetxController {
  final QqTestState state = QqTestState();

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    state.streamSubscription.cancel();
    super.onClose();
  }
}
