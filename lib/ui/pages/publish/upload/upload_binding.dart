import 'package:get/get.dart';

import 'upload_logic.dart';

class UploadBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UploadLogic());
  }
}
