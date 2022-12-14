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
    state.videoPlayerController.initialize().then((value) {
      state.videoPlayerController.play();
      state.showButtons = true;
      state.isPlaying = true;
      state.hideTimer = Timer(const Duration(seconds: 3), () {
        state.showButtons = false;
        update();
      });
      update();
    });
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
    state.hideTimer.cancel();
    state.hideTimer = Timer(const Duration(seconds: 3), () {
      state.showButtons = false;
      update();
    });
  }

  Widget buildMiniWindow() {
    return GetBuilder<MiniWindowLogic>(
      builder: (logic) {
        return GestureDetector(
          onTap: () {
            ///点击背景出现按钮并若干秒之后隐藏按钮
            state.showButtons = true;
            hideButtons();
            logic.update();
          },
          child: AbsorbPointer(
            absorbing: !state.showButtons,
            child: Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: 230.w,
                  height: 130.w,
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
                  opacity: state.showButtons ? 1 : 0,
                  duration: Duration(
                    milliseconds: 300,
                  ),
                  child: Container(
                    width: 230.w,
                    height: 130.w,
                    color: HYAppTheme.norTextColors.withOpacity(.4),
                  ),
                ),

                ///播放按钮
                GestureDetector(
                  onTap: () {
                    if (state.isPlaying) {
                      ///暂停时，让按钮显示出来
                      state.videoPlayerController.pause();
                      state.isPlaying = false;
                      state.hideTimer.cancel();
                      state.showButtons = true;
                      logic.update();
                    } else {
                      ///播放时，若干秒之后就隐藏按钮
                      state.videoPlayerController.play();
                      state.isPlaying = true;
                      logic.update();
                      hideButtons();
                    }
                  },
                  child: AnimatedOpacity(
                    opacity: state.showButtons ? 1 : 0,
                    duration: Duration(
                      milliseconds: 300,
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
                      opacity: state.showButtons ? 1 : 0,
                      duration: Duration(
                        milliseconds: 300,
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
            ),
          ),
        );
      },
    );
  }
}
