import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety_flutter3/flutter_swiper_null_safety_flutter3.dart';

import '../../../../../core/model/pgc_page_bangumi_model.dart';

class ComicState {
  late final List<Module> modules = [];
  late final List<Module> modulesList00 = [];
  late final List<Module> modulesList01 = [];
  late final List<Module> modulesList02 = [];
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
