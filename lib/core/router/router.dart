import 'package:bilibili_getx/ui/pages/chat/chat_view.dart';
import 'package:bilibili_getx/ui/pages/dynamic_circle/dynamic_circle_binding.dart';
import 'package:bilibili_getx/ui/pages/main/home/comic/comic_view.dart';
import 'package:bilibili_getx/ui/pages/main/home/recommend/recommend_binding.dart';
import 'package:bilibili_getx/ui/pages/main/home/recommend/recommend_view.dart';
import 'package:bilibili_getx/ui/pages/mall/mall_binding.dart';
import 'package:bilibili_getx/ui/pages/mall/mall_view.dart';
import 'package:bilibili_getx/ui/pages/mine/scan_login/scan_login_binding.dart';
import 'package:bilibili_getx/ui/pages/publish/publish_binding.dart';
import 'package:bilibili_getx/ui/pages/publish/publish_view.dart';
import 'package:bilibili_getx/ui/pages/publish/upload/search_location/search_location_binding.dart';
import 'package:bilibili_getx/ui/pages/publish/upload/search_location/search_location_view.dart';
import 'package:bilibili_getx/ui/pages/video_play/video_play_view.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import '../../ui/pages/dynamic_circle/dynamic_circle_view.dart';
import '../../ui/pages/main/home/comic/comic_binding.dart';
import '../../ui/pages/main/home/live/live_binding.dart';
import '../../ui/pages/main/home/live/live_view.dart';
import '../../ui/pages/main/home/login/login_binding.dart';
import '../../ui/pages/main/home/login/login_view.dart';
import '../../ui/pages/main/home/search/search_binding.dart';
import '../../ui/pages/main/home/search/search_view.dart';
import '../../ui/pages/main/main_binding.dart';
import '../../ui/pages/main/main_view.dart';
import '../../ui/pages/mine/scan_login/scan_login_view.dart';
import '../../ui/pages/publish/upload/bai_du_map_location/bai_du_map_location_binding.dart';
import '../../ui/pages/publish/upload/bai_du_map_location/bai_du_map_location_view.dart';
import '../../ui/pages/publish/upload/pre_edit_video/pre_edit_video_binding.dart';
import '../../ui/pages/publish/upload/pre_edit_video/pre_edit_video_view.dart';
import '../../ui/pages/publish/upload/pre_publish_video/pre_publish_video_binding.dart';
import '../../ui/pages/publish/upload/pre_publish_video/pre_publish_video_view.dart';
import '../../ui/pages/video_play/video_play_binding.dart';

class AsRouter {
  static const String initialRoute = MainScreen.routeName;
  static List<GetPage> getPages = [
    ///起始路由
    GetPage(
      name: MainScreen.routeName,
      page: () => MainScreen(),
      binding: MainBinding(),
    ),

    ///会员购界面
    GetPage(
        name: MallScreen.routeName,
        page: () => MallScreen(),
        binding: MallBinding()),

    ///动态界面
    GetPage(
        name: DynamicCircleScreen.routeName,
        page: () => DynamicCircleScreen(),
        binding: DynamicCircleBinding()),

    ///动画界面
    GetPage(
      name: ComicScreen.routeName,
      page: () => ComicScreen(),
      binding: ComicBinding(),
    ),

    ///直播界面
    GetPage(
        name: LiveScreen.routeName,
        page: () => LiveScreen(),
        binding: LiveBinding()),

    ///登录界面
    GetPage(
        name: LoginScreen.routeName,
        page: () => LoginScreen(),
        binding: LoginBinding()),

    ///推荐界面
    GetPage(
      name: RecommendScreen.routeName,
      page: () => RecommendScreen(),
      binding: RecommendBinding(),
    ),

    ///搜索界面
    GetPage(
        name: SearchScreen.routeName,
        page: () => SearchScreen(),
        binding: SearchBinding()),

    ///扫描登录
    GetPage(
        name: ScanLoginScreen.routeName,
        page: () => ScanLoginScreen(),
        binding: ScanLoginBinding()),

    ///视频播放界面
    GetPage(
        name: VideoPlayScreen.routeName,
        page: () => VideoPlayScreen(),
        binding: VideoPlayBinding()),

    ///会员狗界面
    GetPage(
        name: MallScreen.routeName,
        page: () => MallScreen(),
        binding: MallBinding()),

    ///发布界面
    GetPage(
        name: PublishScreen.routeName,
        page: () => PublishScreen(),
        binding: PublishBinding()),

    ///预编辑界面
    GetPage(
        name: PreEditVideoScreen.routeName,
        page: () => PreEditVideoScreen(),
        binding: PreEditVideoBinding()),

    ///预编辑界面
    GetPage(
        name: PrePublishVideoScreen.routeName,
        page: () => PrePublishVideoScreen(),
        binding: PrePublishVideoBinding()),

    ///百度地图定位界面
    GetPage(
        name: BaiDuMapLocationScreen.routeName,
        page: () => BaiDuMapLocationScreen(),
        binding: BaiDuMapLocationBinding()),

    ///搜索地名
    GetPage(
        name: SearchLocationScreen.routeName,
        page: () => SearchLocationScreen(),
        binding: SearchLocationBinding()),
  ];
}
