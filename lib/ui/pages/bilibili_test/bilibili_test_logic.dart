import 'package:bilibili_getx/ui/pages/functions/video_player_example/video_player_example_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import 'bilibili_test_state.dart';

class BilibiliTestLogic extends GetxController {
  final BilibiliTestState state = BilibiliTestState();

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void createFloatingView(context) {
    Get.toNamed(VideoPlayerExampleView.routeName);
  }

  ///构建浮动窗口
  Widget buildFloating() {
    return Container(
      color: Colors.amber,
      width: 220.w,
      child: Center(
        child: state.controller.value.isInitialized
            ? AspectRatio(
                aspectRatio: state.controller.value.aspectRatio,
                child: VideoPlayer(
                  state.controller,
                ),
              )
            : Container(),
      ),
    );
    // return FutureBuilder(
    //   future: ,
    //   builder: (ctx, snapshot) {
    //
    //   },
    // );
  }
}
