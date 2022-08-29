import 'package:bilibili_getx/core/service/request/mall_request.dart';
import 'package:get/get.dart';

import 'mall_state.dart';

class MallLogic extends GetxController {
  final MallState state = MallState();

  @override
  void onInit() {
    webFetchMallData();
    super.onInit();
  }

  ///获取数据
  void androidFetchMallData() {}

  void windowsFetchMallData() {}

  void webFetchMallData() {
    HYMallRequest.fetchWebMallData()
        .then((value) => state.ticketProjectListV2Model = value);
  }
}
