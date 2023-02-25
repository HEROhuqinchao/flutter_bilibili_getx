import 'package:mobile_scanner/mobile_scanner.dart';

class ScanQrState {
  late MobileScannerController mobileScannerController;
  late Barcode? barcode;
  late bool flashStatus;
  ScanQrState() {
    mobileScannerController = MobileScannerController();
    flashStatus = false;
  }
}
