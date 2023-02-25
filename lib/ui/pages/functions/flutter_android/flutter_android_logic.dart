import 'dart:math';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../../../core/channel/channel_util.dart';
import 'flutter_android_state.dart';

class FlutterAndroidLogic extends GetxController {
  final FlutterAndroidState state = FlutterAndroidState();

  @override
  void onReady() {
    List<Map<int, double>> points = [];
    for (int i = 0; i < 10000; i++) {
      Map<int, double> point = {
        i: Random().nextDouble() * 1000.0,
      };
      points.add(point);
    }
    Map<String, dynamic> map = {
      "msg": "图表",
      "data": points,
    };
    ChannelUtil.chartChannel.invokeMethod(map.toString()).then((value) {
      state.loading = false;
      update();
    });
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
