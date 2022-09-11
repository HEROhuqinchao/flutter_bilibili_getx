import 'package:bilibili_getx/ui/shared/image_asset.dart';
import 'package:bilibili_getx/ui/widgets/fade_image_default.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../core/I18n/str_res_keys.dart';
import '../../../core/model/video_reply_model.dart';
import '../../shared/app_theme.dart';
import '../../shared/math_compute.dart';
import '../../widgets/expanded_widget.dart';
import '../../widgets/primary_scroll_container.dart';
import '../../widgets/video_reply_item.dart';
import 'dan_mu/dan_mu_proto.dart';
import 'video_play_logic.dart';
final logic = Get.find<VideoPlayLogic>();
final state = Get.find<VideoPlayLogic>().state;
class VideoPlayScreen extends StatefulWidget {
  static const String routeName = "/video_play";

  @override
  State<VideoPlayScreen> createState() => _VideoPlayScreenState();
}

class _VideoPlayScreenState extends State<VideoPlayScreen>
    with AutomaticKeepAliveClientMixin, SingleTickerProviderStateMixin {

  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    tabController.addListener(() {
      for (int i = 0; i < state.scrollChildKeys.length; i++) {
        GlobalKey<PrimaryScrollContainerState> key = state.scrollChildKeys[i];
        if (key.currentState != null) {
          key.currentState?.onPageChange(tabController.index == i); //控制是否当前显示
        }
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    tabController.removeListener(() {});
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SafeArea(
      child: GetBuilder<VideoPlayLogic>(builder: (logic) {
        return WillPopScope(
          onWillPop: () {
            Get.back();
            logic.disposeVideoPlayerController();
            return Future.value(true);
          },
          child: DefaultTabController(
            length: 2,
            child: Scaffold(
              body: NestedScrollView(
                controller: state.nestedScrollViewController,
                headerSliverBuilder:
                    (BuildContext context, bool innerBoxIsScrolled) {
                  return [
                    SliverAppBar(
                      // leading: Icon(
                      //   Icons.keyboard_arrow_left,
                      //   size: 25.sp,
                      // ),
                      pinned: true,
                      floating: true,
                      snap: false,
                      actions: [
                        Container(
                          margin: EdgeInsets.only(right: 15.sp),
                          width: 20.sp,
                          height: 20.sp,
                          child: Image.asset(
                            ImageAssets.moreAndroidLightPNG,
                          ),
                        )
                      ],
                      title: Opacity(
                        opacity: 1 - state.showOrHideIconAndTitleOpacity,
                        child: Image.asset(
                          ImageAssets.videoHomePNG,
                          width: 20.sp,
                          height: 20.sp,
                          fit: BoxFit.cover,
                        ),
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
                      ),
                    ),
                    SliverAppBar(
                      leading: null,
                      automaticallyImplyLeading: false,
                      toolbarHeight: 40.w,
                      backgroundColor: HYAppTheme.norWhite01Color,
                      title: buildVideoPlayTabBar(),
                      pinned: true,
                      floating: false,
                      snap: false,
                    ),
                  ];
                },
                body: buildVideoPlayTabBarView(),
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

  ///TabBar
  PreferredSizeWidget buildVideoPlayTabBar() {
    return PreferredSize(
      ///tab设置底色
      preferredSize: Size.fromHeight(15.h),
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
                controller: tabController,
                tabs: [
                  Tab(text: SR.profile.tr),
                  Tab(text: SR.reply.tr),
                ],
                indicatorColor: HYAppTheme.norMainThemeColors,
                unselectedLabelColor: HYAppTheme.unselectedLabelColor,
                labelColor: HYAppTheme.norMainThemeColors,
                indicatorSize: TabBarIndicatorSize.label,
                labelStyle: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 12.sp,
                    fontFamily: 'bilibiliFonts'),
                unselectedLabelStyle: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 12.sp,
                    fontFamily: 'bilibiliFonts'),
                indicatorWeight: 2.h,
                labelPadding: EdgeInsets.zero,
                indicatorPadding: const EdgeInsets.only(bottom: 6).r,
              ),
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.center,
                width: 60.w,
                height: 23.h,
                decoration: BoxDecoration(
                  color: HYAppTheme.norGrayColor.withOpacity(.3),
                  borderRadius:
                      BorderRadius.horizontal(left: Radius.circular(20.r)),
                ),
                child: Text(
                  "点我发弹幕",
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    color: HYAppTheme.norGrayColor,
                    fontSize: 10.sp,
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                width: 30.w,
                height: 23.h,
                decoration: BoxDecoration(
                  color: HYAppTheme.norGrayColor.withOpacity(.2),
                  borderRadius:
                      BorderRadius.horizontal(right: Radius.circular(20.r)),
                ),
                child: Image.asset(
                  ImageAssets.danmuOpenPNG,
                  width: 16.w,
                  height: 16.w,
                  fit: BoxFit.fill,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  ///TabBarView
  Widget buildVideoPlayTabBarView() {
    return TabBarView(
      controller: tabController,
      children: [
        state.isLoadingVideoProfile
            ? const Center(
                child: CircularProgressIndicator(
                  color: HYAppTheme.norMainThemeColors,
                ),
              )
            : buildVideoProfile(),
        state.isLoadingVideoReply
            ? const Center(
                child: CircularProgressIndicator(
                  color: HYAppTheme.norMainThemeColors,
                ),
              )
            : buildVideoPlayComments(),
      ],
    );
  }



  Widget buildVideoPlayComments() {
    return state.allReplies.isEmpty
        ? const Center(
            child: Text("没有评论"),
          )
        : PrimaryScrollContainer(
            key: state.scrollChildKeys[1],
            child: ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 15.r, vertical: 10.r),
              shrinkWrap: true,
              itemBuilder: (ctx, index) {
                if (index == 0) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      buildVideoReplyTitle(),
                      10.verticalSpace,
                      VideoReplyItem(state.allReplies[index])
                    ],
                  );
                }
                return VideoReplyItem(state.allReplies[index]);
              },
              separatorBuilder: (ctx, index) {
                if (index == state.allReplies.length) {
                  return Center(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10)
                          .r,
                      child: Text(
                        "再怎么找也没有啦~",
                        style: TextStyle(
                          color: HYAppTheme.norGrayColor.withOpacity(.5),
                          fontSize: 14.sp,
                        ),
                      ),
                    ),
                  );
                }
                return Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20)
                          .r,
                  child: Divider(
                    color: HYAppTheme.norGrayColor.withOpacity(.5),
                  ),
                );
              },
              itemCount: state.allReplies.length,
            ),
          );
  }

  ///热门评论
  Widget buildVideoReplyTitle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          state.videoReply.cursor.name,
          style: TextStyle(color: HYAppTheme.norTextColors, fontSize: 14.sp),
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              ImageAssets.icFollowDecPNG,
              width: 20.w,
              height: 20.h,
            ),
            Text(
              "按热度",
              style: TextStyle(color: HYAppTheme.norGrayColor, fontSize: 14.sp),
            ),
          ],
        ),
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}

///视频信息
class buildVideoProfile extends StatefulWidget {
  const buildVideoProfile({Key? key}) : super(key: key);

  @override
  State<buildVideoProfile> createState() => _buildVideoProfileState();
}

class _buildVideoProfileState extends State<buildVideoProfile> with AutomaticKeepAliveClientMixin{
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return PrimaryScrollContainer(
      key: state.scrollChildKeys[0],
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.r, vertical: 10.r),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              buildVideoPlayVideoInfoOwnerInfo(
                state.videoProfile.owner!.face!,
                state.videoProfile.owner!.name!,
              ),
              20.verticalSpace,
              buildVideoPlayVideoInfoVideoTitle(),
              8.verticalSpace,
              ExpandedWidget(
                key: state.cutDownWidgetKey,
                defaultHeight: 0,
                child: buildVideoPlayVideoInfoVideoDetails(),
              ),
              30.verticalSpace,
              buildVideoPlayVideoInfoButtonBanner(),
              60.verticalSpace,

              ///推荐视频
              buildVideoRecommendList(),
            ],
          ),
        ),
      ),
    );
  }
  Widget buildVideoPlayVideoInfoOwnerInfo(String ownerIcon, String ownerName) {
    return Row(
      children: [
        buildVideoPlayUserIcon(ownerIcon),
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10).r,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  ownerName,
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    color: HYAppTheme.norMainThemeColors,
                    fontSize: 15.sp,
                  ),
                ),
                3.verticalSpace,
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${changeToWan(state.videoProfile.ownerExt!.fans!)}粉丝",
                      style: TextStyle(
                        color: HYAppTheme.norGrayColor,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    10.horizontalSpace,
                    Text(
                      "${state.videoProfile.videos} 视频",
                      style: TextStyle(
                        color: HYAppTheme.norGrayColor,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.normal,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
        TextButton(
          onPressed: () {},
          style: TextButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 13).r,
              backgroundColor: HYAppTheme.norMainThemeColors,
              textStyle: TextStyle(
                fontSize: 10.sp,
                fontWeight: FontWeight.normal,
                color: HYAppTheme.norWhite01Color,
              )),
          child: Text(
            "+  关注",
            style: TextStyle(
                fontSize: 10.sp,
                fontWeight: FontWeight.normal,
                color: HYAppTheme.norWhite01Color),
          ),
        )
      ],
    );

  }
  ///视频标题
  Widget buildVideoPlayVideoInfoVideoTitle() {
    String endDateText = getPubData(state.videoProfile.pubdate!).toString();
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: state.isExpanded == false
                    ? Text(
                  state.videoProfile.title!,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: HYAppTheme.norTextColors,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.normal,
                  ),
                )
                    : Text(
                  state.videoProfile.title!,
                  style: TextStyle(
                    color: HYAppTheme.norTextColors,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              10.horizontalSpace,
              state.isExpanded == true
                  ? Image.asset(
                ImageAssets.icArrowUpPNG,
                width: 15.sp,
                height: 15.sp,
              )
                  : Image.asset(
                ImageAssets.icArrowDownPNG,
                width: 15.sp,
                height: 15.sp,
              ),
            ],
          ),
          onTap: () {
            logic.expandedVideoProfileDetail();
          },
        ),
        10.verticalSpace,
        Row(
          children: [
            buildIconInfo("assets/image/icon/play_custom02.png",
                changeToWan(state.videoProfile.stat!["view"] ?? 0)),
            10.horizontalSpace,
            buildIconInfo("assets/image/icon/remark_custom02.png",
                changeToWan(state.videoProfile.stat!["danmaku"] ?? 0)),
            10.horizontalSpace,
            Text(
              endDateText.substring(0, endDateText.length - 4),
              style: TextStyle(
                color: HYAppTheme.norGrayColor,
                fontSize: 14.sp,
                fontWeight: FontWeight.normal,
              ),
            )
          ],
        ),
      ],
    );
  }

  ///视频详细信息
  Widget buildVideoPlayVideoInfoVideoDetails() {
    late List<Widget> tagWidgets = [];
    for (var tag in state.videoProfile.tag!) {
      tagWidgets.add(buildVideoTag(tag.tagName));
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              state.videoProfile.bvid!,
              style: TextStyle(color: HYAppTheme.norGrayColor, fontSize: 16.sp),
            ),
            8.horizontalSpace,
            buildIconInfo("assets/image/icon/ban_custom.png", "未经作者授权禁止转载"),
          ],
        ),
        8.verticalSpace,
        Text(
          state.videoProfile.desc!,
          style: TextStyle(color: HYAppTheme.norGrayColor, fontSize: 14.sp),
        ),
        30.verticalSpace,
        Wrap(
          spacing: 10.w,
          runSpacing: 15.h,
          alignment: WrapAlignment.start,
          children: tagWidgets,
        )
      ],
    );
  }

  ///点赞投币收藏按钮
  Widget buildVideoPlayVideoInfoButtonBanner() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        buildVideoPlayIconButton(ImageAssets.likeCustomPNG,
            changeToWan(state.videoProfile.stat!["like"] ?? 0)),
        buildVideoPlayIconButton(ImageAssets.dislikeCustomPNG, "不喜欢"),
        buildVideoPlayIconButton(ImageAssets.coinCustomPNG,
            changeToWan(state.videoProfile.stat!["coin"] ?? 0)),
        buildVideoPlayIconButton(ImageAssets.collectCustomPNG,
            changeToWan(state.videoProfile.stat!["favorite"] ?? 0)),
        buildVideoPlayIconButton(ImageAssets.shareCustomPNG,
            changeToWan(state.videoProfile.stat!["share"] ?? 0)),
      ],
    );
  }

  Widget buildVideoPlayIconButton(String icon, String text) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          icon,
          width: 24.w,
          height: 24.w,
          color: HYAppTheme.norGray03Color,
        ),
        10.verticalSpace,
        Text(
          text,
          style: TextStyle(
            color: HYAppTheme.norGrayColor,
            fontSize: 14.sp,
            fontWeight: FontWeight.normal,
          ),
        )
      ],
    );
  }

  Widget buildVideoTag(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12).r,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50.r),
          color: HYAppTheme.norWhite08Color),
      child: Text(
        text,
        style: TextStyle(
          color: HYAppTheme.norGray02Color,
          fontWeight: FontWeight.normal,
          fontSize: 14.sp,
        ),
      ),
    );
  }

  Widget buildIconInfo(String icon, String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          alignment: Alignment.center,
          height: 16.w,
          width: 16.w,
          child: Image.asset(
            icon,
          ),
        ),
        Container(
          alignment: Alignment.center,
          height: 16.w,
          margin: const EdgeInsets.only(left: 5).r,
          child: Text(
            text,
            style: TextStyle(
              color: HYAppTheme.norGrayColor,
              fontSize: 13.sp,
              fontWeight: FontWeight.normal,
            ),
          ),
        )
      ],
    );
  }

  Widget buildVideoPlayUserIcon(String userLogo) {
    return Container(
      alignment: Alignment.centerLeft,
      child: CircleAvatar(
        backgroundImage: NetworkImage(userLogo),
      ),
    );
  }

  ///推荐视频
  Widget buildVideoRecommendList() {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (ctx, index) {
        if (state.videoProfile.relates![index].goto == "av") {
          return SizedBox(
            width: 1.sw,
            height: 80.w,
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(5.r)),
                  child: DefaultFadeImage(
                    imageUrl: state.videoProfile.relates![index].pic!,
                    width: 150.w,
                    height: 80.w,
                    fit: BoxFit.cover,
                  ),
                ),
                10.horizontalSpace,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        state.videoProfile.relates![index].title!,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          color: HYAppTheme.norTextColors,
                          fontSize: 14.sp,
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                            ImageAssets.uperCustomPNG,
                            width: 15.sp,
                            height: 15.sp,
                          ),
                          5.horizontalSpace,
                          Text(
                            state.videoProfile.relates![index].owner.name!,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              color: HYAppTheme.norGrayColor,
                              fontSize: 12.sp,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Image.asset(
                                ImageAssets.iconListPlayerPNG,
                                width: 14.sp,
                                height: 14.sp,
                              ),
                              5.horizontalSpace,
                              Container(
                                height: 14.sp,
                                child: Text(
                                  "${changeToWan(state.videoProfile.relates![index].stat["view"]!)}",
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    color: HYAppTheme.norGrayColor,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ),
                              10.horizontalSpace,
                              Image.asset(
                                ImageAssets.icDanmuGrayPNG,
                                width: 14.sp,
                                height: 14.sp,
                              ),
                              5.horizontalSpace,
                              Container(
                                height: 14.sp,
                                child: Text(
                                  "${state.videoProfile.relates![index].stat["danmaku"]!}",
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    color: HYAppTheme.norGrayColor,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Image.asset(
                            ImageAssets.videoMoreCustomPNG,
                            width: 14.sp,
                            height: 14.sp,
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        } else {
          return SizedBox(
            width: 1.sw,
            height: 80.w,
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(5.r)),
                  child: DefaultFadeImage(
                    imageUrl: state.videoProfile.relates![index].cover!,
                    width: 150.w,
                    height: 80.w,
                    fit: BoxFit.cover,
                  ),
                ),
                10.horizontalSpace,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        state.videoProfile.relates![index].title!,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          color: HYAppTheme.norTextColors,
                          fontSize: 14.sp,
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                            ImageAssets.uperCustomPNG,
                            width: 15.sp,
                            height: 15.sp,
                          ),
                          5.horizontalSpace,
                          Text(
                            state.videoProfile.relates![index].desc!,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              color: HYAppTheme.norGrayColor,
                              fontSize: 12.sp,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        }
      },
      separatorBuilder: (ctx, index) {
        return Container(
          padding: EdgeInsets.only(left: 8.r),
          child: Divider(
            color: HYAppTheme.norGrayColor.withOpacity(.2),
            thickness: .5.w,
          ),
        );
      },
      itemCount: state.videoProfile.relates!.length,
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}

