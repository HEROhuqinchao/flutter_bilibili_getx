import 'package:mobile_scanner/mobile_scanner.dart';

class ScanQrState {
  late MobileScannerController mobileScannerController;
  late Barcode? barcode;
  late bool flashStatus;
  late double scale;
  late double scaleBegin;
  late double scaleEnd;
  ScanQrState() {
    mobileScannerController = MobileScannerController();
    flashStatus = false;
    scale = 0;
    scaleBegin = 1;
    scaleEnd = 1;
  }
}
