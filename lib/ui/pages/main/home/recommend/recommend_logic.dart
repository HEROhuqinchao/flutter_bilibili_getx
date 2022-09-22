import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:flutter_swiper_null_safety_flutter3/flutter_swiper_null_safety_flutter3.dart';
import 'package:get/get.dart';

import '../../../../../core/model/feed_index_model.dart';
import '../../../../../core/service/request/home_request.dart';
import '../../../../../core/service/request/video_play_request.dart';
import '../../../../../core/service/utils/constant.dart';
import '../../../../../core/shared_preferences/bilibili_shared_preference.dart';
import '../../../../../core/shared_preferences/shared_preference_util.dart';
import '../../../../shared/app_theme.dart';
import '../../../../shared/color_radix_change.dart';
import '../../../../shared/image_asset.dart';
import '../../../../shared/params_sign.dart';
import '../../../../widgets/recommend_item.dart';
import '../../../video_play/bilibili_video_player/bilibili_video_player_logic.dart';
import '../../../video_play/video_play_logic.dart';
import '../../../video_play/video_play_view.dart';
import 'recommend_state.dart';

class RecommendLogic extends GetxController {
  final RecommendState state = RecommendState();

  @override
  void onReady() {
    fetchFeedIndexData();
    super.onReady();
  }
  // @override
  // void onClose() {
  //   state.easyRefreshController.dispose();
  //   state.swiperController.dispose();
  //   state.easyRefreshScrollController.dispose();
  //   state.gridViewController.dispose();
  //   super.onClose();
  // }
  ///初始化界面
  void initHomeRecommendWidgets() {
    ///还没有数据就初始化数据
    if (state.homeRecommendWidgets.isEmpty) {
      if (state.feedIndexItemList.length == 10) {
        ///单纯的十条数据
        state.homeRecommendWidgets
            .add(buildHomeRecommendVideoCards(state.feedIndexItemList));
      } else if (state.feedIndexItemList.length == 11) {
        ///有轮播图的是十一条数据
        state.homeRecommendWidgets.addAll([
          ///前三条视频数据为轮播图数据
          buildHomeRecommendCarousel(state.feedIndexItemList[0].bannerItems!),

          ///后面的数据用于card
          buildHomeRecommendVideoCards(state.feedIndexItemList.sublist(1)),
        ]);
      } else {
        if (Constant.isDebug) {
          // print(state.feedIndexItemList.length);
        }
      }
    }
  }

  ///清空数据
  void clearFeedIndexData() {
    state.feedIndexItemList.clear();
    state.homeRecommendWidgets.clear();
    fetchFeedIndexData();
  }

  ///获取数据
  void fetchFeedIndexData() {
    HYHomeRequest.getFeedIndexData(fetchFeedIndexParamsWithSign())
        .then((value) async {
      state.feedIndexItemList.addAll(value.data.items);
      initHomeRecommendWidgets();
      update();
    });
  }

  ///获取有sign值的参数
  Map<String, dynamic> fetchFeedIndexParamsWithSign() {
    bool isLogin =
        SharedPreferenceUtil.getBool(BilibiliSharedPreference.isLogin) ?? false;
    Map<String, dynamic> params = {
      // 'ad_extra':
      //     '611A2E4B12D98FBF338F2BF6B58C2FBCEE4EF3B5F4163CA3F71C524BD4C28E64E5EF0D9A03448575CD92322023DFD61BD04B1044511D9C95DDA5AEBD99E97AC422A6F04E4C3563B8F4EE54C794BC4DD41CAA06F3417CCEED1BDCB21D9CB8AEFC09CDCD6BC8AE11FE730C70040DBC291FA9996D5FF9DFDD8A32592C9DC1FD0012C462E454346FC6D9803493CD2E6110A78CEB8E44A61C37D7A883513099E8757E8F0B65CBA9AE4982D8A0E3B9AEAB0FCAA623115E2353DE323DD4F227C7A4F65052AB2A165F76E478BA72A469C42459FBA88A778A7FFF23465258B116451B24011E20B8A895EC2A074AE13BA7E4E444842F8F069F2BB6F7DAC03C2B0EFD5E1D845B8ED6B088D879FF5E67FD2A103A145DF91A0211C772669B4BFB17D2977D2BE1244656631B96A9A915631E21549524C4986D7BA84B5B31CAFB2C1994C7DE6D789F9EF059F8DCA4A30E28E427E3F412AE8BF7882A2908ACEB195847672603F90DD1C8C6D1E0FC5EF6C905AB3B7F9E5B260904BBAE6E560EC81913C2606ECE6A70888189CBCDEFD901C9C3FB694455ECE82B6D0E9DDB97C0092131E3A66F85DFB74296BF213260D773ECB93C288EFD43B185A348EA902B8946588B3555CC4331DB8EF2279D7A2A1819BCE53A55E9D1680DEF20CAA3ABE3AFCB33146EB0449BF8B4FE5DF3864B9CB626CC6C809D7F6E888F64B9DF2C672E9C2252BAE088B57B1FD96391CE29550E5D59D3E6410E7160C9220D2A9C1A4F4F47CECF66CF689335EED850F089B8990DEDDCB4F352346A9B8213319E5AB61679F65A75401B7D72A96A182E109DEA531325737993F0BF6B09EE376B1374F44EE191D8CC6C9858BAD6896C0395971D25BB84989A6ABA19E5E1C8ECEA518545F76E0EDFD773BA67CA98208D5BAF3150057461891D56E204C8E7B7237F967BF88ADF0669F136BD818051B0F2DE7140D2A02A4604B8342668BE392889B4539A24CE996FE103A4AB0D3680AA42',
      'appkey': Constant.appKey,
      'autoplay_card': '11',
      'autoplay_timestamp': '0',
      'build': '6720300',
      'c_locale': 'zh_CN',
      'channel': 'html5_search_baidu',
      'column': '2',
      'column_timestamp': '0',
      'device_name': 'MuMu',
      'device_type': '0',
      'disable_rcmd': '0',
      'flush': '0',
      'fnval': '272',
      'fnver': '0',
      'force_host': '0',
      'fourk': '0',
      'guidance': '0',
      'https_url_req': '0',
      'idx': '0',
      'inline_danmu': '2',
      'inline_sound': '1',
      'interest_id': '0',
      'login_event': '1',
      'mobi_app': 'android',
      'network': 'wifi',
      'open_event': 'cold',
      'platform': 'android',
      'player_net': '1',
      'pull': 'true',
      'qn': '32',
      'recsys_mode': '0',
      's_locale': 'zh_CN',
      'splash_id': '',
      'statistics':
          '%7B%22appId%22%3A1%2C%22platform%22%3A3%2C%22version%22%3A%226.72.0%22%2C%22abtest%22%3A%22%22%7D',
      'ts': '1659143497',
      'voice_balance': '1',
    };

    ///如果已经登录，加上access_key字段
    if (isLogin == true) {
      String? accessKey =
          SharedPreferenceUtil.getString(BilibiliSharedPreference.accessToken);
      final accessKeyEntry = <String, dynamic>{'access_key': accessKey!};
      params.addEntries(accessKeyEntry.entries);
    }

    ///加上sign字段
    final signEntry = <String, dynamic>{'sign': ParamsSign.getSign(params)};
    params.addEntries(signEntry.entries);
    return params;
  }

  ///刷新数据(新加入的数据)
  void refreshVideosData(List<FeedIndexItem> items) {
    state.feedIndexItemList = state.feedIndexItemList.reversed.toList();
    state.feedIndexItemList.addAll(items);
    state.feedIndexItemList = state.feedIndexItemList.reversed.toList();
  }

  void refreshRecommendItemData() async {
    HYHomeRequest.getFeedIndexData(
      fetchFeedIndexParamsWithSign(),
    ).then((value) {
      refreshVideosData(value.data.items);
      state.homeRecommendWidgets
          .insert(0, buildHYHomeRefreshItemOneVideo(value.data.items[8]));
      state.homeRecommendWidgets.insert(
          0, buildHomeRecommendVideoCards(value.data.items.sublist(0, 8)));
      Future.delayed(const Duration(seconds: 2), () {
        update();
      });
    });
  }

  ///单视频
  Widget buildHYHomeRefreshItemOneVideo(FeedIndexItem video) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8.r),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8).r,
        height: 200.w,
        width: 1.sw,
        child: FadeInImage(
          fit: BoxFit.fill,
          placeholderFit: BoxFit.fill,
          placeholder: AssetImage(ImageAssets.icUpperVideoDefaultPNG),
          image: NetworkImage(
            video.cover!,
          ),
        ),
      ),
    );
  }

  ///视频列表
  Widget buildHomeRecommendVideoCards(List<FeedIndexItem> items) {
    return GridView.builder(
      primary: false,
      controller: state.gridViewController,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: items.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2
      ),
      itemBuilder: (ctx, index) {
        // print(data[index].aid);
        return buildRecommendItem(items[index]);
        // return Container();
      },
    );
  }

  Widget buildRecommendItem(FeedIndexItem video) {
    return GestureDetector(
      onTap: () {
        if (video.goto == "av") {
          HYVideoRequest.getMp4VideoPlayData(video.args!.aid!)
              .then((value) {
            ///匹配字符串readyVideoUrl: 到readyDuration之间的字符串
            RegExp exp =
            RegExp(r'(?<=(readyVideoUrl: ))[\s\S]*?(?=(readyDuration))');
            print("exp.allMatches(value)---${exp.stringMatch(value)}");
            String videoMp4 = exp.stringMatch(value) ?? "";
            print(
                "videoMp4-----------${videoMp4.substring(0, videoMp4.length)}");
            if (videoMp4.isEmpty) {
              video.videoData =
              "http://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4";
              // "http://61.164.90.254:9000/dm-pls/08388d26a77a413fa8da09837c6df420.mp4";
            } else {
              video.videoData = videoMp4.substring(1, videoMp4.length - 1);
            }

            ///传递数据
            Get.lazyPut(()=>VideoPlayLogic());
            Get.lazyPut(()=>BilibiliVideoPlayerLogic());
            VideoPlayLogic videoPlayLogic = Get.find<VideoPlayLogic>();
            BilibiliVideoPlayerLogic bilibiliVideoPlayerLogic = Get.find<BilibiliVideoPlayerLogic>();

            bilibiliVideoPlayerLogic.initVideoPlayerVideoData();
            bilibiliVideoPlayerLogic.initVideoPlayerDanMuData();
            bilibiliVideoPlayerLogic.initVideoControllerAndDanMuController(video.videoData);
            bilibiliVideoPlayerLogic.fetchDanMu(video.playerArgs!.cid!.toString(), 0);

            videoPlayLogic.initVideoPlayData();
            videoPlayLogic.changeVideoState(false);
            videoPlayLogic.fetchVideoView(video.playerArgs!.aid!.toString());
            videoPlayLogic.fetchVideoReply(video.playerArgs!.aid!.toString());

            ///跳转至播放界面
            Get.toNamed(VideoPlayScreen.routeName);
          });
        } else {
          SmartDialog.showToast("功能暂未完善");
        }
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(5.r),
            topRight: Radius.circular(5.r),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              children: [
                ///视频封面
                buildHomeVideoItemCover(video),

                ///文字下的阴影块
                buildHomeVideoItemShadow(),

                /// 视频封面上的左下区域（如视频的评论数和观看数）
                buildHomeVideoItemLeftZone(video),

                ///视频封面上的右下区域（如视频的时长）
                buildHomeVideoItemRightZone(video)
              ],
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ///标题
                  buildHomeVideoItemTitle(video),

                  ///视频底部的左下区域
                  buildHomeVideoItemFooter(video),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  ///加载数据（上拉动作）
  void loadRecommendItemData() {
    HYHomeRequest.getFeedIndexData(fetchFeedIndexParamsWithSign())
        .then((value) {
      loadMoreVideosData(value.data.items);
      state.homeRecommendWidgets
          .add(buildHYHomeRefreshItemOneVideo(value.data.items[8]));
      state.homeRecommendWidgets
          .add(buildHomeRecommendVideoCards(value.data.items.sublist(0, 8)));
      update();
    });
  }

  ///加载视频(新加入的数据)
  void loadMoreVideosData(List<FeedIndexItem> items) {
    state.feedIndexItemList.addAll(items);
    update();
  }

  ///轮播图
  Widget buildHomeRecommendCarousel(List<BannerItem> bannerItems) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8.r),
      child: Container(
        margin: const EdgeInsets.only(bottom: 8).r,
        width: 1.sw,
        height: 200.w, //这里的轮播图组件必须包裹在有高度的控件或者设置比例
        child: Swiper(
          controller: state.swiperController,
          scale: 1,
          viewportFraction: 1,
          itemBuilder: (ctx, index) {
            return Stack(
              children: [
                SizedBox(
                  height: 200.w,
                  width: 1.sw,
                  child: FadeInImage(
                    fit: BoxFit.cover,
                    placeholderFit: BoxFit.cover,
                    placeholder: AssetImage(ImageAssets.icUpperVideoDefaultPNG),
                    image: NetworkImage(bannerItems[index].staticBanner!.image!),
                  ),
                ),
                Positioned(
                  left: 10.r,
                  bottom: 10.r,
                  child: Text(
                    bannerItems[index].staticBanner!.title!,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.normal,
                      fontSize: 12.sp,
                    ),
                  ),
                )
              ],
            );
          },
          itemCount: bannerItems.length,
          indicatorLayout: PageIndicatorLayout.SCALE,
          autoplayDelay: 3000,
          pagination: SwiperPagination(
              alignment: Alignment.bottomRight,
              margin:
                  const EdgeInsets.only(left: 0, right: 8, bottom: 8, top: 0)
                      .r),
          fade: 1.0,
          autoplay: true,
          scrollDirection: Axis.horizontal,
        ),
      ),
    );
  }

  ///更多按钮
  Widget buildHomeVideoMoreIcon() {
    return Image.asset(
      ImageAssets.videoMoreCustomPNG,
      width: 14.sp,
      height: 14.sp,
    );
  }

  ///视频封面
  Widget buildHomeVideoItemCover(FeedIndexItem video) {
    if (video.cardType == "cm_v2") {
      ///广告类型的数据
      return ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(5.r),
          topRight: Radius.circular(5.r),
        ),
        child: SizedBox(
          width: 180.w,
          height: 100.w,
          child: FadeInImage(
            imageErrorBuilder: (ctx, error, stackTrace) {
              return Container(
                child: Text("加载中"),
              );
            },
            placeholder: AssetImage(ImageAssets.icUpperVideoDefaultPNG),
            image: NetworkImage(
              video.adInfo!.creativeContent!.imageUrl!,
            ),
            fit: BoxFit.fill,
            placeholderFit: BoxFit.fill,
          ),
        ),
      );
    } else if (video.cardType == "banner_v8") {
      return ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(5.r),
          topRight: Radius.circular(5.r),
        ),
        child: SizedBox(
          width: 180.w,
          height: 100.w,
          child: FadeInImage(
            imageErrorBuilder: (ctx, error, stackTrace) {
              return Container(
                child: Text("加载中"),
              );
            },
            placeholder: AssetImage(ImageAssets.icUpperVideoDefaultPNG),
            image: NetworkImage(
              video.bannerItems![0].staticBanner!.image!,
            ),
            fit: BoxFit.fill,
            placeholderFit: BoxFit.fill,
          ),
        ),
      );
    } else {
      return ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(5.r),
          topRight: Radius.circular(5.r),
        ),
        child: SizedBox(
          width: 180.w,
          height: 100.w,
          child: video.cover != null
              ? FadeInImage(
            imageErrorBuilder: (ctx, error, stackTrace) {
              return Container(
                child: Text("加载中"),
              );
            },
            placeholder: AssetImage(ImageAssets.icUpperVideoDefaultPNG),
            image: NetworkImage(
              video.cover!,
            ),
            fit: BoxFit.fill,
            placeholderFit: BoxFit.fill,
          )
              : Text(video.cover!),
        ),
      );
    }
  }

  ///封面右下角
  Widget buildHomeVideoItemRightZone(FeedIndexItem video) {
    if (video.coverRightText != null) {
      return Positioned(
        right: 5.w,
        bottom: 5.h,
        child: Text(video.coverRightText!,
            style: TextStyle(color: Colors.white, fontSize: 10.sp)),
      );
    } else if (video.badge != null) {
      return Positioned(
        right: 5.w,
        bottom: 5.h,
        child: Text(video.badge!,
            style: TextStyle(color: Colors.white, fontSize: 10.sp)),
      );
    } else {
      return Container();
    }
  }

  ///视频封面左下角区域
  Widget buildHomeVideoItemLeftZone(FeedIndexItem video) {
    if (video.goto == "live") {
      String seenText = video.coverLeftText1!;
      return Positioned(
        left: 5.w,
        bottom: 5.h,
        child: Row(
          textBaseline: TextBaseline.ideographic,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          children: [
            Image.asset(
              ImageAssets.seenPNG,
              width: 14.sp,
              height: 14.sp,
            ),
            5.horizontalSpace,
            Container(
              alignment: Alignment.center,
              height: 14.sp,
              child: Text(
                seenText,
                style:
                TextStyle(color: HYAppTheme.norWhite02Color, fontSize: 10.sp),
              ),
            ),
          ],
        ),
      );
    } else if (video.goto == "av") {
      String viewText = video.coverLeftText1!;
      String remarkText = video.coverLeftText2!;
      return Positioned(
        left: 5.w,
        bottom: 5.h,
        child: Row(
          textBaseline: TextBaseline.ideographic,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          children: [
            Image.asset(
              ImageAssets.icPlayVideoWhitePNG,
              width: 14.sp,
              height: 14.sp,
            ),
            5.horizontalSpace,
            Container(
              alignment: Alignment.center,
              height: 14.sp,
              child: Text(
                viewText,
                style:
                TextStyle(color: HYAppTheme.norWhite02Color, fontSize: 10.sp),
                textAlign: TextAlign.center,
              ),
            ),
            8.horizontalSpace,
            Image.asset(
              ImageAssets.icDanmuWhitePNG,
              width: 14.sp,
              height: 14.sp,
            ),
            5.horizontalSpace,
            Container(
              alignment: Alignment.center,
              height: 14.sp,
              child: Text(
                remarkText,
                style:
                TextStyle(color: HYAppTheme.norWhite02Color, fontSize: 10.sp),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      );
    } else if (video.goto == "bangumi") {
      String viewText = video.coverLeftText1!;
      String likeText = video.coverLeftText2!;
      return Positioned(
        left: 5.w,
        bottom: 5.h,
        child: Row(
          textBaseline: TextBaseline.ideographic,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          children: [
            Image.asset(
              ImageAssets.icPlayVideoWhitePNG,
              width: 14.sp,
              height: 14.sp,
            ),
            3.horizontalSpace,
            Container(
              alignment: Alignment.center,
              height: 14.sp,
              child: Text(
                viewText,
                style:
                TextStyle(color: HYAppTheme.norWhite02Color, fontSize: 10.sp),
              ),
            ),
            6.horizontalSpace,
            Image.asset(
              ImageAssets.lovePNG,
              width: 14.sp,
              height: 14.sp,
            ),
            3.horizontalSpace,
            Container(
              alignment: Alignment.center,
              height: 14.sp,
              child: Text(
                likeText,
                style:
                TextStyle(color: HYAppTheme.norWhite02Color, fontSize: 10.sp),
              ),
            ),
          ],
        ),
      );
    } else {
      return Container();
    }
  }

  ///视频的标题
  Widget buildHomeVideoItemTitle(FeedIndexItem video) {
    if (video.title != null) {
      return Expanded(
        child: Container(
          alignment: Alignment.topLeft,
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 8).r,
          child: Text(
            video.title!,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(color: HYAppTheme.norTextColors, fontSize: 12.sp),
          ),
        ),
      );
    } else {
      return Container();
    }
  }

  ///视频up主及id名称
  Widget buildHomeVideoBottomInfo(FeedIndexItem video) {
    if (video.goto == "av") {
      if (video.rcmdReasonStyle != null) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 2).r,
          decoration: BoxDecoration(
              color: ColorRadixChange.hexColor(video.rcmdReasonStyle!.bgColor!),
              borderRadius: BorderRadius.all(Radius.circular(2.r)),
              border: Border(
                  left: BorderSide(
                      color: ColorRadixChange.hexColor(
                          video.rcmdReasonStyle!.borderColor!)),
                  top: BorderSide(
                      color: ColorRadixChange.hexColor(
                          video.rcmdReasonStyle!.borderColor!)),
                  bottom: BorderSide(
                      color: ColorRadixChange.hexColor(
                          video.rcmdReasonStyle!.borderColor!)),
                  right: BorderSide(
                      color: ColorRadixChange.hexColor(
                          video.rcmdReasonStyle!.borderColor!)))),
          child: Text(video.rcmdReasonStyle!.text!,
              style: TextStyle(
                fontSize: 10.sp,
                color:
                ColorRadixChange.hexColor(video.rcmdReasonStyle!.textColor!),
              )),
        );
      } else {
        return Row(
          textBaseline: TextBaseline.ideographic,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          children: [
            Image.asset(
              ImageAssets.uperCustomPNG,
              width: 14.sp,
              height: 14.sp,
            ),
            4.horizontalSpace,
            SizedBox(
              width: 80.w,
              child: Text(video.args!.upName!,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 10.sp,
                    color: HYAppTheme.norGrayColor,
                  )),
            ),
          ],
        );
      }
    } else if (video.goto == "vertical_av") {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 2).r,
        decoration: BoxDecoration(
            color: ColorRadixChange.hexColor(video.rcmdReasonStyle!.bgColor!),
            borderRadius: BorderRadius.all(Radius.circular(2.r)),
            border: Border(
                left: BorderSide(
                    color: ColorRadixChange.hexColor(
                        video.rcmdReasonStyle!.borderColor!)),
                top: BorderSide(
                    color: ColorRadixChange.hexColor(
                        video.rcmdReasonStyle!.borderColor!)),
                bottom: BorderSide(
                    color: ColorRadixChange.hexColor(
                        video.rcmdReasonStyle!.borderColor!)),
                right: BorderSide(
                    color: ColorRadixChange.hexColor(
                        video.rcmdReasonStyle!.borderColor!)))),
        child: Text(video.rcmdReasonStyle!.text!,
            style: TextStyle(
              fontSize: 10.sp,
              color: ColorRadixChange.hexColor(video.rcmdReasonStyle!.textColor!),
            )),
      );
    } else if (video.goto == "live") {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            radius: 13.r,
            backgroundImage: NetworkImage(video.up!.avatar!.cover!),
          ),
          7.horizontalSpace,
          SizedBox(
            width: 80.w,
            child: Text(video.up!.name!,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 10.sp,
                  color: HYAppTheme.norGrayColor,
                )),
          ),
        ],
      );
    } else if (video.goto == "bangumi") {
      return video.badgeStyle != null
          ? Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 2).r,
            decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.all(Radius.circular(2.r)),
                border: Border(
                    left: BorderSide(
                        color: ColorRadixChange.hexColor(
                            video.badgeStyle!.borderColor!)),
                    top: BorderSide(
                        color: ColorRadixChange.hexColor(
                            video.badgeStyle!.borderColor!)),
                    bottom: BorderSide(
                        color: ColorRadixChange.hexColor(
                            video.badgeStyle!.borderColor!)),
                    right: BorderSide(
                        color: ColorRadixChange.hexColor(
                            video.badgeStyle!.borderColor!)))),
            child: Text(video.badgeStyle!.text!,
                style: TextStyle(
                  fontSize: 10.sp,
                  color: ColorRadixChange.hexColor(
                      video.badgeStyle!.textColor!),
                )),
          ),
          6.horizontalSpace,
          video.rcmdReasonStyle != null
              ? Container(
            padding: const EdgeInsets.symmetric(horizontal: 2).r,
            decoration: BoxDecoration(
                color: ColorRadixChange.hexColor(
                    video.rcmdReasonStyle!.bgColor!),
                borderRadius: BorderRadius.all(Radius.circular(2.r)),
                border: Border(
                    left: BorderSide(
                        color: ColorRadixChange.hexColor(
                            video.rcmdReasonStyle!.borderColor!)),
                    top: BorderSide(
                        color: ColorRadixChange.hexColor(
                            video.rcmdReasonStyle!.borderColor!)),
                    bottom: BorderSide(
                        color: ColorRadixChange.hexColor(
                            video.rcmdReasonStyle!.borderColor!)),
                    right: BorderSide(
                        color: ColorRadixChange.hexColor(video.rcmdReasonStyle!.borderColor!)))),
            child: Text(video.rcmdReasonStyle!.text!,
                style: TextStyle(
                  fontSize: 10.sp,
                  color: ColorRadixChange.hexColor(
                      video.rcmdReasonStyle!.textColor!),
                )),
          )
              : Container(),
        ],
      )
          : Container();
    } else {
      return Container();
    }
  }

  Widget buildHomeVideoItemFooter(FeedIndexItem video) {
    return Container(
      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 5).r,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ///视频Up主信息
          buildHomeVideoBottomInfo(video),

          ///视频右下更多按钮
          buildHomeVideoMoreIcon()
        ],
      ),
    );
  }

  Widget buildHomeVideoItemShadow() {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        height: 35.w,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.black.withOpacity(.5),
              Colors.transparent,
            ],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),
      ),
    );
  }
}
