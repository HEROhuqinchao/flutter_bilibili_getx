import 'dart:isolate';

import 'package:dio/dio.dart';

class BilibiliTestState {
  /// 文件下载地址
  late String downloadPath;

  /// 下载进度比例，用于检测下载是否完成
  late double downloadRatio;

  /// 下载进度百分比
  late String downloadIndicator;

  /// 下载文件的存储路径
  late String destPath;

  /// 取消下载的 token
  late CancelToken token;

  /// 指示当前是否处于下载中，以便做业务判断
  late bool downloading;

  late ReceivePort port;

  BilibiliTestState() {
    destPath = "";
    downloadPath =
        'http://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4';
    downloadRatio = 0.0;
    downloadIndicator = '0.00%';
    downloading = false;
    port = ReceivePort();
  }
}
