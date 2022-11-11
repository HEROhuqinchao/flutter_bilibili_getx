import 'package:bilibili_getx/ui/pages/functions/animation_compoent/animation_compoent_logic.dart';
import 'package:bilibili_getx/ui/pages/functions/blue_tooth_connection/blue_tooth_connection_logic.dart';
import 'package:bilibili_getx/ui/pages/live_play/live_play_logic.dart';
import 'package:bilibili_getx/ui/pages/main/home/comic/comic_logic.dart';
import 'package:bilibili_getx/ui/pages/video_play/video_play_logic.dart';
import 'package:get/get.dart';

import '../dynamic_circle/dynamic_circle_logic.dart';
import '../functions/qq_share/qq_share_logic.dart';
import '../mall/mall_logic.dart';
import '../mine/mine_logic.dart';
import '../publish/publish_logic.dart';
import '../publish/upload/upload_logic.dart';
import 'home/home_logic.dart';
import 'home/live/live_logic.dart';
import 'home/login/login_logic.dart';
import 'home/recommend/recommend_logic.dart';
import 'home/search/search_logic.dart';
import 'main_logic.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MainLogic());
    Get.lazyPut(() => PublishLogic());
    Get.lazyPut(() => MallLogic());
    Get.lazyPut(() => DynamicCircleLogic());
    Get.lazyPut(() => HomeLogic());
    Get.lazyPut(() => LoginLogic());
    Get.lazyPut(() => MineLogic());
    Get.lazyPut(() => ComicLogic());
    Get.lazyPut(() => RecommendLogic());
    Get.lazyPut(() => LiveLogic());
    Get.lazyPut(() => SearchLogic());
    Get.lazyPut(() => UploadLogic());
    Get.lazyPut(() => VideoPlayLogic());
    Get.lazyPut(() => QqShareLogic());
    Get.lazyPut(() => BlueToothConnectionLogic());
    Get.lazyPut(() => AnimationCompoentLogic());
    Get.lazyPut(() => LivePlayLogic());
  }
}
