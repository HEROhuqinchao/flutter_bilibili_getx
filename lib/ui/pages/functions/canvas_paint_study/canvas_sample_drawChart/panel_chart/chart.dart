import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

const double _kPanelPadding = 20;
const double panelRate = .2;
const double kStrokeWidth = 10;
const double kMin = 0;
const double kMax = 220;
const double panelAngle = 270;
const double kLevel1 = 10;
const double kLevel2 = 15;
const double kLevel3 = 22;
const Color kColor1 = Colors.green;
const Color kColor2 = Colors.blue;
const Color kColor3 = Colors.red;
const double initAngle = 135;
const double nowValue = 150;

class ICharts extends StatefulWidget {
  const ICharts({super.key});

  @override
  State<ICharts> createState() => _IChartsState();
}

class _IChartsState extends State<ICharts> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..forward(from: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 450,
      height: 300,
      child: CustomPaint(
        painter: ChartPainter(repaint: _controller),
      ),
    );
  }
}

class ChartPainter extends CustomPainter {
  double radius = 0;
  Paint bgPaint = Paint()..color = Colors.black.withAlpha(11);
  Paint strokePaint = Paint()
    ..style = PaintingStyle.stroke
    ..strokeWidth = kStrokeWidth;
  Paint linePaint = Paint()
    ..style = PaintingStyle.stroke
    ..strokeWidth = 2;
  Paint arrowPaint = Paint()
    ..color = Colors.blue
    ..style = PaintingStyle.fill;
  Animation<double> repaint;

  ChartPainter({required this.repaint}) : super(repaint: repaint);

  @override
  void paint(Canvas canvas, Size size) {
    canvas.translate(size.width / 2, size.height / 2);
    radius = size.shortestSide / 2 - _kPanelPadding;
    drawBg(canvas, size);
    drawArrow(canvas, size);
    drawAroundText(canvas);
    drawNowValueText(canvas);
    drawUnitValueText(canvas);
  }

  void drawArrow(Canvas canvas, Size size) {
    canvas.save();
    canvas.rotate(
        (nowValue * repaint.value / kMax * panelAngle + initAngle) / 180 * pi);
    Path path = Path();
    double p1X = -18;
    double p2X = 9;
    double p2Y = 7;
    double centerCircleRadius = 4;
    double space = 15;
    path
      ..moveTo(p1X, 0)
      ..relativeLineTo(p2X, p2Y)
      ..lineTo(radius - space, 0)
      ..relativeLineTo(-(radius - space) - (p1X.abs() - p2X), -p2Y)
      ..lineTo(p1X, 0)
      ..close();
    canvas.drawPath(path, arrowPaint..color = Colors.blue);
    canvas.drawCircle(
        Offset.zero, centerCircleRadius, arrowPaint..color = Colors.white);
    canvas.restore();
  }

  void drawBg(Canvas canvas, Size size) {
    canvas.drawRect(
      Rect.fromCenter(
          center: Offset.zero, width: size.width, height: size.height),
      bgPaint,
    );
    Path path = Path()..moveTo(radius, 0);
    path.arcTo(
      Rect.fromCenter(
        center: Offset.zero,
        width: radius * 2,
        height: radius * 2,
      ),
      pi / 180 * initAngle,
      pi / 180 * panelAngle,
      true,
    );
    PathMetrics pms = path.computeMetrics();
    for (var pm in pms) {
      canvas.drawPath(pm.extractPath(0, pm.length * panelRate),
          strokePaint..color = kColor1);
      canvas.drawPath(
          pm.extractPath(pm.length * panelRate, pm.length * (1 - panelRate)),
          strokePaint..color = kColor2);
      canvas.drawPath(pm.extractPath(pm.length * (1 - panelRate), pm.length),
          strokePaint..color = kColor3);
    }
    canvas.save();
    canvas.rotate(initAngle / 180 * pi);
    double count = kMax / 2;
    for (int i = 0; i < count + 1; i++) {
      double len = 0;
      Color color = Colors.black;
      if (i % 5 == 0 && i % 10 != 0) {
        len = kLevel2;
      } else if (i % 10 == 0) {
        len = kLevel3;
      } else {
        len = kLevel1;
      }
      if (i < panelRate * count) {
        color = kColor1;
      } else if (i < (1 - panelRate) * count) {
        color = kColor2;
      } else {
        color = kColor3;
      }
      canvas.drawLine(
        Offset(radius + kStrokeWidth / 2, 0),
        Offset(radius - len, 0),
        linePaint..color = color,
      );
      canvas.rotate(panelAngle / 180 * pi / (kMax / 2));
    }
    canvas.restore();
  }

  void drawAroundText(Canvas canvas) {
    double textSpace = 40;
    double count = kMax / 2 / 10;
    for (int i = 0; i < count + 1; i++) {
      var thta = pi / 180 * (panelAngle / count * i + initAngle);
      Color color = Colors.black.withAlpha(11);
      if (i < panelRate * count) {
        color = kColor1;
      } else if (i < (1 - panelRate) * count) {
        color = kColor2;
      } else {
        color = kColor3;
      }
      drawAxisText(
        canvas,
        (kMax / count * i).toStringAsFixed(0),
        Offset(
          cos(thta) * (radius - textSpace),
          sin(thta) * (radius - textSpace),
        ),
        color,
        Colors.white,
      );
    }
  }

  @override
  bool shouldRepaint(covariant ChartPainter oldDelegate) => false;

  void drawAxisText(
      Canvas canvas, String text, Offset offset, Color color, Color textColor) {
    var textPaint = TextPainter(
      text: TextSpan(
        text: text,
        style: TextStyle(
          fontSize: 12,
          color: textColor,
        ),
      ),
      textDirection: TextDirection.ltr,
      textAlign: TextAlign.center,
    );
    textPaint.layout();
    Size size = textPaint.size;
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromCenter(
          center: offset,
          width: size.width + 5,
          height: size.height + 5,
        ),
        const Radius.circular(5),
      ),
      Paint()..color = color,
    );
    textPaint.paint(canvas, Offset(-size.width / 2, -size.height / 2) + offset);
  }

  void drawNowValueText(Canvas canvas) {
    drawAxisText(
      canvas,
      "km/s",
      Offset(0, -radius / 2 + 10),
      Colors.transparent,
      Colors.black,
    );
  }

  void drawUnitValueText(Canvas canvas) {
    drawAxisText(
      canvas,
      nowValue.toStringAsFixed(1),
      Offset(0, radius / 2 - 10),
      Colors.transparent,
      Colors.black,
    );
  }
}
