import 'package:flutter/material.dart';

import 'curve_box_painter.dart';

class CurveBox extends StatefulWidget {
  late final Curve curve;

  CurveBox({super.key, required this.curve});

  @override
  State<CurveBox> createState() => _CurveBoxState();
}

class _CurveBoxState extends State<CurveBox>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _angleAnimation;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );
    _angleAnimation = CurveTween(curve: widget.curve).animate(_controller);
    _controller.repeat();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: const Size(100, 100),
      painter: CurveBoxPainter(
        repaint: _controller,
        angleAnimation: _angleAnimation,
      ),
    );
  }
}
