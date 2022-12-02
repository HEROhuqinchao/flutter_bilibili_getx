import 'dart:async';
import 'dart:isolate';
import 'package:flutter/cupertino.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:video_player/video_player.dart';
import 'dart:ui' as ui;
import '../../../../core/model/android/video_play/dan_mu_route_model.dart';
import '../../../../core/model/android/video_play/download_video_model.dart';

class BilibiliVideoPlayerState {
  ///视频的cid
  late String cid;

  ///视频的videoOriginalUrl
  late String videoOriginalUrl;

  ///视频的oid
  late String oid;

  ///是否正在加载视频
  late bool isLoadingVideo;

  ///视频控制器
  late VideoPlayerController videoPlayerController;

  ///是否显示顶部工具栏
  late bool showTopBar;

  ///是否显示顶部工具栏的home按钮和更多按钮
  late bool showTopBarHome;
  late bool showTopBarMore;

  ///是否显示底部的工具栏
  late bool showBottomBar;

  ///进度条顶端图片
  late ui.Image image;

  ///是否在播放
  late bool controllerWasPlaying;

  ///是否在拖动
  late bool dragging;

  ///隐藏计时器
  late Timer hideTimer;

  ///是否为全屏显示
  late bool isFullScreen;

  ///是否显示视频进度
  late bool videoProgress;

  ///是否显示视频音量
  late bool videoVolume;

  ///是否显示视频亮度
  late bool videoBrightness;

  ///当前音量数值
  late double volume;

  ///当前亮度数值
  late double brightness;

  ///弹幕
  late bool danMuIsScroll;
  late List<DanMuRouteModel> danMuRouteList;
  late List<List<Widget>> danMuChildren;
  late List<int> velocity;
  late List<double> routeMaxLength;
  late double nowPosition;
  late int danMuPackageNum;
  late List<Widget> danMuWidgets;
  late List<Duration> speedList;
  late int danMuRouteAmount;
  late bool showDanMu;

  ///控制组件是否存在
  ///是否有全屏功能;是否有弹幕功能;是否有播放结束的界面;是否有进度条;是否有时长
  late bool haveFullScreenFunction;
  late bool haveDanMuFunction;
  late bool haveFinishView;
  late bool haveProcessSlider;
  late bool haveProcessTimePosition;

  /// 下载文件的存储路径
  late String destPath;
  late ReceivePort port;
  ///下载列表
  late List<DownloadVideoModel> downloadVideoList;

  BilibiliVideoPlayerState() {
    showBottomBar = true;
    showTopBar = true;
    showTopBarHome = true;
    showTopBarMore = true;
    isLoadingVideo = true;
    danMuRouteAmount = 6;
    showDanMu = true;
    haveFullScreenFunction = true;
    haveDanMuFunction = true;
    haveFinishView = true;
    haveProcessSlider = true;
    haveProcessTimePosition = true;

    ///缓存视频
    destPath = "";
    port = ReceivePort();
    downloadVideoList = [
      DownloadVideoModel(
        downloadPath: "https://media.w3.org/2010/05/sintel/trailer.mp4",
        fileName: "video01",
        status: DownloadTaskStatus.undefined,
        progress: 0,
        taskId: '',
      ),
      DownloadVideoModel(
        downloadPath: "http://www.w3school.com.cn/example/html5/mov_bbb.mp4",
        fileName: "video02",
        status: DownloadTaskStatus.undefined,
        progress: 0,
        taskId: '',
      ),
    ];
  }
}
