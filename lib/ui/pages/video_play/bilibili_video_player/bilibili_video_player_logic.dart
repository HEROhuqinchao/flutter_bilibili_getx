import 'dart:async';

import 'package:brightness_volume/brightness_volume.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

import '../../../../core/model/dan_mu_model_02.dart';
import '../../../../core/service/request/dan_mu_request.dart';
import '../../../shared/color_radix_change.dart';
import '../../../shared/math_compute.dart';
import '../../../shared/text_height_width.dart';
import 'bilibili_video_player_state.dart';
import 'bilibili_video_player_view.dart';

class BilibiliVideoPlayerLogic extends GetxController {
  final BilibiliVideoPlayerState state = BilibiliVideoPlayerState();

  @override
  void onInit() {
    ///初始化视频
    initVideo();

    ///获取音量和亮度
    fetchVolumeBrightness();

    fetchDanMu();
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

  void initVideo() {
    state.videoPlayerController = VideoPlayerController.network(
        // "http://61.164.90.254:9000/dm-pls/08388d26a77a413fa8da09837c6df420.mp4"
        "https://media.w3.org/2010/05/sintel/trailer.mp4")
      ..initialize().then((value) {
        update();
      });
    state.videoPlayerController.addListener(() {
      bool lastState = state.controllerWasPlaying;
      if (state.videoPlayerController.value.isPlaying) {
        state.controllerWasPlaying = true;
      } else {
        state.controllerWasPlaying = false;
      }
      if (lastState != state.controllerWasPlaying) {
        if (state.controllerWasPlaying) {
          if (state.scrollController.hasClients) {
            print("state.scrollController.position.maxScrollExtent---${state.scrollController.position.maxScrollExtent}");
            state.scrollController.animateTo(
                state.scrollController.position.maxScrollExtent,
                duration: Duration(
                    seconds: 119),
                curve: Curves.linear);
          }
        } else {
          if (state.scrollController.hasClients) {
            state.scrollController.jumpTo(state.nowPosition);
          }
        }
      }
    });
    state.scrollController.addListener(() {
      state.nowPosition = state.scrollController.position.pixels;
    });
  }

  void fetchDanMu() {
    ///总共弹幕包数
    state.danMuPackageNum =
        state.videoPlayerController.value.duration.inMinutes ~/ 6 + 1;
    HYDanMuRequest.getDanMuProtoData(825354573, 1).then((value) {
      ///发送时间做排序排序
      value.sort((left, right) => left.progress.compareTo(right.progress));

      ///最多装填X条弹幕，太多弹幕会卡顿严重
      // value = value.sublist(0, value.length > 10 ? 10 : value.length);
      for (var element in value) {
        ///普通弹幕
        if (element.mode == 1 || element.mode == 2 || element.mode == 3) {
          print(element.content);
          print(element.progress);
          double gap = element.progress / 1000 * state.v - state.maxLength;
          double textLength = TextHeightWidth.boundingTextSize(
            element.content,
            TextStyle(fontSize: element.fontsize - 10),
          ).width;
          double tempMaxLength = element.progress / 1000 * state.v + textLength;
          if(tempMaxLength > state.maxLength) {
            state.maxLength = tempMaxLength;
          } else {
            state.maxLength += textLength;
          }
          print("state.maxLength---${state.maxLength}");
          if(gap < 0) {
            gap = 0;
          }
          Widget danMu = Container(
            color: Colors.red,
            margin: EdgeInsets.only(left: gap),
            child: Text(element.content,
                style: TextStyle(
                  color: ColorRadixChange.hexColor(
                      element.color.toRadixString(16)),
                  fontSize: (element.fontsize - 10).sp,
                  fontWeight: FontWeight.normal,
                )),
          );
          state.danMuChildren.add(danMu);
        } else if (element.mode == 4) {
          ///底部弹幕
        } else if (element.mode == 5) {
          ///顶部弹幕
        } else {}
      }
      update();
    });
  }

  ///获取音量和亮度
  void fetchVolumeBrightness() async {
    state.brightness = (await BVUtils.brightness).clamp(0.0, 1.0);
    state.volume = (await BVUtils.volume).clamp(0.0, 1.0);
  }

  ///播放或暂停
  void playOrPauseVideo() {
    ///暂停显示进度条
    if (state.videoPlayerController.value.isPlaying) {
      ///视频控制
      state.videoPlayerController.pause();
      state.hideTimer.cancel();
      state.showBottomBar = true;
      update();
    } else {
      ///播放开始计时消失
      state.videoPlayerController.play();
      cancelAndRestartTimer();
      update();
    }
  }

  ///水平拖动进度条
  void videoPlayProgressOnHorizontalDragStart() {
    ///是否显示视频当前进度的弹框（拖动进度条时显示）
    state.videoProgress = true;
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
    state.videoProgress = false;
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
    state.hideTimer = Timer(const Duration(milliseconds: 4000), () {
      state.showBottomBar = false;
      update();
    });
  }

  ///重启隐藏计时器
  void cancelAndRestartTimer() {
    state.hideTimer.cancel();
    state.showBottomBar = true;
    update();
    if (state.videoPlayerController.value.isPlaying) {
      startHideTimer();
    }
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

  ///横屏模式
  void openFullScreen() {
    state.isFullScreen = true;
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    update();
  }

  ///竖屏模式
  void closeFullScreen() {
    state.isFullScreen = false;
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.top, SystemUiOverlay.bottom]);
    update();
  }

  ///开始调节音量或者亮度
  void videoPlayVolumeBrightnessOnVerticalDragStart(DragStartDetails details) {
    if (details.globalPosition.dx > 1.sw / 2) {
      state.videoVolume = true;
    } else {
      state.videoBrightness = true;
    }
    update();
  }

  ///结束调节音量或者亮度
  void videoPlayVolumeBrightnessOnVerticalDragEnd() {
    state.videoBrightness = false;
    state.videoVolume = false;
    update();
  }

  ///音量更新或者亮度
  void videoPlayVolumeBrightnessOnVerticalDragUpdate(
      DragUpdateDetails details) {
    if (state.isFullScreen) {
      if (details.globalPosition.dx > 1.sw / 2) {
        state.volume = (state.volume - (details.delta.dy / 60));
        BVUtils.setVolume(state.volume.clamp(0, 1));
      } else {
        state.brightness = (state.brightness - (details.delta.dy / 60));
        BVUtils.setBrightness(state.brightness.clamp(0, 1));
      }
    } else {
      if (details.globalPosition.dx > 1.sw / 2) {
        state.volume = (state.volume - (details.delta.dy / 40));
        BVUtils.setVolume(state.volume.clamp(0, 1));
      } else {
        state.brightness = (state.brightness - (details.delta.dy / 40));
        BVUtils.setBrightness(state.brightness.clamp(0, 1));
      }
    }
    update();
  }
}
