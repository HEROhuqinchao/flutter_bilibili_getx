import 'dart:typed_data';

import 'package:bilibili_getx/ui/shared/image_asset.dart';
import 'package:flutter/services.dart';
import 'dart:ui' as ui;

import 'package:bilibili_getx/ui/pages/functions/canvas_paint_study/mix/grid.dart';
import 'package:flutter/material.dart';

class Paper extends StatelessWidget {
  const Paper({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: FutureBuilder<ui.Image?>(
        future: loadImageFromAssets(ImageAssets.canvasAvatarPng),
        builder: (ctx, snapShot) {
          if (snapShot.hasData) {
            return CustomPaint(
              painter: PaperCustomPainter(snapShot.data!),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }

  Future<ui.Image?> loadImageFromAssets(String path) async {
    ByteData data = await rootBundle.load(path);
    return decodeImageFromList(data.buffer.asUint8List());
  }
}

class PaperCustomPainter extends CustomPainter with Grid {
  late ui.Image? im;

  PaperCustomPainter(this.im);

  @override
  void paint(Canvas canvas, Size size) {
    drawGrid(canvas, size);
    drawAxis(canvas, size);
    drawImageShader(canvas);
  }

  @override
  bool shouldRepaint(covariant PaperCustomPainter oldDelegate) => false;

  drawImageShader(Canvas canvas) {
    Paint paint = Paint()
      ..shader = ImageShader(
          im!,
          TileMode.repeated,
          TileMode.repeated,
          Float64List.fromList([
            1,
            0,
            0,
            0,
            0,
            1,
            0,
            0,
            0,
            0,
            1,
            0,
            0,
            0,
            0,
            1,
          ]));
    canvas.drawCircle(Offset(100, 100), 50, paint);
    canvas.translate(120, 0);
    canvas.drawCircle(
      Offset(100, 100),
      50,
      paint
        ..strokeWidth = 10
        ..style = PaintingStyle.stroke,
    );
    canvas.translate(-120 * 2.0, 0);
    canvas.drawLine(
        Offset(100, 50),
        Offset(100, 50 + 100.0),
        paint
          ..strokeWidth = 30
          ..style = PaintingStyle.stroke);
  }
}
