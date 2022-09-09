import 'package:bilibili_getx/ui/widgets/video_reply_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/model/video_reply_model.dart';
import '../../../../core/service/request/video_reply_request.dart';
import '../shared/app_theme.dart';
import '../shared/image_asset.dart';

class VideoPlayComments extends StatefulWidget {
  HYVideoReplyModel videoReply;
  int leftCount;

  VideoPlayComments(
      {Key? key,
      required this.videoReply,
      required this.leftCount})
      : super(key: key);

  @override
  State<VideoPlayComments> createState() => _VideoPlayCommentsState();
}

class _VideoPlayCommentsState extends State<VideoPlayComments>
    with AutomaticKeepAliveClientMixin {
  int pageIndex = 2;
  List<HYVideoReplyModelReply> allReplies = [];
  late int _leftCount;

  @override
  void initState() {
    _leftCount = widget.leftCount;
    allReplies.addAll(widget.videoReply.replies);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return widget.videoReply.cursor.allCount == 0
        ? const Center(
            child: Text("没有评论"),
          )
        : buildVideoReplyList();
  }

  ///热门评论
  Widget buildVideoReplyTitle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          widget.videoReply.cursor.name,
          style: TextStyle(
              color: HYAppTheme.norTextColors,
              fontSize: 14.sp),
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
              style: TextStyle(
                  color: HYAppTheme.norGrayColor,
                  fontSize: 14.sp),
            ),
          ],
        ),
      ],
    );
  }

  ///回复列表
  Widget buildVideoReplyList() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25.r, vertical: 10.r),
      child: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (ctx, index) {
          if (index == 0) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                buildVideoReplyTitle(),
                10.verticalSpace,
                VideoReplyItem(allReplies[index])
              ],
            );
          }
          return VideoReplyItem(allReplies[index]);
        },
        separatorBuilder: (ctx, index) {
          if (index == allReplies.length && _leftCount <= 0) {
            return Center(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10).r,
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
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20).r,
            child: Divider(
              color: HYAppTheme.norGrayColor.withOpacity(.5),
            ),
          );
        },
        itemCount: allReplies.length,
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
