import 'package:flutter/material.dart';
import 'package:flutter_floating/floating/assist/floating_slide_type.dart';
import 'package:flutter_floating/floating/floating.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'bilibili_test_state.dart';

class BilibiliTestLogic extends GetxController {
  final BilibiliTestState state = BilibiliTestState();

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void createFloatingView(context) {
    state.floatingOne = state.floatingManager.createFloating(
      "1",
      Floating(
        buildFloating(),
        slideType: FloatingSlideType.onLeftAndTop,
        isShowLog: false,
        slideBottomHeight: 100,
      ),
    );
    state.floatingManager.createFloating("1", state.floatingOne);
    state.floatingOne.open(context);
    Get.back();
  }

  ///构建浮动窗口
  Widget buildFloating() {
    return Container(
      color: Colors.amber,
      width: 200.w,
      height: 200.w,
      child: Text("这是界面B"),
    );
  }
}
