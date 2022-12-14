import 'package:bilibili_getx/ui/pages/functions/mini_window/mini_window_logic.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_floating/floating/floating.dart';
import 'package:get/get.dart';

import '../mini_window/mini_window_view.dart';
import 'video_player_example_state.dart';

class VideoPlayerExampleLogic extends GetxController {
  final VideoPlayerExampleState state = VideoPlayerExampleState();

  @override
  void onReady() {
    state.videoPlayerController.initialize().then((value) {
      MiniWindowLogic miniWindowLogic = Get.find<MiniWindowLogic>();
      state.videoPlayerController.play();
      miniWindowLogic.state.isPlaying = true;
      miniWindowLogic.state.showButtons = false;
      update();
    });
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  void showVideoMiniWindow(BuildContext context) {
    ///传递视频播放信息给小窗口
    MiniWindowLogic miniWindowLogic = Get.find<MiniWindowLogic>();
    miniWindowLogic.state.videoPlayerController = state.videoPlayerController;
    miniWindowLogic.state.floating = state.floating;
    miniWindowLogic.state.isPlaying =  state.videoPlayerController.value.isPlaying;
    miniWindowLogic.state.showButtons = state.videoPlayerController.value.isPlaying ? false : true;
    miniWindowLogic.state.videoPlayerController.addListener(() {
      if (miniWindowLogic.state.videoPlayerController.value.isPlaying) {
        miniWindowLogic.update();
      }
    });

    ///关闭当前播放界面
    state.isMiniWindowPlay = true;
    state.floating.open(context);
    update();
  }
}