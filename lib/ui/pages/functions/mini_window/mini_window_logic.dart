import 'dart:async';

import 'package:bilibili_getx/ui/shared/app_theme.dart';
import 'package:bilibili_getx/ui/shared/image_asset.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_floating/floating/floating.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

import 'mini_window_state.dart';

class MiniWindowLogic extends GetxController {
  final MiniWindowState state = MiniWindowState();

  @override
  void onReady() {
    state.videoPlayerController.initialize().then((value) => {update()});
    super.onReady();
  }

  @override
  void onClose() {
    // state.videoPlayerController.dispose();
    super.onClose();
  }

  void showVideoMiniWindow(BuildContext context) {
    state.floating = state.floatingManager.createFloating(
      '1',
      Floating(
        buildMiniWindow(),
        isShowLog: false,
      ),
    );
    state.floating.open(context);
    Get.back();
  }

  ///隐藏按钮
  void hideButtons() {
    state.hideTimer = Timer(const Duration(seconds: 3000), () {
      state.showButtons = false;
    });
  }

  Widget buildMiniWindow() {
    return GetBuilder<MiniWindowLogic>(
      builder: (logic) {
        return Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              width: 230.w,
              height: 130.w,
              // child: Text("这是一个文本"),
              child: state.videoPlayerController.value.isInitialized
                  ? AspectRatio(
                      aspectRatio:
                          state.videoPlayerController.value.aspectRatio,
                      child: VideoPlayer(state.videoPlayerController),
                    )
                  : Container(
                      child: Text("未显示"),
                    ),
            ),

            ///背景
            AnimatedOpacity(
              opacity: state.showButtons ? 0 : 1,
              duration: Duration(
                seconds: 1,
              ),
              child: GestureDetector(
                onTap: () {
                  print("点击beijing");
                },
                child: Container(
                  width: 230.w,
                  height: 130.w,
                  color: HYAppTheme.norTextColors.withOpacity(.4),
                ),
              ),
            ),

            ///播放按钮
            GestureDetector(
              onTap: () {
                if (state.isPlaying) {
                  state.videoPlayerController.pause();
                  state.isPlaying = false;
                } else {
                  state.videoPlayerController.play();
                  state.isPlaying = true;
                }
                logic.update();
                print("点击");
              },
              child: AnimatedOpacity(
                opacity: state.showButtons ? 0 : 1,
                duration: Duration(
                  milliseconds: 500,
                ),
                child: Container(
                  width: 30.w,
                  height: 30.w,
                  child: Image.asset(
                    state.isPlaying
                        ? ImageAssets.biliPlayerPlayCanPausePNG
                        : ImageAssets.bilibiliPlayerPlayCanPlayPNG,
                  ),
                ),
              ),
            ),

            ///关闭按钮
            Positioned(
              right: 5.r,
              top: 5.r,
              child: GestureDetector(
                onTap: () {
                  state.videoPlayerController.pause();
                  state.isPlaying = false;
                  state.floating.hideFloating();
                  logic.update();
                },
                child: AnimatedOpacity(
                  opacity: state.showButtons ? 0 : 1,
                  duration: Duration(
                    milliseconds: 500,
                  ),
                  child: Container(
                    width: 20.w,
                    height: 20.w,
                    child: Image.asset(ImageAssets.miniWindowClosePng),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
