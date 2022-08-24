import 'package:flutter/cupertino.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_swiper_null_safety_flutter3/flutter_swiper_null_safety_flutter3.dart';

import '../../../../../core/model/feed_index_model.dart';

class RecommendState {
  late List<Widget> homeRecommendWidgets;
  late ScrollController easyRefreshScrollController;
  late SwiperController swiperController;
  late ScrollController gridViewController;
  late EasyRefreshController easyRefreshController;
  late List<FeedIndexItem> feedIndexItemList;
  RecommendState() {
    homeRecommendWidgets = [];
    easyRefreshController = EasyRefreshController();
    swiperController = SwiperController();
    easyRefreshScrollController = ScrollController();
    gridViewController = ScrollController();
    feedIndexItemList = [];
  }
}
