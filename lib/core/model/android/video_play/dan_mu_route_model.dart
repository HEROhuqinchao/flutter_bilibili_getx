import 'package:flutter/cupertino.dart';

///弹幕轨道模型
class DanMuRouteModel {
  int velocity;
  ScrollController scrollController;
  bool show;

  DanMuRouteModel({
    required this.velocity,
    required this.scrollController,
    required this.show,
  });
}
