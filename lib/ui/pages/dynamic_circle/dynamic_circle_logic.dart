import 'package:get/get.dart';

import '../../../core/service/request/dynamic_request.dart';
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
      print(value.code);
      update();
    });
    super.onReady();
  }
}
