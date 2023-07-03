import 'dart:math';
import 'dart:ui';

import 'package:bilibili_getx/core/proto/dynamic/dynamic.pb.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///点类
class Point {
  final double x;
  final double y;

  Point({
    required this.x,
    required this.y,
  });

  factory Point.fromOffset(Offset offset) {
    return Point(x: offset.dx, y: offset.dy);
  }

  double get distance => sqrt(x * x + y * y);

  Point operator -(Point other) => Point(x: x - other.x, y: y - other.y);

  Offset toOffset() => Offset(x, y);
}

enum PaintState {
  doing,
  done,
  hide,
  edit,
}

///线类
class Line {
  List<Point> points = [];
  PaintState state;
  double strokeWidth;
  Color color;
  Path _linePath = Path();
  late Path _recodePath = Path();
  Path get path => _linePath;

  Line({
    this.state = PaintState.doing,
    this.strokeWidth = 1,
    this.color = Colors.black,
  });

  void paint(Canvas canvas, Paint paint) {
    paint
      ..style = PaintingStyle.stroke
      ..color = color
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;
    if (state == PaintState.doing) {
      _linePath = formPath();
    }
    if (state == PaintState.edit) {
      Paint paint1 = Paint()
        ..strokeWidth = 1
        ..style = PaintingStyle.stroke
        ..color = Colors.deepPurpleAccent;
      canvas.drawRect(
        Rect.fromCenter(
          center: _linePath
              .getBounds()
              .center,
          width: _linePath
              .getBounds()
              .width,
          height: _linePath
              .getBounds()
              .height,
        ),
        paint1,
      );
    }
    canvas.drawPath(_linePath, paint);

    Path p1 =
    _linePath.shift(Offset(paint.strokeWidth / 2, paint.strokeWidth / 2));
    Path p2 =
    _linePath.shift(Offset(-paint.strokeWidth / 2, -paint.strokeWidth / 2));
    Paint paint1 = Paint()
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke
      ..color = Colors.red;
    canvas.drawPath(p1, paint1);
    canvas.drawPath(p2, paint1);
    // canvas.drawPoints(
    //   PointMode.polygon,
    //   points.map((e) => e.toOffset()).toList(),
    //   paint,
    // );
  }

  Path formPath() {
    Path path = Path();
    for (int i = 0; i < points.length - 1; i++) {
      Point current = points[i];
      Point next = points[i + 1];
      if (i == 0) {
        path.moveTo(current.x, current.y);
        path.lineTo(next.x, next.y);
      } else if (i <= points.length - 2) {
        double xc = (points[i].x + points[i + 1].x) / 2;
        double yc = (points[i].y + points[i + 1].y) / 2;
        Point p2 = points[i];
        path.quadraticBezierTo(p2.x, p2.y, xc, yc);
      } else {
        path.moveTo(current.x, current.y);
        path.lineTo(next.x, next.y);
      }
    }
    return path;
  }

  void recode() {
    _recodePath = path.shift(Offset.zero);
  }

  void translate(Offset offset) {
    if (_recodePath == null) return;
    _linePath = _recodePath.shift(offset);
  }
}

/// 绘制数据的整合类
class PaintModel extends ChangeNotifier {
  List<Line> _lines = [];

  List<Line> get lines => _lines;

  Line get activeLine =>
      _lines.singleWhere((element) => element.state == PaintState.doing,
          orElse: () => Line());

  void pushLine(Line line) {
    _lines.add(line);
  }

  void pushPoint(Point point, {bool force = false}) {
    if (activeLine == null) return;
    if (activeLine.points.isNotEmpty && !force) {
      if ((point - activeLine.points.last).distance < tolerance) return;
    }
    activeLine.points.add(point);
    notifyListeners();
  }

  void doneLine() {
    if (activeLine == null) return;
    activeLine.state = PaintState.done;
    notifyListeners();
  }

  void clear() {
    _lines.forEach((line) {
      line.points.clear();
    });
    _lines.clear();
    notifyListeners();
  }

  void removeEmpty() {
    _lines.removeWhere((element) => element.points.isEmpty);
  }

  final double tolerance = 8.0;

  Line get editLine =>
      _lines.singleWhere((element) => element.state == PaintState.edit,
          orElse: () => Line());

  void activeEditLine(Point point) {
    List<Line> lines = _lines
        .where((element) {
          print(_lines.length);
          print(element.path.getBounds());
      return element.path.getBounds().contains(point.toOffset());
    }).toList();
    print(lines.length);
    if (lines.isNotEmpty) {
      lines[0].state = PaintState.edit;
      lines[0].recode();
      notifyListeners();
    }
  }

  void cancelEditLine() {
    for (var element in _lines) {
      element.state = PaintState.done;
    }
    notifyListeners();
  }

  void moveEditLine(Offset offset) {
    if (editLine == null) return;
    editLine.translate(offset);
    notifyListeners();
  }
}

// 画板定义
class PaperPainter extends CustomPainter {
  final PaintModel model;

  PaperPainter({required this.model}) : super(repaint: model);
  final Paint _paint = Paint();

  @override
  void paint(Canvas canvas, Size size) {
    model.lines.forEach((line) => line.paint(canvas, _paint));
  }

  @override
  bool shouldRepaint(covariant PaperPainter oldDelegate) {
    return oldDelegate.model != model;
  }
}

// 组件的定义
class WhitePaper extends StatefulWidget {
  const WhitePaper({super.key});

  @override
  State<WhitePaper> createState() => _WhitePaperState();
}

class _WhitePaperState extends State<WhitePaper> {
  final PaintModel paintModel = PaintModel();
  Color lineColor = Colors.black;
  double strokeWidth = 1;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanDown: _initLineData,
      onPanUpdate: _collectPoint,
      onPanEnd: _doneALine,
      onPanCancel: _cancel,
      onDoubleTap: _showSettingDialog,
      // onDoubleTap: _clear,
      onLongPressStart: _activeEdit,
      onLongPressUp: _cancelEdit,
      onLongPressMoveUpdate: _moveEdit,
      // onLongPress: _showSettingDialog,
      child: CustomPaint(
        size: MediaQuery
            .of(context)
            .size,
        painter: PaperPainter(model: paintModel),
      ),
    );
  }

  void _activeEdit(LongPressStartDetails detail) {
    print(detail.localPosition);
    paintModel.activeEditLine(Point.fromOffset(detail.localPosition));
  }

  void _cancelEdit() {
    paintModel.cancelEditLine();
  }

  void _moveEdit(LongPressMoveUpdateDetails detail) {
    print(detail.offsetFromOrigin);
    paintModel.moveEditLine(detail.offsetFromOrigin);
  }

  void _initLineData(DragDownDetails details) {
    Line line = Line(color: lineColor, strokeWidth: strokeWidth);
    paintModel.pushLine(line);
  }

  void _collectPoint(DragUpdateDetails details) {
    paintModel.pushPoint(Point.fromOffset(details.localPosition));
  }

  void _doneALine(DragEndDetails details) {
    paintModel.doneLine();
  }

  void _cancel() {
    paintModel.removeEmpty();
  }

  void _clear() {
    paintModel.clear();
  }

  void _showSettingDialog() {
    showCupertinoModalPopup(
      context: context,
      builder: (ctx) =>
          PaintSettingDialog(
            onLineWidthSelect: _selectWidth,
            onColorSelect: _selectColor,
          ),
    );
  }

  void _selectWidth(double width) {
    strokeWidth = width;
  }

  void _selectColor(Color color) {
    lineColor = color;
  }
}

main() {
  runApp(
    const MaterialApp(
      home: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: WhitePaper(),
      ),
    );
  }
}

typedef ColorSelectCallback = void Function(Color color);

class ColorSelect extends StatefulWidget {
  final List<Color> colors;
  final double radius;
  final ColorSelectCallback onColorSelect;
  final Color defaultColor;
  final Color? currentColor;

  ColorSelect({
    required this.colors,
    this.radius = 25,
    this.defaultColor = Colors.black,
    required this.onColorSelect,
    this.currentColor,
  });

  @override
  State<ColorSelect> createState() => _ColorSelectState();
}

class _ColorSelectState extends State<ColorSelect> {
  int _selectIndex = 0;

  Color get activeColor => widget.colors[_selectIndex];

  @override
  void initState() {
    if (widget.currentColor != null) {
      _selectIndex = widget.colors.indexOf(widget.defaultColor);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 45,
      child: Wrap(
        spacing: 45,
        children: widget.colors
            .map((e) =>
            GestureDetector(
              onTap: () => _doSelectColor(e),
              child: _buildItem(e),
            ))
            .toList(),
      ),
    );
  }

  Widget _buildItem(Color color) =>
      Container(
        width: widget.radius,
        height: widget.radius,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
        ),
      );

  void _doSelectColor(Color e) {
    int index = widget.colors.indexOf(e);
    if (index == _selectIndex) return;
    setState(() {
      _selectIndex = index;
    });
    widget.onColorSelect.call(e);
  }
}

typedef LineWidthCallback = void Function(double width);

class LineWidthSelect extends StatefulWidget {
  final List<double> numbers;
  final double width;
  final LineWidthCallback onLineWidthSelect;
  final double defaultWidth;

  LineWidthSelect({
    required this.numbers,
    this.width = 25,
    this.defaultWidth = 1,
    required this.onLineWidthSelect,
  });

  @override
  _LineWidthSelectState createState() => _LineWidthSelectState();
}

class _LineWidthSelectState extends State<LineWidthSelect> {
  int _selectIndex = 0;

  double get activeWidth => widget.numbers[_selectIndex];

  @override
  void initState() {
    super.initState();
    if (widget.defaultWidth != null) {
      _selectIndex = widget.numbers.indexOf(widget.defaultWidth);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 45,
      child: Wrap(
        spacing: 20,
        alignment: WrapAlignment.center,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: widget.numbers
            .map(
              (e) =>
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () => _doSelectWidth(e),
                child: _buildItem(e),
              ),
        )
            .toList(),
      ),
    );
  }

  Widget _buildItem(double width) =>
      Container(
        alignment: Alignment.center,
        height: widget.width,
        width: widget.width,
        padding: const EdgeInsets.all(5),
        decoration: activeWidth == width
            ? BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.blue),
            borderRadius: BorderRadius.circular(5))
            : null,
        child: Container(
          height: width,
          decoration: const BoxDecoration(
            color: Colors.black,
          ),
        ),
      );

  void _doSelectWidth(double width) {
    int index = widget.numbers.indexOf(width);
    if (index == _selectIndex) return;
    setState(() {
      _selectIndex = index;
    });
    widget.onLineWidthSelect.call(width);
  }
}

const List<Color> _kColorSupport = [
  Colors.black,
  Colors.red,
  Colors.orange,
  Colors.yellow,
  Colors.green,
  Colors.blue,
  Colors.indigo,
  Colors.purple
];

const List<double> _kWidthSupport = [1.0, 3.0, 5.0, 6.0, 8.0, 9.0, 12.0, 15.0];

class PaintSettingDialog extends StatelessWidget {
  final LineWidthCallback onLineWidthSelect;
  final ColorSelectCallback onColorSelect;
  final initColor;
  final initWidth;

  PaintSettingDialog({
    required this.onLineWidthSelect,
    required this.onColorSelect,
    this.initColor = Colors.black,
    this.initWidth = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: Colors.white,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildColorSelect(),
            const Divider(
              height: 1,
            ),
            _buildLineWidthSelect(),
            Container(
              color: const Color(0xffE5E3E4).withOpacity(.3),
              height: 10,
            ),
            _buildCancel(context),
          ],
        ),
      ),
    );
  }

  Widget _buildCancel(BuildContext context) =>
      Material(
        child: InkWell(
          onTap: () => Navigator.of(context).pop(),
          child: Ink(
            width: MediaQuery
                .of(context)
                .size
                .width,
            height: 50,
            color: Colors.white,
            child: const Center(
              child: Text(
                '取消',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      );

  Widget _buildColorSelect() =>
      ColorSelect(
        colors: _kColorSupport,
        onColorSelect: onColorSelect,
      );

  Widget _buildLineWidthSelect() =>
      LineWidthSelect(
        numbers: _kWidthSupport,
        onLineWidthSelect: onLineWidthSelect,
      );
}
