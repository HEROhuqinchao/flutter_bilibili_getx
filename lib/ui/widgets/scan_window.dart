import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../shared/app_theme.dart';

///矩形扫描框
class RectScanWindow extends StatefulWidget {
  Container? scanLine;
  int? lineScanDuration;
  Color? backgroundColor;

  RectScanWindow({
    super.key,
    this.scanLine,
    this.lineScanDuration,
    this.backgroundColor,
  });

  @override
  State<RectScanWindow> createState() => _ScanWindowState();
}

class _ScanWindowState extends State<RectScanWindow>
    with SingleTickerProviderStateMixin {
  late Animation<Offset> animation;
  late AnimationController animationController;

  @override
  void initState() {
    animationController = AnimationController(
      duration: Duration(seconds: widget.lineScanDuration ?? 3),
      vsync: this,
    )..repeat(reverse: true);
    animation =
        Tween<Offset>(begin: const Offset(0, -50), end: const Offset(0, 50))
            .animate(
      animationController,
    );
    animationController.repeat();
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final scanWindow = RRect.fromRectAndRadius(
      Rect.fromCenter(
        center: MediaQuery.of(context).size.center(Offset.zero),
        width: 200,
        height: 200,
      ),
      const Radius.circular(10),
    );
    final defaultLine = Container(
      width: 200,
      height: 2.r,
      decoration: BoxDecoration(
        color: Colors.blue.withOpacity(.3),
        boxShadow: [
          BoxShadow(
            color: Colors.blue.withOpacity(.5),
            blurRadius: 15.r,
            spreadRadius: 5.r,
          )
        ],
      ),
    );

    return Stack(
      children: [
        CustomPaint(
          painter: ScannerOverlay(
            center: MediaQuery.of(context).size.center(Offset.zero),
            cornerColor: HYAppTheme.norMainThemeColors,
            scanWindow: scanWindow,
            backgroundColor: widget.backgroundColor ??
                HYAppTheme.norTextColors.withOpacity(.4),
          ),
        ),
        Center(
          child: SlideTransition(
            position: animation,
            child: widget.scanLine ?? defaultLine,
          ),
        )
      ],
    );
  }
}

class ScannerOverlay extends CustomPainter {
  ScannerOverlay({
    required this.scanWindow,
    required this.backgroundColor,
    required this.cornerColor,
    required this.center,
  });

  final RRect scanWindow;
  final Color backgroundColor;
  final Color cornerColor;
  final Offset center;

  @override
  void paint(Canvas canvas, Size size) {
    final backgroundPath = Path()..addRect(Rect.largest);
    final cutoutPath = Path()..addRRect(scanWindow);
    final backgroundPaint = Paint()
      ..color = backgroundColor
      ..style = PaintingStyle.fill
      ..blendMode = BlendMode.dstOut;
    final backgroundWithCutout = Path.combine(
      PathOperation.difference,
      backgroundPath,
      cutoutPath,
    );
    final cornerPaint = Paint()
      ..strokeWidth = 5
      ..color = cornerColor ?? Colors.blue
      ..style = PaintingStyle.stroke;
    canvas.drawPath(backgroundWithCutout, backgroundPaint);
    canvas.translate(center.dx, center.dy);

    drawCorner(canvas, cornerPaint);

    canvas.save();
    canvas.scale(-1, 1);
    drawCorner(canvas, cornerPaint);
    canvas.restore();

    canvas.save();
    canvas.scale(-1, -1);
    drawCorner(canvas, cornerPaint);
    canvas.restore();

    canvas.save();
    canvas.scale(1, -1);
    drawCorner(canvas, cornerPaint);
    canvas.restore();
  }

  drawCorner(canvas, cornerPaint) {
    canvas.drawLine(
      const Offset(-100, -60),
      const Offset(-100, -100),
      cornerPaint,
    );
    canvas.drawLine(
      const Offset(-100, -100),
      const Offset(-60, -100),
      cornerPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
