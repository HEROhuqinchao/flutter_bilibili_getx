import 'package:bilibili_getx/ui/shared/app_theme.dart';
import 'package:bilibili_getx/ui/shared/image_asset.dart';
import 'package:bilibili_getx/ui/widgets/expanded_widget.dart';
import 'package:bilibili_getx/ui/widgets/fade_image_default.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../core/model/web/dynamic/web_dynamic_v1_feed_all.dart';
import '../../widgets/height_reporter.dart';
import 'dynamic_circle_logic.dart';

class DynamicCircleScreen extends StatelessWidget {
  static const String routeName = "/dynamicCircle";
  final logic = Get.find<DynamicCircleLogic>();
  final state = Get.find<DynamicCircleLogic>().state;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DynamicCircleLogic>(builder: (logic) {
      return Scaffold(
        body: state.isLoading
            ? buildDynamicCircleLoading()
            : buildDynamicCircleContent(),
      );
    });
  }

  ///加载界面
  Widget buildDynamicCircleLoading() {
    return Center(
      child: SizedBox(
        width: 50.w,
        height: 50.w,
        child: const CircularProgressIndicator(
          color: HYAppTheme.norMainThemeColors,
        ),
      ),
    );
  }

  ///动态界面
  Widget buildDynamicCircleContent() {
    List<DataItem> items = state.dynamicV1FeedAllData.data!.items;
    return Container(
      padding: EdgeInsets.all(10.r),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
              "https://s1.hdslb.com/bfs/static/stone-free/dyn-home/assets/background.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: ListView.builder(
        itemBuilder: (ctx, index) {
          String type = items[index].type;
          return type == "DYNAMIC_TYPE_DRAW"
              ? buildDynamicTypeDraw(items[index], index)
              : const Text("其他类型");
        },
        itemCount: items.length,
      ),
    );
  }

  ///DynamicTypeDraw类型
  Widget buildDynamicTypeDraw(DataItem item, index) {
    bool showMoreButton = false;
    print(item.modules.moduleDynamic.desc!.text);
    print(item.modules.moduleDynamic.desc!.text.length);
    if ((item.modules.moduleDynamic.desc!.text.length) > 50) {
      showMoreButton = true;
    }
    return Container(
      padding: EdgeInsets.all(10.r),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.r),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(180.r),
                child: Image.network(
                  item.modules.moduleAuthor.face,
                  width: 35.r,
                  height: 35.r,
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(left: 10.r),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        item.modules.moduleAuthor.name,
                        style: TextStyle(
                          color: HYAppTheme.norTextColors,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      Text(
                        item.modules.moduleAuthor.pubTime,
                        style: TextStyle(
                          color: HYAppTheme.norGrayColor,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 25.r,
                height: 25.r,
                child: Image.asset(
                  ImageAssets.morePNG,
                ),
              )
            ],
          ),
          Container(
            width: 1.sw,
            padding: EdgeInsets.only(left: 45.r, right: 35.r),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                10.verticalSpace,
                ExpandedWidget(
                  defaultHeight: 60.w,
                  expandedKey: state.keys[index],
                  child: buildRichTextNodes(item.modules.moduleDynamic.desc!),
                ),
                5.verticalSpace,
                showMoreButton
                    ? GestureDetector(
                        child: state.expandedList[index] == false
                            ? Text(
                                "展开",
                                style: TextStyle(
                                  color: HYAppTheme.norBlue01Colors,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.normal,
                                ),
                              )
                            : Text(
                                "收缩",
                                style: TextStyle(
                                  color: HYAppTheme.norBlue01Colors,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                        onTap: () {
                          logic.expandText(index);
                        },
                      )
                    : Container(),
                10.verticalSpace,
                buildDynamicTypeDrawMajor(
                    item.modules.moduleDynamic.major!.draw!.items),
                40.verticalSpace,
                Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 14.r,
                      height: 14.r,
                      child: Image.asset(ImageAssets.forwardPNG),
                    ),
                    5.horizontalSpace,
                    Container(
                      alignment: Alignment.center,
                      height: 16.r,
                      child: Text(
                        "转发",
                        style: TextStyle(
                          color: HYAppTheme.norGrayColor,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                    30.horizontalSpace,
                    SizedBox(
                      width: 14.r,
                      height: 14.r,
                      child: Image.asset(ImageAssets.commentPNG),
                    ),
                    5.horizontalSpace,
                    Container(
                      alignment: Alignment.center,
                      height: 16.r,
                      child: Text(
                        item.modules.moduleStat.comment.count.toString(),
                        style: TextStyle(
                          color: HYAppTheme.norGrayColor,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                    30.horizontalSpace,
                    SizedBox(
                      width: 14.r,
                      height: 14.r,
                      child: Image.asset(ImageAssets.likePNG),
                    ),
                    5.horizontalSpace,
                    Container(
                      alignment: Alignment.center,
                      height: 16.r,
                      child: Text(
                        item.modules.moduleStat.like.count.toString(),
                        style: TextStyle(
                          color: HYAppTheme.norGrayColor,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  ///动态文字内容
  Widget buildRichTextNodes(ItemDesc itemDesc) {
    List<InlineSpan> children = [];
    for (var item in itemDesc.richTextNodes) {
      InlineSpan widget;
      if (item.type == "RICH_TEXT_NODE_TYPE_TEXT") {
        widget = TextSpan(
          text: item.text,
          style: TextStyle(
              height: 1.5,
              color: HYAppTheme.norTextColors,
              fontSize: 14.sp,
              fontWeight: FontWeight.normal,
              fontFamily: 'bilibiliFonts'),
        );
        children.add(widget);
      } else if (item.type == "RICH_TEXT_NODE_TYPE_TOPIC") {
        widget = TextSpan(
          text: item.text,
          style: TextStyle(
              height: 1.5,
              color: HYAppTheme.norBlue01Colors,
              fontSize: 13.sp,
              fontWeight: FontWeight.normal,
              fontFamily: 'bilibiliFonts'),
        );
        children.add(widget);
      } else if (item.type == "RICH_TEXT_NODE_TYPE_EMOJI") {
        widget = WidgetSpan(
          child: DefaultFadeImage(
            width: 23.r,
            height: 23.r,
            imageUrl: item.emoji!.iconUrl,
            fit: BoxFit.cover,
          ),
        );
        children.add(widget);
      } else if (item.type == "RICH_TEXT_NODE_TYPE_GOODS") {
        widget = TextSpan(
          text: item.text,
          style: TextStyle(
              height: 1.5,
              color: HYAppTheme.norTextColors,
              fontSize: 13.sp,
              fontWeight: FontWeight.normal,
              fontFamily: 'bilibiliFonts'),
        );
        children.add(widget);
      } else {
        children.add(TextSpan(text: "未知类型"));
      }
    }
    return RichText(
      text: TextSpan(children: children),
    );
  }

  ///动态图片
  Widget buildDynamicTypeDrawMajor(List<DrawItem> items) {
    if (items.isEmpty) {
      return Container();
    } else {
      Widget widget;
      if (items.length > 1) {
        widget = GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 3.r,
            mainAxisSpacing: 3.r,
          ),
          itemBuilder: (BuildContext context, int index) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(5.r),
              child: DefaultFadeImage(
                imageUrl: items[index].src,
                fit: BoxFit.cover,
              ),
            );
          },
          itemCount: items.length,
        );
      } else {
        return SizedBox(
          width: (items[0].width / 10).r,
          height: (items[0].height / 10).r,
          child: Image.network(
            items[0].src,
            fit: BoxFit.cover,
          ),
        );
      }
      return widget;
    }
  }
}
