import 'package:bilibili_getx/ui/widgets/user_level.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/model/video_reply_model.dart';
import '../shared/app_theme.dart';
import '../shared/image_asset.dart';
import '../shared/math_compute.dart';

class VideoReplyItem extends StatefulWidget {
  HYVideoReplyModelReply reply;

  VideoReplyItem(this.reply, {Key? key}) : super(key: key);

  @override
  State<VideoReplyItem> createState() => _VideoReplyItemState();
}

class _VideoReplyItemState extends State<VideoReplyItem> with AutomaticKeepAliveClientMixin{
  ///内容行数
  int maxLines = 5;

  ///是否展开
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    DateTime pubDate = getPubData(widget.reply.ctime);
    int nowYear = DateTime.now().year;
    String pubDateText = pubDate.toString();
    if (pubDate.year == nowYear) {
      pubDateText = pubDateText.substring(5, pubDateText.length - 12);
    } else {
      pubDateText = pubDateText.substring(0, pubDateText.length - 12);
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.only(right: 10).r,
          child: CircleAvatar(
            radius: 15.r,
            backgroundImage: NetworkImage(widget.reply.member.avatar),
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    widget.reply.member.uname,
                    style: TextStyle(
                      color: HYAppTheme.norTextColors,
                      fontSize: 14.sp,
                    ),
                  ),
                  5.horizontalSpace,
                  UserLevel(
                    level: widget.reply.member.levelInfo.currentLevel,
                  ),
                ],
              ),
              5.verticalSpace,
              Text(
                pubDateText,
                style: TextStyle(
                  color: HYAppTheme.norGrayColor,
                  fontSize: 12.sp,
                ),
              ),
              5.verticalSpace,
              LayoutBuilder(
                builder: (ctx, size) {
                  ///带表情的留言
                  List<InlineSpan> spanList = [];
                  PurpleContent content = widget.reply.content;
                  // String message = "中文中文";
                  String message = content.message;
                  String messageTextPainter = content.message;
                  Map<String, EmoteValue>? emote = content.emote;
                  emote?.forEach((key, value) {
                    message = message.replaceAll(key, "[${value.url}]");
                    messageTextPainter =
                        messageTextPainter.replaceAll(key, "2笙");
                  });

                  bool haveHead = false;
                  int headIndex = 0;
                  int tailIndex = 0;
                  List<String> list = message.split('');
                  for (int i = 0; i < list.length; i++) {
                    if (list[i] == '[') {
                      haveHead = true;
                      headIndex = i;
                    }
                    if (list[i] == ']' && haveHead == true) {
                      String textSpanText =
                          list.sublist(tailIndex, headIndex).join('');
                      String widgetSpanUrl =
                          list.sublist(headIndex + 1, i).join('');
                      var textSpan = TextSpan(
                        text: textSpanText,
                        style: TextStyle(
                          color: HYAppTheme.norTextColors,
                          fontSize: 14.sp,
                        ),
                      );
                      InlineSpan widgetSpan;
                      if (widgetSpanUrl.contains("http")) {
                        widgetSpan = WidgetSpan(
                            child: Image.network(
                          widgetSpanUrl,
                          width: 20.w,
                          height: 20.h,
                        ));
                      } else {
                        widgetSpan = TextSpan(
                          text: widgetSpanUrl,
                          style: TextStyle(
                            color: HYAppTheme.norTextColors,
                            fontSize: 14.sp,
                          ),
                        );
                      }
                      spanList.add(textSpan);
                      spanList.add(widgetSpan);
                      tailIndex = i + 1;
                      headIndex = 0;
                      haveHead = false;
                    }
                  }
                  var spans;
                  if (spanList.isEmpty) {
                    ///没有使用表情
                    spans = TextSpan(
                      text: message,
                      style: TextStyle(
                        color: HYAppTheme.norTextColors,
                        fontSize: 14.sp,
                      ),
                    );
                  } else {
                    // spans = TextSpan(children: spanList);
                    spans = TextSpan(children: spanList);
                  }

                  var spanTextSpan = TextSpan(
                      text: messageTextPainter,
                      style: TextStyle(
                        color: HYAppTheme.norTextColors,
                        fontSize: 14.sp,
                      ));
                  var textPainter = TextPainter(
                    maxLines: maxLines,
                    textAlign: TextAlign.left,
                    textDirection: TextDirection.ltr,
                    text: spanTextSpan,
                  );
                  textPainter.layout(maxWidth: size.maxWidth);
                  var exceeded = textPainter.didExceedMaxLines;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text.rich(
                        spans,
                        overflow: TextOverflow.ellipsis,
                        maxLines: maxLines,
                      ),
                      exceeded == true
                          ? GestureDetector(
                              child: Container(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10)
                                        .r,
                                child: Text(
                                  "展开",
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    color: Colors.blue,
                                  ),
                                ),
                              ),
                              onTap: () {
                                isExpanded = !isExpanded;
                                if (isExpanded == false) {
                                  maxLines = 5;
                                } else {
                                  maxLines = 999;
                                }
                                if (mounted) {
                                  setState(() {});
                                }
                              },
                            )
                          : maxLines == 999
                              ? GestureDetector(
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                            vertical: 10)
                                        .r,
                                    child: Text(
                                      "收起",
                                      style: TextStyle(
                                        fontSize: 12.sp,
                                        color: Colors.blue,
                                      ),
                                    ),
                                  ),
                                  onTap: () {
                                    isExpanded = !isExpanded;
                                    if (isExpanded == false) {
                                      maxLines = 5;
                                    } else {
                                      maxLines = 999;
                                    }
                                    if (mounted) {
                                      setState(() {});
                                    }
                                  },
                                )
                              : Container()
                    ],
                  );
                },
              ),
              20.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        ImageAssets.likePNG,
                        width: 15.w,
                        height: 15.h,
                      ),
                      8.horizontalSpace,
                      Text(
                        widget.reply.like.toString(),
                        style: TextStyle(
                          color: HYAppTheme.norTextColors,
                          fontSize: 14.sp,
                        ),
                      ),
                      15.horizontalSpace,
                      Image.asset(
                        ImageAssets.dislikePNG,
                        width: 20.w,
                        height: 20.h,
                      ),
                      SizedBox(
                        width: 20.w,
                      ),
                      Image.asset(
                        ImageAssets.sharePNG,
                        width: 17.w,
                        height: 17.h,
                      ),
                      SizedBox(
                        width: 20.w,
                      ),
                      Image.asset(
                        ImageAssets.replyPNG,
                        width: 17.w,
                        height: 17.h,
                      ),
                    ],
                  ),
                  Image.asset(
                    ImageAssets.morePNG,
                    width: 10.w,
                    height: 10.h,
                  ),
                ],
              ),
              10.verticalSpace,

              ///显示前三条，showFlow为true隐藏部分回复
              widget.reply.replies == null
                  ? Container()
                  : Container(
                      decoration: BoxDecoration(
                        color: HYAppTheme.norGrayColor.withOpacity(.1),
                        borderRadius: BorderRadius.all(
                          Radius.circular(
                            3.r,
                          ),
                        ),
                      ),
                      child: buildReplyReplies(),
                    )
            ],
          ),
        )
      ],
    );
  }

  ///回复的回复
  Widget buildReplyReplies() {
    String subReplyEntryText =
        widget.reply.replyControl.subReplyEntryText ?? "";
    List<ReplyReply>? replies = widget.reply.replies;
    return Container(
      padding: const EdgeInsets.all(10).r,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (ctx, index) {
              ///带表情的留言
              List<InlineSpan> spanList = [];
              String message = replies![index].content.message;
              Map<String, EmoteValue>? emote = replies[index].content.emote;
              emote?.forEach((key, value) {
                message = message.replaceAll(key, "[${value.url}]");
              });

              bool haveHead = false;
              int headIndex = 0;
              int tailIndex = 0;
              List<String> list = message.split('');
              for (int i = 0; i < list.length; i++) {
                if (list[i] == '[') {
                  haveHead = true;
                  headIndex = i;
                }
                if (list[i] == ']' && haveHead == true) {
                  String textSpanText =
                      list.sublist(tailIndex, headIndex).join('');
                  String widgetSpanUrl =
                      list.sublist(headIndex + 1, i).join('');
                  var textSpan = TextSpan(
                    text: textSpanText,
                    style: TextStyle(
                        color: HYAppTheme.norTextColors,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.normal,
                        fontFamily: 'bilibiliFonts'),
                  );
                  InlineSpan widgetSpan;
                  if (widgetSpanUrl.contains("http")) {
                    widgetSpan = WidgetSpan(
                        child: Image.network(
                      widgetSpanUrl,
                      width: 20.w,
                      height: 20.h,
                    ));
                  } else {
                    widgetSpan = TextSpan(
                      text: widgetSpanUrl,
                      style: TextStyle(
                        color: HYAppTheme.norTextColors,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.normal,
                        fontFamily: 'bilibiliFonts',
                      ),
                    );
                  }
                  spanList.add(textSpan);
                  spanList.add(widgetSpan);
                  tailIndex = i + 1;
                  headIndex = 0;
                  haveHead = false;
                }
              }
              var spans;
              if (spanList.isEmpty) {
                ///没有使用表情
                spans = TextSpan(
                  text: message,
                  style: TextStyle(
                    color: HYAppTheme.norTextColors,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.normal,
                    fontFamily: 'bilibiliFonts',
                  ),
                );
              } else {
                spans = TextSpan(children: spanList);
              }
              return RichText(
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                text: TextSpan(
                  children: [
                    TextSpan(
                        style: TextStyle(
                          color: Color.fromRGBO(24, 114, 164, 1),
                          fontSize: 14.sp,
                          fontWeight: FontWeight.normal,
                          fontFamily: 'bilibiliFonts',
                        ),
                        text: replies[index].member.uname),
                    TextSpan(
                        style: TextStyle(
                          color: HYAppTheme.norTextColors,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.normal,
                          fontFamily: 'bilibiliFonts',
                        ),
                        text: ": "),
                    spans
                  ],
                ),
              );
            },
            itemCount: replies!.length > 3 ? 3 : replies.length,
          ),
          5.verticalSpace,
          Text(
            subReplyEntryText,
            style: TextStyle(
              color: HYAppTheme.norBlue02Colors,
              fontSize: 14.sp,
              fontWeight: FontWeight.normal,
              fontFamily: 'bilibiliFonts',
            ),
          ),
        ],
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
