import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tencent_kit/tencent_kit.dart';

class BilibiliTestState {
  late List<bool> option;
  late bool snapToEnd;
  late bool isFav;

  BilibiliTestState() {
    option = [false, true, false, true, true];
    snapToEnd = true;
    isFav = true;
  }
}