import 'package:flutter/cupertino.dart';

class PointDataNotifier extends ChangeNotifier {
  late List<double> dataList;

  PointDataNotifier(this.dataList);

  void push(double data) {
    dataList.add(data);
    notifyListeners();
  }

  void clear() {
    dataList.clear();
    notifyListeners();
  }
}
