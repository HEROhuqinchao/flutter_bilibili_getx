import 'dart:math';

import 'package:bilibili_getx/core/system/system_preferred_orientations/system_preferred_orientations_util.dart';
import 'package:get/get.dart';
import '../../../../core/channel/channel_util.dart';
import 'flutter_android_state.dart';

class FlutterAndroidLogic extends GetxController {
  final FlutterAndroidState state = FlutterAndroidState();

  @override
  void onReady() {
    SystemPreferredOrientationsUtil.setHorizontal();
    List<Map<String, double>> points = [];
    for (double i = 0; i < 2000; i++) {
      Map<String, double> point = {
        "x": i,
        "y": Random().nextDouble() * 1000.0,
      };
      points.add(point);
    }
    Map<String, dynamic> map = {
      "msg": "图表",
      "data": points,
    };
    ChannelUtil()
        .chart
        ?.invokeMethod("chartData", map.toString())
        .then((value) {
      print(value);
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
