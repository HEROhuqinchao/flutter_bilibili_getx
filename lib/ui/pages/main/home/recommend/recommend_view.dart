import 'package:bilibili_getx/ui/shared/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'recommend_logic.dart';

class RecommendScreen extends StatelessWidget {
  static const String routeName = "/recommend";

  @override
  Widget build(BuildContext context) {
    final logic = Get.find<RecommendLogic>();
    final state = Get.find<RecommendLogic>().state;

    return Column(
      children: [
        Container(
          child: Text("测试测试", style: TextStyle(fontSize: HYAppTheme.normalFontSize),),
        ),
        Container(
          child: Text("测试测试", style: TextStyle(fontSize: 20),),
        ),
      ],
    );
  }
}
