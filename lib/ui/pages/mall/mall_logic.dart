import 'dart:ui';

import 'package:bilibili_getx/core/service/request/mall_request.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'mall_state.dart';

class MallLogic extends GetxController {
  final MallState state = MallState();

  @override
  void onReady() {
    webFetchMallData();
    super.onReady();
  }

  void mouseHoverAction(index) {
    state.backgroundSpreadRadius[index] = 4;
    state.backgroundBlurRadius[index] = 15;
    state.coverBottomGap[index] = 10.r;
    state.backgroundOffset[index] = Offset(-5, 20);
    update();
  }

  void mouseExitAction(index) {
    state.backgroundSpreadRadius[index] = 0;
    state.backgroundBlurRadius[index] = 0;
    state.coverBottomGap[index] = 0.r;
    state.backgroundOffset[index] = Offset(0, 0);
    update();
  }

  ///Android端获取数据
  void androidFetchMallData() {}

  void windowsFetchMallData() {}

  void webFetchMallData() {
    HYMallRequest.fetchWebMallData().then((value) {
      state.total = value.data.total;
      // print(value.data.result?.length);
      state.result = value.data.result!;
      for (int i = 0; i < state.total; i++) {
        state.backgroundSpreadRadius.add(0);
        state.backgroundBlurRadius.add(0);
        state.coverBottomGap.add(0.r);
        state.backgroundOffset.add(Offset(0, 0));
      }
      update();
    });
  }
}
