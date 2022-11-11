import 'package:bilibili_getx/ui/pages/video_play/bilibili_video_player/bilibili_video_player_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../shared/app_theme.dart';
import 'live_play_logic.dart';

class LivePlayView extends StatelessWidget {
  static String routeName = "/live_play";
  final logic = Get.find<LivePlayLogic>();
  final state = Get.find<LivePlayLogic>().state;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LivePlayLogic>(
      builder: (logic) {
        return Scaffold(
          body: Column(
            children: [
              Container(
                width: 1.sw,
                height: 200.w,
                child:
                    state.isLoading ? CircularProgressIndicator() : Container(),
              ),
              Expanded(
                child: state.isLoading ? Container() : buildDanMuPanel(),
              )
            ],
          ),
        );
      },
    );
  }

  Widget buildDanMuPanel() {
    return WebView(
      backgroundColor: HYAppTheme.norTextColors,
      initialUrl:
          'file:///android_asset/flutter_assets/assets/html/live_dan_mu.html?roomid=${state.roomId}',
      zoomEnabled: false,
      javascriptMode: JavascriptMode.unrestricted,
      onWebViewCreated: (WebViewController webViewController) {
        state.completer.complete(webViewController);
      },
      onProgress: (int progress) {
        print('WebView is loading (progress : $progress%)');
      },
    );
  }
}
