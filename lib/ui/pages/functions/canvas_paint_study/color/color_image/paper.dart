import 'dart:typed_data';
import 'dart:ui';
import 'package:flutter/services.dart';
import 'package:image/image.dart' as image;
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
      child: FutureBuilder<image.Image?>(
        future: loadImageFromAssets(ImageAssets.canvasAvatarPng),
        builder: (ctx, snap) {
          return CustomPaint(
            painter: PaperCustomPainter(snap.data),
          );
        },
      ),
    );
  }

  Future<image.Image?> loadImageFromAssets(String path) async {
    ByteData data = await rootBundle.load(path);
    List<int> bytes =
        data.buffer.asInt8List(data.offsetInBytes, data.lengthInBytes);
    return image.decodeImage(Uint8List.fromList(bytes));
  }
}

class PaperCustomPainter extends CustomPainter with Grid {
  late image.Image? imageSrc;
  final Paint _paint = Paint();

  PaperCustomPainter(this.imageSrc);

  @override
  void paint(Canvas canvas, Size size) {
    drawGrid(canvas, size);
    drawAxis(canvas, size);
    _drawImage(canvas);
  }

  @override
  bool shouldRepaint(covariant PaperCustomPainter oldDelegate) => false;

  void _drawImage(Canvas canvas) {
    if (imageSrc == null) return;
    image.Pixel pixel = imageSrc!.getPixel(imageSrc!.width, 0);
    var color = Color.fromARGB(
        pixel.a.toInt(), pixel.r.toInt(), pixel.g.toInt(), pixel.b.toInt());
    canvas.drawCircle(Offset.zero, 10, _paint..color = color);
  }
}
