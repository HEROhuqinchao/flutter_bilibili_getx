import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety_flutter3/flutter_swiper_null_safety_flutter3.dart';

import '../../../../../core/model/android/home/pgc_page_bangumi_model.dart';

class ComicState {
  late ScrollController easyRefreshScrollController;
  late ScrollController customScrollController;
  late ScrollController buttonsScrollController;
  late SwiperController swiperController;
  late List<Widget> widgets = [];

  ComicState() {
    customScrollController = ScrollController();
    easyRefreshScrollController = ScrollController();
    buttonsScrollController = ScrollController();
    swiperController = SwiperController();
  }
}
