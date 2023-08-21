import 'dart:typed_data';
import 'dart:ui';
import 'package:flutter/services.dart';
import 'package:image/image.dart' as image;
import 'package:bilibili_getx/ui/pages/functions/canvas_paint_study/mix/grid.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

import '../../../../../shared/image_asset.dart';

class Paper extends StatefulWidget {
  const Paper({super.key});

  @override
  State<Paper> createState() => _PaperState();
}

class _PaperState extends State<Paper> {
  late image.Image? _image;
  List<Ball> balls = [];
  double d = 1.5;

  @override
  void initState() {
    _initBalls();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1000,
      height: 1000,
      color: Colors.white,
      child: CustomPaint(
        painter: PaperCustomPainter(balls, d),
      ),
    );
  }

  void _initBalls() async {
    _image = await loadImageFromAssets(ImageAssets.canvasAvatarPng);
    if (_image == null) return;
    for (int i = 0; i < _image!.width; i++) {
      for (int j = 0; j < _image!.height; j++) {
        Ball ball = Ball();
        ball.x = i * d + d / 2;
        ball.y = j * d + d / 2;
        ball.r = d / 2;
        image.Pixel pixel = _image!.getPixel(i, j);
        var color = Color.fromARGB(
            pixel.a.toInt(), pixel.r.toInt(), pixel.g.toInt(), pixel.b.toInt());
        ball.color = color;
        balls.add(ball);
      }
    }
    setState(() {});
  }

  Future<image.Image?> loadImageFromAssets(String path) async {
    ByteData data = await rootBundle.load(path);
    List<int> bytes =
        data.buffer.asInt8List(data.offsetInBytes, data.lengthInBytes);
    return image.decodeImage(Uint8List.fromList(bytes));
  }
}

class PaperCustomPainter extends CustomPainter with Grid {
  List<Ball> balls = [];
  final Paint _paint = Paint();
  double d;

  PaperCustomPainter(this.balls, this.d);

  @override
  void paint(Canvas canvas, Size size) {
    drawGrid(canvas, size);
    drawAxis(canvas, size);
    _drawImage(canvas);
  }

  @override
  bool shouldRepaint(covariant PaperCustomPainter oldDelegate) => false;

  void _drawImage(Canvas canvas) {
    canvas.save();
    canvas.translate(
        -math.sqrt(balls.length) * d / 2, -math.sqrt(balls.length) * d / 2);
    for (var ball in balls) {
      canvas.drawCircle(
          Offset(ball.x, ball.y), ball.r, _paint..color = ball.color);
    }
    canvas.restore();
  }
}

class Ball {
  double x;
  double y;
  Color color;
  double r;

  Ball({this.x = 0, this.y = 0, this.color = Colors.black, this.r = 5});
}
