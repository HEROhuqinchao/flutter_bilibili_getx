import 'dart:io';
import 'dart:isolate';
import 'dart:ui';

import 'package:bilibili_getx/core/service/request/video_play_request.dart';
import 'package:bilibili_getx/core/service/utils/constant.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:bilibili_getx/ui/pages/video_play/video_play_state.dart';
import 'package:path_provider/path_provider.dart';
import '../../shared/params_sign.dart';
import 'bilibili_video_player/bilibili_video_player_logic.dart';

class VideoPlayLogic extends GetxController {
  final VideoPlayState state = VideoPlayState();

  @override
  void onReady() {
    ///控制显示或者隐藏
    state.nestedScrollViewController.addListener(() {
      if (state.nestedScrollViewController.offset > 140.w &&
          !state.nestedScrollViewController.position.outOfRange &&
          state.showOrHideIconAndTitleOpacity != 1) {
        state.showOrHideIconAndTitleOpacity = 1;
        update();
      }
      if (state.nestedScrollViewController.offset < 140.w &&
          !state.nestedScrollViewController.position.outOfRange &&
          state.showOrHideIconAndTitleOpacity != 0) {
        state.showOrHideIconAndTitleOpacity = 0;
        update();
      }
    });
    super.onReady();
  }

  ///销毁控件，取消监听
  @override
  void onClose() {
    state.nestedScrollViewController.removeListener(() {});
    state.nestedScrollViewController.dispose();
    super.onClose();
  }

  void setFullScreen(double height) {
    state.expandedHeight = height;
    update();
  }

  void initVideoPlayData() {
    state.isLoadingVideoPlayer = true;
    state.isLoadingVideoProfile = true;
    state.isLoadingVideoReply = true;
    state.expandedHeight = 190.w;
    state.showOrHideIconAndTitleOpacity = 0;
    state.isExpanded = false;
    state.allReplies = [];
  }

  ///获取视频数据
  void fetchVideoView() {
    Map<String, dynamic> params = {
      'aid': state.aid,
      'appkey': Constant.appKey,
      'build': '5480400',
      'ts': '1662682722783',
    };

    ///加上sign字段
    final signEntry = <String, dynamic>{'sign': ParamsSign.getSign(params)};
    params.addEntries(signEntry.entries);

    HYVideoRequest.getVideoView(params).then((value) {
      state.videoProfile = value.data;
      state.isLoadingVideoProfile = false;
      update();
    });
  }

  ///获取视频回复的评论
  void fetchVideoReply() {
    HYVideoRequest.getVideoReply(state.aid, 1, 1).then((value) {
      state.videoReply = value;
      state.allReplies.addAll(value.replies);
      state.isLoadingVideoReply = false;
      update();
    });
  }

  ///展开明细或隐藏视频的明细
  void expandedVideoProfileDetail() {
    state.isExpanded = !state.isExpanded;
    state.cutDownWidgetKey.currentState!.widgetShift();
    update();
  }

  ///显示或者隐藏弹幕
  void showOrHideDanMu() {
    state.danMuOpenOrClose = !state.danMuOpenOrClose;
    Get.lazyPut(() => BilibiliVideoPlayerLogic());
    BilibiliVideoPlayerLogic bilibiliVideoPlayerLogic =
        Get.find<BilibiliVideoPlayerLogic>();
    bilibiliVideoPlayerLogic.showOrHideDanMu(state.danMuOpenOrClose);
  }

  ///是否结束放映
  void changeVideoState(bool videoIsFinished) {
    state.videoIsFinished = videoIsFinished;
    update();
  }

  void iniDownloadFilePath() async {
    ///获取外部存储的目录
    final filepath = await getExternalStorageDirectory();
    state.destPath = "${filepath!.path}/video_downloads";
    var file = Directory(state.destPath);
    try {
      bool exists = await file.exists();
      if (!exists) {
        await file.create();
      } else if (Constant.isDebug) {
        print("当前下载目录为${file.path}");
      }
    } catch (e) {
      print(e);
    }
  }

  void initFlutterDownloader() {
    ///UI主线程线程 与 下载线程 之间的数据交流
    IsolateNameServer.registerPortWithName(
        state.port.sendPort, 'downloader_send_port');
    state.port.listen((dynamic data) {
      String id = data[0];
      DownloadTaskStatus status = data[1];
      int progress = data[2];
      for (var i = 0; i < state.downloadVideoList.length; i++) {
        if (state.downloadVideoList[i].taskId == id) {
          state.downloadVideoList[i].status = status;
          state.downloadVideoList[i].progress = progress.toDouble() / 100;
          print("当前progress为${state.downloadVideoList[i].progress}");
          update();
          break;
        }
      }
    });
    FlutterDownloader.registerCallback(downloadCallback);
  }

  @pragma('vm:entry-point')
  static void downloadCallback(taskId, status, progress) {
    final SendPort? send =
    IsolateNameServer.lookupPortByName('downloader_send_port');
    send?.send([taskId, status, progress]);
  }
}
