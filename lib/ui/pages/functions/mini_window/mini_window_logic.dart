import 'package:bilibili_getx/ui/shared/image_asset.dart';
import 'package:flutter/cupertino.dart';
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

  Widget buildMiniWindow() {
    return GetBuilder<MiniWindowLogic>(
      builder: (logic) {
        return Stack(
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
            Positioned(
              left: 0,
              right: 0,
              top: 0,
              bottom: 0,
              child: GestureDetector(
                onTap: () {
                  if (state.isPlaying) {
                    state.videoPlayerController.pause();
                  } else {
                    state.videoPlayerController.play();
                  }
                  state.isPlaying = !state.isPlaying;
                  update();
                },
                child: Container(
                  width: 40.w,
                  height: 40.w,
                  child: Image.asset(
                    state.isPlaying
                        ? ImageAssets.biliPlayerPlayCanPausePNG
                        : ImageAssets.bilibiliPlayerPlayCanPlayPNG,
                  ),
                ),
              ),
            )
          ],
        );
      },
    );
  }
}
