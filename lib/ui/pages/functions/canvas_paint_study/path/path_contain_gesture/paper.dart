import 'package:bilibili_getx/ui/pages/functions/canvas_paint_study/mix/grid.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Paper extends StatefulWidget {
  @override
  State<Paper> createState() => _PaperState();
}

class _PaperState extends State<Paper> {
  late final ValueNotifier<Offset> pointer;

  @override
  void initState() {
    pointer = ValueNotifier(Offset.infinite);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      color: Colors.white,
      child: Listener(
        onPointerMove: (event) {
          pointer.value = event.position;
        },
        child: ValueListenableBuilder(
          valueListenable: pointer,
          builder: (_, __, ___) {
            return CustomPaint(
              painter: PaperCustomPainter(pointer),
            );
          },
        ),
      ),
    );
  }
}

class PaperCustomPainter extends CustomPainter with Grid {
  late ValueListenable<Offset> offset;

  PaperCustomPainter(this.offset) : super(repaint: offset);

  @override
  void paint(Canvas canvas, Size size) {
    canvas.save();
    canvas.translate(size.width / 2, size.height / 2);
    drawGridWithPath(canvas, size);
    drawAxis(canvas, size);
    canvas.restore();
    Path path = Path()
      ..moveTo(size.width / 2, size.height / 2)
      ..relativeLineTo(40, 40)
      ..relativeLineTo(100, -100)
      ..close();
    bool contains = path.contains(offset.value);
    double strokeWidth = contains ? 2 : 1;
    Color color = contains ? Colors.orange : Colors.black;
    canvas.drawPath(
      path,
      Paint()
        ..strokeWidth = strokeWidth
        ..color = color
        ..style = PaintingStyle.stroke,
    );
  }

  @override
  bool shouldRepaint(covariant PaperCustomPainter oldDelegate) => false;
}
