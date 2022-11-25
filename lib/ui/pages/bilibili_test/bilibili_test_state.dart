import 'package:flutter/animation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_floating/floating/floating.dart';
import 'package:flutter_floating/floating/manager/floating_manager.dart';
import 'package:rive/rive.dart';

class BilibiliTestState {
  ///浮动窗口
  late FloatingManager floatingManager;
  late Floating floatingOne;

  BilibiliTestState() {
    floatingManager = FloatingManager();

  }
}
