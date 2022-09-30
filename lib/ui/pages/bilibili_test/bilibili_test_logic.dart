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
    ///请求下载的权限
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

  void iniDownloadList() async {
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
    for (int i = 0; i < state.downloadVideoList.length; i++) {
      File file =
          File("${state.destPath}/${state.downloadVideoList[i].fileName}");
      print("${state.destPath}/${state.downloadVideoList[i].fileName}");
      var fileIsExist = await file.exists();
      if (fileIsExist) {
        state.downloadVideoList[i].progress = 1;
        state.downloadVideoList[i].status = DownloadTaskStatus.complete;
        update();
      }
    }
  }

  iniDownloadFilePath() async {
    ///获取外部存储的目录
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

  @pragma('vm:entry-point')
  static void downloadCallback(taskId, status, progress) {
    final SendPort? send =
        IsolateNameServer.lookupPortByName('downloader_send_port');
    send?.send([taskId, status, progress]);
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
    FlutterDownloader.pause(taskId: state.downloadVideoList[index].taskId!)
        .then((value) {
      print("暂停下载");
      update();
    });
  }

  void resumeDownloadFile(index) {
    FlutterDownloader.resume(taskId: state.downloadVideoList[index].taskId!)
        .then((value) {
      print(value);
      update();
    });
  }

  void retryDownloadFile(index) {
    FlutterDownloader.retry(taskId: state.downloadVideoList[index].taskId!)
        .then((value) {
      print(value);
      update();
    });
  }

  void removeDownloadFile(taskId) {
    FlutterDownloader.remove(taskId: taskId, shouldDeleteContent: false);
  }

  void openDownloadFile(taskId) {
    FlutterDownloader.open(taskId: taskId);
  }
}
