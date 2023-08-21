import 'dart:ui';

import 'package:flutter/material.dart';

import '../part004/point_data_notifier.dart';

class AnimPainter extends CustomPainter {
  Paint axisPaint = Paint()
    ..style = PaintingStyle.stroke
    ..strokeWidth = 1;
  Paint fpsPaint = Paint()
    ..style = PaintingStyle.stroke
    ..color = Colors.green;
  TextPainter textPainter = TextPainter(
    textAlign: TextAlign.center,
    textDirection: TextDirection.ltr,
  );
  Paint pointPaint = Paint()
    ..style = PaintingStyle.stroke
    ..color = Colors.blue
    ..strokeWidth = 2;

  PointDataNotifier pointDataNotifier;

  AnimPainter(this.pointDataNotifier) : super(repaint: pointDataNotifier);

  @override
  void paint(Canvas canvas, Size size) {
    canvas.translate(0, size.height);
    textPainter.text = TextSpan(
      text: '动画控制器数值散点图',
      style: TextStyle(
        fontSize: 14,
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
    );
    textPainter.layout();
    Size textSize = textPainter.size;
    textPainter.paint(canvas,
        Offset(size.width / 2 - textSize.width / 2, -size.height - 100));

    ///绘制点
    List<Offset> drawPoints = [];
    for (int i = 0; i < pointDataNotifier.dataList.length; i++) {
      drawPoints
          .add(Offset(3.0 * (i + 1), -pointDataNotifier.dataList[i] * 100));
    }
    // print(drawPoints.length);
    canvas.drawPoints(
      PointMode.points,
      drawPoints,
      pointPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
