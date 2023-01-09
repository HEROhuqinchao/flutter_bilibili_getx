import 'package:qrscan/qrscan.dart' as scanner;

class QrCodeUtil {
  static Future<String?> scanQrCode() async {
    String? cameraScanResult = await scanner.scan();
    return cameraScanResult;
  }
}