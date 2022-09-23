import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/model/local_image_model.dart';
import '../../../../core/model/local_video_model.dart';

class UploadState {
  ///本地视频数据
  late List<HYLocalVideoModel> localVideoList;

  ///本地图片
  late List<HYLocalImageModel> localImageList;

  ///上传的数据类型
  late int upLoadFileType;

  ///封面图片缓存
  late String imageCache;

  ///当前播放的是哪个视频
  late int currentVideoIndex;

  ///标签控制器
  late TabController tabController;
  UploadState() {
    localVideoList = [];
    localImageList = [];
    upLoadFileType = 0;
    imageCache = "";
    currentVideoIndex = 0;
  }
}
