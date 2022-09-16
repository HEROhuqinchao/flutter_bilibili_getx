import 'dart:async';
import 'dart:math';

import 'package:brightness_volume/brightness_volume.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

import '../../../../core/model/dan_mu_model_02.dart';
import '../../../../core/service/request/dan_mu_request.dart';
import '../../../shared/color_radix_change.dart';
import '../../../shared/math_compute.dart';
import '../../../shared/text_height_width.dart';
import 'bilibili_video_player_state.dart';

class BilibiliVideoPlayerLogic extends GetxController {
  final BilibiliVideoPlayerState state = BilibiliVideoPlayerState();

  @override
  void onReady() {
    ///获取音量和亮度
    fetchVolumeBrightness();
    super.onReady();
  }

  @override
  void onClose() {
    state.videoPlayerController.removeListener(() {
      update();
    });
    state.videoPlayerController.dispose();
    for (var item in state.danMuRouteList) {
      item.scrollController.removeListener(() {});
      item.scrollController.dispose();
    }
    super.onClose();
  }

  void initVideo(videoPath) {
    state.videoPlayerController = VideoPlayerController.network(
        // "http://61.164.90.254:9000/dm-pls/08388d26a77a413fa8da09837c6df420.mp4"
        videoPath)
      ..initialize().then((value) {
        update();
      });
    state.videoPlayerController.addListener(() {
      bool lastState = state.controllerWasPlaying;
      if (state.videoPlayerController.value.isPlaying) {
        state.controllerWasPlaying = true;
        if (state.showBottomBar == true) {
          update();
        }
      } else {
        state.controllerWasPlaying = false;
      }
      if (lastState != state.controllerWasPlaying) {
        if (state.controllerWasPlaying) {
          for (var item in state.danMuRouteList) {
            if (item.scrollController.hasClients) {
              item.scrollController.animateTo(
                  item.scrollController.position.maxScrollExtent,
                  duration: Duration(
                      milliseconds:
                          item.scrollController.position.maxScrollExtent *
                              1000 ~/
                              item.velocity),
                  curve: Curves.linear);
            }
          }
        } else {
          for (var item in state.danMuRouteList) {
            if (item.scrollController.hasClients) {
              item.scrollController.jumpTo(state.nowPosition);
            }
          }
        }
      }
    });
    for (var item in state.danMuRouteList) {
      item.scrollController.addListener(() {
        state.nowPosition = item.scrollController.position.pixels;
      });
    }
    state.isLoadingVideo = false;
  }

  void fetchDanMu(oid) {
    ///总共弹幕包数
    state.danMuPackageNum =
        state.videoPlayerController.value.duration.inMinutes ~/ 6 + 1;
    HYDanMuRequest.getDanMuProtoData(oid, 1).then((value) {
      ///发送时间做排序排序
      value.sort((left, right) => left.progress.compareTo(right.progress));

      for (var element in value) {
        ///普通弹幕
        if (element.mode == 1 || element.mode == 2 || element.mode == 3) {
          // print(element.content);
          // print(element.progress);

          ///寻找最短的那条轨道
          int routeMinLengthNumber = getListMin(state.routeMaxLength);

          ///随机选择一条发送(使弹幕混乱）
          if (Random().nextInt(3) == 1) {
            routeMinLengthNumber = Random().nextInt(state.danMuRouteAmount);
          }

          ///判断是否加间距（如果弹幕在很后面发出，需要加上间距）
          double gap = element.progress /
                  1000 *
                  state.danMuRouteList[routeMinLengthNumber].velocity -
              state.routeMaxLength[routeMinLengthNumber];
          double textLength = TextHeightWidth.boundingTextSize(
            element.content,
            TextStyle(fontSize: (element.fontsize - 12).sp),
          ).width;
          double tempMaxLength = element.progress /
                  1000 *
                  state.danMuRouteList[routeMinLengthNumber].velocity +
              textLength;
          if (tempMaxLength > state.routeMaxLength[routeMinLengthNumber]) {
            state.routeMaxLength[routeMinLengthNumber] = tempMaxLength;
          } else {
            state.routeMaxLength[routeMinLengthNumber] += textLength;
          }
          if (gap < 0) {
            gap = 0;
          }
          Widget danMu = Container(
            margin: EdgeInsets.only(left: gap),
            child: Text(element.content,
                style: TextStyle(
                  color: ColorRadixChange.hexColor(
                      element.color.toRadixString(16)),
                  fontSize: (element.fontsize - 12).sp,
                  fontWeight: FontWeight.normal,
                )),
          );
          state.danMuChildren[routeMinLengthNumber].add(danMu);
        } else if (element.mode == 4) {
          ///底部弹幕
        } else if (element.mode == 5) {
          ///顶部弹幕
        } else {}
      }

      ///弹幕轨道添加到布局中
      for (var i = 0; i < state.danMuRouteList.length; i++) {
        Widget widget = SizedBox(
          width: 1.sw,
          height: 25.w,
          child: SingleChildScrollView(
            controller: state.danMuRouteList[i].scrollController,
            scrollDirection: Axis.horizontal,
            child: StaggeredGrid.count(
              crossAxisCount: 1,
              axisDirection: AxisDirection.right,
              children: state.danMuChildren[i],
            ),
          ),
        );
        state.danMuWidgets.add(widget);
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

  ///拖动进度条（全屏）
  void videoPlayScreenOnHorizontalDragUpdate(
      BuildContext context, Offset globalPosition) {
    if (!state.videoPlayerController.value.isInitialized) {
      return;
    }
    seekToRelativePosition(context, globalPosition);
  }

  ///拖动进度条（拖动进度条）
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
    if (state.videoPlayerController.value.isPlaying) {
      startHideTimer();
    }
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

  // ///横屏模式
  // void openFullScreen() {
  //   state.isFullScreen = true;
  //   SystemChrome.setPreferredOrientations(
  //       [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
  //   SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
  //       overlays: [SystemUiOverlay.top, SystemUiOverlay.bottom]);
  //   update();
  // }
  //
  // ///竖屏模式
  // void closeFullScreen() {
  //   state.isFullScreen = false;
  //   SystemChrome.setPreferredOrientations(
  //       [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  //   SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
  //       overlays: [SystemUiOverlay.top, SystemUiOverlay.bottom]);
  //   update();
  // }

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
