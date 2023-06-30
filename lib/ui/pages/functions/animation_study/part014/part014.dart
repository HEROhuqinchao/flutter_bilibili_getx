import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: ClockWidget(100)),
    );
  }
}

class ClockWidget extends StatefulWidget {
  late double radius;

  ClockWidget(this.radius);

  @override
  State<ClockWidget> createState() => _ClockWidgetState();
}

class _ClockWidgetState extends State<ClockWidget>
    with SingleTickerProviderStateMixin {
  late Ticker ticker;
  ValueNotifier<DateTime> time = ValueNotifier<DateTime>(DateTime.now());

  @override
  void initState() {
    ticker = createTicker((elapsed) {
      if (time.value.second != DateTime.now().second) {
        time.value = DateTime.now();
      }
    })
      ..start();
    super.initState();
  }

  @override
  void dispose() {
    ticker.dispose();
    time.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        debugDumpRenderTree();
      },
      child: Stack(
        children: [
          CustomPaint(
            size: Size(widget.radius * 2, widget.radius * 2),
            painter: ClockPainter(
              radius: 100,
              time: time,
            ),
            // painter: ClockBgPainter(),
          ),
          RepaintBoundary(
            child: CustomPaint(
              painter: ClockBgPainter(
                radius: 100,
                // painter: ClockBgPainter(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ClockBgPainter extends CustomPainter {
  final Paint _paint = Paint()..style = PaintingStyle.stroke;
  final double radius;
  final Paint arcPaint = Paint()
    ..style = PaintingStyle.fill
    ..color = Color(0xff00abf2);
  final TextPainter _textPainter = TextPainter(
    textAlign: TextAlign.center,
    textDirection: TextDirection.ltr,
  );
  final Paint hourPaint = Paint()
    ..color = Color(0xff00ff00)
    ..strokeWidth = 5;
  final Paint minusPaint = Paint()
    ..color = Color(0xffff00ff)
    ..strokeWidth = 3;
  final Paint secondPaint = Paint()
    ..color = Color(0xff00ffff)
    ..strokeWidth = 2;

  double get logic1 => radius * 0.01;

  double get minusLen => logic1 * 60; // 分针长
  double get hourLen => logic1 * 45; // 时针长
  double get secondLen => logic1 * 68; // 秒针长
  double get hourLineWidth => logic1 * 3; // 时针线宽
  double get minusLineWidth => logic1 * 2; // 分针线宽
  double get secondLineWidth => logic1; // 秒针线宽
  double get scaleSpace => logic1 * 11; // 刻度与外圈的间隔
  double get shortScaleLen => logic1 * 7; // 短刻度线长
  double get shortLenWidth => logic1; // 短刻度线长
  double get longScaleLen => logic1 * 11; // 长刻度线长
  double get longLineWidth => logic1 * 2; // 长刻度线宽

  ClockBgPainter({
    required this.radius,
  });

  @override
  void paint(Canvas canvas, Size size) {
    canvas.translate(size.width / 2, size.height / 2);
    drawOuterCircle(canvas);
  }

  @override
  bool shouldRepaint(ClockPainter oldDelegate) {
    return oldDelegate.radius != radius;
  }

  void drawOuterCircle(Canvas canvas) {
    _paint
      ..strokeWidth = 4
      ..color = Color(0xffD5D5);
    _painArc(canvas);
    for (int i = 0; i < 4; i++) {
      _painArc(canvas);
      canvas.rotate(pi / 2);
    }
    drawScale(canvas);
    drawText(canvas);
  }

  void _painArc(Canvas canvas) {
    arcPaint.maskFilter = MaskFilter.blur(BlurStyle.solid, logic1);
    final Path circlePath = Path()
      ..addArc(
        Rect.fromCenter(
            center: Offset.zero, width: radius * 2, height: radius * 2),
        pi / 18,
        pi / 2 - pi / 9,
      );
    Path circlePath2 = Path()
      ..addArc(
        Rect.fromCenter(
            center: Offset(-logic1, 0), width: radius * 2, height: radius * 2),
        10 / 180 * pi,
        pi / 2 - 20 / 180 * pi,
      );
    Path result =
        Path.combine(PathOperation.difference, circlePath, circlePath2);
    canvas.drawPath(result, arcPaint);
  }

  void drawScale(Canvas canvas) {
    _paint
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.fill;
    double count = 60;
    double perAngle = 2 * pi / count;
    for (int i = 0; i < count; i++) {
      if (i % 5 == 0) {
        _paint
          ..strokeWidth = longLineWidth
          ..color = Colors.blue;
        canvas.drawLine(Offset(radius - scaleSpace, 0),
            Offset(radius - scaleSpace - longScaleLen, 0), _paint);
        canvas.drawCircle(
            Offset(radius - scaleSpace - longScaleLen - logic1 * 5, 0),
            longLineWidth,
            _paint..color = Colors.orange);
      } else {
        _paint
          ..strokeWidth = shortLenWidth
          ..color = Colors.black;
        canvas.drawLine(Offset(radius - scaleSpace, 0),
            Offset(radius - scaleSpace - shortScaleLen, 0), _paint);
      }
      canvas.rotate(perAngle);
    }
  }

  void drawText(Canvas canvas) {
    _drawCircleText(canvas, 'IX', offsetX: -radius);
    _drawCircleText(canvas, 'III', offsetX: radius);
    _drawCircleText(canvas, 'VI', offsetY: radius);
    _drawCircleText(canvas, 'XII', offsetY: -radius);
  }

  _drawCircleText(Canvas canvas, String text,
      {double offsetX = 0, double offsetY = 0}) {
    _textPainter.text = TextSpan(
      text: text,
      style: TextStyle(
        fontSize: radius * .15,
        color: Colors.blue,
      ),
    );
    _textPainter.layout();
    _textPainter.paint(
        canvas,
        Offset.zero.translate(
          -_textPainter.size.width / 2 + offsetX,
          -_textPainter.size.height / 2 + offsetY,
        ));
  }
}

class ClockPainter extends CustomPainter {
  ValueNotifier time;
  final Paint _paint = Paint()..style = PaintingStyle.stroke;
  final double radius;
  final Paint arcPaint = Paint()
    ..style = PaintingStyle.fill
    ..color = Color(0xff00abf2);
  final TextPainter _textPainter = TextPainter(
    textAlign: TextAlign.center,
    textDirection: TextDirection.ltr,
  );
  final Paint hourPaint = Paint()
    ..color = Color(0xff00ff00)
    ..strokeWidth = 5;
  final Paint minusPaint = Paint()
    ..color = Color(0xffff00ff)
    ..strokeWidth = 3;
  final Paint secondPaint = Paint()
    ..color = Color(0xff00ffff)
    ..strokeWidth = 2;

  double get logic1 => radius * 0.01;

  double get minusLen => logic1 * 60; // 分针长
  double get hourLen => logic1 * 45; // 时针长
  double get secondLen => logic1 * 68; // 秒针长
  double get hourLineWidth => logic1 * 3; // 时针线宽
  double get minusLineWidth => logic1 * 2; // 分针线宽
  double get secondLineWidth => logic1; // 秒针线宽
  double get scaleSpace => logic1 * 11; // 刻度与外圈的间隔
  double get shortScaleLen => logic1 * 7; // 短刻度线长
  double get shortLenWidth => logic1; // 短刻度线长
  double get longScaleLen => logic1 * 11; // 长刻度线长
  double get longLineWidth => logic1 * 2; // 长刻度线宽

  ClockPainter({
    required this.radius,
    required this.time,
  }) : super(repaint: time);

  @override
  void paint(Canvas canvas, Size size) {
    canvas.translate(size.width / 2, size.height / 2);
    drawOuterCircle(canvas);
  }

  @override
  bool shouldRepaint(ClockPainter oldDelegate) {
    return oldDelegate.radius != radius || oldDelegate.time != time;
  }

  void drawOuterCircle(Canvas canvas) {
    // _paint
    //   ..strokeWidth = 4
    //   ..color = Color(0xffD5D5);
    // _painArc(canvas);
    // for (int i = 0; i < 4; i++) {
    //   _painArc(canvas);
    //   canvas.rotate(pi / 2);
    // }
    // drawScale(canvas);
    // drawText(canvas);
    drawArrow(canvas, time.value);
  }

  void _painArc(Canvas canvas) {
    arcPaint.maskFilter = MaskFilter.blur(BlurStyle.solid, logic1);
    final Path circlePath = Path()
      ..addArc(
        Rect.fromCenter(
            center: Offset.zero, width: radius * 2, height: radius * 2),
        pi / 18,
        pi / 2 - pi / 9,
      );
    Path circlePath2 = Path()
      ..addArc(
        Rect.fromCenter(
            center: Offset(-logic1, 0), width: radius * 2, height: radius * 2),
        10 / 180 * pi,
        pi / 2 - 20 / 180 * pi,
      );
    Path result =
        Path.combine(PathOperation.difference, circlePath, circlePath2);
    canvas.drawPath(result, arcPaint);
  }

  void drawScale(Canvas canvas) {
    _paint
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.fill;
    double count = 60;
    double perAngle = 2 * pi / count;
    for (int i = 0; i < count; i++) {
      if (i % 5 == 0) {
        _paint
          ..strokeWidth = longLineWidth
          ..color = Colors.blue;
        canvas.drawLine(Offset(radius - scaleSpace, 0),
            Offset(radius - scaleSpace - longScaleLen, 0), _paint);
        canvas.drawCircle(
            Offset(radius - scaleSpace - longScaleLen - logic1 * 5, 0),
            longLineWidth,
            _paint..color = Colors.orange);
      } else {
        _paint
          ..strokeWidth = shortLenWidth
          ..color = Colors.black;
        canvas.drawLine(Offset(radius - scaleSpace, 0),
            Offset(radius - scaleSpace - shortScaleLen, 0), _paint);
      }
      canvas.rotate(perAngle);
    }
  }

  void drawText(Canvas canvas) {
    _drawCircleText(canvas, 'IX', offsetX: -radius);
    _drawCircleText(canvas, 'III', offsetX: radius);
    _drawCircleText(canvas, 'VI', offsetY: radius);
    _drawCircleText(canvas, 'XII', offsetY: -radius);
  }

  _drawCircleText(Canvas canvas, String text,
      {double offsetX = 0, double offsetY = 0}) {
    _textPainter.text = TextSpan(
      text: text,
      style: TextStyle(
        fontSize: radius * .15,
        color: Colors.blue,
      ),
    );
    _textPainter.layout();
    _textPainter.paint(
        canvas,
        Offset.zero.translate(
          -_textPainter.size.width / 2 + offsetX,
          -_textPainter.size.height / 2 + offsetY,
        ));
  }

  void drawArrow(Canvas canvas, DateTime time) {
    double sec = time.second.toDouble();
    double minute = time.minute.toDouble();
    double hour = time.hour.toDouble();
    double perAngle = 2 * pi / 60;
    double secondRad = sec * perAngle;
    double minuteRad = (minute + sec / 60.0) * perAngle;
    double hourRad = (hour + minute / 60.0 + sec / 3600.0) * (perAngle * 5);
    canvas.save();
    canvas.rotate(-pi / 2);
    canvas.save();
    canvas.rotate(hourRad);
    drawHour(canvas);
    canvas.restore();
    canvas.save();
    canvas.rotate(minuteRad);
    drawMinus(canvas);
    canvas.restore();
    canvas.save();
    canvas.rotate(secondRad);
    drawSecond(canvas);
    canvas.restore();
    canvas.restore();
  }

  void drawMinus(Canvas canvas) {
    canvas.drawLine(Offset.zero, Offset(minusLen, 0), minusPaint);
  }

  void drawSecond(Canvas canvas) {
    canvas.drawLine(Offset.zero, Offset(secondLen, 0), secondPaint);
  }

  void drawHour(Canvas canvas) {
    canvas.drawLine(Offset.zero, Offset(hourLen, 0), hourPaint);
  }
}
