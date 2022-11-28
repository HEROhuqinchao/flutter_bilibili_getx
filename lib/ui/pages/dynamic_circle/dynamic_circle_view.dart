import 'package:bilibili_getx/ui/shared/app_theme.dart';
import 'package:bilibili_getx/ui/shared/image_asset.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../core/model/web/dynamic/web_dynamic_v1_feed_all.dart';
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
      child: Container(
        width: 50.w,
        height: 50.w,
        child: CircularProgressIndicator(
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
              ? buildDynamicTypeDraw(items[index])
              : Container(
                  child: Text("其他类型"),
                );
        },
        itemCount: items.length,
      ),
    );
  }

  Widget buildDynamicTypeDraw(DataItem item) {
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
                          fontSize: 12.sp,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      Text(
                        item.modules.moduleAuthor.pubTime,
                        style: TextStyle(
                          color: HYAppTheme.norGrayColor,
                          fontSize: 10.sp,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
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
                buildRichTextNodes(item.modules.moduleDynamic.desc!),
                10.verticalSpace,
                buildDynamicTypeDrawMajor(
                    item.modules.moduleDynamic.major!.draw!.items),
                15.verticalSpace,
                Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 14.r,
                      height: 14.r,
                      child: Image.asset(ImageAssets.forwardPNG),
                    ),
                    5.horizontalSpace,
                    Container(
                      height: 12.r,
                      child: Text(
                        "转发",
                        style: TextStyle(
                          color: HYAppTheme.norGrayColor,
                          fontSize: 10.sp,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                    30.horizontalSpace,
                    Container(
                      width: 14.r,
                      height: 14.r,
                      child: Image.asset(ImageAssets.commentPNG),
                    ),
                    5.horizontalSpace,
                    Container(
                      height: 12.r,
                      child: Text(
                        item.modules.moduleStat.comment.count.toString(),
                        style: TextStyle(
                          color: HYAppTheme.norGrayColor,
                          fontSize: 10.sp,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                    30.horizontalSpace,
                    Container(
                      width: 14.r,
                      height: 14.r,
                      child: Image.asset(ImageAssets.likePNG),
                    ),
                    5.horizontalSpace,
                    Container(
                      height: 12.r,
                      child: Text(
                        item.modules.moduleStat.like.count.toString(),
                        style: TextStyle(
                          color: HYAppTheme.norGrayColor,
                          fontSize: 10.sp,
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

  Widget buildRichTextNodes(ItemDesc itemDesc) {
    List<Widget> children = [];
    List<Widget> topicChildren = [];
    for (var item in itemDesc.richTextNodes) {
      Widget widget;
      if (item.type == "RICH_TEXT_NODE_TYPE_TEXT") {
        widget = Text(
          item.text,
          style: TextStyle(
            color: HYAppTheme.norTextColors,
            fontSize: 10.sp,
            fontWeight: FontWeight.normal,
          ),
        );
        children.add(widget);
      } else if (item.type == "RICH_TEXT_NODE_TYPE_TOPIC") {
        widget = Container(
          margin: EdgeInsets.only(right: 5.r),
          child: Text(
            item.text,
            style: TextStyle(
              color: HYAppTheme.norBlue01Colors,
              fontSize: 10.sp,
              fontWeight: FontWeight.normal,
            ),
          ),
        );
        topicChildren.add(widget);
      } else {
        children.add(Text("不存在的类型"));
      }
    }
    children.add(Row(
      mainAxisSize: MainAxisSize.min,
      children: topicChildren,
    ));
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: children,
    );
  }

  Widget buildDynamicTypeDrawMajor(List<DrawItem> items) {
    if (items.isEmpty) {
      return Container();
    } else {
      Widget widget;
      if (items.length > 1) {
        widget = GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 5.r,
            mainAxisSpacing: 5.r,
          ),
          itemBuilder: (BuildContext context, int index) {
            return Container(
              width: items[0].width.r,
              height: items[0].height.r,
              child: Image.network(items[index].src),
            );
          },
          itemCount: items.length,
        );
      } else {
        return Container(
          width: (items[0].width / 9).r,
          height: (items[0].height / 9).r,
          child: Image.network(items[0].src),
        );
      }
      return widget;
    }
  }
}
