import 'dart:async';
import 'dart:math';

import 'package:bilibili_getx/ui/pages/video_play/video_play_logic.dart';
import 'package:brightness_volume/brightness_volume.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

import '../../../../core/model/android/video_play/dan_mu_route_model.dart';
import '../../../../core/model/dan_mu_model_02.dart';
import '../../../../core/service/request/dan_mu_request.dart';
import '../../../shared/color_radix_change.dart';
import '../../../shared/math_compute.dart';
import '../../../shared/text_height_width.dart';
import 'bilibili_video_player_state.dart';

class BilibiliVideoPlayerLogic extends GetxController {
  final BilibiliVideoPlayerState state = BilibiliVideoPlayerState();
  final VideoPlayLogic videoPlayLogic = Get.find<VideoPlayLogic>();

  @override
  void onReady() {
    ///获取音量和亮度
    fetchVolumeBrightness();
    super.onReady();
  }

  @override
  void onClose() {
    disposeAllController();
    super.onClose();
  }

  ///销毁所有控件
  void disposeAllController() {
    state.videoPlayerController.removeListener(() {
      update();
    });
    state.videoPlayerController.dispose();
    for (var item in state.danMuRouteList) {
      item.scrollController.removeListener(() {});
      item.scrollController.dispose();
    }
  }

  ///初始化视频数据
  void initVideoPlayerVideoData() {
    state.isLoadingVideo = true;
    state.showBottomBar = true;
    state.controllerWasPlaying = false;
    state.dragging = false;
    state.isFullScreen = false;
    state.hideTimer = Timer(const Duration(microseconds: 4000), () {});
    state.videoProgress = false;
    state.videoVolume = false;
    state.videoBrightness = false;
  }

  ///初始化弹幕数据
  void initVideoPlayerDanMuData() {
    state.danMuIsScroll = false;
    state.nowPosition = 0;
    state.danMuPackageNum = 0;
    state.velocity = [];
    state.danMuRouteList = [];
    state.danMuChildren = [];
    state.routeMaxLength = [];
    for (var i = 0; i < state.danMuRouteAmount; i++) {
      ///生成随机速度
      state.velocity.add(nextIntRange(50, 80));

      ///初始化轨道对象
      ScrollController scrollController = ScrollController();
      state.danMuRouteList.add(DanMuRouteModel(
          velocity: state.velocity[i],
          scrollController: scrollController,
          show: true));

      ///初始化单条轨道中的弹幕
      Widget header = Container(
        width: .5.sw,
      );
      List<Widget> danMuChild = [header];
      state.danMuChildren.add(danMuChild);

      ///轨道的最大长度
      state.routeMaxLength.add(0);
    }

    ///弹幕轨道控件
    state.danMuWidgets = [];
  }

  ///初始化弹幕和视频的控制器
  void initVideoControllerAndDanMuController() {
    state.videoPlayerController = VideoPlayerController.network(state.videoOriginalUrl)
      ..initialize().then((value) {
        update();
      });
    state.videoPlayerController.addListener(() {
      ///更新进度条
      if (state.videoPlayerController.value.isPlaying) {
        update();
      }

      ///播放结束
      if(state.haveFinishView) {
        if (state.videoPlayerController.value.position ==
            state.videoPlayerController.value.duration) {
          videoPlayLogic.changeVideoState(true);
        }
      }


      ///弹幕与视频播放联动
      if(state.haveDanMuFunction) {
        bool lastState = state.controllerWasPlaying;
        state.controllerWasPlaying = state.videoPlayerController.value.isPlaying;
        if (lastState != state.controllerWasPlaying) {
          if (state.controllerWasPlaying) {
            controlDanMuScroll();
          } else {
            for (var item in state.danMuRouteList) {
              if (item.scrollController.hasClients) {
                item.scrollController.jumpTo(state.nowPosition);
              }
            }
          }
        } else if(!state.danMuIsScroll && state.controllerWasPlaying){
          controlDanMuScroll();
        }
      }
    });

    ///监听目前滑动的位置
    if(state.haveDanMuFunction) {
      for (var item in state.danMuRouteList) {
        item.scrollController.addListener(() {
          state.nowPosition = item.scrollController.position.pixels;
        });
      }
    }
    ///加载完成
    state.isLoadingVideo = false;
  }

  ///控制弹幕滚动
  void controlDanMuScroll() {
    for (var item in state.danMuRouteList) {
      if (item.scrollController.hasClients && item.scrollController.position.maxScrollExtent > 0) {
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
  }

  ///清除弹幕缓存
  void clearDanMuCache() {
    state.nowPosition = 0;
    state.danMuPackageNum = 0;
    state.danMuChildren.clear();
    state.routeMaxLength.clear();
    for (var i = 0; i < state.danMuRouteAmount; i++) {
      ///初始化单条轨道中的弹幕
      Widget header = Container(
        width: .5.sw,
      );
      List<Widget> danMuChild = [header];
      state.danMuChildren.add(danMuChild);

      ///轨道的最大长度
      state.routeMaxLength.add(0);
    }
  }

  ///视频快进或者跳转，更新弹幕数据，并传入起点
  void updateDanMuData(beginProgress) {
    ///总共弹幕包数
    state.danMuPackageNum =
        state.videoPlayerController.value.duration.inMinutes ~/ 6 + 1;
    HYDanMuRequest.getDanMuProtoData(state.oid, 1).then((value) {
      ///发送时间做排序排序
      value.sort((left, right) => left.progress.compareTo(right.progress));
      List<DanMuModel02> filterValue =
          value.where((e) => e.progress > beginProgress).toList();
      SmartDialog.showToast("加载了${filterValue.length}条弹幕");
      for (var element in filterValue) {
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
          double gap = (element.progress - beginProgress) /
                  1000 *
                  state.danMuRouteList[routeMinLengthNumber].velocity -
              state.routeMaxLength[routeMinLengthNumber];
          double textLength = TextHeightWidth.boundingTextSize(
            element.content,
            TextStyle(fontSize: (element.fontsize - 12).sp),
          ).width;
          double tempMaxLength = (element.progress - beginProgress) /
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
            margin: EdgeInsets.only(left: gap + 5.r),
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
      for (var i = 0; i < state.danMuRouteAmount; i++) {
        Widget footer = Container(width: 1.sw);
        state.danMuChildren[i].add(footer);
      }
      ///弹幕未滚动
      state.danMuIsScroll = false;
      update();
    });
  }

  ///视频的oid；开始时间beginProgress
  void fetchDanMu(beginProgress) {
    ///总共弹幕包数
    state.danMuPackageNum =
        state.videoPlayerController.value.duration.inMinutes ~/ 6 + 1;
    HYDanMuRequest.getDanMuProtoData(state.oid, 1).then((value) {
      // value = value.sublist(0,10);
      ///发送时间做排序排序
      value.sort((left, right) => left.progress.compareTo(right.progress));

      List<DanMuModel02> filterValue =
          value.where((e) => e.progress > beginProgress).toList();
      // print("filterValue.length--${filterValue.length}");
      for (var element in filterValue) {
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
            margin: EdgeInsets.only(left: gap + 5.r),
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
      for (var i = 0; i < state.danMuRouteAmount; i++) {
        Widget footer = Container(width: 1.sw);
        state.danMuChildren[i].add(footer);
        Widget widget = GetBuilder<BilibiliVideoPlayerLogic>(builder: (logic) {
          return SizedBox(
            width: 1.sw,
            height: 15.w,
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
        });
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

      ///弹幕是否在滚动
      state.danMuIsScroll = false;
      update();
    } else {
      ///播放开始计时消失
      state.videoPlayerController.play();
      cancelAndRestartTimer();

      ///弹幕是否在滚动
      state.danMuIsScroll = true;
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
      BuildContext context, Offset delta) {
    if (!state.videoPlayerController.value.isInitialized) {
      return;
    }
    dragToRelativePosition(context, delta);
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

    ///清空弹幕轨道的数据，并重新获取该时刻之后的弹幕数据
    if(state.haveDanMuFunction) {
      Timer.periodic(const Duration(seconds: 1), (timer) {
        clearDanMuCache();
        updateDanMuData(state.videoPlayerController.value.position.inMilliseconds);
        timer.cancel();
      });
    }
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

  ///滑动进度条
  void dragToRelativePosition(BuildContext context, Offset delta) {
    Duration duration = Duration(milliseconds: (delta.dx * 200).toInt());
    state.videoPlayerController
        .seekTo(state.videoPlayerController.value.position + duration);
    update();
  }

  ///横屏模式
  void openFullScreen() {
    state.isFullScreen = true;
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    videoPlayLogic.setFullScreen(1.sw);
    update();
  }

  ///竖屏模式
  void closeFullScreen() {
    state.isFullScreen = false;
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.top, SystemUiOverlay.bottom]);
    videoPlayLogic.setFullScreen(220.h);
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

  void showOrHideDanMu(danMuState) {
    state.showDanMu = danMuState;
    update();
  }
}
