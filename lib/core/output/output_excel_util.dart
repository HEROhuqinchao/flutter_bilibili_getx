import 'dart:convert';
import 'dart:io';

import 'dart:ui' as ui;
import 'package:flutter/services.dart';
import 'package:image/image.dart' as img_lib;
import 'package:dio/dio.dart';
import 'package:open_file_plus/open_file_plus.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart' as xlsio;
import 'package:path_provider/path_provider.dart' as path_provider;

import 'model/excel_model.dart';

class OutputExcelUtil {
  OutputExcelUtil._internal();

  factory OutputExcelUtil() => _instance;
  static final OutputExcelUtil _instance = OutputExcelUtil._internal();
  static late Workbook workbook;

  static getInstance() {
    workbook = Workbook();
    return _instance;
  }

  static Future<void> generateExcel({
    required String title,
    required List<ExcelTitle> columns,
    required List<List<String>> tableValue,
    required String excelName,
  }) async {
    ///边界线
    xlsio.Border border = xlsio.Border();
    border.color = '#000000';
    border.colorRgb = const ui.Color.fromRGBO(0, 0, 0, 1);
    border.lineStyle = xlsio.LineStyle.thin;

    final xlsio.Workbook workbook = xlsio.Workbook();
    final xlsio.Worksheet sheet = workbook.worksheets[0];
    sheet.showGridlines = true;
    sheet.getRangeByName('A1:G1').cellStyle.backColor = '#006fc0';
    sheet.getRangeByName('A1:G1').merge();
    sheet.getRangeByName('A1').setText(title);
    sheet.getRangeByName('A1').cellStyle.fontSize = 15;
    sheet.getRangeByName('A1').cellStyle.fontColor = '#ffffff';
    sheet.getRangeByName('A1').cellStyle.bold = true;
    sheet.getRangeByName('A1').cellStyle.hAlign = xlsio.HAlignType.center;
    sheet.getRangeByName('A1').cellStyle.vAlign = xlsio.VAlignType.center;
    sheet.getRangeByName('A1').rowHeight = 30;

    ///标题部分
    int columnIndex = 0;
    for (var columnName in columns) {
      String key = '${keys[columnIndex]}2';
      sheet.getRangeByName(key).cellStyle.backColor = '#a4b6dd';
      sheet.getRangeByName(key).columnWidth = 15;
      sheet.getRangeByName(key).rowHeight = 25;
      sheet.getRangeByName(key).setText(columnName.title);
      sheet.getRangeByName(key).cellStyle.fontSize = 8;
      sheet.getRangeByName(key).cellStyle.bold = false;
      sheet.getRangeByName(key).cellStyle.hAlign = xlsio.HAlignType.center;
      sheet.getRangeByName(key).cellStyle.vAlign = xlsio.VAlignType.center;
      sheet.getRangeByName(key).cellStyle.borders.left = border;
      sheet.getRangeByName(key).cellStyle.borders.top = border;
      sheet.getRangeByName(key).cellStyle.borders.bottom = border;
      sheet.getRangeByName(key).cellStyle.borders.right = border;
      columnIndex++;
    }

    ///内容部分
    int rowIndex = 3;
    for (var rowList in tableValue) {
      int columnIndex = 0;
      for (var value in rowList) {
        String key = '${keys[columnIndex]}$rowIndex';
        sheet.getRangeByName(key).cellStyle.backColor = '#ffffff';
        sheet.getRangeByName(key).columnWidth = 15;
        sheet.getRangeByName(key).rowHeight = 20;
        final type = columns[columnIndex].valueType;
        if (type == ExcelTitleValueType.number) {
          sheet.getRangeByName(key).setNumber(double.parse(value));
        } else if (type == ExcelTitleValueType.time) {
          try {
            sheet.getRangeByName(key).setDateTime(DateTime.parse(value));
          } catch (e) {
            sheet.getRangeByName(key).setText(value);
          }
        } else {
          sheet.getRangeByName(key).setText(value);
        }
        sheet.getRangeByName(key).cellStyle.fontSize = 6;
        sheet.getRangeByName(key).cellStyle.bold = false;
        sheet.getRangeByName(key).cellStyle.hAlign = xlsio.HAlignType.center;
        sheet.getRangeByName(key).cellStyle.vAlign = xlsio.VAlignType.center;
        sheet.getRangeByName(key).cellStyle.borders.left = border;
        sheet.getRangeByName(key).cellStyle.borders.top = border;
        sheet.getRangeByName(key).cellStyle.borders.bottom = border;
        sheet.getRangeByName(key).cellStyle.borders.right = border;
        columnIndex++;
      }
      rowIndex++;
    }

    ///保存表格
    final List<int> bytes = workbook.saveAsStream();
    workbook.dispose();
    final Directory directory = await path_provider.getTemporaryDirectory();
    final File file = File('${directory.path}/$excelName.xlsx');
    await file.writeAsBytes(bytes, flush: true);
    await OpenFile.open(file.path);
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
  static Future<Worksheet> addAssetsImage({
    required Worksheet worksheet,
    required int topRow,
    required int leftColumn,
    required String imageName,
  }) async {
    final String imagesBytes = base64.encode(await _readImageData(imageName));
    worksheet.pictures.addBase64(topRow, leftColumn, imagesBytes);
    return worksheet;
  }

  static Future<List<int>> _readImageData(String name) async {
    final ByteData data = await rootBundle.load(name);
    return data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
  }

  static List<String> keys = [
    "A",
    "B",
    "C",
    "D",
    "E",
    "F",
    "G",
    "H",
    "I",
    "J",
    "K",
    "L",
    "M",
    "N",
    "O",
    "P",
    "Q",
    "R",
    "S",
    "T",
    "U",
    "V",
    "W",
    "X",
    "Y",
    "Z"
  ];
}
