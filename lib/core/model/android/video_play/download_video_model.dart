import 'package:flutter_downloader/flutter_downloader.dart';

class DownloadVideoModel {
  ///下载地址
  String downloadPath;

  String? taskId;

  String fileName;

  DownloadTaskStatus status;

  double progress;

  DownloadVideoModel({
    required this.downloadPath,
    required this.status,
    required this.taskId,
    required this.fileName,
    required this.progress,
  });
}