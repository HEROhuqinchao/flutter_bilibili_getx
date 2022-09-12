import 'dart:async';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

import 'bilibili_video_player_state.dart';

class BilibiliVideoPlayerLogic extends GetxController {
  final BilibiliVideoPlayerState state = BilibiliVideoPlayerState();

  @override
  void onInit() {
    state.videoPlayerController = VideoPlayerController.network(
        "http://61.164.90.254:9000/dm-pls/08388d26a77a413fa8da09837c6df420.mp4")
      ..initialize().then((value) {
        state.latestValue = state.videoPlayerController.value;
        update();
      });
    state.videoPlayerController.addListener(() {
      state.latestValue = state.videoPlayerController.value;
      update();
    });
    super.onInit();
  }

  @override
  void onClose() {
    state.videoPlayerController.removeListener(() {
      update();
    });
    state.videoPlayerController.dispose();
    super.onClose();
  }

  void playOrPauseVideo() {
    ///播放或暂停
    if (state.videoPlayerController.value.isPlaying) {
      state.videoPlayerController.pause();
      state.showBottomBar = true;
    } else {
      state.videoPlayerController.play();
      ///隐藏进度条
      startHideTimer();
    }
    update();
  }

  ///水平拖动进度条
  void videoPlayProgressOnHorizontalDragStart() {
    if (!state.videoPlayerController.value.isInitialized) {
      return;
    }
    state.controllerWasPlaying = state.videoPlayerController.value.isPlaying;
    if (state.controllerWasPlaying) {
      state.videoPlayerController.pause();
    }
    state.dragging = true;
    state.hideTimer.cancel();
    update();
  }

  ///拖动进度条
  void videoPlayProgressOnHorizontalDragUpdate(
      BuildContext context, Offset globalPosition) {
    if (!state.videoPlayerController.value.isInitialized) {
      return;
    }
    seekToRelativePosition(context, globalPosition);
  }

  ///拖动结束
  void videoPlayProgressOnHorizontalDragEnd() {
    if (state.controllerWasPlaying) {
      state.videoPlayerController.play();
    }
    state.dragging = false;
    startHideTimer();
  }

  ///点击进度条跳转至某一时刻
  void videoPlayProgressOnTapDown(BuildContext context, Offset globalPosition) {
    if (!state.videoPlayerController.value.isInitialized) {
      return;
    }
    seekToRelativePosition(context, globalPosition);
  }

  ///隐藏进度条
  void startHideTimer() {
    ///过一段时间隐藏掉
    state.hideTimer = Timer(const Duration(microseconds: 2500), () {
      state.showBottomBar = false;
      update();
    });
  }

  ///重启隐藏计时器
  void cancelAndRestartTimer() {
    state.hideTimer.cancel();
    startHideTimer();
    state.showBottomBar = true;
    update();
  }

  ///跳转至某一时刻
  void seekToRelativePosition(BuildContext context, Offset globalPosition) {
    ///获取父组件
    final box = context.findRenderObject()! as RenderBox;

    ///将屏幕坐标转换成父组件内的坐标
    final Offset tapPos = box.globalToLocal(globalPosition);

    ///占比多少
    final double relative = tapPos.dx / box.size.width;

    ///计算出时长
    final Duration position =
        state.videoPlayerController.value.duration * relative;

    ///进度跳转
    state.videoPlayerController.seekTo(position);
    update();
  }

  ///全屏模式
  void openOrCloseFullScreen() {
    if (state.isFullScreen) {
      // AutoOrientation.portraitAutoMode();
      ///显示状态栏，与底部虚拟操作按钮
      SystemChrome.setEnabledSystemUIMode(
          SystemUiMode.manual, overlays: [SystemUiOverlay.top, SystemUiOverlay.bottom]);
    } else {
      // AutoOrientation.landscapeAutoMode();

      ///关闭状态栏，与底部虚拟操作按钮
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    }
    cancelAndRestartTimer();
    update();
  }
}
