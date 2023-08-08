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
    drawColorFilter(canvas);
  }

  @override
  bool shouldRepaint(covariant PaperCustomPainter oldDelegate) => false;

  void drawColorFilter(Canvas canvas) {
    var paint = Paint();
    paint.colorFilter = ColorFilter.linearToSrgbGamma();
    _drawImage(canvas, paint);

    ColorFilter sepia = ColorFilter.matrix(<double>[
      0.393,
      0.769,
      0.189,
      0,
      0,
      0.349,
      0.686,
      0.168,
      0,
      0,
      0.272,
      0.534,
      0.131,
      0,
      0,
      0,
      0,
      0,
      1,
      0,
    ]);
    _drawImage(canvas, paint..colorFilter = sepia);
    const ColorFilter greyscale = ColorFilter.matrix(<double>[
      0.2126,
      0.7152,
      0.0722,
      0,
      0,
      0.2126,
      0.7152,
      0.0722,
      0,
      0,
      0.2126,
      0.7152,
      0.0722,
      0,
      0,
      0,
      0,
      0,
      1,
      0,
    ]);
    _drawImage(canvas, paint..colorFilter = greyscale);
    const n = 90.0;
    const ColorFilter light = ColorFilter.matrix(
        <double>[1, 0, 0, 0, n, 0, 1, 0, 0, n, 0, 0, 1, 0, n, 0, 0, 0, 1, 0]);
    _drawImage(canvas, paint..colorFilter = light);
    const n2 = -126.0;
    const ColorFilter darken = ColorFilter.matrix(<double>[
      1,
      0,
      0,
      0,
      n2,
      0,
      1,
      0,
      0,
      n2,
      0,
      0,
      1,
      0,
      n2,
      0,
      0,
      0,
      1,
      0
    ]);
    _drawImage(canvas, paint..colorFilter = darken);
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
