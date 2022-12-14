import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

import 'video_player_example_logic.dart';

class VideoPlayerExampleView extends StatelessWidget {
  final logic = Get.find<VideoPlayerExampleLogic>();
  final state = Get.find<VideoPlayerExampleLogic>().state;
  static String routeName = "/video_player_example";

  @override
  Widget build(BuildContext context) {
    return GetBuilder<VideoPlayerExampleLogic>(
      builder: (logic) {
        return Scaffold(
          body: Center(
            child: SizedBox(
              width: 1.sw,
              child: state.videoPlayerController.value.isInitialized
                  ? !state.isMiniWindowPlay
                      ? AspectRatio(
                          aspectRatio:
                              state.videoPlayerController.value.aspectRatio,
                          child: VideoPlayer(state.videoPlayerController),
                        )
                      : Container(
                          color: Colors.black,
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
