import 'package:bilibili_getx/ui/pages/dynamic_circle/dynamic_circle_binding.dart';
import 'package:bilibili_getx/ui/pages/home/home_binding.dart';
import 'package:bilibili_getx/ui/pages/home/home_view.dart';
import 'package:bilibili_getx/ui/pages/mall/mall_binding.dart';
import 'package:bilibili_getx/ui/pages/mall/mall_view.dart';
import 'package:bilibili_getx/ui/pages/mine/mine_binding.dart';
import 'package:bilibili_getx/ui/pages/mine/mine_view.dart';
import 'package:bilibili_getx/ui/pages/publish/publish_binding.dart';
import 'package:bilibili_getx/ui/pages/publish/publish_view.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import '../../ui/pages/dynamic_circle/dynamic_circle_view.dart';
import '../../ui/pages/main/main_binding.dart';
import '../../ui/pages/main/main_view.dart';

class AsRouter {
  static const String initialRoute = MainScreen.routeName;
  static List<GetPage> getPages = [
    ///起始路由
    GetPage(
      name: MainScreen.routeName,
      page: () => MainScreen(),
      bindings: [
        MainBinding(),
        PublishBinding(),
        MallBinding(),
        DynamicCircleBinding(),
        HomeBinding(),
        MineBinding(),
      ],
    ),

    ///发布界面
    GetPage(
      name: PublishScreen.routeName,
      page: () => PublishScreen(),
    ),

    ///会员购界面
    GetPage(
      name: MallScreen.routeName,
      page: () => MallScreen(),
    ),

    ///动态界面
    GetPage(
      name: DynamicCircleScreen.routeName,
      page: () => DynamicCircleScreen(),
    ),
    GetPage(
      name: HomeScreen.routeName,
      page: () => HomeScreen(),
    ),
  ];
}
