import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety_flutter3/flutter_swiper_null_safety_flutter3.dart';

import '../../../../../core/model/pgc_page_bangumi_model.dart';

class ComicState {
  late List<Module> modules;
  late List<Module> modulesList00;
  late List<Module> modulesList01;
  late List<Module> modulesList02;
  late ScrollController easyRefreshScrollController;
  late ScrollController customScrollController;
  late ScrollController buttonsScrollController;
  late SwiperController swiperController;
  late List<Widget> widgets = [];

  ComicState() {
    modules = [];
    modulesList00 = [];
    modulesList01 = [];
    modulesList02 = [];
    customScrollController = ScrollController();
    easyRefreshScrollController = ScrollController();
    buttonsScrollController = ScrollController();
    swiperController = SwiperController();
  }
}
