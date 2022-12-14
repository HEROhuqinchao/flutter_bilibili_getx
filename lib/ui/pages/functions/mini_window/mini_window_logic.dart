import 'dart:async';

import 'package:bilibili_getx/ui/pages/functions/mini_window/mini_window_view.dart';
import 'package:bilibili_getx/ui/shared/app_theme.dart';
import 'package:bilibili_getx/ui/shared/image_asset.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_floating/floating/floating.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

import '../video_player_example/video_player_example_logic.dart';
import '../video_player_example/video_player_example_view.dart';
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
    VideoPlayerExampleLogic videoPlayerExampleLogic = Get.find<VideoPlayerExampleLogic>();
    videoPlayerExampleLogic.state.isMiniWindowPlay = false;
    videoPlayerExampleLogic.update();
  }
}
