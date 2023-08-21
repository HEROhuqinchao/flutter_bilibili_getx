import 'package:flutter/material.dart';
import 'dart:ui' as ui;

typedef ChangeCallBack = void Function(double);

const double _kHeightLevel1 = 20; // 短线长
const double _kHeightLevel2 = 25; // 5 线长
const double _kHeightLevel3 = 30; //10 线长
const double _kPrefixOffSet = 5; // 左侧偏移
const double _kVerticalOffSet = 12; // 线顶部偏移
const double _kStrokeWidth = 2; // 刻度宽
const double _kSpacer = 4; // 刻度间隙
const List<Color> _kRulerColors = [
  // 渐变色
  Color(0xFF1426FB),
  Color(0xFF6080FB),
  Color(0xFFBEE0FB),
];
const List<double> _kRulerColorStops = [0.0, 0.2, 0.8];

class RulerChooser extends StatefulWidget {
  late final Size size;
  final ChangeCallBack? onChanged;
  late final int min;
  late final int max;

  RulerChooser({
    super.key,
    required this.onChanged,
    this.min = 100,
    this.max = 200,
    this.size = const Size(240.0, 60),
  });

  @override
  State<RulerChooser> createState() => _RulerChooserState();
}

class _RulerChooserState extends State<RulerChooser> {
  final ValueNotifier<double> _dx = ValueNotifier(0.0);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: _parser,
      child: CustomPaint(
        size: widget.size,
        painter: _HandlePainter(
          dx: _dx,
          max: widget.max,
          min: widget.min,
        ),
      ),
    );
  }

  double dx = 0;

  void _parser(DragUpdateDetails details) {
    dx += details.delta.dx;
    if (dx > 0) {
      dx = 0.0;
    }
    var limitMax = -(widget.max - widget.min) * (_kSpacer + _kStrokeWidth);
    if (dx < limitMax) {
      dx = limitMax;
    }
    _dx.value = dx;
    if (widget.onChanged != null) {
      widget.onChanged!(widget.min - dx / (_kSpacer + _kStrokeWidth));
    }
  }
}

class _HandlePainter extends CustomPainter {
  final _paint = Paint();
  final Paint _pointPaint = Paint();
  final ValueNotifier<double> dx;
  final int max;
  final int min;

  _HandlePainter({
    required this.dx,
    required this.max,
    required this.min,
  }) : super(repaint: dx) {
    _paint
      ..strokeWidth = _kStrokeWidth
      ..shader = ui.Gradient.radial(
        Offset.zero,
        25,
        _kRulerColors,
        _kRulerColorStops,
        TileMode.mirror,
      );
  }

  @override
  void paint(Canvas canvas, Size size) {
    canvas.clipRect(Offset.zero & size);
    drawArrow(canvas);
    canvas.translate(_kStrokeWidth / 2 + _kPrefixOffSet, _kVerticalOffSet);
    canvas.translate(dx.value, 0);
    drawRuler(canvas);
  }

  @override
  bool shouldRepaint(covariant _HandlePainter oldDelegate) =>
      oldDelegate.dx != dx || oldDelegate.min != min || oldDelegate.max != max;

  void drawArrow(Canvas canvas) {
    var path = Path()
      ..moveTo(_kStrokeWidth / 2 + _kPrefixOffSet, 3)
      ..relativeLineTo(-3, 0)
      ..relativeLineTo(3, _kPrefixOffSet)
      ..close();
    canvas.drawPath(path, _pointPaint);
  }

  void drawRuler(Canvas canvas) {
    double y = _kHeightLevel1;
    for (int i = min; i < max + 5; i++) {
      if (i % 5 == 0 && i % 10 != 0) {
        y = _kHeightLevel2;
      } else if (i % 10 == 0) {
        y = _kHeightLevel3;
        _simpleDrawText(
          canvas,
          i.toString(),
          offset: const Offset(-3, _kHeightLevel3 + 5),
        );
      } else {
        y = _kHeightLevel1;
      }
      canvas.drawLine(Offset.zero, Offset(0, y), _paint);
      canvas.translate(_kStrokeWidth + _kSpacer, 0);
    }
  }

  void _simpleDrawText(
    Canvas canvas,
    String str, {
    Offset offset = Offset.zero,
  }) {
    var builder = ui.ParagraphBuilder(ui.ParagraphStyle())
      ..pushStyle(
        ui.TextStyle(
          color: Colors.black,
          textBaseline: ui.TextBaseline.alphabetic,
        ),
      )
      ..addText(str);
    canvas.drawParagraph(
      builder.build()
        ..layout(ui.ParagraphConstraints(width: 11.0 * str.length)),
      offset,
    );
  }
}
