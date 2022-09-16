import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

import 'bilibili_video_player_full_screen_logic.dart';

class BilibiliVideoPlayerFullScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final logic = Get.find<BilibiliVideoPlayerFullLogic>();
    final state = Get.find<BilibiliVideoPlayerFullLogic>().state;

    return Container(
      height: 1.sh,
      width: 1.sw,
      margin: EdgeInsets.only(
          top: MediaQueryData.fromWindow(WidgetsBinding.instance.window)
              .padding
              .top),
      color: Colors.black,
      child: state.controller.value.isInitialized
          ? Hero(
              tag: "player",
              child: AspectRatio(
                aspectRatio: state.controller.value.aspectRatio,
                child: VideoPlayer(state.controller),
              ),
            )
          : Container(
              alignment: Alignment.center,
              child: CircularProgressIndicator(),
            ),
    );
  }
}
