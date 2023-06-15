import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'wechat_explore_logic.dart';

class WechatExploreView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final logic = Get.put(WechatExploreLogic());
    final state = Get.find<WechatExploreLogic>().state;

    return Container();
  }
}
