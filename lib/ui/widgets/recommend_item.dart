import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

import '../../../../core/service/request/video_play_request.dart';
import '../../core/model/feed_index_model.dart';
import '../shared/app_theme.dart';
import '../shared/color_radix_change.dart';
import '../shared/image_asset.dart';

final _radius = 5.r;
final _iconSize = 14.sp;

class RecommendItem extends StatelessWidget {
  FeedIndexItem video;

  RecommendItem(this.video)

  @override
  Widget build(BuildContext context) {
    FeedIndexItem videoItem = video;
    return GestureDetector(
      onTap: () {
        if (video.goto == "av") {
          HYVideoRequestRequest.getMp4VideoPlayData(videoItem.args!.aid!)
              .then((value) {
            ///匹配字符串readyVideoUrl: 到readyDuration之间的字符串
            RegExp exp =
            RegExp(r'(?<=(readyVideoUrl: ))[\s\S]*?(?=(readyDuration))');
            // print("exp.allMatches(value)---${exp.stringMatch(value)}");
            String videoMp4 = exp.stringMatch(value) ?? "";
            // print("videoMp4-----------${videoMp4.substring(0,videoMp4.length)}");
            videoItem.videoData = videoMp4.substring(1, videoMp4.length - 1);

            ///跳转至播放界面
            Navigator.of(context)
                .pushNamed(HYVideoPlayScreen.routeName, arguments: videoItem);
          });
        } else {
          SmartDialog.showToast("功能暂未完善");
        }
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(_radius),
            topRight: Radius.circular(_radius),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              children: [

                ///视频封面
                buildHomeVideoItemCover(videoItem),

                ///文字下的阴影块
                buildHomeVideoItemShadow(),

                /// 视频封面上的左下区域（如视频的评论数和观看数）
                buildHomeVideoItemLeftZone(videoItem),

                ///视频封面上的右下区域（如视频的时长）
                buildHomeVideoItemRightZone(videoItem)
              ],
            ),
            SizedBox(
              height: 85.h,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  ///标题
                  buildHomeVideoItemTitle(videoItem),

                  ///视频底部的左下区域
                  buildHomeVideoItemFooter(videoItem),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

///更多按钮
Widget buildHomeVideoMoreIcon() {
  return Image.asset(
    ImageAssets.videoMoreCustomPNG,
    width: _iconSize,
    height: _iconSize,
  );
}

///视频封面
Widget buildHomeVideoItemCover(FeedIndexItem video) {
  if (video.cardType == "cm_v2") {
    ///广告类型的数据
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(_radius),
        topRight: Radius.circular(_radius),
      ),
      child: SizedBox(
        width: 180.w,
        height: 120.h,
        child: FadeInImage(
          placeholder: AssetImage(ImageAssets.icUpperVideoDefaultPNG),
          image: NetworkImage(
            video.adInfo!.creativeContent!.imageUrl!,
          ),
          fit: BoxFit.fill,
          placeholderFit: BoxFit.fill,
        ),
      ),
    );
  } else {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(_radius),
        topRight: Radius.circular(_radius),
      ),
      child: SizedBox(
        width: 180.w,
        height: 120.h,
        child: FadeInImage(
          placeholder: AssetImage(ImageAssets.icUpperVideoDefaultPNG),
          image: NetworkImage(
            video.cover!,
          ),
          fit: BoxFit.fill,
          placeholderFit: BoxFit.fill,
        ),
      ),
    );
  }
}

///视频时长
Widget buildHomeVideoItemRightZone(FeedIndexItem video) {
  if (video.coverRightText != null) {
    return Positioned(
      right: 5.w,
      bottom: 5.h,
      child: Text(video.coverRightText!,
          style: TextStyle(
              color: Colors.white, fontSize: 8.sp)),
    );
  } else if (video.badge != null) {
    return Positioned(
      right: 5.w,
      bottom: 5.h,
      child: Text(video.badge!,
          style: TextStyle(
              color: Colors.white, fontSize: 8.sp)),
    );
  } else {
    return Container();
  }
}

///视频播放量、评论数
Widget buildHomeVideoItemLeftZone(FeedIndexItem video) {
  if (video.goto == "live") {
    String _seenText = video.coverLeftText1!;
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
            width: _iconSize,
            height: _iconSize,
          ),
          5.horizontalSpace,
          Text(_seenText,
              style: TextStyle(
                  color: HYAppTheme.norWhite02Color,
                  fontSize: 8.sp)),
        ],
      ),
    );
  } else if (video.goto == "av") {
    String _viewText = video.coverLeftText1!;
    String _remarkText = video.coverLeftText2!;
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
            width: _iconSize,
            height: _iconSize,
          ),
          5.horizontalSpace,
          Text(_viewText,
              style: TextStyle(
                  color: HYAppTheme.norWhite02Color,
                  fontSize: 8.sp)),
          8.horizontalSpace,
          Image.asset(
            ImageAssets.icDanmuWhitePNG,
            width: _iconSize,
            height: _iconSize,
          ),
          5.horizontalSpace,
          Text(_remarkText,
              style: TextStyle(
                  color: HYAppTheme.norWhite02Color,
                  fontSize: 8.sp)),
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
            width: _iconSize,
            height: _iconSize,
          ),
          3.horizontalSpace,
          Text(viewText,
              style: TextStyle(
                  color: HYAppTheme.norWhite02Color,
                  fontSize: 8.sp)),
          6.horizontalSpace,
          Image.asset(
            ImageAssets.lovePNG,
            width: _iconSize,
            height: _iconSize,
          ),
          3.horizontalSpace,
          Text(likeText,
              style: TextStyle(
                  color: HYAppTheme.norWhite02Color,
                  fontSize: 8.sp)),
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
    return Container(
      alignment: Alignment.topLeft,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 8).r,
      child: Text(
        video.title!,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
            color: HYAppTheme.norTextColors,
            fontSize: 10.sp),
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
              fontSize: 8.sp,
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
            width: _iconSize,
            height: _iconSize,
          ),
          4.horizontalSpace,
          SizedBox(
            width: 100.w,
            child: Text(video.args!.upName!,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 8.sp,
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
            fontSize: 8.sp,
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
                fontSize: 8.sp,
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
                      color: ColorRadixChange.hexColor(
                          video.rcmdReasonStyle!.borderColor!)))),
          child: Text(video.rcmdReasonStyle!.text!,
              style: TextStyle(
                fontSize: 8.sp,
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
      width: 180.w,
      height: 35.h,
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
