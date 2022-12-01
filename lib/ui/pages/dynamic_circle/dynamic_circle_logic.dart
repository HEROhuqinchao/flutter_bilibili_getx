import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../core/service/request/dynamic_request.dart';
import '../../widgets/expanded_widget.dart';
import 'dynamic_circle_state.dart';

class DynamicCircleLogic extends GetxController {
  final DynamicCircleState state = DynamicCircleState();

  @override
  void onReady() {
    Map<String, dynamic> params = {
      'timezone_offset': '-480',
      'type': 'all',
      'offset': '',
      'page': '1'
    };
    DynamicRequest.getWebDynamicV1FeedAll(params).then((value) {
      state.dynamicV1FeedAllData = value;
      state.isLoading = false;
      // for (var i = 0; i < value.data!.items.length; i++) {
        // state.keys.add(GlobalKey<ExpandedWidgetState>());
        // state.expandedList.add(false);
      // }
      update();
    });
    super.onReady();
  }

  // void expandText(int index) {
    // state.expandedList[index] = !state.expandedList[index];
    // state.keys[index].currentState!.widgetShift();
    // update();
  // }
}
