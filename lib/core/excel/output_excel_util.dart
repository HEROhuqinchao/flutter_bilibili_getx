import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:image/image.dart' as img_lib;
import 'package:dio/dio.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart';

class OutputExcelUtil {
  OutputExcelUtil._internal();

  factory OutputExcelUtil() => _instance;
  static late final OutputExcelUtil _instance = OutputExcelUtil._internal();
  static late Workbook workbook;

  static getInstance() {
    workbook = Workbook();
    return _instance;
  }

  ///添加网络图片
  static Future<Worksheet> addUrlImage({
    required int width,
    required int height,
    required String imageUrl,
    required Worksheet worksheet,
    required int topRow,
    required int leftColumn,
  }) async {
    Uint8List imagesBytes = await _netImagesToBase64(imageUrl, height, width);
    worksheet.pictures.addStream(topRow, leftColumn, imagesBytes);
    return worksheet;
  }

  static Future _netImagesToBase64(String url, int height, int width) async {
    var response = await Dio()
        .get(url, options: Options(responseType: ResponseType.bytes));
    img_lib.Image? image =
        img_lib.decodeImage(Uint8List.fromList(response.data));
    img_lib.Image thumbnail =
        img_lib.copyResize(image!, height: height, width: width);
    final List<int> bytesTmp = img_lib.encodePng(thumbnail);
    return bytesTmp;
  }

  ///添加本地图片
  static Future<Worksheet> addAssetsImage(
      {required Worksheet worksheet,
      required int topRow,
      required int leftColumn,
      required String imageName}) async {
    final String imagesBytes = base64.encode(await _readImageData(imageName));
    worksheet.pictures.addBase64(topRow, leftColumn, imagesBytes);
    return worksheet;
  }

  static Future<List<int>> _readImageData(String name) async {
    final ByteData data = await rootBundle.load(name);
    return data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
  }
}
