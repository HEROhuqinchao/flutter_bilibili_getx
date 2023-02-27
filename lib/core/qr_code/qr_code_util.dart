import 'package:qrscan/qrscan.dart' as scanner;

///扫描二维码
class QrCodeUtil {
  static Future<String?> scanQrCode() async {
    String? cameraScanResult = await scanner.scan();
    return cameraScanResult;
  }
}