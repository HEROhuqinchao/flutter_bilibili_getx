import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'search_logic.dart';

class SearchScreen extends StatelessWidget {
  static const String routeName = "/search";
  @override
  Widget build(BuildContext context) {
    final logic = Get.find<SearchLogic>();
    final state = Get.find<SearchLogic>().state;

    return Container();
  }
}
