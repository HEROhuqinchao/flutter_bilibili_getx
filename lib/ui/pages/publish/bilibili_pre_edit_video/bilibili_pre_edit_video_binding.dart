
import 'package:get/get.dart';
import 'bilibili_pre_edit_video_logic.dart';

class BilibiliPreEditVideoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BilibiliPreEditVideoLogic());
  }
}
