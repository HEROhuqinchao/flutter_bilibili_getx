import 'package:bilibili_getx/core/service/request/video_play_request.dart';
import 'package:bilibili_getx/core/service/utils/constant.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:bilibili_getx/ui/pages/video_play/video_play_state.dart';
import '../../shared/params_sign.dart';

class VideoPlayLogic extends GetxController {
  final VideoPlayState state = VideoPlayState();

  @override
  void onReady() {
    ///控制显示或者隐藏
    state.nestedScrollViewController.addListener(() {
      if (state.nestedScrollViewController.offset > 140.w &&
          !state.nestedScrollViewController.position.outOfRange &&
          state.showOrHideIconAndTitleOpacity != 1) {
        state.showOrHideIconAndTitleOpacity = 1;
        update();
      }
      if (state.nestedScrollViewController.offset < 140.w &&
          !state.nestedScrollViewController.position.outOfRange &&
          state.showOrHideIconAndTitleOpacity != 0) {
        state.showOrHideIconAndTitleOpacity = 0;
        update();
      }
    });
    super.onReady();
  }


  ///销毁控件，取消监听
  @override
  void onClose() {
    disposeVideoPlayerController();
    super.onClose();
  }

  ///获取视频数据
  void fetchVideoView(aid) {
    Map<String, dynamic> params = {
      'aid': aid,
      'appkey': Constant.appKey,
      'build': '5480400',
      'ts': '1662682722783',
    };

    ///加上sign字段
    final signEntry = <String, dynamic>{'sign': ParamsSign.getSign(params)};
    params.addEntries(signEntry.entries);

    HYVideoRequest.getVideoView(params).then((value) {
      state.videoProfile = value.data;
      state.isLoadingVideoProfile = false;
      update();
    });
  }

  ///销毁视频的控件
  void disposeVideoPlayerController() {
    state.nestedScrollViewController.removeListener(() {});
    state.nestedScrollViewController.dispose();
  }

  ///获取视频回复的评论
  void fetchVideoReply(aid) {
    HYVideoRequest.getVideoReply(aid, 1, 1).then((value) {
      state.videoReply = value;
      state.allReplies.addAll(value.replies);
      state.isLoadingVideoReply = false;
      update();
    });
  }

  ///展开明细或隐藏视频的明细
  void expandedVideoProfileDetail() {
    state.isExpanded = !state.isExpanded;
    state.cutDownWidgetKey.currentState?.widgetShift();
    update();
  }

  void disposeController() {
    state.hideTimer.cancel();
    state.initTimer.cancel();
    state.showAfterExpandCollapseTimer.cancel();
  }
}
