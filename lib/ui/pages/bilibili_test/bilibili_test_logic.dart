import 'dart:io';
import 'dart:isolate';
import 'dart:ui';

import 'package:bilibili_getx/core/service/utils/http_base_request.dart';
import 'package:dio/dio.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'bilibili_test_state.dart';

class BilibiliTestLogic extends GetxController {
  final BilibiliTestState state = BilibiliTestState();

  @override
  void onReady() {
    getExternalStorageDirectory()
        .then((tempDir) => {state.destPath = '${tempDir?.path}/'});

    ///UI主线程线程 与 下载线程 之间的数据交流
    IsolateNameServer.registerPortWithName(
        state.port.sendPort, 'downloader_send_port');
    state.port.listen((dynamic data) {
      String id = data[0];
      DownloadTaskStatus status = data[1];
      int progress = data[2];
      update();
    });
    FlutterDownloader.registerCallback(downloadCallback);
    super.onReady();
  }

  @override
  void onClose() {
    IsolateNameServer.removePortNameMapping('downloader_send_port');
    super.onClose();
  }

  @pragma('vm:entry-point')
  static void downloadCallback(
      String id, DownloadTaskStatus status, int progress) {
    final SendPort? send =
        IsolateNameServer.lookupPortByName('downloader_send_port');
    send?.send([id, status, progress]);
  }

  Future<void> openFile() async {
    final result = await OpenFile.open(state.destPath);
  }

  void downloadFile() async {
    print(state.destPath);
    print(state.downloadPath);
    final taskId = await FlutterDownloader.enqueue(
      url: state.downloadPath,
      // optional: header send with url (auth token etc)
      headers: {},
      savedDir: state.destPath,
      // show download progress in status bar (for Android)
      showNotification: true,
      // click on notification to open downloaded file (for Android)
      openFileFromNotification: true,
    );

    final tasks = await FlutterDownloader.loadTasks();
  }

  void cancelDownloadFile(taskId) {
    FlutterDownloader.cancel(taskId: taskId);
  }

  void cancelAllDownloadFile(){
    FlutterDownloader.cancelAll();
  }

  void pauseDownloadFile(taskId){
    FlutterDownloader.pause(taskId: taskId);
  }

  void resumeDownloadFile(taskId) {
    FlutterDownloader.resume(taskId: taskId);
  }

  void retryDownloadFile(taskId) {
    FlutterDownloader.retry(taskId: taskId);
  }

  void removeDownloadFile(taskId){
    FlutterDownloader.remove(taskId: taskId, shouldDeleteContent:false);
  }

  void openDownloadFile(taskId){
    FlutterDownloader.open(taskId: taskId);
  }

// void downloadFile() {
//   state.token = CancelToken();
//   state.downloading = true;
//   HttpBaseRequest.download(state.downloadPath, state.destPath,
//       cancelToken: state.token, onReceiveProgress: (received, total) {
//     if (total != -1) {
//       if (!state.token.isCancelled) {
//         state.downloadRatio = (received / total);
//         if (state.downloadRatio == 1) {
//           state.downloading = false;
//         }
//         state.downloadIndicator =
//             '${(state.downloadRatio * 100).toStringAsFixed(2)}%';
//         update();
//       }
//     } else {
//       state.downloading = false;
//       SmartDialog.showToast('无法获取文件大小，下载失败!');
//     }
//   });
// }
//
// void cancelDownload() {
//   if (state.downloadRatio < 1.0) {
//     state.token.cancel();
//     state.downloading = false;
//     state.downloadRatio = 0;
//     state.downloadIndicator = '0.00%';
//     update();
//   }
// }
//
// void deleteFile() {
//   try {
//     File downloadedFile = File(state.destPath);
//     if (downloadedFile.existsSync()) {
//       downloadedFile.delete();
//     } else {
//       SmartDialog.showToast('文件不存在');
//     }
//   } catch (e) {
//     SmartDialog.showToast(e.toString());
//   }
// }
}
