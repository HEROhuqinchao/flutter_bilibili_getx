import 'dart:io';
import 'dart:isolate';
import 'dart:ui';

import 'package:bilibili_getx/core/permission/bilibili_permission.dart';
import 'package:bilibili_getx/core/service/utils/constant.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:get/get.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import '../../../core/model/android/video_play/download_video_model.dart';
import 'bilibili_test_state.dart';

class BilibiliTestLogic extends GetxController {
  final BilibiliTestState state = BilibiliTestState();

  @override
  void onReady() {
    BilibiliPermission.requestDownloadPermissions();

    ///创建下载目录
    iniDownloadFilePath();

    ///初始化下载插件
    initFlutterDownloader();

    super.onReady();
  }

  @override
  void onClose() {
    IsolateNameServer.removePortNameMapping('downloader_send_port');
    super.onClose();
  }

  void iniDownloadList() {
    state.downloadVideoList = [
      DownloadVideoModel(
        downloadPath: "https://media.w3.org/2010/05/sintel/trailer.mp4",
        fileName: "video01",
        status: DownloadTaskStatus.undefined,
        progress: 0,
        taskId: '',
      ),
      DownloadVideoModel(
        downloadPath: "http://www.w3school.com.cn/example/html5/mov_bbb.mp4",
        fileName: "video02",
        status: DownloadTaskStatus.undefined,
        progress: 0,
        taskId: '',
      ),
    ];
    update();
  }

  void initFlutterDownloader() {
    ///UI主线程线程 与 下载线程 之间的数据交流
    IsolateNameServer.registerPortWithName(
        state.port.sendPort, 'downloader_send_port');
    state.port.listen((dynamic data) {
      String id = data[0];
      DownloadTaskStatus status = data[1];
      int progress = data[2];
      for (var i = 0; i < state.downloadVideoList.length; i++) {
        if (state.downloadVideoList[i].taskId == id) {
          state.downloadVideoList[i].status = status;
          state.downloadVideoList[i].progress = progress.toDouble() / 100;
          print("当前progress为${state.downloadVideoList[i].progress}");
          update();
          break;
        }
      }
    });
    FlutterDownloader.registerCallback(downloadCallback);
  }

  iniDownloadFilePath() async {
    final filepath = await getExternalStorageDirectory();
    state.destPath = "${filepath!.path}/video_downloads";
    var file = Directory(state.destPath);
    try {
      bool exists = await file.exists();
      if (!exists) {
        await file.create();
      } else if (Constant.isDebug) {
        print("当前下载目录为${file.path}");
      }
    } catch (e) {
      print(e);
    }
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

  void downloadFile(i) async {
    FlutterDownloader.enqueue(
        fileName: state.downloadVideoList[i].fileName,
        url: state.downloadVideoList[i].downloadPath,
        headers: {},
        savedDir: state.destPath,
        showNotification: true,
        openFileFromNotification: true,
        // saveInPublicStorage: true
    ).then((value) {
      state.downloadVideoList[i].taskId = value;
    });
    // FlutterDownloader.loadTasksWithRawQuery(
    //   query:
    //       'SELECT * FROM task WHERE task_id = ${state.downloadVideoList[index].taskId!}',
    // );
  }

  void cancelDownloadFile(index) {
    FlutterDownloader.cancel(taskId: state.downloadVideoList[index].taskId!);
  }

  void cancelAllDownloadFile() {
    FlutterDownloader.cancelAll();
  }

  void pauseDownloadFile(index) {
    FlutterDownloader.pause(taskId: state.downloadVideoList[index].taskId!);
  }

  void resumeDownloadFile(index) {
    FlutterDownloader.resume(taskId: state.downloadVideoList[index].taskId!);
  }

  void retryDownloadFile(index) {
    FlutterDownloader.retry(taskId: state.downloadVideoList[index].taskId!);
  }

  void removeDownloadFile(taskId) {
    FlutterDownloader.remove(taskId: taskId, shouldDeleteContent: false);
  }

  void openDownloadFile(taskId) {
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
