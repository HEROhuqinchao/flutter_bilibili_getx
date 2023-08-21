import 'package:qrscan/qrscan.dart' as scanner;
import 'package:dio/dio.dart';

//扫描二维码
//或者扫描界面ScanQr
class QrCodeUtil {
  QrCodeUtil._internal();

  static final QrCodeUtil _instance = QrCodeUtil._internal();

  factory QrCodeUtil() => _instance;

  Future<String?> scanQrCode() async {
    String? cameraScanResult = await scanner.scan();
    return cameraScanResult;
  }
}

class HttpBaseRequest {
  ///单例
  static late Dio? _dio = null;

  HttpBaseRequest._internal();

  static final HttpBaseRequest _instance = HttpBaseRequest._internal();

  factory HttpBaseRequest() {
    _dio ??= Dio();
    return _instance;
  }

  Dio? get dio => _dio;

  Future request(String path) async {
    final result = await _dio?.get(path);
    return result;
  }
}
