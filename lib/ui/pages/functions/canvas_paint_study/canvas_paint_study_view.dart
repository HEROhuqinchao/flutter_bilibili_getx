import 'dart:math';
import 'dart:typed_data';
import 'dart:ui';

import 'package:bilibili_getx/ui/pages/video_play/video_play_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:ui' as ui;
import 'canvas_paint_study_logic.dart';

class CanvasPaintStudyView extends StatelessWidget {
  static String routeName = "/canvas_paint_study";
  final logic = Get.find<CanvasPaintStudyLogic>();
  final state = Get
      .find<CanvasPaintStudyLogic>()
      .state;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CanvasPaintStudyLogic>(
      builder: (logic) {
        return Container(
          color: Colors.white,
          child: state.img != null
              ? CustomPaint(
            painter: PaperPainter(
              state.img,
            ),
          )
              : Container(),
        );
      },
    );
  }
}

class PaperPainter extends CustomPainter {
  ui.Image? image;

  PaperPainter(this.image);

  @override
  void paint(Canvas canvas, Size size) {
    // example001(canvas);
    // example002(canvas);
    // example003(canvas);
    // example004(canvas);
    // example005(canvas);
    // example006(canvas);
    // example007(canvas);
    // example008(canvas);
    // example009(canvas, image!);
    // example010(canvas);
    // example011(canvas, image!);
    // example012(canvas, image!);
    // example013(canvas, image!);
    // example014(canvas, image!);
    // example015(canvas, image!);
    // example016(canvas, size);
    // example017(canvas, size);
    // example018(canvas, size);
    // example019(canvas, size);
    // example020(canvas, size);
    // example021(canvas, size);
    // example023(canvas, size);
    // example024(canvas, size);
    example025(canvas, size);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }

  void example001(Canvas canvas) {
    final Paint paint = Paint();
    paint
      ..color = Colors.blue
      ..strokeWidth = 4
      ..style = PaintingStyle.stroke;
    canvas.drawCircle(Offset(100, 100), 10, paint);
    canvas.drawLine(Offset(50, 50), Offset(150, 150), paint);
  }

  void example002(Canvas canvas) {
    final Paint paint = Paint()
      ..color = Colors.red
      ..strokeWidth = 4
      ..style = PaintingStyle.stroke;
    Path path = Path();
    path.moveTo(100, 200);
    path.lineTo(200, 100);
    canvas.drawPath(path, paint);
  }

  void example003(Canvas canvas) {
    Paint paint = Paint();
    canvas.drawCircle(
      Offset(180, 180),
      170,
      paint
        ..color = Colors.blue
        ..strokeWidth = 5
        ..style = PaintingStyle.stroke
        ..isAntiAlias = false,
    );
  }

  void example004(Canvas canvas) {
    ///StrokeCap
    Paint paint = Paint();
    paint
      ..style = PaintingStyle.stroke
      ..color = Colors.blue
      ..strokeWidth = 20;
    canvas.drawLine(
        Offset(50, 50), Offset(50, 150), paint..strokeCap = StrokeCap.round);
  }

  void example005(Canvas canvas) {
    /// StrokeJoin strokeMiterLimit
    Paint paint = Paint();
    Path path = Path();
    paint
      ..style = PaintingStyle.stroke
      ..color = Colors.blue
      ..strokeWidth = 20;
    path.moveTo(50, 50);
    path.lineTo(50, 150);
    path.relativeLineTo(100, -50);
    path.relativeLineTo(0, 100);
    canvas.drawPath(
        path,
        paint
          ..strokeJoin = StrokeJoin.miter
          ..strokeMiterLimit = 1);
  }

  void example006(Canvas canvas) {
    var colors = [
      Color(0xFFF60C0C),
      Color(0xFFF3B913),
      Color(0xFFE7F716),
      Color(0xFF3DF30B),
      Color(0xFF0DF6EF),
      Color(0xFF0829FB),
      Color(0xFFB709F4),
    ];
    var pos = [1.0 / 7, 2.0 / 7, 3.0 / 7, 4.0 / 7, 5.0 / 7, 6.0 / 7, 1.0];
    Paint paint = Paint();
    paint
      ..style = PaintingStyle.stroke
      ..color = Colors.blue
      ..strokeJoin = StrokeJoin.miter
      ..strokeWidth = 100;
    paint.shader = ui.Gradient.linear(
      Offset(0, 0),
      Offset(100, 0),
      colors,
      pos,
      TileMode.mirror,
    );
    canvas.drawLine(Offset(0, 100), Offset(700, 100), paint);
  }

  void example007(Canvas canvas) {
    var colors = [
      Color(0xFFF60C0C),
      Color(0xFFF3B913),
      Color(0xFFE7F716),
      Color(0xFF3DF30B),
      Color(0xFF0DF6EF),
      Color(0xFF0829FB),
      Color(0xFFB709F4),
    ];
    var pos = [1.0 / 7, 2.0 / 7, 3.0 / 7, 4.0 / 7, 5.0 / 7, 6.0 / 7, 1.0];
    Paint paint = Paint();
    paint
      ..style = PaintingStyle.stroke
      ..color = Colors.blue
      ..strokeJoin = StrokeJoin.miter
      ..strokeWidth = 100;
    paint.shader = ui.Gradient.radial(
      Offset(150, 150),
      50,
      colors,
      pos,
      TileMode.repeated,
    );
    canvas.drawCircle(Offset(150, 150), 50, paint);
  }

  void example008(Canvas canvas) {
    var colors = [
      Color(0xFFF60C0C),
      Color(0xFFF3B913),
      Color(0xFFE7F716),
      Color(0xFF3DF30B),
      Color(0xFF0DF6EF),
      Color(0xFF0829FB),
      Color(0xFFB709F4),
    ];
    var pos = [1.0 / 7, 2.0 / 7, 3.0 / 7, 4.0 / 7, 5.0 / 7, 6.0 / 7, 1.0];
    Paint paint = Paint();
    paint
      ..style = PaintingStyle.stroke
      ..color = Colors.blue
      ..strokeJoin = StrokeJoin.miter
      ..strokeWidth = 100;
    paint.shader = ui.Gradient.sweep(
      Offset(150, 150),
      colors,
      pos,
      TileMode.repeated,
      0,
      pi,
    );
    canvas.drawCircle(Offset(150, 150), 50, paint);
  }

  void example009(Canvas canvas, ui.Image image) {
    Paint paint = Paint()
      ..strokeWidth = 10
      ..style = PaintingStyle.stroke
      ..color = Colors.red;
    paint.shader = ImageShader(image, TileMode.repeated, TileMode.repeated,
        Float64List.fromList([1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1]));
    canvas.drawCircle(
      Offset(100 + 120, 200),
      200,
      paint
        ..strokeWidth = 10
        ..style = PaintingStyle.fill,
    );
  }

  void example010(Canvas canvas) {
    ///BlendMode invertColors
    Paint paint = Paint()
      ..invertColors = true;
    canvas.drawCircle(Offset(100, 100), 50, paint..color = Colors.red);
    canvas.drawCircle(
      Offset(140, 70),
      50,
      paint
        ..color = Colors.green
        ..blendMode = BlendMode.hue,
    );
  }

  void example011(Canvas canvas, ui.Image image) {
    ///ColorFilter.mode  ColorFilter.linearToSrgbGamma
    // Paint paint = Paint()..colorFilter = ColorFilter.linearToSrgbGamma();
    Paint paint = Paint()
      ..colorFilter = ColorFilter.mode(Colors.yellow, BlendMode.lighten);
    canvas.drawImageRect(
      image,
      Rect.fromLTRB(0, 0, image.width.toDouble(), image.height.toDouble()),
      Rect.fromLTRB(
          0, 0, image.width.toDouble() / 2, image.height.toDouble() / 2),
      paint,
    );
  }

  void example012(Canvas canvas, ui.Image image) {
    ///ColorFilter.mode  ColorFilter.linearToSrgbGamma
    // Paint paint = Paint()..colorFilter = ColorFilter.linearToSrgbGamma();
    Paint paint = Paint()
      ..colorFilter = ColorFilter.matrix(<double>[
        0.1,
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
        0
      ]);
    canvas.drawImageRect(
      image,
      Rect.fromLTRB(0, 0, image.width.toDouble(), image.height.toDouble()),
      Rect.fromLTRB(
          0, 0, image.width.toDouble() / 2, image.height.toDouble() / 2),
      paint,
    );
  }

  void example013(Canvas canvas, ui.Image image) {
    Paint paint = Paint()
      ..maskFilter = MaskFilter.blur(BlurStyle.inner, 20);
    canvas.drawImageRect(
      image,
      Rect.fromLTRB(0, 0, image.width.toDouble(), image.height.toDouble()),
      Rect.fromLTRB(
          0, 0, image.width.toDouble() / 2, image.height.toDouble() / 2),
      paint,
    );
  }

  void example014(Canvas canvas, ui.Image image) {
    // Paint paint = Paint()..imageFilter = ui.ImageFilter.blur(sigmaX: 0.8,sigmaY: 0.8);
    Paint paint = Paint()
      ..imageFilter = ui.ImageFilter.matrix(Matrix4
          .skew(pi / 4, 0)
          .storage);
    canvas.drawImageRect(
      image,
      Rect.fromLTRB(0, 0, image.width.toDouble(), image.height.toDouble()),
      Rect.fromLTRB(
          0, 0, image.width.toDouble() / 2, image.height.toDouble() / 2),
      paint,
    );
  }

  void example015(Canvas canvas, ui.Image image) {
    Paint paint = Paint()
      ..maskFilter = MaskFilter.blur(BlurStyle.inner, 20)
      ..filterQuality = FilterQuality.low;
    canvas.drawImageRect(
      image,
      Rect.fromLTRB(0, 0, image.width.toDouble(), image.height.toDouble()),
      Rect.fromLTRB(
          0, 0, image.width.toDouble() / 2, image.height.toDouble() / 2),
      paint,
    );
  }

  void example016(Canvas canvas, Size size) {
    var paint = Paint()
      ..style = PaintingStyle.fill
      ..color = Colors.blue;
    canvas.translate(size.width / 2, size.height / 2);
    canvas.drawCircle(Offset(0, 0), 50, paint);
    canvas.drawLine(
      Offset(20, 20),
      Offset(50, 50),
      paint
        ..color = Colors.red
        ..strokeWidth = 15
        ..strokeCap = StrokeCap.round
        ..style = PaintingStyle.stroke,
    );
  }

  void example017(Canvas canvas, Size size) {
    Paint paint = Paint();
    canvas.save();
    double step = 20.0;
    for (int i = 0; i < size.height / 2 / step; i++) {
      canvas.drawLine(Offset(0, 0), Offset(size.width / 2, 0), paint);
      canvas.translate(0, step);
    }
    canvas.restore();

    canvas.save();
    for (int i = 0; i < size.width / 2 / step; i++) {
      canvas.drawLine(Offset(0, 0), Offset(0, size.height / 2), paint);
      canvas.translate(step, 0);
    }
    canvas.restore();
  }

  void example018(Canvas canvas, Size size) {
    ///居中
    canvas.translate(size.width / 2, size.height / 2);
    example017(canvas, size);
    canvas.save();
    canvas.scale(1, -1);
    example017(canvas, size);
    canvas.restore();

    canvas.save();
    canvas.scale(-1, 1);
    example017(canvas, size);
    canvas.restore();

    canvas.save();
    canvas.scale(-1, -1);
    example017(canvas, size);
    canvas.restore();
  }

  void example019(Canvas canvas, Size size) {
    canvas.translate(size.width / 2, size.height / 2);
    Paint paint = Paint()
      ..color = Colors.orangeAccent
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10;
    const int count = 12;

    canvas.save();
    for (int i = 0; i < count; i++) {
      var step = 2 * pi / count;
      canvas.drawLine(Offset(80, 0), Offset(100, 0), paint);
      canvas.rotate(step);
    }
    canvas.restore();
  }

  void example020(Canvas canvas, Size size) {
    ///PointMode
    canvas.translate(size.width / 2, size.height / 2);
    Paint paint = Paint()
      ..strokeWidth = 13
      ..color = Colors.red;
    final List<Offset> points = [
      Offset(-120, -20),
      Offset(-80, -80),
      Offset(-40, -40),
      Offset(-00, 20),
    ];
    canvas.drawPoints(PointMode.polygon, points, paint);
  }

  void example021(Canvas canvas, Size size) {
    canvas.translate(size.width / 2, size.height / 2);
    Paint paint = Paint();
    Float32List pos = Float32List.fromList([
      -120,
      -20,
      -80,
      -80,
      -40,
      -40,
      0,
      -100,
      40,
      -140,
      80,
      -160,
      120,
      -100
    ]);
    paint
      ..color = Colors.red
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10
      ..strokeCap = StrokeCap.round;
    canvas.drawRawPoints(PointMode.points, pos, paint);
  }

  void example022(Canvas canvas, Size size) {
    canvas.translate(size.width / 2, size.height / 2);
    Paint paint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 1.5;
    canvas.drawLine(
        Offset(-size.width / 2, 0), Offset(size.width / 2, 0), paint);
    canvas.drawLine(
        Offset(0, -size.height / 2), Offset(0, size.height / 2), paint);
    canvas.drawLine(Offset(0, size.height / 2),
        Offset(0 - 7.0, size.height / 2 - 10), paint);
    canvas.drawLine(Offset(0, size.height / 2),
        Offset(0 + 7.0, size.height / 2 - 10), paint);
    canvas.drawLine(
        Offset(size.width / 2, 0), Offset(size.width / 2 - 10, 7), paint);
    canvas.drawLine(
        Offset(size.width / 2, 0), Offset(size.width / 2 - 10, -7), paint);
  }

  void example023(Canvas canvas, Size size) {
    canvas.translate(size.width / 2, size.height / 2);
    Paint paint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 1.5;
    Rect rectFromCenter =
    Rect.fromCenter(center: Offset(0, 0), width: 160, height: 160);
    canvas.drawRect(rectFromCenter, paint);
    Rect rectFromLTRB = Rect.fromLTRB(-120, -120, -80, -80);
    canvas.drawRect(rectFromLTRB, paint..color = Colors.red);
    Rect rectFromLTWH = Rect.fromLTWH(80, -120, 40, 40);
    canvas.drawRect(rectFromLTWH, paint..color = Colors.orange);
    Rect rectFromCircle = Rect.fromCircle(center: Offset(100, 100), radius: 20);
    canvas.drawRect(rectFromCircle, paint..color = Colors.green);
    Rect rectFromPoints = Rect.fromPoints(Offset(-120, 80), Offset(-80, 120));
    canvas.drawRect(rectFromPoints, paint..color = Colors.purple);
  }

  void example024(Canvas canvas, Size size) {
    canvas.translate(size.width / 2, size.height / 2);
    Paint paint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 1.5;
    Rect rectFromCenter =
    Rect.fromCenter(center: Offset(0, 0), width: 100, height: 160);
    canvas.drawRRect(RRect.fromRectXY(rectFromCenter, 100, 20), paint);

    canvas.drawRRect(
      RRect.fromLTRBXY(-120, -120, -80, -80, 10, 10),
      paint..color = Colors.red,
    );
    canvas.drawRRect(RRect.fromLTRBR(80, -120, 120, -80, Radius.circular(10)),
        paint..color = Colors.orange);
    canvas.drawRRect(
      RRect.fromLTRBAndCorners(80, 80, 120, 120,
          bottomRight: Radius.elliptical(10, 10)),
      paint..color = Colors.green,
    );
    Rect rectFromPoints = Rect.fromPoints(Offset(-120, 80), Offset(-80, 120));
    canvas.drawRRect(
      RRect.fromRectAndCorners(rectFromPoints,
          bottomLeft: Radius.elliptical(10, 10)),
      paint..color = Colors.purple,
    );
  }

  void example025(Canvas canvas, Size size) {
    canvas.translate(size.width / 2, size.height / 2);
    Paint paint = Paint()
      ..color = Colors.blue;
    canvas.save();
    canvas.translate(-200, 0);
    canvas.drawCircle(Offset(0, 0), 60, paint);
    canvas.restore();

    var rect = Rect.fromCenter(center: Offset(0, 0), width: 120, height: 100);
    canvas.drawOval(rect, paint);

    canvas.save();
    canvas.translate(200, 0);
    canvas.drawArc(rect, 0, pi / 2 * 3, true, paint);
    canvas.restore();
  }

  void example026(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..style = PaintingStyle.fill
      ..strokeWidth = 0.5
      ..color = Colors.blue;
    canvas.translate(size.width / 2, size.height / 2);
    canvas.save();
    canvas.translate(-200, 0);
    canvas.drawCircle(Offset(0, 0), 60, paint);
    canvas.restore();

    var rect = Rect.fromCenter(center: Offset(0, 0), width: 120, height: 100);
    canvas.drawOval(rect, paint);

    canvas.save();
    canvas.translate(200, 0);
    canvas.drawArc(rect, 0, pi / 2 * 3, true, paint);
    canvas.restore();
  }

  void example027(Canvas canvas) {
    var rect = Rect.fromCenter(center: Offset(0, 0), width: 100, height: 100);
    Paint paint = Paint()..style = PaintingStyle.stroke..strokeWidth = 2;
    canvas.save();
    canvas.translate(-200, 0);
    canvas.drawArc(rect, 0, pi / 2 * 3, false, paint);
    canvas.restore();

    canvas.drawArc(rect, 0, pi / 2 * 3, true, paint);
    canvas.save();
    canvas.translate(200, 0);
    var a = pi / 8;
    canvas.drawArc(rect, a, 2 * pi - a.abs() * 2, true, paint..color = Colors.yellowAccent);
    canvas.translate(40, 0);
    canvas.drawCircle(Offset(0, 0), 6, paint);
    canvas.translate(25, 0);
    canvas.drawCircle(Offset(0, 0), 6, paint);
    canvas.restore();
  }
}
