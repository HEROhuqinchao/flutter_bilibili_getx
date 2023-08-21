import 'package:flutter/cupertino.dart';

class ViewSizeChangeNotifier extends ChangeNotifier {
  ///外部容器大小
  late Size outerSize;

  ///容器内child大小
  late Size childSize;

  ///拖动位移
  late double panX = 0;

  ///放缩大小
  late double scale = 1;

  ///平移量
  late Offset move = Offset.zero;

  late double minX;

  late double maxX;

  set setOuterSize(Size value) {
    outerSize = value;
  }

  set setScale(double value) {
    scale = value;
  }

  set setChildSize(Size size) {
    childSize = size;
  }

  set setMove(Offset offset) {
    move = offset;
  }

  set setPanX(double value) {
    panX = value;
  }

  ///计算可以移动的范围
  bool decideIfPan() {
    final double computedWidth = childSize.width * scale;
    final double screenWidth = outerSize.width;

    ///子宽度小于父容器
    if (computedWidth < screenWidth) {
      return false;
    }

    ///范围计算，比较当前移动的距离
    final double widthDiff = computedWidth - screenWidth;
    minX = widthDiff * -1;
    maxX = widthDiff;
    double tryToMove = panX;
    tryToMove = tryToMove + move.dx;
    if (tryToMove >= minX && tryToMove <= maxX) {
      panX = panX + move.dx;
      return true;
    } else {
      return false;
    }
  }
}
