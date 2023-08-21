import 'package:flutter/widgets.dart';

class TriangleWidget extends CustomPainter {
  Color color;

  TriangleWidget(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    canvas.translate(size.width / 2, size.height / 2);
    Path path = Path();
    Paint paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;
    path
      ..moveTo(0, 10)
      ..lineTo(-10, 0)
      ..lineTo(0, -10)
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
