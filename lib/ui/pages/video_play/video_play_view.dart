import 'package:bilibili_getx/ui/shared/image_asset.dart';
import 'package:bilibili_getx/ui/widgets/video_play_comments.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../shared/app_theme.dart';
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
            Get.back();
            logic.disposeVideoPlayerController();
            return Future.value(true);
          },
          child: Scaffold(
            body: DefaultTabController(
              length: state.tabTitle.length,
              initialIndex: 0,
              child: CustomScrollView(
                controller: state.customScrollController,
                slivers: [
                  SliverAppBar(
                    // backgroundColor: HYAppTheme.norMainThemeColors,
                    leading: Icon(
                      Icons.keyboard_arrow_left,
                      size: 25.sp,
                    ),
                    pinned: true,
                    floating: true,
                    snap: false,
                    actions: [
                      Container(
                        margin: EdgeInsets.only(right: 15.sp),
                        child: Image.asset(
                          ImageAssets.moreAndroidLightPNG,
                        ),
                        width: 20.sp,
                        height: 20.sp,
                      )
                    ],
                    title: Opacity(
                      child: Image.asset(
                        ImageAssets.videoHomePNG,
                        width: 20.sp,
                        height: 20.sp,
                        fit: BoxFit.cover,
                      ),
                      opacity: 1 - state.showOrHideIconAndTitleOpacity,
                    ),
                    expandedHeight: state.expandedHeight,
                    flexibleSpace: FlexibleSpaceBar(
                      title: Opacity(
                        opacity: state.showOrHideIconAndTitleOpacity,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              ImageAssets.playVideoCustomPNG,
                              width: 15.sp,
                              height: 15.sp,
                            ),
                            10.horizontalSpace,
                            Text(
                              "立即播放",
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 15.sp,
                                color: HYAppTheme.norWhite01Color,
                              ),
                            )
                          ],
                        ),
                      ),
                      centerTitle: true,
                      collapseMode: CollapseMode.none,
                      background: buildVideoPlayVideoPlayer(),
                      // stretchModes: [StretchMode.blurBackground],
                    ),
                    // onStretchTrigger: () {
                    //
                    // },
                  ),
                  SliverAppBar(
                    backgroundColor: HYAppTheme.norWhite01Color,
                    title: buildVideoPlayTabBar(),
                    pinned: true,
                    floating: false,
                    snap: false,
                  ),
                  SliverFillRemaining(
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
    return state.isLoadingVideoPlayer == false
        ? Container(
            padding: EdgeInsets.zero,
            color: HYAppTheme.norTextColors,
            alignment: Alignment.topCenter,
            height: (width /
                        state.chewieController.videoPlayerController.value
                            .aspectRatio) >
                    .9.sw
                ? .9.sw
                : (width /
                    state.chewieController.videoPlayerController.value
                        .aspectRatio),
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
            // height: width / 1.77777777777777777,
            color: HYAppTheme.norTextColors,
            child: Center(
              child: SizedBox(
                width: 20.w,
                height: 20.w,
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Material(
            color: HYAppTheme.norWhite01Color,
            child: SizedBox(
              width: .3.sw,
              height: 30.w,
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
                labelStyle:
                    TextStyle(fontWeight: FontWeight.bold, fontSize: 12.sp),
                unselectedLabelStyle:
                    TextStyle(fontWeight: FontWeight.normal, fontSize: 12.sp),
                indicatorWeight: 2.h,
                labelPadding: EdgeInsets.zero,
                indicatorPadding: const EdgeInsets.only(bottom: 6).r,
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            width: 90.w,
            height: 23.w,
            decoration: BoxDecoration(
              border: Border.all(color: HYAppTheme.norGrayColor),
              color: HYAppTheme.norWhite02Color,
              borderRadius: BorderRadius.all(Radius.circular(20.r)),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "点我发弹幕",
                  style: TextStyle(
                    color: HYAppTheme.norGrayColor,
                    fontSize: 10.sp,
                  ),
                ),
                5.horizontalSpace,
                Image.asset(
                  ImageAssets.danmuOpenPNG,
                  width: 16.w,
                  height: 16.w,
                  fit: BoxFit.fill,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget buildVideoPlayTabBarView() {
    return TabBarView(
      children: state.tabTitle.map((e) {
        if (e == "简介") {
          if (state.isLoadingVideoView == false) {
            return buildVideoProfile();
          } else {
            return const Center(
              child: CircularProgressIndicator(
                color: HYAppTheme.norMainThemeColors,
              ),
            );
          }
        } else {
          if (state.isLoadingVideoReply == false) {
            ///评论
            return HYVideoPlayComments(
              videoReply: state.videoReply,
              aid: state.video.args!.aid!,
              leftCount: state.leftCount,
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(
                color: HYAppTheme.norMainThemeColors,
              ),
            );

          }
        }
      }).toList(),
    );
  }

  Widget buildVideoProfile() {
    return Container();
  }
}
