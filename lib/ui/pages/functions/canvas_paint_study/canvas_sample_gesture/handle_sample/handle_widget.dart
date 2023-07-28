import 'dart:math';

import 'package:flutter/material.dart';

typedef MessageCallBack = void Function(double rotation, double distance);

class HandleWidget extends StatefulWidget {
  final double size;
  final double handleRadius;
  final MessageCallBack onMove;

  HandleWidget({
    this.size = 200.0,
    this.handleRadius = 20.0,
    required this.onMove,
  });

  @override
  State<HandleWidget> createState() => _HandleWidgetState();
}

class _HandleWidgetState extends State<HandleWidget> {
  final ValueNotifier<Offset> _offset = ValueNotifier(Offset.zero);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanEnd: reset,
      onPanUpdate: parser,
      child: CustomPaint(
        size: Size(widget.size, widget.size),
        painter: _HandlePainter(
          handleR: widget.handleRadius,
          offset: _offset,
        ),
      ),
    );
  }

  reset(DragEndDetails details) {
    _offset.value = Offset.zero;
    widget.onMove(0, 0);
  }

  parser(DragUpdateDetails details) {
    final offset = details.localPosition;
    double dx = 0;
    double dy = 0;
    dx = offset.dx - widget.size / 2;
    dy = offset.dy - widget.size / 2;
    var rad = atan2(dx, dy);
    if (dx < 0) {
      rad += 2 * pi;
    }
    var bgR = widget.size / 2 - widget.handleRadius;
    var thta = rad - pi / 2;
    var d = sqrt(dx * dx + dy * dy);
    if (d > bgR) {
      dx = bgR * cos(thta);
      dy = -bgR * sin(thta);
    }
    widget.onMove(thta, d);
    _offset.value = Offset(dx, dy);
  }
}

class _HandlePainter extends CustomPainter {
  final _circlePaint = Paint()
    ..color = Colors.blue
    ..style = PaintingStyle.fill
    ..isAntiAlias = true;
  final _linePaint = Paint()
    ..color = Colors.red
    ..style = PaintingStyle.stroke
    ..strokeWidth = 1;
  double handleR;
  final ValueNotifier<Offset> offset;

  _HandlePainter({
    required this.handleR,
    required this.offset,
  }) : super(repaint: offset);

  @override
  void paint(Canvas canvas, Size size) {
    canvas.clipRect(Offset.zero & size);
    final bgR = size.width / 2 - handleR;
    canvas.translate(size.width / 2, size.height / 2);
    _circlePaint.color = _circlePaint.color.withAlpha(100);
    canvas.drawCircle(Offset.zero, bgR, _circlePaint);
    _circlePaint.color = _circlePaint.color.withAlpha(150);
    canvas.drawCircle(offset.value, handleR, _circlePaint);
    canvas.drawLine(Offset.zero, offset.value, _linePaint);
  }

  @override
  bool shouldRepaint(covariant _HandlePainter oldDelegate) =>
      oldDelegate.handleR != handleR || oldDelegate.offset != offset;
}
