import 'dart:math';

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
      duration: const Duration(milliseconds: 1500),
    )..forward();
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
          width: 350,
          height: 250,
          padding: EdgeInsets.only(top: 40, right: 20, bottom: 20, left: 20),
          color: Colors.blueAccent.withAlpha(11),
          child: CustomPaint(
            painter: ChartPainter(repaint: _controller),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 8.0),
          child: Text(
            "统计表",
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
  double _kBarPadding = 10;
  final List<double> yData = [88, 98, 70, 80, 100, 75];
  final List<String> xData = ["7月", "8月", "9月", "10月", "11月", "12月"];
  Path axisPath = Path();
  Paint axisPaint = Paint()
    ..style = PaintingStyle.stroke
    ..strokeWidth = 1;
  Paint gridPaint = Paint()
    ..style = PaintingStyle.stroke
    ..color = Colors.grey
    ..strokeWidth = .5;
  Paint fillPaint = Paint()..color = Colors.red;
  double xStep = 0;
  double yStep = 0;
  double maxData = 0;
  late Animation<double> repaint;

  ChartPainter({required this.repaint}) : super(repaint: repaint);

  @override
  void paint(Canvas canvas, Size size) {
    maxData = yData.reduce((value, element) => max(value, element));
    canvas.drawRect(
        Offset.zero & size, Paint()..color = Colors.black.withAlpha(11));
    canvas.translate(0, size.height);
    canvas.translate(_kScaleHeight, -_kScaleHeight);
    canvas.drawCircle(Offset.zero, 10, axisPaint);
    axisPath.moveTo(-_kScaleHeight, 0);
    axisPath.relativeLineTo(size.width, 0);
    axisPath.moveTo(0, _kScaleHeight);
    axisPath.relativeLineTo(0, -size.height);
    canvas.drawPath(axisPath, axisPaint);
    drawYText(canvas, size);
    drawXText(canvas, size);
    drawBarChart(canvas, size);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;

  void drawYText(Canvas canvas, Size size) {
    canvas.save();
    yStep = (size.height - _kScaleHeight) / 5;
    double numStep = maxData / 5;
    for (int i = 0; i <= 5; i++) {
      if (i == 0) {
        drawAxisText(canvas, '0', offset: const Offset(-_kScaleHeight - 10, 2));
        canvas.translate(0, -yStep);
        continue;
      }
      canvas.drawLine(
          Offset.zero, Offset(size.width - _kScaleHeight, 0), gridPaint);
      canvas.drawLine(const Offset(-_kScaleHeight, 0), Offset.zero, axisPaint);
      String str = (numStep * i).toStringAsFixed(0);
      drawAxisText(canvas, str, offset: const Offset(-_kScaleHeight - 10, 2));
      canvas.translate(0, -yStep);
    }
    canvas.restore();
  }

  void drawAxisText(Canvas canvas, String text, {required Offset offset}) {
    Paint _paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1
      ..color = Colors.blue;
    var textPaint = TextPainter(
      text: TextSpan(
          text: text, style: TextStyle(fontSize: 12, foreground: _paint)),
      textDirection: TextDirection.ltr,
      textAlign: TextAlign.center,
    );
    textPaint.layout(maxWidth: 100);
    Size size = textPaint.size;
    textPaint.paint(canvas, Offset(-size.width / 2, -size.height / 2) + offset);
  }

  void drawXText(Canvas canvas, Size size) {
    xStep = (size.width - _kScaleHeight) / xData.length;
    canvas.save();
    canvas.translate(xStep, 0);
    for (int i = 0; i < xData.length; i++) {
      canvas.drawLine(Offset.zero, const Offset(0, _kScaleHeight), axisPaint);
      drawAxisText(canvas, xData[i], offset: Offset(-xStep / 2, 10));
      canvas.translate(xStep, 0);
    }
    canvas.restore();
  }

  void drawBarChart(Canvas canvas, Size size) {
    canvas.save();
    for (int i = 0; i < xData.length; i++) {
      canvas.drawRect(
        Rect.fromLTWH(
          (xStep - 30) / 2,
          0,
          30,
          -(yData[i] / maxData * (size.height - _kScaleHeight)) * repaint.value,
        ),
        fillPaint,
      );
      canvas.translate(xStep, 0);
    }
    canvas.restore();
  }
}
