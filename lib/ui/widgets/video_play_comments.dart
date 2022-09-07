import 'package:bilibili_getx/ui/widgets/video_reply_item.dart';
import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/model/video_reply_model.dart';
import '../../../../core/service/request/video_reply_request.dart';
import '../shared/app_theme.dart';
import '../shared/image_asset.dart';

class HYVideoPlayComments extends StatefulWidget {
  HYVideoReplyModel videoReply;
  int aid;
  int leftCount;

  HYVideoPlayComments(
      {Key? key,
      required this.videoReply,
      required this.aid,
      required this.leftCount})
      : super(key: key);

  @override
  State<HYVideoPlayComments> createState() => _HYVideoPlayCommentsState();
}

class _HYVideoPlayCommentsState extends State<HYVideoPlayComments>
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
        : EasyRefresh(
            onLoad: _leftCount > 0
                ? () async {
                    HYVideoReplyRequest.getVideoReply(widget.aid, 1, pageIndex)
                        .then((value) {
                      widget.leftCount =
                          widget.leftCount - value.replies.length;
                      allReplies.addAll(value.replies);
                    });
                    await Future.delayed(const Duration(milliseconds: 1500),
                        () {
                      setState(() {});
                    });
                    pageIndex++;
                  }
                : null,
            child: Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 20, horizontal: 20).r,
              child: buildVideoReplyList(),
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
      padding: const EdgeInsets.symmetric(vertical: 10).r,
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
