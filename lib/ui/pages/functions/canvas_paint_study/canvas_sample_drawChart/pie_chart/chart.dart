import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

const double _kScaleHeight = 8;

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
      duration: const Duration(milliseconds: 4500),
    )..forward(from: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Container(
          width: 450,
          height: 350,
          padding: EdgeInsets.only(top: 40, right: 20, bottom: 20, left: 20),
          color: Colors.blueAccent.withAlpha(11),
          child: CustomPaint(
            painter: ChartPainter(repaint: _controller),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 8.0),
          child: Text(
            "饼图",
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    );
  }
}

class ChartPainter extends CustomPainter {
  final double _kPiePadding = 40;
  final List<double> yData = [.12, .25, .1, .18, .15, .2];
  final List<String> xData = ["学习资料", "伙食费", "话费", "游玩", "游戏", "其他"];
  final List<Color> colors = [
    Colors.red,
    Colors.orangeAccent,
    Colors.blue,
    Colors.green,
    Colors.purple,
    Colors.pink
  ];
  late double radius;
  Paint linePaint = Paint();
  Paint fillPaint = Paint();
  Animation<double> repaint;

  ChartPainter({required this.repaint}) : super(repaint: repaint);

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawRect(
        Offset.zero & size, Paint()..color = Colors.black.withAlpha(22));
    Path clipPath = Path();
    canvas.translate(size.width / 2, size.height / 2);
    radius = size.shortestSide / 2 - _kPiePadding;
    clipPath.lineTo(radius, 0);
    clipPath.arcTo(
        Rect.fromCenter(
            center: Offset.zero, width: radius * 4, height: radius * 4),
        0,
        2 * pi * repaint.value,
        false);
    clipPath.close();
    if(repaint.value != 1.0) {
      canvas.clipPath(clipPath);
    }


    canvas.drawCircle(
      Offset.zero,
      radius,
      linePaint
        ..color = Colors.red
        ..style = PaintingStyle.stroke,
    );
    for (int i = 0; i < yData.length; i++) {
      Color color = colors[i % colors.length];
      Path path = Path();
      path.moveTo(0, 0);
      path.lineTo(radius, 0);
      path.arcTo(
        Rect.fromCenter(
          center: Offset.zero,
          width: radius * 2,
          height: radius * 2,
        ),
        0,
        2 * pi * yData[i],
        false,
      );
      path.close();
      canvas.drawPath(
        path,
        fillPaint
          ..style = PaintingStyle.fill
          ..color = color,
      );
      canvas.rotate(2 * pi * yData[i]);
    }
    drawInfo(canvas);
  }

  @override
  bool shouldRepaint(covariant ChartPainter oldDelegate) => false;

  void drawInfo(Canvas canvas) {
    canvas.save();
    for (int i = 0; i < yData.length; i++) {
      canvas.save();
      Color color = colors[i % colors.length];
      canvas.rotate(2 * pi * yData[i] / 2);
      drawAxisText(
        canvas,
        "${(yData[i] * 100).toStringAsFixed(1)}%",
        Colors.white,
        9,
        Offset(radius / 2 + 10, 0),
      );
      Path showPath = Path();
      showPath.moveTo(radius, 0);
      showPath.relativeLineTo(15, 0);
      showPath.relativeLineTo(5, 10);
      canvas.drawPath(showPath, linePaint..color = color);
      drawAxisText(
        canvas,
        xData[i],
        color,
        9,
        Offset(radius + 20, 18),
      );
      canvas.restore();
      canvas.rotate(2 * pi * yData[i]);
    }
    canvas.restore();
  }

  void drawAxisText(
    Canvas canvas,
    String str,
    Color color,
    double fontSize,
    Offset offset,
  ) {
    TextPainter textPainter = TextPainter(
      text: TextSpan(
        text: str,
        style: TextStyle(
          fontSize: fontSize,
          color: color,
        ),
      ),
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );
    textPainter.layout();
    Size size = textPainter.size;
    textPainter.paint(
      canvas,
      Offset(-size.width / 2, -size.height / 2) + offset,
    );
  }
}
