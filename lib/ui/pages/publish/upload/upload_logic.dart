import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../../core/channel/bilibili_channel.dart';
import '../../../../core/model/local_image_model.dart';
import '../../../../core/model/local_video_model.dart';
import 'upload_state.dart';

class UploadLogic extends GetxController {
  final UploadState state = UploadState();

  @override
  void onReady() {
    ///获取手机本地视频
    final platform = MethodChannel(BilibiliChannel.uploadChannel);
    platform.invokeMethod("getVideos").then((value) {
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

    ///获取手机本地照片
    platform.invokeMethod("getPhotos").then((value) {
      for (int i = 0; i < value.length; i++) {
        state.localImageList.add(
          HYLocalImageModel(
              value[i]["imageName"] ?? "", value[i]["imageLocation"] ?? ""),
        );
      }

      ///初始化图片
      if (state.localImageList.isNotEmpty) {
        state.imageCache = state.localImageList[0].imageLocation;
      }
      update();
    });

    ///获取本地文件-待补充

    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  ///左滑右划更新
  void updateTabName() {
    state.upLoadFileType = state.tabController.index;
    update();
  }


}
