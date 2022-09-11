import 'package:bilibili_getx/ui/pages/main/home/live/live_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/model/xliveAppInterfaceV2IndexFeedModel.dart';

class LiveState {
  ///数据列表
  late List<CardList> cardList;
  late bool isLoadingLiveData;
  late CardData cardDataBannerV1;
  late CardData cardDataAreaEntranceV3;
  late List<CardData> cardDataSmallCardV1;
  late double headerHeight;
  late bool isAutoPlay;
  late ScrollController customScrollViewScrollController;
  LiveState() {
    isLoadingLiveData = true;
    cardDataSmallCardV1 = [];
    headerHeight = 120.w;
    isAutoPlay = true;
    customScrollViewScrollController = ScrollController();
  }
}
