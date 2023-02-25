import 'package:get/get.dart';

import 'scan_qr_state.dart';

class ScanQrLogic extends GetxController {
  final ScanQrState state = ScanQrState();

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  switchFlashLight() async{
    state.flashStatus = !state.flashStatus;
    state.mobileScannerController.toggleTorch();
    update();
  }
}
