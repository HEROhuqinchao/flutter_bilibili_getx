import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/services.dart';
import 'package:bilibili_getx/ui/pages/functions/canvas_paint_study/mix/grid.dart';
import 'package:flutter/material.dart';

import '../../../../../shared/image_asset.dart';

class Paper extends StatelessWidget {
  const Paper({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      color: Colors.white,
      child: FutureBuilder<ui.Image?>(
        future: loadImageFromAssets(ImageAssets.canvasAvatarPng),
        builder: (ctx, snap) {
          if (snap.hasData) {
            return CustomPaint(
              painter: PaperCustomPainter(snap.data!),
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
  ui.Image? img;

  double get imgW => img!.width.toDouble();

  double get imgH => img!.height.toDouble();

  PaperCustomPainter(this.img);

  @override
  void paint(Canvas canvas, Size size) {
    drawGrid(canvas, size);
    drawAxis(canvas, size);
    canvas.translate(-imgW / 2 * 2.5, -imgH / 2 / 2);
    drawMaskFilter(canvas);
  }

  @override
  bool shouldRepaint(covariant PaperCustomPainter oldDelegate) => false;

  void drawMaskFilter(Canvas canvas) {
    var paint = Paint();
    paint.maskFilter = MaskFilter.blur(BlurStyle.inner, 20);
    _drawImage(canvas, paint);
    paint.maskFilter = MaskFilter.blur(BlurStyle.outer, 3);
    _drawImage(canvas, paint);
    paint.maskFilter = MaskFilter.blur(BlurStyle.solid, 3);
    _drawImage(canvas, paint);
    paint.maskFilter = MaskFilter.blur(BlurStyle.normal, 3);
    _drawImage(canvas, paint);
    paint.maskFilter = MaskFilter.blur(BlurStyle.normal, 5);
    _drawImage(canvas, paint);
  }

  void _drawImage(Canvas canvas, Paint paint) {
    canvas.drawImageRect(
      img!,
      Rect.fromLTRB(0, 0, imgW, imgH),
      Rect.fromLTRB(0, 0, imgW / 2, imgH / 2),
      paint,
    );
    canvas.translate(120, 0);
  }
}
