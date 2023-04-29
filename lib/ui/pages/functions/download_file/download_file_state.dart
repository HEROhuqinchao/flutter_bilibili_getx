import 'package:flutter_downloader/flutter_downloader.dart';

class DownloadFileState {
  late int progress;
  late DownloadTaskStatus downloadTaskStatus;
  late String destPath;
  late String storagePath;
  DownloadFileState() {
    progress = 0;
    downloadTaskStatus = DownloadTaskStatus.undefined;
  }
}
