import 'dart:ui' as ui;

import 'package:bilibili_getx/ui/pages/functions/canvas_paint_study/mix/grid.dart';
import 'package:bilibili_getx/ui/shared/image_asset.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Paper extends StatefulWidget {
  const Paper({super.key});

  @override
  State<Paper> createState() => _PaperState();
}

class _PaperState extends State<Paper> {
  Future<ui.Image?> _loadImage() async {
    ui.Image? image = await loadImageFromAssets(ImageAssets.scanPNG);
    return image;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: FutureBuilder<ui.Image?>(
        future: _loadImage(),
        builder: (ctx, snapshot) {
          return CustomPaint(
            painter: PaperCustomPainter(snapshot.data),
          );
        },
      ),
    );
  }

  ///从Assets中获取图片数据
  Future<ui.Image>? loadImageFromAssets(String path) async {
    ByteData data = await rootBundle.load(path);
    return decodeImageFromList(data.buffer.asUint8List());
  }
}

class PaperCustomPainter extends CustomPainter with Grid {
  ui.Image? image;
  final double strokeWidth = .5;
  final Color color = Colors.blue;
  late final Paint _paint;

  PaperCustomPainter(this.image) {
    _paint = Paint()
      ..style = PaintingStyle.fill
      ..strokeWidth = strokeWidth
      ..color = color;
  }

  @override
  void paint(Canvas canvas, Size size) {
    drawGrid(canvas, size);
    drawAxis(canvas, size);
    if (image != null) {
      canvas.drawImage(
        image!,
        Offset(-image!.width / 2, -image!.height / 2),
        _paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant PaperCustomPainter oldDelegate) =>
      image != oldDelegate.image;
}