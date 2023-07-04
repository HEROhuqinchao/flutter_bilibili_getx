// 组件的定义
import 'package:bilibili_getx/ui/pages/functions/gesture_study/part004/paint_model.dart';
import 'package:bilibili_getx/ui/pages/functions/gesture_study/part004/paper_painter.dart';
import 'package:bilibili_getx/ui/pages/functions/gesture_study/part004/point.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'line.dart';

class WhitePaper extends StatefulWidget {
  const WhitePaper({super.key});

  @override
  State<WhitePaper> createState() => _WhitePaperState();
}

class _WhitePaperState extends State<WhitePaper> {
  final PaintModel paintModel = PaintModel();
  Color lineColor = Colors.black;
  double strokeWidth = 1;
  ValueNotifier<TransformType> type =
      ValueNotifier<TransformType>(TransformType.none);
  Matrix4 recodeMatrix = Matrix4.identity();
  static const List<IconData> icons = [
    Icons.edit,
    Icons.api,
    Icons.rotate_90_degrees_ccw_sharp,
    Icons.expand,
  ];
  late Offset _offset;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onScaleStart: _onScaleStart,
          onScaleUpdate: _onScaleUpdate,
          // onPanDown: _initLineData,
          // onPanUpdate: _collectPoint,
          // onPanEnd: _doneALine,
          // onPanCancel: _cancel,
          onDoubleTap: _showSettingDialog,
          // onDoubleTap: _clear,
          onLongPressStart: _activeEdit,
          onLongPressUp: _cancelEdit,
          onLongPressMoveUpdate: _moveEdit,
          // onLongPress: _showSettingDialog,
          child: CustomPaint(
            size: MediaQuery.of(context).size,
            painter: PaperPainter(model: paintModel),
          ),
        ),
        _buildTools(),
      ],
    );
  }

  void _onScaleStart(ScaleStartDetails details) {
    switch (type.value) {
      case TransformType.none:
        Line line = Line(color: lineColor, strokeWidth: strokeWidth);
        paintModel.pushLine(line);
        break;
      case TransformType.translate:
        if (details.pointerCount == 1) {
          _offset = details.focalPoint;
        }
        break;
      case TransformType.rotate:
        break;
      case TransformType.scale:
        break;
    }
  }

  void _onScaleUpdate(ScaleUpdateDetails details) {
    switch (type.value) {
      case TransformType.none:
        paintModel.pushPoint(Point.fromOffset(details.localFocalPoint));
        break;
      case TransformType.translate:
        paintModel.matrix = Matrix4.translationValues(
          details.focalPoint.dx - _offset.dx,
          details.focalPoint.dx - _offset.dx,
          details.focalPoint.dx - _offset.dy,
        ).multiplied(recodeMatrix);
        break;
      case TransformType.rotate:
        paintModel.matrix = recodeMatrix.multiplied(
          Matrix4.rotationZ(details.rotation),
        );
        break;
      case TransformType.scale:
        if (details.scale == 1.0) {
          return;
        }
        paintModel.matrix = recodeMatrix.multiplied(
          Matrix4.diagonal3Values(details.scale, details.scale, 1),
        );
    }
  }

  void _onScaleEnd(ScaleEndDetails details) {
    switch (type.value) {
      case TransformType.none:
        paintModel.doneLine();
        paintModel.removeEmpty();
        break;
      case TransformType.translate:
      case TransformType.rotate:
      case TransformType.scale:
        recodeMatrix = paintModel.matrix;
        break;
    }
  }

  Widget _buildTools() {
    return ValueListenableBuilder(
      valueListenable: type,
      builder: (_, value, __) => Row(
        mainAxisSize: MainAxisSize.min,
        children: icons.asMap().keys.map((index) {
          bool active = value == TransformType.values[index];
          return IconButton(
            onPressed: () => type.value = TransformType.values[index],
            icon: Icon(
              icons[index],
              color: active ? Colors.blue : Colors.grey,
            ),
          );
        }).toList(),
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
      builder: (ctx) => PaintSettingDialog(
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

enum TransformType {
  none,
  translate,
  rotate,
  scale,
}
