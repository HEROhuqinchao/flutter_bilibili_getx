import 'package:bilibili_getx/ui/pages/functions/mini_window/mini_window_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_floating/floating/assist/floating_slide_type.dart';
import 'package:flutter_floating/floating/floating.dart';
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
    Get.toNamed(MiniWindowView.routeName);
    // state.floatingOne = state.floatingManager.createFloating(
    //   "1",
    //   Floating(
    //     buildFloating(),
    //     slideType: FloatingSlideType.onLeftAndTop,
    //     isShowLog: false,
    //     slideBottomHeight: 100,
    //   ),
    // );
    // state.floatingManager.createFloating("1", state.floatingOne);
    // state.floatingOne.open(context);
    // Get.back();
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
