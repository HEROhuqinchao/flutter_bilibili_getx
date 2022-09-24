import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../core/channel/bilibili_channel.dart';
import '../../../../core/model/local_image_model.dart';
import '../../../../core/model/local_video_model.dart';

class UploadState {
  ///上传的数据类型
  late int fileType;

  ///标签控制器
  late TabController tabController;

  ///文件地址
  late String fileSrc;

  UploadState() {
    fileType = 0;
    fileSrc = "";
  }
}
