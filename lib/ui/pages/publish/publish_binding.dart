import 'package:bilibili_getx/ui/pages/publish/upload/upload_logic.dart';
import 'package:get/get.dart';

import 'publish_logic.dart';

class PublishBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PublishLogic());
    Get.lazyPut(() => UploadLogic());
  }
}
