import 'package:bilibili_getx/core/system/system_preferred_orientations/system_preferred_orientations_util.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'flutter_android_logic.dart';

///显示Android原生界面（这里显示显示MPAndroidChart图表）
///在缩放的流畅度中，MPAndroidChart图表效果比flutter插件要好。特别是点数特别多的时候，flutter插件卡顿尤为明显
class FlutterAndroidView extends StatelessWidget {
  static String routeName = "/flutter_android";
  final logic = Get.find<FlutterAndroidLogic>();
  final state = Get.find<FlutterAndroidLogic>().state;

  @override
  Widget build(BuildContext context) {
    Widget platformView() {
      if (defaultTargetPlatform == TargetPlatform.android) {
        return const AndroidView(viewType: 'flutter_android_view');
      }
      return const Text("非android平台");
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Android原生"),
      ),
      body: WillPopScope(
        onWillPop: () async {
          SystemPreferredOrientationsUtil.setVertical();
          return true;
        },
        child: platformView(),
      ),
    );
  }
}
