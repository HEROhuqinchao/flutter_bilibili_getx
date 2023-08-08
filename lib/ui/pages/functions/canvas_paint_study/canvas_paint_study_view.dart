import 'dart:math';
import 'dart:typed_data';
import 'dart:ui';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'canvas_paint_study_logic.dart';
import 'coordinate.dart';

// https://juejin.cn/book/6844733827265331214/section/6844733827311468551
class CanvasPaintStudyView extends StatelessWidget {
  static String routeName = "/canvas_paint_study";
  final logic = Get.find<CanvasPaintStudyLogic>();
  final state = Get.find<CanvasPaintStudyLogic>().state;

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
    canvas.translate(size.width / 2, size.height / 2);
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
    // example025(canvas, size);
    // example028(canvas, size);
    // example029(canvas, size);
    // example030(canvas, TextAlign.center);
    // example031(canvas);
    // example032(canvas);
    // example033(canvas);
    // example034(canvas);
    // example037(canvas);
    // example038(canvas);
    // example039(canvas);
    // example040(canvas);
    // example041(canvas);
    // example042(canvas);
    // example043(canvas, size);
    // example044(canvas);
    // example045(canvas);
    // example046(canvas);
    // example047(canvas);
    // example048(canvas);
    // example049(canvas);
    example050(canvas);
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
    Paint paint = Paint()..invertColors = true;
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
    Paint paint = Paint()..maskFilter = MaskFilter.blur(BlurStyle.inner, 20);
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
      ..imageFilter = ui.ImageFilter.matrix(Matrix4.skew(pi / 4, 0).storage);
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
    Paint paint = Paint()..color = Colors.blue;
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
    Paint paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;
    canvas.save();
    canvas.translate(-200, 0);
    canvas.drawArc(rect, 0, pi / 2 * 3, false, paint);
    canvas.restore();

    canvas.drawArc(rect, 0, pi / 2 * 3, true, paint);
    canvas.save();
    canvas.translate(200, 0);
    var a = pi / 8;
    canvas.drawArc(rect, a, 2 * pi - a.abs() * 2, true,
        paint..color = Colors.yellowAccent);
    canvas.translate(40, 0);
    canvas.drawCircle(Offset(0, 0), 6, paint);
    canvas.translate(25, 0);
    canvas.drawCircle(Offset(0, 0), 6, paint);
    canvas.restore();
  }

  void example028(Canvas canvas, Size size) async {
    Coordinate coordinate = Coordinate();
    coordinate.paint(canvas, size);
    canvas.translate(size.width / 2, size.height / 2);
    late Paint paint = Paint()
      ..style = PaintingStyle.fill
      ..strokeWidth = 0.5
      ..color = Colors.blue;
    canvas.drawImage(
        image!, Offset(image!.width / 2, image!.height / 2), paint);
  }

  void example029(Canvas canvas, Size size) async {
    Coordinate coordinate = Coordinate();
    coordinate.paint(canvas, size);
    canvas.translate(size.width / 2, size.height / 2);
    late Paint paint = Paint()
      ..style = PaintingStyle.fill
      ..strokeWidth = 0.5
      ..color = Colors.blue;
    if (image != null) {
      // canvas.drawImageNine(
      //     image!,
      //     Rect.fromCenter(
      //         center: Offset(image!.width / 2, image!.height - 6.0),
      //         width: 10,
      //         height: 2.0),
      //     Rect.fromCenter(center: Offset(0, 0), width: 300, height: 300),
      //     paint);
      //
      // canvas.drawImage(image!, Offset(0, 0), paint);
      // canvas.drawRect(
      //     Rect.fromCenter(
      //         center: Offset(image!.width / 2, image!.height - 6.0),
      //         width: 10,
      //         height: 2.0),
      //     paint);
      //
      // canvas.drawImageNine(
      //     image!,
      //     Rect.fromCenter(
      //         center: Offset(image!.width / 2, image!.height - 6.0),
      //         width: image!.width - 20.0,
      //         height: 2.0),
      //     Rect.fromCenter(center: Offset(0, 0), width: 100, height: 50)
      //         .translate(250, 0),
      //     paint);

      canvas.drawImageNine(
          image!,
          Rect.fromCenter(
              center: Offset(image!.width / 2, image!.height - 6.0),
              width: image!.width - 10.0,
              height: 2.0),
          Rect.fromCenter(center: Offset(0, 0), width: 190, height: 250),
          paint);
    }
  }

  ///文本绘制
  ///drawParagraph绘制文字
  void example030(Canvas canvas, TextAlign textAlign) {
    ///构造基本样式
    var builder = ui.ParagraphBuilder(
      ui.ParagraphStyle(
        textAlign: textAlign,
        fontSize: 40,
        textDirection: TextDirection.ltr,
        maxLines: 1,
      ),
    );
    builder.pushStyle(
      ui.TextStyle(
        color: Colors.black87,
        textBaseline: ui.TextBaseline.alphabetic,
      ),
    );
    //添加文字
    builder.addText("Flutter Unit Text");
    //生成Paragraph
    ui.Paragraph paragraph = builder.build();
    //对于布局限制区域
    paragraph.layout(ui.ParagraphConstraints(width: 300));
    canvas.drawParagraph(paragraph, Offset(0, 0));
    canvas.drawRect(Rect.fromLTRB(0, 0, 300, 40),
        Paint()..color = Colors.blue.withAlpha(33));
  }

  ///TextPainter 绘制文字
  void example031(Canvas canvas) {
    var textPainter = TextPainter(
      text: TextSpan(
        text: 'Flutter Unit',
        style: TextStyle(
          fontSize: 40,
          color: Colors.blue,
        ),
      ),
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );
    //绘制布局
    textPainter.layout();
    //进行绘制
    textPainter.paint(canvas, Offset.zero);
  }

  ///TextPainter获取文字范围
  void example032(Canvas canvas) {
    // 设置画笔样式
    Paint textPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;
    TextPainter textPainter = TextPainter(
      text: TextSpan(
        text: 'Flutter Unit',
        style: TextStyle(
          foreground: textPaint,
          fontSize: 40,
          // color: Colors.black,
        ),
      ),
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );
    textPainter.layout();
    Size size = textPainter.size;
    textPainter.paint(canvas, Offset(-size.width / 2, -size.height / 2));
    canvas.drawRect(
      Rect.fromLTRB(0, 0, size.width, size.height)
          .translate(-size.width / 2, -size.height / 2),
      Paint()..color = Colors.blue.withAlpha(33),
    );
  }

  ///绘制文本方位
  void example033(Canvas canvas) {
    var builder = ui.ParagraphBuilder(ui.ParagraphStyle(
      textAlign: TextAlign.left,
      // textAlign: TextAlign.center,
      fontSize: 40,
      textDirection: TextDirection.ltr,
      maxLines: 1,
    ))
      ..pushStyle(
        ui.TextStyle(
          color: Colors.black87,
          textBaseline: ui.TextBaseline.alphabetic,
        ),
      )
      ..addText("Flutter Unit");
    canvas.drawParagraph(
      builder.build()
        ..layout(
          ui.ParagraphConstraints(width: 300),
        ),
      Offset(0, -100),
    );
    canvas.drawRect(Rect.fromLTRB(0, -100, 300, -60),
        Paint()..color = Colors.blue.withAlpha(33));
  }

  void example034(Canvas canvas) {
    Path path = Path();
    Paint paint = Paint()
      ..color = Colors.deepPurpleAccent
      ..style = PaintingStyle.fill;
    path
      ..moveTo(0, 0)
      ..lineTo(60, 80)
      ..lineTo(60, 0)
      ..lineTo(0, -80)
      ..close();
    canvas.drawPath(path, paint);
    paint
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;
    path
      ..moveTo(0, 0)
      ..lineTo(-60, 80)
      ..lineTo(-60, 0)
      ..lineTo(0, -80);
    canvas.drawPath(path, paint);
  }

  ///相对位置
  void example035(Canvas canvas) {
    Path path = Path();
    Paint paint = Paint()
      ..color = Colors.green
      ..style = PaintingStyle.fill;
    path
      ..relativeMoveTo(0, 0)
      ..relativeLineTo(100, 120)
      ..relativeLineTo(-10, -60)
      ..relativeLineTo(60, -10)
      ..close();
    canvas.drawPath(path, paint);
    path.reset();
    paint
      ..style = PaintingStyle.stroke
      ..color = Colors.green
      ..strokeWidth = 2;
    path
      ..relativeMoveTo(-200, 0)
      ..relativeLineTo(100, 120)
      ..relativeLineTo(-10, -60)
      ..relativeLineTo(60, -10)
      ..close();
    canvas.drawPath(path, paint);
  }

  ///指定矩形区域，形成椭圆
  void example036(Canvas canvas) {
    Path path = Path();
    Paint paint = Paint()
      ..color = Colors.purpleAccent
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;
    var rect = Rect.fromCenter(center: Offset(0, 0), width: 160, height: 100);
    path.lineTo(30, 30);
    path.arcTo(rect, 0, pi * 1.5, false);
    canvas.drawPath(path, paint);
    path.reset();
    canvas.translate(200, 0);
    path.lineTo(200, 0);
    path.arcTo(rect, 0, pi * 1.5, false);
    canvas.drawPath(path, paint);
  }

  ///点定弧线
  void example037(Canvas canvas) {
    Path path = Path();
    Paint paint = Paint()
      ..color = Colors.purpleAccent
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;
    path.lineTo(80, -40);
    path
      ..arcToPoint(
        //圆弧的终点
        Offset(40, 40),
        //圆弧的半径
        radius: Radius.circular(60),
        //优劣弧
        largeArc: false,
      )
      ..close();
    canvas.drawPath(path, paint);
    path.reset();
    canvas.translate(200, 0);
    path.lineTo(80, -40);
    path
      ..arcToPoint(Offset(40, 40), radius: Radius.circular(60), largeArc: true)
      ..close();
    canvas.drawPath(path, paint);
  }

  ///圆锥曲线
  void example038(Canvas canvas) {
    final Offset p1 = Offset(80, -100);
    final Offset p2 = Offset(160, 0);
    Path path = Path();
    Paint paint = Paint()
      ..color = Colors.purpleAccent
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;
    path.conicTo(p1.dx, p1.dy, p2.dx, p2.dy, 1);
    canvas.drawPath(path, paint);
    path.reset();
    canvas.translate(-180, 0);
    path.conicTo(p1.dx, p1.dy, p2.dx, p2.dy, .5);
    canvas.drawPath(path, paint);
    path.reset();
    canvas.translate(-180, 0);
    path.conicTo(p1.dx, p1.dy, p2.dx, p2.dy, 1.5);
    canvas.drawPath(path, paint);
  }

  ///二阶贝塞尔曲线
  void example039(Canvas canvas) {
    final Offset p1 = Offset(100, -100);
    final Offset p2 = Offset(160, 50);
    Path path = Path();
    Paint paint = Paint()
      ..color = Colors.purpleAccent
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;
    path.quadraticBezierTo(p1.dx, p1.dy, p2.dx, p2.dy);
    path.relativeQuadraticBezierTo(p1.dx, p1.dy, p2.dx, p2.dy);
    canvas.drawPath(path, paint);
  }

  ///三阶贝塞尔曲线
  void example040(Canvas canvas) {
    final Offset p1 = Offset(-10, -10);
    final Offset p2 = Offset(50, 90);
    final Offset p3 = Offset(200, 150);
    Path path = Path();
    Paint paint = Paint();
    paint
      ..color = Colors.purpleAccent
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;
    // path.cubicTo(p1.dx, p1.dy, p2.dx, p2.dy, p3.dx, p3.dy);
    path.relativeCubicTo(p1.dx, p1.dy, p2.dx, p2.dy, p3.dx, p3.dy);
    canvas.drawPath(path, paint);
  }

  ///路径上添加类圆形矩形
  void example041(Canvas canvas) {
    Path path = Path();
    Paint paint = Paint()
      ..color = Colors.purpleAccent
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;
    Rect rect = Rect.fromPoints(Offset(100, 100), Offset(160, 160));
    path
      ..lineTo(100, 100)
      ..addRect(rect)
      ..relativeLineTo(100, -100)
      ..addRRect(RRect.fromRectXY(rect.translate(100, -100), 10, 10))
      ..addOval(rect)
      ..relativeLineTo(100, -100)
      ..addArc(rect.translate(100, -100), 0, pi);
    canvas.drawPath(path, paint);
  }

  ///添加多边形路径，添加路径
  void example042(Canvas canvas) {
    Path path = Path();
    Paint paint = Paint()
      ..color = Colors.purpleAccent
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;
    var p0 = Offset(100, 100);
    path
      ..lineTo(100, 100)
      ..addPolygon(
        [
          p0,
          p0.translate(20, -20),
          p0.translate(40, -20),
          p0.translate(60, 0),
        ],
        true,
      )
      ..addPath(
          Path()..relativeQuadraticBezierTo(125, -100, 260, 0), Offset(0, 0))
      ..lineTo(160, 100);
    canvas.drawPath(path, paint);
  }

  ///坐标轴
  void example043(Canvas canvas, Size size) {
    double step = 10;
    Path path = Path();
    Paint paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = .5
      ..color = Colors.green;
    for (int i = 0; i < size.width / 2 / step; i++) {
      path.moveTo(step * i, -size.height / 2);
      path.relativeLineTo(0, size.height);
      path.moveTo(-step * i, -size.height / 2);
      path.relativeLineTo(0, size.height);
    }

    for (int i = 0; i < size.height / 2 / step; i++) {
      path.moveTo(-size.width / 2, step * i);
      path.relativeLineTo(size.width, 0);
      path.moveTo(-size.width / 2, -step * i);
      path.relativeLineTo(size.width, 0);
    }
    canvas.drawPath(path, paint);
  }

  ///路径操作
  void example044(Canvas canvas) {
    Path path = Path();
    Paint paint = Paint()
      ..color = Colors.purpleAccent
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;
    path
      ..lineTo(100, 100)
      ..relativeLineTo(0, -50)
      //路径封闭
      ..close();
    canvas.drawPath(path, paint);
    //指定点Offset对路径进行平移，并返回一条新路径
    canvas.drawPath(path.shift(Offset(100, 0)), paint);
  }

  ///路径判断点；获取路径所在区域
  void example045(Canvas canvas) {
    Path path = Path();
    Paint paint = Paint()
      ..color = Colors.purpleAccent
      ..style = PaintingStyle.fill;
    path
      ..relativeMoveTo(0, 0)
      ..relativeLineTo(-30, 120)
      ..relativeLineTo(30, -30)
      ..relativeLineTo(30, 30);
    canvas.drawPath(path, paint);
    print(path.contains(Offset(20, 20)));
    print(path.contains(Offset(0, 20)));
    Rect bounds = path.getBounds();
    canvas.drawRect(
      bounds,
      Paint()
        ..color = Colors.purpleAccent
        ..style = PaintingStyle.stroke,
    );
  }

  ///transform路径变换
  void example046(Canvas canvas) {
    Path path = Path();
    Paint paint = Paint()
      ..color = Colors.purple
      ..style = PaintingStyle.fill;
    path
      ..relativeMoveTo(0, 0)
      ..relativeLineTo(-30, 120)
      ..relativeLineTo(30, -30)
      ..relativeLineTo(30, 30)
      ..close();
    for (int i = 0; i < 4; i++) {
      canvas.drawPath(
          path.transform(Matrix4.rotationZ(i * pi / 2).storage), paint);
    }
  }

  ///路径联合生成新路径
  void example047(Canvas canvas) {
    Path path = Path();
    Paint paint = Paint();
    paint
      ..color = Colors.purple
      ..style = PaintingStyle.fill;
    path
      ..relativeMoveTo(0, 0)
      ..relativeLineTo(-30, 120)
      ..relativeLineTo(30, -30)
      ..relativeLineTo(30, 30)
      ..close();
    var pathOval = Path()
      ..addOval(
        Rect.fromCenter(center: Offset(0, 0), width: 60, height: 60),
      );
    canvas.drawPath(
        Path.combine(PathOperation.difference, path, pathOval), paint);
    canvas.translate(120, 0);
    canvas.drawPath(
        Path.combine(PathOperation.intersect, path, pathOval), paint);
    canvas.translate(120, 0);
    canvas.drawPath(Path.combine(PathOperation.union, path, pathOval), paint);
    canvas.translate(-120 * 3, 0);
    canvas.drawPath(
        Path.combine(PathOperation.reverseDifference, path, pathOval), paint);
    canvas.translate(-120, 0);
    canvas.drawPath(Path.combine(PathOperation.xor, path, pathOval), paint);
  }

  ///PathMetric获得路径长度length、路径索引contourIndex、路径是否闭合isClosed
  ///computeMetrics获得一组路径测量信息
  void example048(Canvas canvas) {
    Paint paint = Paint();
    paint
      ..color = Colors.purple
      ..style = PaintingStyle.fill;
    Path path = Path();
    path
      ..relativeMoveTo(0, 0)
      ..relativeLineTo(-30, 120)
      ..relativeLineTo(30, -30)
      ..relativeLineTo(30, 30)
      ..close();
    path.addOval(Rect.fromCenter(center: Offset.zero, width: 50, height: 50));
    canvas.drawPath(path, paint);
    PathMetrics pms = path.computeMetrics();
    for (var pm in pms) {
      print(
          "--length:-${pm.length}----contourIndex:-${pm.contourIndex}----isClosed:-${pm.isClosed}");
    }
  }

  void example049(Canvas canvas) {
    Paint paint = Paint()
      ..color = Colors.purple
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;
    Path path = Path();
    path
      ..relativeMoveTo(0, 0)
      ..relativeLineTo(-30, 120)
      ..relativeLineTo(30, -30)
      ..relativeLineTo(30, 30)
      ..close();
    path.addOval(Rect.fromCenter(center: Offset.zero, width: 50, height: 50));
    PathMetrics pathMetrics = path.computeMetrics();
    pathMetrics.forEach((pathMetric) {
      Tangent? tangent =
          pathMetric.getTangentForOffset(pathMetric.length * 0.5);
      if (tangent == null) return;
      canvas.drawCircle(
          tangent.position, 5, Paint()..color = Colors.deepOrange);
      canvas.drawPath(path, paint);
    });
  }

  void example050(Canvas canvas) {
    Paint paint = Paint()..style = PaintingStyle.stroke;
    Path path = Path()
      ..lineTo(40, 40)
      ..relativeLineTo(0, -40)
      ..close();
    canvas.drawPath(path, paint);
  }
}
