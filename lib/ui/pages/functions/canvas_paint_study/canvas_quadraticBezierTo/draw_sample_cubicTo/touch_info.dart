import 'package:flutter/cupertino.dart';

class TouchInfo extends ChangeNotifier {
  late List<Offset> _points = [];
  int _selectIndex = -1;

  int get selectIndex => _selectIndex;

  List<Offset> get points => _points;

  set selectIndex(int value) {
    if (_selectIndex == value) return;
    _selectIndex = value;
    notifyListeners();
  }

  void addPoint(Offset point) {
    points.add(point);
    notifyListeners();
  }

  void updatePoint(int index, Offset point) {
    points[index] = point;
    notifyListeners();
  }

  void clearSelectedPoint() {
    selectIndex = -1;
    notifyListeners();
  }

  void setPoints(List<Offset> points) {
    _points = points;
    notifyListeners();
  }

  Offset? get selectPoint => _selectIndex == -1 ? null : _points[_selectIndex];
}
