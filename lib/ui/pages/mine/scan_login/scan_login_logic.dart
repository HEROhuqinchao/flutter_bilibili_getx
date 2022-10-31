import 'package:bilibili_getx/core/qr_code/qr_code_util.dart';
import 'package:get/get.dart';
import 'scan_login_state.dart';

class ScanLoginLogic extends GetxController {
  final ScanLoginState state = ScanLoginState();

  @override
  void onReady() {
    super.onReady();
  }

  void scanQrCode() {
    QrCodeUtil.scanQrCode().then((value) {
      state.result = value!;
      update();
    });
  }
}
