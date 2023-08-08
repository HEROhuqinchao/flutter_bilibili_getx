import 'package:flutter/cupertino.dart';

import '../dynamic_circle/dynamic_circle_view.dart';
import '../mall/mall_view.dart';
import '../mine/mine_view.dart';
import '../publish/publish_view.dart';
import 'home/home_view.dart';

class MainState {
  ///当前下标
  late int currentIndex;

  ///主页界面子页面
  late List<Widget> mainIndexStackPages;

  MainState() {
    currentIndex = 0;
    mainIndexStackPages = [
      HomeScreen(),
      DynamicCircleScreen(),
      PublishScreen(),
      MallScreen(),
      MineScreen(),
    ];
  }
}
