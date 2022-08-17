import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'home_logic.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = "/home";

  @override
  Widget build(BuildContext context) {
    final logic = Get.find<HomeLogic>();
    final state = Get.find<HomeLogic>().state;

    return Center(
      child: Container(
        child: Text("您好",style: TextStyle(fontFamily: 'bilibiliFonts',fontSize: 100.sp),),
      ),
    );
  }
}
