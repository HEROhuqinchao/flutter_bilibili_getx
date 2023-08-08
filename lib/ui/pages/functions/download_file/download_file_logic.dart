import 'dart:io';
import 'dart:isolate';
import 'dart:ui';

import 'package:bilibili_getx/core/service/utils/constant.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';

import 'download_file_state.dart';

class DownloadFileLogic extends GetxController {
  final DownloadFileState state = DownloadFileState();
  static String fileName = '哔哩哔哩.apk';
  ReceivePort port = ReceivePort();
  static String updatePort = 'downloader_send_port';

  @override
  void onReady() async {
    if (defaultTargetPlatform == TargetPlatform.android) {}
    super.onReady();
  }

  @override
  void onClose() {
    if (defaultTargetPlatform == TargetPlatform.android) {
      _unbindBackgroundIsolate();
    }
    super.onClose();
  }

  void _bindBackgroundIsolate() {
    final isSuccess =
        IsolateNameServer.registerPortWithName(port.sendPort, updatePort);
    if (!isSuccess) {
      _unbindBackgroundIsolate();
      _bindBackgroundIsolate();
      return;
    }
    port.listen((dynamic data) {
      // final taskId = (data as List<dynamic>)[0] as String;
      final status = DownloadTaskStatus(data[1] as int);
      final progress = data[2] as int;
      updateProgress(progress, status);
    });
  }

  @pragma('vm:entry-point')
  static void downloadCallback(
    String id,
    DownloadTaskStatus status,
    int progress,
  ) {
    IsolateNameServer.lookupPortByName(updatePort)!
        .send([id, status.value, progress]);
  }

  void _unbindBackgroundIsolate() {
    IsolateNameServer.removePortNameMapping(updatePort);
  }

  updateProgress(progress, status) {
    state.progress = progress;
    state.downloadTaskStatus = status;
    update();
  }

  ///初始化下载列表
  Future initDownloadFilePath() async {
    final Directory? directory;
    if (defaultTargetPlatform == TargetPlatform.android) {
      directory = await getExternalStorageDirectory();
    } else if (defaultTargetPlatform == TargetPlatform.iOS) {
      directory = await getApplicationDocumentsDirectory();
    } else {
      directory = await getExternalStorageDirectory();
    }
    state.destPath = "${directory!.path}/update";
    state.storagePath = "${state.destPath}/$fileName";
    Directory destPath = Directory(state.destPath);
    try {
      bool exists = destPath.existsSync();
      if (!exists) {
        destPath.createSync();
      } else {
        if (Constant.isDebug) {
          print("下载目录为${destPath.path}");
          print("下载目录为${state.storagePath}");
        }
      }
    } catch (e) {
      print(e);
    }

    ///判断是否要下载文件
    File file = File("${state.destPath}/$fileName");
    bool fileIsExist = file.existsSync();
    if (fileIsExist) {
      state.progress = 0;
      state.downloadTaskStatus = DownloadTaskStatus.undefined;
      file.deleteSync();
      update();
    }
  }

  void downloadFile() async {
    FlutterDownloader.cancelAll();
    await FlutterDownloader.enqueue(
      fileName: fileName,
      url: "下载的链接",
      headers: {},
      savedDir: state.destPath,
      showNotification: true,
      openFileFromNotification: true,
      // saveInPublicStorage: true
    );
  }
}
