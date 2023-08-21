import 'package:get/get.dart';

import 'flutter_android_logic.dart';

class FlutterAndroidBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FlutterAndroidLogic());
  }
}
