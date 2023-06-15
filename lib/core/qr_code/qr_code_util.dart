import 'package:qrscan/qrscan.dart' as scanner;

///扫描二维码
///或者扫描界面ScanQr
class QrCodeUtil {
  static Future<String?> scanQrCode() async {
    String? cameraScanResult = await scanner.scan();
    return cameraScanResult;
  }
}