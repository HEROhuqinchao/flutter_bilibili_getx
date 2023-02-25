import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'flutter_android_logic.dart';

///显示Android原生界面（这里显示显示MPAndroidChart图表）
///在缩放的流畅度中，MPAndroidChart图表效果比flutter插件要好。特别是点数特别多的时候，flutter插件卡顿尤为明显
class FlutterAndroidView extends StatelessWidget {
  static String routeName = "/flutter_android";
  @override
  Widget build(BuildContext context) {
    final logic = Get.find<FlutterAndroidLogic>();
    final state = Get.find<FlutterAndroidLogic>().state;
    Widget platformView() {
      if(defaultTargetPlatform == TargetPlatform.android) {
        return AndroidView(viewType: 'history_chart_view');
      }
      return Text("非android平台");
    }
    return platformView();
  }
}
