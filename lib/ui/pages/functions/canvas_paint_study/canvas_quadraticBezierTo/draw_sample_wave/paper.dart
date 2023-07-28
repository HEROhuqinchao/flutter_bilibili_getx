import 'dart:ui';

import 'package:bilibili_getx/ui/pages/functions/canvas_paint_study/mix/grid.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TolyWaveLoading extends StatefulWidget {
  final double waveHeight;
  final double progress;
  final Color color;
  final Size size;
  final int secondAlpha;
  final double strokeWidth;
  final double borderRadius;
  final bool isOval;
  final Duration duration;
  final Curve curve;

  TolyWaveLoading({
    this.waveHeight = 5,
    this.progress = 1,
    this.color = Colors.blue,
    this.size = const Size(100, 100),
    this.secondAlpha = 88,
    this.strokeWidth = 3.0,
    this.borderRadius = 20,
    this.isOval = true,
    this.duration = const Duration(seconds: 1),
    this.curve = Curves.linear,
  });

  @override
  State<TolyWaveLoading> createState() => _TolyWaveLoadingState();
}

class _TolyWaveLoadingState extends State<TolyWaveLoading>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    )..repeat();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomPaint(
        size: widget.size,
        painter: PaperPainter(
          repaint: CurveTween(curve: widget.curve).animate(_controller),
          progress: widget.progress,
          waveHeight: widget.waveHeight,
          secondAlpha: widget.secondAlpha,
          color: widget.color,
          borderRadius: widget.borderRadius,
          isOval: widget.isOval,
          strokeWidth: widget.strokeWidth,
        ),
      ),
    );
  }
}

class PaperPainter extends CustomPainter with Grid {
  final bool isOval;
  double waveWidth;
  double waveHeight;
  double wrapHeight;
  late final Paint _wavePaint = Paint();
  final Color color;
  final Animation<double> repaint;
  late Rect rect;
  final int secondAlpha;
  final double borderRadius;
  final double progress;
  final double strokeWidth;

  PaperPainter({
    required this.repaint,
    this.waveWidth = 0,
    required this.waveHeight,
    required this.secondAlpha,
    required this.color,
    required this.borderRadius,
    this.wrapHeight = 0,
    required this.isOval,
    required this.strokeWidth,
    required this.progress,
  }) : super(repaint: repaint);

  @override
  void paint(Canvas canvas, Size size) {
    // canvas.save();
    // drawGrid(canvas, size);
    // drawAxis(canvas, size);
    // canvas.restore();
    waveWidth = size.width / 2;
    wrapHeight = size.height;
    _wavePaint
      ..color = color
      ..style = PaintingStyle.fill
      ..strokeWidth = strokeWidth;
    if (isOval) {
      canvas.clipPath(Path()..addOval(Offset.zero & size));
    } else {
      canvas.clipPath(
        Path()
          ..addRRect(
            RRect.fromRectXY(
              Offset.zero & size,
              borderRadius,
              borderRadius,
            ),
          ),
      );
    }

    Path path = getWavePath();
    canvas.translate(0, wrapHeight);
    canvas.translate(-4 * waveWidth + 2 * waveWidth * repaint.value, 0);
    canvas.drawPath(path, _wavePaint..color = color);

    canvas.translate(2 * waveWidth * repaint.value, 0);
    canvas.drawPath(path, _wavePaint..color = color.withAlpha(secondAlpha));
  }

  Path getWavePath() {
    Path path = Path();
    path.moveTo(0, 0);
    path.relativeLineTo(0, -wrapHeight * progress);
    path.relativeQuadraticBezierTo(
        waveWidth / 2, -waveHeight * 2, waveWidth, 0);
    path.relativeQuadraticBezierTo(waveWidth / 2, waveHeight * 2, waveWidth, 0);
    path.relativeQuadraticBezierTo(
        waveWidth / 2, -waveHeight * 2, waveWidth, 0);
    path.relativeQuadraticBezierTo(waveWidth / 2, waveHeight * 2, waveWidth, 0);
    path.relativeQuadraticBezierTo(
        waveWidth / 2, -waveHeight * 2, waveWidth, 0);
    path.relativeQuadraticBezierTo(waveWidth / 2, waveHeight * 2, waveWidth, 0);
    path.relativeLineTo(0, wrapHeight);
    path.relativeLineTo(-waveWidth * 3 * 2.0, 0);
    path.close();
    return path;
  }

  @override
  bool shouldRepaint(covariant PaperPainter oldDelegate) =>
      oldDelegate.repaint != repaint ||
      oldDelegate.waveHeight != waveHeight ||
      oldDelegate.progress != progress ||
      oldDelegate.color != color ||
      oldDelegate.strokeWidth != strokeWidth ||
      oldDelegate.isOval != isOval ||
      oldDelegate.secondAlpha != secondAlpha ||
      oldDelegate.borderRadius != borderRadius;
}
