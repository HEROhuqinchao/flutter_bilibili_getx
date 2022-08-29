import 'package:bilibili_getx/ui/widgets/video_play_comments.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../shared/app_theme.dart';
import '../../widgets/video_play_profile.dart';
import 'dan_mu/dan_mu_proto.dart';
import 'video_play_logic.dart';

class VideoPlayScreen extends StatelessWidget {
  static const String routeName = "/video_play";
  final logic = Get.find<VideoPlayLogic>();
  final state = Get.find<VideoPlayLogic>().state;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetBuilder<VideoPlayLogic>(builder: (logic) {
        return WillPopScope(
          onWillPop: () {
            logic.disposeVideoPlayerController();
            Get.back();
            return Future.value(false);
          },
          child: DefaultTabController(
            length: state.tabTitle.length,
            initialIndex: 0,
            child: Scaffold(
              body: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  buildVideoPlayVideoPlayer(),
                  buildVideoPlayTabBar(),
                  Expanded(
                    child: buildVideoPlayTabBarView(),
                  )
                ],
              ),
            ),
          ),
        );
      }),
    );
  }

  ///视频和弹幕
  Widget buildVideoPlayVideoPlayer() {
    double width = 1.sw;
    return state.isLoadingAccomplished == true
        ? Container(
            padding: EdgeInsets.zero,
            color: HYAppTheme.norTextColors,
            alignment: Alignment.topCenter,
            height: (width /
                state.chewieController.videoPlayerController.value.aspectRatio) > .9.sw ? .9.sw : (width /
                state.chewieController.videoPlayerController.value.aspectRatio),
            child: Stack(
              children: [
                Chewie(
                  controller: state.chewieController,
                ),

                /// 忽略弹幕的点击事件，将点击传递给视频
                IgnorePointer(
                  child: BuildDanMuProtoScreen(
                    width: width,
                    oid: state.video.playerArgs!.cid!,

                    ///转为多少分钟，整除
                    duration: state.video.playerArgs!.duration! ~/ 60,
                  ),
                )
              ],
            ),
          )
        : Container(
            height: width / 1.77777777777777777,
            color: HYAppTheme.norTextColors,
            child: Center(
              child: SizedBox(
                width: 40.w,
                height: 40.h,
                child: const CircularProgressIndicator(
                  color: HYAppTheme.norMainThemeColors,
                ),
              ),
            ),
          );
  }

  ///视频简介和评论
  PreferredSizeWidget buildVideoPlayTabBar() {
    return PreferredSize(
      ///tab设置底色
      preferredSize: Size.fromHeight(5.h),
      child: Material(
        color: Colors.white,
        child: Container(
          decoration: BoxDecoration(
              border: BorderDirectional(
                  bottom: BorderSide(
                      color: HYAppTheme.norGrayColor.withOpacity(.2)))),
          child: TabBar(
            tabs: state.tabTitle.map((e) {
              if (state.allCount > 0 && e.contains("评论")) {
                return Tab(text: "$e $state.allCount");
              } else {
                return Tab(text: e);
              }
            }).toList(),
            indicatorColor: HYAppTheme.norMainThemeColors,
            unselectedLabelColor: HYAppTheme.unselectedLabelColor,
            labelColor: HYAppTheme.norMainThemeColors,
            indicatorSize: TabBarIndicatorSize.label,
            labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 12.sp),
            unselectedLabelStyle:
                TextStyle(fontWeight: FontWeight.normal, fontSize: 12.sp),
            indicatorWeight: 2.h,
            labelPadding: EdgeInsets.zero,
            indicatorPadding: const EdgeInsets.only(bottom: 6).r,
          ),
        ),
      ),
    );
  }

  ///TabBarView
  Widget buildVideoPlayTabBarView() {
    return TabBarView(
      children: state.tabTitle.map((e) {
        if (e == "简介") {
          return Container(
            child: Text(
              state.video.title!
            ),
          );

          ///视频简介
          return HYVideoPlayProfile(
            video: state.video
          );
        } else {
          if (state.allCount == -1) {
            return const Center(
              child: CircularProgressIndicator(
                color: HYAppTheme.norMainThemeColors,
              ),
            );
          } else {
            ///评论
            return HYVideoPlayComments(
              videoReply: state.videoReply,
              aid: state.video.args!.aid!,
              leftCount: state.leftCount,
            );
          }
        }
      }).toList(),
    );
  }
}
