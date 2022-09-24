import 'package:bilibili_getx/core/channel/channel_util.dart';
import 'package:get/get.dart';

import '../../../../../core/model/local_video_model.dart';
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

  fetchLocalVideo() {
    ChannelUtil.methodChannel.invokeMethod("getVideos").then((value) {
      for (int i = 0; i < value.length; i++) {
        state.localVideoList.add(HYLocalVideoModel(
          videoLocation: value[i]["videoLocation"],
          videoName: value[i]["videoName"],

          ///这里的duration返回值单位为毫秒，不是秒
          duration: value[i]["duration"] ?? "0",
        ));
      }
      update();
    });
  }
}
