import 'package:bilibili_getx/ui/pages/chat/chat_view.dart';
import 'package:bilibili_getx/ui/pages/dynamic_circle/dynamic_circle_binding.dart';
import 'package:bilibili_getx/ui/pages/functions/animation_compoent/animation_compoent_view.dart';
import 'package:bilibili_getx/ui/pages/functions/blue_tooth_connection/blue_tooth_connection_binding.dart';
import 'package:bilibili_getx/ui/pages/functions/blue_tooth_connection/blue_tooth_connection_view.dart';
import 'package:bilibili_getx/ui/pages/functions/blue_tooth_connection/blue_tooth_device_operation/blue_tooth_device_operation_view.dart';
import 'package:bilibili_getx/ui/pages/functions/statistics_chart/statistics_chart_logic.dart';
import 'package:bilibili_getx/ui/pages/functions/video_player_example/video_player_example_view.dart';
import 'package:bilibili_getx/ui/pages/functions/wx_share/wx_share_view.dart';
import 'package:bilibili_getx/ui/pages/live_play/live_play_view.dart';
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

import '../../ui/pages/bilibili_test/bilibili_test_binding.dart';
import '../../ui/pages/bilibili_test/bilibili_test_view.dart';
import '../../ui/pages/dynamic_circle/dynamic_circle_view.dart';
import '../../ui/pages/functions/animation_compoent/animation_compoent_binding.dart';
import '../../ui/pages/functions/blue_tooth_connection/blue_tooth_device_operation/blue_tooth_device_operation_binding.dart';
import '../../ui/pages/functions/canvas_paint_study/canvas_paint_study_binding.dart';
import '../../ui/pages/functions/canvas_paint_study/canvas_paint_study_view.dart';
import '../../ui/pages/functions/download_file/download_file_binding.dart';
import '../../ui/pages/functions/download_file/download_file_view.dart';
import '../../ui/pages/functions/mini_window/mini_window_binding.dart';
import '../../ui/pages/functions/mini_window/mini_window_view.dart';
import '../../ui/pages/functions/push_message/push_message_binding.dart';
import '../../ui/pages/functions/push_message/push_message_view.dart';
import '../../ui/pages/functions/qq_share/qq_share_binding.dart';
import '../../ui/pages/functions/qq_share/qq_share_view.dart';
import '../../ui/pages/functions/statistics_chart/statistics_chart_binding.dart';
import '../../ui/pages/functions/statistics_chart/statistics_chart_view.dart';
import '../../ui/pages/functions/video_player_example/video_player_example_binding.dart';
import '../../ui/pages/functions/wx_share/wx_share_binding.dart';
import '../../ui/pages/live_play/live_play_binding.dart';
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
    ///????????????
    GetPage(
      name: MainScreen.routeName,
      page: () => MainScreen(),
      binding: MainBinding(),
    ),

    ///???????????????
    GetPage(
        name: MallScreen.routeName,
        page: () => MallScreen(),
        binding: MallBinding()),

    ///????????????
    GetPage(
        name: DynamicCircleScreen.routeName,
        page: () => DynamicCircleScreen(),
        binding: DynamicCircleBinding()),

    ///????????????
    GetPage(
      name: ComicScreen.routeName,
      page: () => ComicScreen(),
      binding: ComicBinding(),
    ),

    ///????????????
    GetPage(
        name: LiveScreen.routeName,
        page: () => LiveScreen(),
        binding: LiveBinding()),

    ///????????????
    GetPage(
        name: LoginScreen.routeName,
        page: () => LoginScreen(),
        binding: LoginBinding()),

    ///????????????
    GetPage(
      name: RecommendScreen.routeName,
      page: () => RecommendScreen(),
      binding: RecommendBinding(),
    ),

    ///????????????
    GetPage(
        name: SearchScreen.routeName,
        page: () => SearchScreen(),
        binding: SearchBinding()),

    ///????????????
    GetPage(
        name: ScanLoginScreen.routeName,
        page: () => ScanLoginScreen(),
        binding: ScanLoginBinding()),

    ///??????????????????
    GetPage(
        name: VideoPlayScreen.routeName,
        page: () => VideoPlayScreen(),
        binding: VideoPlayBinding()),

    ///???????????????
    GetPage(
        name: MallScreen.routeName,
        page: () => MallScreen(),
        binding: MallBinding()),

    ///????????????
    GetPage(
        name: PublishScreen.routeName,
        page: () => PublishScreen(),
        binding: PublishBinding()),

    ///???????????????
    GetPage(
        name: PreEditVideoScreen.routeName,
        page: () => PreEditVideoScreen(),
        binding: PreEditVideoBinding()),

    ///???????????????
    GetPage(
        name: PrePublishVideoScreen.routeName,
        page: () => PrePublishVideoScreen(),
        binding: PrePublishVideoBinding()),

    ///????????????????????????
    GetPage(
        name: BaiDuMapLocationScreen.routeName,
        page: () => BaiDuMapLocationScreen(),
        binding: BaiDuMapLocationBinding()),

    ///????????????
    GetPage(
        name: SearchLocationScreen.routeName,
        page: () => SearchLocationScreen(),
        binding: SearchLocationBinding()),

    ///????????????
    GetPage(
        name: PushMessageScreen.routeName,
        page: () => PushMessageScreen(),
        binding: PushMessageBinding()),

    ///????????????
    GetPage(
        name: BilibiliTestScreen.routeName,
        page: () => BilibiliTestScreen(),
        binding: BilibiliTestBinding()),

    ///QQ??????
    GetPage(
        name: QqShareView.routeName,
        page: () => QqShareView(),
        binding: QqShareBinding()),

    ///rive lottie ????????????
    GetPage(
        name: AnimationCompoentView.routeName,
        page: () => AnimationCompoentView(),
        binding: AnimationCompoentBinding()),

    ///??????
    GetPage(
        name: BlueToothConnectionView.routeName,
        page: () => BlueToothConnectionView(),
        binding: BlueToothConnectionBinding()),

    ///????????????
    GetPage(
        name: StatisticsChartView.routeName,
        page: () => StatisticsChartView(),
        binding: StatisticsChartBinding()),

    ///??????????????????
    GetPage(
        name: BlueToothDeviceOperationView.routeName,
        page: () => BlueToothDeviceOperationView(),
        binding: BlueToothDeviceOperationBinding()),

    ///?????????
    GetPage(
        name: LivePlayView.routeName,
        page: () => LivePlayView(),
        binding: LivePlayBinding()),

    ///????????????
    GetPage(
        name: WxShareView.routeName,
        page: () => WxShareView(),
        binding: WxShareBinding()),

    ///???????????????
    GetPage(
        name: MiniWindowView.routeName,
        page: () => MiniWindowView(),
        binding: MiniWindowBinding()),

    ///??????????????????????????????
    GetPage(
        name: VideoPlayerExampleView.routeName,
        page: () => VideoPlayerExampleView(),
        binding: VideoPlayerExampleBinding()),

    ///??????
    GetPage(
        name: CanvasPaintStudyView.routeName,
        page: () => CanvasPaintStudyView(),
        binding: CanvasPaintStudyBinding()),

    ///??????APP & ??????
    GetPage(
        name: DownloadFileView.routeName,
        page: () => DownloadFileView(),
        binding: DownloadFileBinding()),
  ];
}
