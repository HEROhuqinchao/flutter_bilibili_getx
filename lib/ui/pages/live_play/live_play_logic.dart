import 'dart:io';

import 'package:bilibili_getx/core/service/request/live_room_play_request.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../video_play/bilibili_video_player/bilibili_video_player_logic.dart';
import '../video_play/bilibili_video_player/bilibili_video_player_state.dart';
import 'live_play_state.dart';

class LivePlayLogic extends GetxController {
  final LivePlayState state = LivePlayState();

  @override
  void onReady() {
    fetchLiveRoomVideoStream(26311851);
    initWebView();
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  ///初始化WebView
  void initWebView() {
    if (!kIsWeb) {
      if (Platform.isAndroid) {
        WebView.platform = AndroidWebView();
      }
    }
  }

  ///获取直播间的直播视频流flv
  void fetchLiveRoomVideoStream(int roomId) {
    state.roomId = roomId;
    print(state.roomId);
    HYLiveRoomPlayRequest.getLiveRoomStreamData(state.roomId).then((value) {
      state.playUrl = value.durl[0].url;
      print(state.playUrl);
      ///视频播放控件
      Get.put(BilibiliVideoPlayerLogic());
      BilibiliVideoPlayerState bilibiliVideoPlayerState =
          Get.find<BilibiliVideoPlayerLogic>().state;
      bilibiliVideoPlayerState.haveFinishView = false;
      bilibiliVideoPlayerState.haveFullScreenFunction = false;
      bilibiliVideoPlayerState.haveDanMuFunction = false;
      bilibiliVideoPlayerState.haveProcessSlider = false;
      bilibiliVideoPlayerState.haveProcessTimePosition = false;
      bilibiliVideoPlayerState.videoOriginalUrl = state.playUrl;
      BilibiliVideoPlayerLogic bilibiliVideoPlayerLogic =
          Get.find<BilibiliVideoPlayerLogic>();
      bilibiliVideoPlayerLogic.initVideoPlayerVideoData();
      bilibiliVideoPlayerLogic.initVideoControllerAndDanMuController();

      state.isLoading = false;
      update();
    });
  }
}
