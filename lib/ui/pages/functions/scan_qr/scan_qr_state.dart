import 'package:mobile_scanner/mobile_scanner.dart';

class ScanQrState {
  late MobileScannerController mobileScannerController;
  late Barcode? barcode;
  late bool flashStatus;
  ///当前摄像的缩放比例（0为原比例，1为最大倍数）
  late double scale;
  ///手势缩放开始缩放比例
  late double scaleBegin;
  ///手势缩放结束缩放比例
  late double scaleEnd;
  ScanQrState() {
    mobileScannerController = MobileScannerController();
    flashStatus = false;
    scale = 0;
    scaleBegin = 1;
    scaleEnd = 1;
  }
}
