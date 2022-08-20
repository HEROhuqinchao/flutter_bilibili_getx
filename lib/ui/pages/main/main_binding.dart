import 'package:get/get.dart';

import '../comic/comic_logic.dart';
import '../dynamic_circle/dynamic_circle_logic.dart';
import '../home/home_logic.dart';
import '../live/live_logic.dart';
import '../login/login_logic.dart';
import '../mall/mall_logic.dart';
import '../mine/mine_logic.dart';
import '../publish/publish_logic.dart';
import '../recommend/recommend_logic.dart';
import '../search/search_logic.dart';
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
  }
}
