import 'package:bilibili_getx/ui/pages/functions/gesture_study/part004/paint_model.dart';
import 'package:flutter/material.dart';

// 画板定义
class PaperPainter extends CustomPainter {
  final PaintModel model;

  PaperPainter({required this.model}) : super(repaint: model);
  final Paint _paint = Paint();

  @override
  void paint(Canvas canvas, Size size) {
    final Matrix4 result = Matrix4.identity();
    result.translate(size.width / 2, size.height / 2);
    result.multiply(model.matrix);
    result.translate(-size.width / 2, -size.height / 2);
    canvas.transform(result.storage);
    model.lines.forEach((line) => line.paint(canvas, _paint));
  }

  @override
  bool shouldRepaint(covariant PaperPainter oldDelegate) {
    return oldDelegate.model != model;
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
            .map((e) => GestureDetector(
                  onTap: () => _doSelectColor(e),
                  child: _buildItem(e),
                ))
            .toList(),
      ),
    );
  }

  Widget _buildItem(Color color) => Container(
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
    _selectIndex = widget.numbers.indexOf(widget.defaultWidth);
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
              (e) => GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () => _doSelectWidth(e),
                child: _buildItem(e),
              ),
            )
            .toList(),
      ),
    );
  }

  Widget _buildItem(double width) => Container(
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
  final Color initColor;
  final int initWidth;

  const PaintSettingDialog({
    super.key,
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

  Widget _buildCancel(BuildContext context) => Material(
        child: InkWell(
          onTap: () => Navigator.of(context).pop(),
          child: Ink(
            width: MediaQuery.of(context).size.width,
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

  Widget _buildColorSelect() => ColorSelect(
        colors: _kColorSupport,
        onColorSelect: onColorSelect,
      );

  Widget _buildLineWidthSelect() => LineWidthSelect(
        numbers: _kWidthSupport,
        onLineWidthSelect: onLineWidthSelect,
      );
}
