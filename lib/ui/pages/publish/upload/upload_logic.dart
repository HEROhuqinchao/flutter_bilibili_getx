import 'package:bilibili_getx/core/permission/bilibili_permission.dart';
import 'package:get/get.dart';
import 'upload_state.dart';

class UploadLogic extends GetxController {
  final UploadState state = UploadState();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    ///获取本地文件-待补充
    fetLocalFileData();
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  ///左滑右划更新
  void updateTabName() {
    // state.fileType = state.tabController.index;
    update();
  }

  void fetLocalFileData() {}

  void showFileContent(int fileType, String fileSrc) {
    // state.fileType = fileType;
    // state.fileSrc = fileSrc;
    update();
  }
}
