import 'package:bilibili_getx/ui/pages/functions/gesture_study/part004/point.dart';
import 'package:flutter/material.dart';

import 'line.dart';

/// 绘制数据的整合类
class PaintModel extends ChangeNotifier {
  List<Line> _lines = [];
  Matrix4 _matrix = Matrix4.identity();

  List<Line> get lines => _lines;

  Matrix4 get matrix => _matrix;

  set matrix(Matrix4 value) {
    _matrix = value;
    notifyListeners();
  }

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
    List<Line> lines = _lines.where((element) {
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
