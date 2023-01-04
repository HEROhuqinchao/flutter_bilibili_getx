import 'package:get/get.dart';

import 'download_file_logic.dart';

class DownloadFileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DownloadFileLogic());
  }
}
