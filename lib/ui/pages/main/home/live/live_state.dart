import 'package:bilibili_getx/ui/pages/main/home/live/live_view.dart';
import 'package:flutter/cupertino.dart';

import '../../../../../core/model/xliveAppInterfaceV2IndexFeedModel.dart';

class LiveState {
  ///数据列表
  late List<CardList> cardList;
  late bool isLoadingLiveData;
  late double liveTabBarHeightY;
  late GlobalKey liveTabBarGlobalKey;
  late CardData cardDataBannerV1;
  late CardData cardDataAreaEntranceV3;
  // late CardData cardDataActivityCardV1;
  late List<CardData> cardDataSmallCardV1;
  late ScrollController customScrollViewScrollController;
  LiveState() {
    isLoadingLiveData = true;
    liveTabBarGlobalKey = GlobalKey<LiveScreenState>();
    cardDataSmallCardV1 = [];
    customScrollViewScrollController = ScrollController();
  }
}
