import 'dart:async';
import 'package:webview_flutter/webview_flutter.dart';

class LivePlayState {
  ///是否在加载
  late bool isLoading;

  ///房间号码
  late int roomId;
  late String playUrl;

  LivePlayState() {
    isLoading = true;
  }
}
