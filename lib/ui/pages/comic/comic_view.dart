import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'comic_logic.dart';

class ComicScreen extends StatelessWidget {
  static const String routeName = "/comic";

  @override
  Widget build(BuildContext context) {
    final logic = Get.find<ComicLogic>();
    final state = Get.find<ComicLogic>().state;

    return Container();
  }
}
