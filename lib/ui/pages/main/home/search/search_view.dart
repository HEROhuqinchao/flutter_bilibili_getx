import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'search_logic.dart';

class SearchScreen extends StatefulWidget {
  static const String routeName = "/home/search";

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    final logic = Get.find<SearchLogic>();
    final state = Get.find<SearchLogic>().state;

    return SafeArea(
        child:
    );
  }
}
