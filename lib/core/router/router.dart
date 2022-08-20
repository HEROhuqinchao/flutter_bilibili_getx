import 'package:bilibili_getx/ui/pages/comic/comic_binding.dart';
import 'package:bilibili_getx/ui/pages/comic/comic_view.dart';
import 'package:bilibili_getx/ui/pages/dynamic_circle/dynamic_circle_binding.dart';
import 'package:bilibili_getx/ui/pages/home/home_binding.dart';
import 'package:bilibili_getx/ui/pages/home/home_view.dart';
import 'package:bilibili_getx/ui/pages/live/live_binding.dart';
import 'package:bilibili_getx/ui/pages/live/live_view.dart';
import 'package:bilibili_getx/ui/pages/login/login_binding.dart';
import 'package:bilibili_getx/ui/pages/login/login_view.dart';
import 'package:bilibili_getx/ui/pages/mall/mall_binding.dart';
import 'package:bilibili_getx/ui/pages/mall/mall_view.dart';
import 'package:bilibili_getx/ui/pages/mine/mine_binding.dart';
import 'package:bilibili_getx/ui/pages/mine/mine_view.dart';
import 'package:bilibili_getx/ui/pages/publish/publish_binding.dart';
import 'package:bilibili_getx/ui/pages/publish/publish_view.dart';
import 'package:bilibili_getx/ui/pages/recommend/recommend_binding.dart';
import 'package:bilibili_getx/ui/pages/recommend/recommend_view.dart';
import 'package:bilibili_getx/ui/pages/scan_login/scan_login_binding.dart';
import 'package:bilibili_getx/ui/pages/scan_login/scan_login_view.dart';
import 'package:bilibili_getx/ui/pages/search/search_binding.dart';
import 'package:bilibili_getx/ui/pages/search/search_view.dart';
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
      ],
    ),

    ///发布界面
    GetPage(
      name: PublishScreen.routeName,
      page: () => PublishScreen(),
      binding: PublishBinding()
    ),

    ///会员购界面
    GetPage(
      name: MallScreen.routeName,
      page: () => MallScreen(),
      binding: MallBinding()
    ),

    ///动态界面
    GetPage(
      name: DynamicCircleScreen.routeName,
      page: () => DynamicCircleScreen(),
      binding: DynamicCircleBinding()
    ),

    ///动画界面
    GetPage(name: ComicScreen.routeName, page: () => ComicScreen(), binding: ComicBinding()),

    ///直播界面
    GetPage(
        name: LiveScreen.routeName,
        page: () => LiveScreen(),
        binding: LiveBinding()),

    ///登录界面
    GetPage(name: LoginScreen.routeName, page: () => LoginScreen(), binding: LoginBinding()),

    ///推荐界面
    GetPage(name: RecommendScreen.routeName, page: () => RecommendScreen()),

    ///搜索界面
    GetPage(name: SearchScreen.routeName, page: () => SearchScreen(), binding: SearchBinding()),

    ///扫描登录
    GetPage(name: ScanLoginScreen.routeName, page: () => ScanLoginScreen(), binding: ScanLoginBinding()),
  ];
}
