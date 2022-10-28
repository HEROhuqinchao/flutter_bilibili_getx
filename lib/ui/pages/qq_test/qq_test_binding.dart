import 'package:get/get.dart';

import 'qq_test_logic.dart';

class QqTestBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => QqTestLogic());
  }
}
