import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/model/video_model.dart';
import '../../../../core/service/request/video_play_request.dart';
import '../pages/video_play/video_play_view.dart';
import '../shared/app_theme.dart';
import '../shared/image_asset.dart';
import '../shared/math_compute.dart';

final _radius = 6.r;
final _iconSize = 14.sp;

class HYVideoPlayRelatedVideoItem extends StatefulWidget {
  final HYVideoModel _video;

  const HYVideoPlayRelatedVideoItem(this._video, {Key? key}) : super(key: key);

  @override
  State<HYVideoPlayRelatedVideoItem> createState() =>
      _HYVideoPlayRelatedVideoItemState();
}

class _HYVideoPlayRelatedVideoItemState
    extends State<HYVideoPlayRelatedVideoItem> {
  @override
  Widget build(BuildContext context) {
    HYVideoModel _video = widget._video;
    return GestureDetector(
      onTap: () {
        HYVideoRequestRequest.getMp4VideoPlayData(_video.aid).then((value) {
          ///匹配字符串readyVideoUrl: 到readyDuration之间的字符串
          RegExp exp =
              RegExp(r'(?<=(readyVideoUrl: ))[\s\S]*?(?=(readyDuration))');
          String videoMp4 = exp.stringMatch(value) ?? "";
          _video.videoData = videoMp4.substring(1, videoMp4.length - 1);
          Navigator.of(context)
              .pushNamed(VideoPlayScreen.routeName, arguments: widget._video);
        });
      },
      child: Stack(
        children: [
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(_radius),
                topRight: Radius.circular(_radius),
              ),
            ),
            child: Column(
              children: [
                Stack(
                  children: [
                    buildVideoPlayRelatedVideoItemCover(widget._video),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        width: 180.w,
                        height: 30.h,
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
                    ),
                    buildVideoPlayRelatedVideoItemInfo(widget._video, context),
                    buildVideoPlayRelatedVideoItemDuration(
                        widget._video.durationText)
                  ],
                ),
                buildVideoPlayRelatedVideoItemTitle(
                    context, widget._video.title),
              ],
            ),
          ),
          buildVideoPlayRelatedVideoBottomInfo(
              context, widget._video.owner.name),
        ],
      ),
    );
  }
}

//视频封面
Widget buildVideoPlayRelatedVideoItemCover(HYVideoModel video) {
  return ClipRRect(
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(_radius),
      topRight: Radius.circular(_radius),
    ),
    child: Image.network(
      video.pic,
      width: 180.w,
      height: 110.h,
      fit: BoxFit.fill,
    ),
  );
}

//视频时长
Widget buildVideoPlayRelatedVideoItemDuration(String duration) {
  return Positioned(
    right: 5.w,
    bottom: 3.h,
    child: Text(
      duration,
      style:
          TextStyle(color: Colors.white, fontSize: 12.sp),
    ),
  );
}

//视频播放量、评论数
Widget buildVideoPlayRelatedVideoItemInfo(
    HYVideoModel video, BuildContext context) {
  int? _view = video.stat["view"];
  int? _remark = video.stat["danmaku"];
  String _viewText = changeToWan(_view!);
  String _remarkText = changeToWan(_remark!);

  return Positioned(
    left: 5.w,
    bottom: 3.h,
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        buildVideoPlayRelatedVideoIconInfoItem(
            ImageAssets.icPlayVideoWhitePNG, _viewText),
        10.horizontalSpace,
        buildVideoPlayRelatedVideoIconInfoItem(
            ImageAssets.icDanmuWhitePNG, _remarkText),
      ],
    ),
  );
}

//视频的标题
Widget buildVideoPlayRelatedVideoItemTitle(
    BuildContext context, String videoTitle) {
  return Container(
    alignment: Alignment.topLeft,
    margin: const EdgeInsets.all(8).r,
    child: Text(
      videoTitle,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(color: HYAppTheme.norTextColors, fontSize: 13.sp),
    ),
  );
}

//视频up主及id名称
Widget buildVideoPlayRelatedVideoBottomInfo(BuildContext context, String info) {
  return Positioned(
    bottom: 8.h,
    left: 8.w,
    right: 8.w,
    child: Row(
      children: [
        Image.asset(
          "assets/image/icon/uper_custom.png",
          width: _iconSize,
          height: _iconSize,
        ),
        Expanded(
          child: Container(
            padding: const EdgeInsets.only(left: 5).r,
            child: Text(info,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 14.sp,
                  color: HYAppTheme.norGrayColor,
                )),
          ),
        ),
        Image.asset(
          "assets/image/icon/video_more_custom.png",
          width: _iconSize,
          height: _iconSize,
        )
      ],
    ),
  );
}

//视频播放量和评论如果过万，就要显示多少万
Widget buildVideoPlayRelatedVideoIconInfoItem(String icon, String numText) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Image.asset(
        icon,
        width: 16.sp,
        height: 16.sp,
      ),
      Container(
        alignment: Alignment.centerLeft,
        margin: const EdgeInsets.only(left: 5).r,
        child: Text(
          numText,
          style: TextStyle(
              color: Colors.white, fontSize: 12.sp),
        ),
      )
    ],
  );
}
