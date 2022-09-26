import 'package:bilibili_getx/ui/pages/publish/bilibili_pre_edit_video/bilibili_pre_edit_video_logic.dart';
import 'package:get/get.dart';
import '../../video_play/bilibili_video_player/bilibili_video_player_logic.dart';
import 'upload_logic.dart';

class UploadBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UploadLogic());
  }
}
