import 'dart:isolate';

import 'package:dio/dio.dart';

import '../../../core/model/android/video_play/download_video_model.dart';

class BilibiliTestState {
  /// 下载文件的存储路径
  late String destPath;
  late ReceivePort port;

  ///下载列表
  late List<DownloadVideoModel> downloadVideoList;

  BilibiliTestState() {
    destPath = "";
    port = ReceivePort();
    downloadVideoList = [];
  }
}
