import 'dart:async';

import 'package:bilibili_getx/ui/widgets/custom/progress_bar_painter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

import '../../../shared/app_theme.dart';
import '../../../shared/image_asset.dart';
import 'mini_window_logic.dart';

class MiniWindowView extends StatelessWidget {
  static String routeName = "/mini_window";

  const MiniWindowView({super.key});

  @override
  Widget build(BuildContext context) {
    final state = Get.find<MiniWindowLogic>().state;

    return GetBuilder<MiniWindowLogic>(
      builder: (logic) {
        return GestureDetector(
          onTap: () {
            ///点击背景出现按钮并若干秒之后隐藏按钮
            state.showButtons = true;
            state.hideTimer.cancel();
            state.hideTimer = Timer(const Duration(seconds: 3), () {
              state.showButtons = false;
              logic.update();
            });
            // hideButtons();
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
                      : const Text("未显示"),
                ),

                ///背景
                AnimatedOpacity(
                  opacity: state.showButtons ? 1 : 0,
                  duration: const Duration(
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
                      state.hideTimer.cancel();
                      state.hideTimer = Timer(const Duration(seconds: 3), () {
                        state.showButtons = false;
                        logic.update();
                      });
                      // hideButtons();
                    }
                  },
                  child: AnimatedOpacity(
                    opacity: state.showButtons ? 1 : 0,
                    duration: const Duration(
                      milliseconds: 300,
                    ),
                    child: SizedBox(
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
                  left: 5.r,
                  top: 5.r,
                  child: GestureDetector(
                    onTap: () {
                      ///把播放进度传递给视频界面
                      logic.backVideoPlayerExample();
                    },
                    child: AnimatedOpacity(
                      opacity: state.showButtons ? 1 : 0,
                      duration: const Duration(
                        milliseconds: 300,
                      ),
                      child: SizedBox(
                        width: 15.w,
                        height: 15.w,
                        child: Image.asset(ImageAssets.miniWindowClosePng),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  child: SizedBox(
                    width: 230.w,
                    height: 3.h,
                    child: CustomPaint(
                      painter: ProgressBarPainter(
                        barHeight: 3.h,
                        handleHeight: 3.h,
                        drawShadow: true,
                        videoPlayerValue: state.videoPlayerController.value,
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
