import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'scan_login_logic.dart';

class ScanLoginScreen extends StatelessWidget {
  static const String routeName = "/scan_login";
  @override
  Widget build(BuildContext context) {
    final logic = Get.find<ScanLoginLogic>();
    final state = Get.find<ScanLoginLogic>().state;

    return Container();
  }
}
