import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

import 'mini_window_logic.dart';

class MiniWindowView extends StatelessWidget {
  static String routeName = "/mini_window";

  @override
  Widget build(BuildContext context) {
    final logic = Get.find<MiniWindowLogic>();
    final state = Get.find<MiniWindowLogic>().state;

    return GetBuilder<MiniWindowLogic>(
      builder: (logic) {
        return Scaffold(
          body: Center(
            child: SizedBox(
              width: 1.sw,
              child: state.videoPlayerController.value.isInitialized
                  ? AspectRatio(
                      aspectRatio:
                          state.videoPlayerController.value.aspectRatio,
                      child: VideoPlayer(state.videoPlayerController),
                    )
                  : Container(),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.desktop_windows_outlined),
            onPressed: () {
              logic.showVideoMiniWindow(context);
            },
          ),
        );
      },
    );
  }
}
