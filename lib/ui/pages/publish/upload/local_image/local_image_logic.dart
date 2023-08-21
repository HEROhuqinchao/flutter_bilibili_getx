import 'package:bilibili_getx/core/channel/channel_util.dart';
import 'package:get/get.dart';

import '../../../../../core/model/local_image_model.dart';
import 'local_image_state.dart';

class LocalImageLogic extends GetxController {
  final LocalImageState state = LocalImageState();

  @override
  void onReady() {
    fetchLocalImage();
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void fetchLocalImage() {
    ///获取手机本地照片
    ChannelUtil().media?.invokeMethod("getPhotos").then((value) {
      for (int i = 0; i < value.length; i++) {
        state.localImageList.add(
          HYLocalImageModel(
              value[i]["imageName"] ?? "", value[i]["imageLocation"] ?? ""),
        );
      }

      ///初始化图片
      if (state.localImageList.isNotEmpty) {
        // imageCache = localImageList[0].imageLocation;
      }
      update();
    });
  }
}
