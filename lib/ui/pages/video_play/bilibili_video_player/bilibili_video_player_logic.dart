import 'dart:async';

import 'package:brightness_volume/brightness_volume.dart';
import 'package:flutter/cupertino.dart';
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
    ///获取视频的弹幕
    fetchDanMu();

    ///获取音量和亮度
    fetchVolumeBrightness();

    state.videoPlayerController = VideoPlayerController.network(
        // "http://61.164.90.254:9000/dm-pls/08388d26a77a413fa8da09837c6df420.mp4"
        "https://media.w3.org/2010/05/sintel/trailer.mp4")
      ..initialize().then((value) {
        update();
      });
    state.videoPlayerController.addListener(() {
      if (state.videoPlayerController.value.isPlaying) {
        int seconds = state.videoPlayerController.value.position.inSeconds;
        int minutes = state.videoPlayerController.value.position.inMinutes;
        int hours = state.videoPlayerController.value.position.inHours;
        int tempProcess = seconds + minutes * 60 + hours * 3600;
        if (state.latestProcess != tempProcess) {
          state.latestProcess = tempProcess;
          for (var i = state.customDanMuListBeginIndex;
              i < state.customDanMuList.length;
              i++) {
            var item = state.customDanMuList[i];
            if (state.latestProcess >= item.progress) {
              ///选择轨道（目前是最短的选中，随机值的话也可）
              int routeNum = getListMin(state.movingDMRoutesTime);

              ///弹幕在那一时刻发出，但是如果弹幕早就发出了，而选中的那个轨道排队的弹幕很多，你就得延后发
              int sendTime =
                  item.progress + getMovingDelayTime(item.progress, routeNum);

              ///弹幕内容
              String content = item.content;

              ///弹幕颜色
              Color color =
                  ColorRadixChange.hexColor(item.color.toRadixString(16));

              ///弹幕字体大小（这里原本数据传来我设置后发现太大了
              double fontSize = item.fontsize - 12;

              ///不同轨道有不同速度，对应弹幕从右边移到左边的时间不同
              int moveTime = state.moveTimeList[routeNum];

              ///弹幕有长有短，所以需要弹幕显示在屏幕上的宽度
              double textLength = TextHeightWidth.boundingTextSize(
                item.content,
                TextStyle(fontSize: item.fontsize - 12),
              ).width;

              ///构建一个移动的弹幕
              SendMovingDM sendDM = SendMovingDM(
                sendTime: sendTime,
                routeNum: routeNum,
                content: content,
                color: color,
                fontSize: fontSize,
                moveTime: moveTime,
              );

              ///扔到stack布局中
              state.dMWidgets.add(sendDM);

              ///更新轨道数组，防止弹幕叠在一起了，这里延迟了500毫秒
              state.movingDMRoutesTime[routeNum] =
                  sendTime + textLength / state.speedList[routeNum] + 500;
              update();
            } else {
              state.customDanMuListBeginIndex = i;
            }
          }
        }
      }
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

  void fetchDanMu() {
    ///像素每毫秒
    for (int i = 0; i < state.moveTimeList.length; i++) {
      state.speedList.add(1.sw / state.moveTimeList[i]);
    }

    ///总共allMount包弹幕
    state.allMount = state.duration ~/ 6 + 1;
    getDMPackage();
    state.segmentIndex++;

    ///六分钟一包
    state.danMuTimerPeriodic =
        Timer.periodic(const Duration(minutes: 6), (timer) {
      if (state.segmentIndex <= state.allMount) {
        getDMPackage();
        state.segmentIndex++;
      } else {
        timer.cancel();
      }
    });
  }

  ///获取弹幕包
  void getDMPackage() {
    HYDanMuRequest.getDanMuProtoData(state.oid, state.segmentIndex)
        .then((value) {
      ///发送时间做排序
      value.sort((left, right) => left.progress.compareTo(right.progress));

      ///滚动弹幕、顶部弹幕、底部弹幕
      List<DanMuModel02> topDanMuList = [];
      List<DanMuModel02> bottomDanMuList = [];

      ///最多装填X条弹幕，太多弹幕会卡顿严重
      value = value.sublist(0, value.length > 50 ? 50 : value.length);
      for (var element in value) {
        // print(element.content);
        // print(element.progress);
        // print("/////////////////");
        if (element.mode == 1 || element.mode == 2 || element.mode == 3) {
          ///普通弹幕
          state.customDanMuList.add(element);
        } else if (element.mode == 4) {
          ///底部弹幕
          bottomDanMuList.add(element);
        } else if (element.mode == 5) {
          ///顶部弹幕
          topDanMuList.add(element);
        } else {}
      }

      // ///构建移动弹幕
      // for (int i = 0; i < state.customDanMuList.length; i++) {
      //   ///选择轨道（目前是最短的选中，随机值的话也可）
      //   int routeNum = getListMin(state.movingDMRoutesTime);
      //
      //   ///弹幕在那一时刻发出，但是如果弹幕早就发出了，而选中的那个轨道排队的弹幕很多，你就得延后发
      //   int sendTime = state.customDanMuList[i].progress +
      //       getMovingDelayTime(state.customDanMuList[i].progress, routeNum);
      //
      //   ///弹幕内容
      //   String content = state.customDanMuList[i].content;
      //
      //   ///弹幕颜色
      //   Color color = ColorRadixChange.hexColor(
      //       state.customDanMuList[i].color.toRadixString(16));
      //
      //   ///弹幕字体大小（这里原本数据传来我设置后发现太大了
      //   double fontSize = state.customDanMuList[i].fontsize - 12;
      //
      //   ///不同轨道有不同速度，对应弹幕从右边移到左边的时间不同
      //   int moveTime = state.moveTimeList[routeNum];
      //
      //   ///弹幕有长有短，所以需要弹幕显示在屏幕上的宽度
      //   double textLength = TextHeightWidth.boundingTextSize(
      //     state.customDanMuList[i].content,
      //     TextStyle(fontSize: state.customDanMuList[i].fontsize - 12),
      //   ).width;
      //
      //   ///构建一个移动的弹幕
      //   SendMovingDM sendDM = SendMovingDM(
      //     sendTime: sendTime,
      //     routeNum: routeNum,
      //     content: content,
      //     color: color,
      //     fontSize: fontSize,
      //     moveTime: moveTime,
      //   );
      //
      //   ///扔到stack布局中
      //   state.dMWidgets.add(sendDM);
      //
      //   ///更新轨道数组，防止弹幕叠在一起了，这里延迟了500毫秒
      //   state.movingDMRoutesTime[routeNum] =
      //       sendTime + textLength / state.speedList[routeNum] + 500;
      // }

      ///顶部弹幕
      for (int i = 0; i < topDanMuList.length; i++) {
        ///选择轨道（目前是最短的选中，随机值的话也可）
        int routeNum = getListMin(state.topDMRoutesTime);

        ///弹幕在那一时刻发出
        int sendTime = topDanMuList[i].progress +
            getTopDelayTime(topDanMuList[i].progress, routeNum);

        ///弹幕内容
        String content = topDanMuList[i].content;

        ///弹幕颜色
        Color color =
            ColorRadixChange.hexColor(topDanMuList[i].color.toRadixString(16));

        ///弹幕字体大小（这里原本数据传来我设置后发现太大了
        double fontSize = topDanMuList[i].fontsize - 12;

        ///弹幕显示时间
        int showTime = state.showTimeList[routeNum];

        ///构建一个移动的弹幕
        SendTopDM sendTopDM = SendTopDM(
          sendTime: sendTime,
          routeNum: routeNum,
          content: content,
          color: color,
          fontSize: fontSize,
          showTime: showTime,
        );

        ///扔到stack布局中
        state.dMWidgets.add(sendTopDM);

        ///更新轨道数组
        if (sendTime > state.topDMRoutesTime[routeNum]) {
          state.topDMRoutesTime[routeNum] += (showTime + sendTime + 1000);
        } else if (sendTime == state.topDMRoutesTime[routeNum]) {
          state.topDMRoutesTime[routeNum] += (showTime + 1000);
        } else {
          ///小于是不可能的
        }

        // print("####${topDanMuList[i].progress}");
        // print("####${sendTime}");
        //
        // for (var i in topDMRoutesTime) {
        //   print(i);
        // }
        // print("######");
      }

      ///底部弹幕
      for (int i = 0; i < bottomDanMuList.length; i++) {
        ///选择轨道（目前是最短的选中，随机值的话也可）
        int routeNum = getListMin(state.bottomDMRoutesTime);

        ///弹幕在那一时刻发出
        int sendTime = bottomDanMuList[i].progress +
            getBottomDelayTime(bottomDanMuList[i].progress, routeNum);

        ///弹幕内容
        String content = bottomDanMuList[i].content;

        ///弹幕颜色
        Color color = ColorRadixChange.hexColor(
            bottomDanMuList[i].color.toRadixString(16));

        ///弹幕字体大小（这里原本数据传来我设置后发现太大了
        double fontSize = bottomDanMuList[i].fontsize - 12;

        ///弹幕显示时间
        int showTime = state.showTimeList[routeNum];

        ///构建一个移动的弹幕
        SendBottomDM sendBottomDM = SendBottomDM(
          sendTime: sendTime,
          routeNum: routeNum,
          content: content,
          color: color,
          fontSize: fontSize,
          showTime: showTime,
        );

        ///扔到stack布局中
        state.dMWidgets.add(sendBottomDM);

        ///更新轨道数组
        if (sendTime > state.bottomDMRoutesTime[routeNum]) {
          state.bottomDMRoutesTime[routeNum] += (showTime + sendTime + 1000);
        } else if (sendTime == state.bottomDMRoutesTime[routeNum]) {
          state.bottomDMRoutesTime[routeNum] += (showTime + 1000);
        } else {
          ///小于是不可能的
        }
      }
      update();
    });
  }

  ///延迟发送
  int getMovingDelayTime(int sendTime, int routeNum) {
    double delayTime = 0;

    ///如果当前选择的最短轨道比你发射时间还长
    if (state.movingDMRoutesTime[routeNum] > sendTime) {
      delayTime = state.movingDMRoutesTime[routeNum] - sendTime;
    }
    return delayTime.toInt();
  }

  ///延迟发送
  int getTopDelayTime(int sendTime, int routeNum) {
    double delayTime = 0;

    ///如果当前选择的最短轨道比你发射时间还长
    if (state.topDMRoutesTime[routeNum] > sendTime) {
      delayTime += state.topDMRoutesTime[routeNum] - sendTime;
    }
    return delayTime.toInt();
  }

  ///延迟发送
  int getBottomDelayTime(int sendTime, int routeNum) {
    double delayTime = 0;

    ///如果当前选择的最短轨道比你发射时间还长
    if (state.bottomDMRoutesTime[routeNum] > sendTime) {
      delayTime = state.bottomDMRoutesTime[routeNum] - sendTime;
    }
    return delayTime.toInt();
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
