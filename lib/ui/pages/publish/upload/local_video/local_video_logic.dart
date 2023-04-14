import 'package:bilibili_getx/core/channel/channel_util.dart';
import 'package:get/get.dart';

import '../../../../../core/model/local_video_model.dart';
import '../../../video_play/bilibili_video_player/bilibili_video_player_logic.dart';
import '../../../video_play/bilibili_video_player/bilibili_video_player_state.dart';
import '../pre_edit_video/pre_edit_video_view.dart';
import 'local_video_state.dart';

class LocalVideoLogic extends GetxController {
  final LocalVideoState state = LocalVideoState();

  @override
  void onReady() {
    fetchLocalVideo();
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  ///获取手机本地的视频
  fetchLocalVideo() {
    ChannelUtil.getMediaMethodChannel.invokeMethod("getVideos").then((value) {
      for (int i = 0; i < value.length; i++) {
        state.localVideoList.add(HYLocalVideoModel(
          videoLocation: value[i]["videoLocation"],
          videoName: value[i]["videoName"],

          ///这里的duration返回值单位为毫秒，不是秒
          duration: value[i]["duration"] ?? "0",
        ));
        print(value[i]["videoLocation"]);
        print(value[i]["videoName"]);
      }
      update();
    });
  }

  ///跳转至预编辑界面
  void go2PreEditScreen(int index) {
    Get.put(BilibiliVideoPlayerLogic());
    BilibiliVideoPlayerLogic bilibiliVideoPlayerLogic = Get.find<BilibiliVideoPlayerLogic>();
    BilibiliVideoPlayerState bilibiliVideoPlayerState = Get.find<BilibiliVideoPlayerLogic>().state;

    bilibiliVideoPlayerLogic.initVideoPlayerVideoData();
    bilibiliVideoPlayerState.haveFinishView = false;
    bilibiliVideoPlayerState.haveFullScreenFunction = false;
    bilibiliVideoPlayerState.haveDanMuFunction = false;
    bilibiliVideoPlayerState.showDanMu = false;
    bilibiliVideoPlayerState.showTopBarHome = false;
    bilibiliVideoPlayerState.showTopBarMore = false;
    bilibiliVideoPlayerState.videoOriginalUrl = state.localVideoList[index].videoLocation;
    bilibiliVideoPlayerLogic.initVideoControllerAndDanMuController();

    Get.toNamed(PreEditVideoScreen.routeName);
  }
}
