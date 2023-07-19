import 'dart:io';
import 'dart:math';
import 'dart:ui';

import 'dart:ui' as ui;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart' as xlsio;

import 'package:open_file_plus/open_file_plus.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

import 'model/excel_model.dart';

class OutputUtil {
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

  ///绘制图片
  static void outputPhoto({
    required List<ExcelTitle> columns,
    required List<List<String>> tableValue,
    required Map<String, String> infoMap,
  }) async {
    PictureRecorder recorder = PictureRecorder();
    Canvas canvas = Canvas(recorder);

    const double columnWidth = 200;
    const double titleHeight = 30;
    const double columnsNamesHeight = 60;
    const double dataHeight = 30;

    TablePainter painter = TablePainter(
      columns: columns,
      tableValue: tableValue,
      columnWidth: columnWidth,
      titleHeight: titleHeight,
      columnsNamesHeight: columnsNamesHeight,
      dataHeight: dataHeight,
      infoMap: infoMap,
    );
    var size = Size(
      columnWidth * columns.length.toDouble(),
      titleHeight * 2 +
          columnsNamesHeight +
          dataHeight * tableValue.length.toDouble() +
          dataHeight * infoMap.length,
    );
    painter.paint(canvas, size);

    ui.Picture picture = recorder.endRecording();
    ui.Image image =
        await picture.toImage(size.width.toInt(), size.height.toInt());
    _saveImage(image, "bilibili");
  }

  ///捕获组件图片
  static void captureImage(
    RenderRepaintBoundary? boundary,
    BuildContext context,
  ) async {
    double dpr = View.of(context).devicePixelRatio;
    var image = await boundary!.toImage(pixelRatio: dpr);
    _saveImage(image, "bilibili");
  }

  /// 获取字节，存入文件
  static void _saveImage(ui.Image image, String name) async {
    ByteData? byteData = await image.toByteData(format: ImageByteFormat.png);
    if (byteData != null) {
      String? path;
      String fileName = "$name.png";
      final Directory? directory;
      if (defaultTargetPlatform == TargetPlatform.iOS) {
        directory = await path_provider.getApplicationSupportDirectory();
      } else if (defaultTargetPlatform == TargetPlatform.android) {
        directory = await path_provider.getExternalStorageDirectory();
      } else {
        directory = await path_provider.getTemporaryDirectory();
      }
      path = directory?.path;
      final File file = File('$path/$fileName');
      final uInt8List = byteData.buffer.asUint8List();
      await file.writeAsBytes(uInt8List, flush: true);
      await OpenFile.open(file.path);
      await ImageGallerySaver.saveImage(uInt8List, name: name);
    }
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

///绘制图片
class TablePainter extends CustomPainter {
  List<ExcelTitle> columns;
  List<List<String>> tableValue;
  Map<String, String> infoMap;
  final Paint _paint = Paint();
  double titleHeight;
  double columnsNamesHeight;
  double dataHeight;
  double columnWidth;
  double topIndex = 0;

  TablePainter({
    required this.columns,
    required this.tableValue,
    required this.infoMap,
    this.titleHeight = 30,
    this.columnsNamesHeight = 60,
    this.dataHeight = 30,
    this.columnWidth = 200,
  });

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawColor(Colors.white, BlendMode.color);
    _buildTitle(canvas, "设备组基本信息");

    ///信息
    _buildInfo(canvas, size);

    ///标题
    _buildTitle(canvas, "历史数据");

    ///列名
    _buildColumns(canvas);

    ///数据项
    _buildTableData(canvas);

    canvas.rotate(90 / 360 * pi);
  }

  @override
  bool shouldRepaint(covariant TablePainter oldDelegate) => false;

  void _drawTextPaint(
      Canvas canvas, String text, Rect rect, Color color, double fontSize) {
    TextPainter textPainter = TextPainter(
      text: TextSpan(
        text: text,
        style: TextStyle(fontSize: fontSize, color: Colors.black),
      ),
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );
    textPainter.layout(); // 进行布局
    Size size = textPainter.size; // 尺寸必须在布局后获取
    textPainter.paint(
        canvas, rect.center + Offset(-size.width / 2, -size.height / 2));
    canvas.drawRect(
      rect,
      _paint
        ..color = color
        ..style = PaintingStyle.fill,
    );
  }

  void _buildTitle(Canvas canvas, String title) {
    Rect rect = Rect.fromLTWH(
        0, topIndex, columnWidth * columns.length.toDouble(), titleHeight);
    topIndex += titleHeight;
    canvas.drawRect(
      rect,
      _paint
        ..color = Colors.black
        ..strokeWidth = 1
        ..style = PaintingStyle.stroke,
    );
    _drawTextPaint(canvas, title, rect, Colors.blue.withAlpha(66), 20);
  }

  _buildColumns(Canvas canvas) {
    int columnIndex = 0;
    for (var column in columns) {
      Rect rect = Rect.fromLTWH(
          columnIndex * columnWidth, topIndex, columnWidth, columnsNamesHeight);

      canvas.drawRect(
        rect,
        _paint
          ..color = Colors.black
          ..strokeWidth = 1
          ..style = PaintingStyle.stroke,
      );
      _drawTextPaint(canvas, column.title, rect, Colors.blue.withAlpha(33), 22);
      columnIndex++;
    }
    topIndex += columnsNamesHeight;
  }

  _buildTableData(Canvas canvas) {
    for (var rowList in tableValue) {
      int columnIndex = 0;
      for (var value in rowList) {
        Rect rect = Rect.fromLTWH(
            columnIndex * columnWidth, topIndex, columnWidth, dataHeight);

        canvas.drawRect(
          rect,
          _paint
            ..color = Colors.black
            ..strokeWidth = 1
            ..style = PaintingStyle.stroke,
        );
        _drawTextPaint(canvas, value, rect, Colors.blue.withAlpha(11), 18);
        columnIndex++;
      }
      topIndex += dataHeight;
    }
  }

  _buildInfo(Canvas canvas, Size size) {
    infoMap.forEach((key, value) {
      Rect rectLabel = Rect.fromLTWH(0, topIndex, size.width / 2, dataHeight);
      canvas.drawRect(
        rectLabel,
        _paint
          ..color = Colors.black
          ..strokeWidth = 1
          ..style = PaintingStyle.stroke,
      );
      _drawTextPaint(canvas, key, rectLabel, Colors.blue.withAlpha(44), 18);
      Rect rectContent =
          Rect.fromLTWH(size.width / 2, topIndex, size.width / 2, dataHeight);
      canvas.drawRect(
        rectContent,
        _paint
          ..color = Colors.black
          ..strokeWidth = 1
          ..style = PaintingStyle.stroke,
      );
      _drawTextPaint(canvas, value, rectContent, Colors.blue.withAlpha(11), 18);
      topIndex += dataHeight;
    });
  }
}