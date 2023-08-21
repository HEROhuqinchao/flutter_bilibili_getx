import 'package:get/get.dart';

import '../video_player_example/video_player_example_logic.dart';
import 'mini_window_state.dart';

class MiniWindowLogic extends GetxController {
  final MiniWindowState state = MiniWindowState();

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  backVideoPlayerExample() {
    state.floating.close();
    update();

    ///关闭小窗口，通知视频播放界面
    VideoPlayerExampleLogic videoPlayerExampleLogic =
        Get.find<VideoPlayerExampleLogic>();
    videoPlayerExampleLogic.state.isMiniWindowPlay = false;
    videoPlayerExampleLogic.update();
  }
}
