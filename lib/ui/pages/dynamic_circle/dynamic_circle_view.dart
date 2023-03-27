import 'package:bilibili_getx/ui/shared/app_theme.dart';
import 'package:bilibili_getx/ui/shared/image_asset.dart';
import 'package:bilibili_getx/ui/widgets/fade_image_default.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../core/model/web/dynamic/web_dynamic_v1_feed_all.dart';
import '../../widgets/common_rich_text.dart';
import 'dynamic_circle_logic.dart';

class DynamicCircleScreen extends StatelessWidget {
  static const String routeName = "/dynamicCircle";
  final logic = Get.find<DynamicCircleLogic>();
  final state = Get.find<DynamicCircleLogic>().state;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetBuilder<DynamicCircleLogic>(builder: (logic) {
        return Scaffold(
          body: state.isLoading
              ? buildDynamicCircleLoading()
              : buildDynamicCircleContent(),
        );
      }),
    );
  }

  ///加载界面
  Widget buildDynamicCircleLoading() {
    return Center(
      child: SizedBox(
        width: 50.r,
        height: 50.r,
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
      padding: EdgeInsets.all(8.r),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
              "https://s1.hdslb.com/bfs/static/stone-free/dyn-home/assets/background.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: ListView.separated(
        itemBuilder: (ctx, index) {
          String type = items[index].type;
          return Container(
            padding: EdgeInsets.all(12.r),
            decoration: BoxDecoration(
              boxShadow: [HYAppTheme.norBoxShadow],
              color: Colors.white,
              borderRadius: BorderRadius.circular(5.r),
            ),
            child: type == "DYNAMIC_TYPE_DRAW"
                ? buildDynamicTypeDraw(items[index], index)
                : type == "DYNAMIC_TYPE_AV"
                    ? buildDynamicTypeAv(items[index], index)
                    : type == "DYNAMIC_TYPE_WORD"
                        ? buildDynamicTypeWord(items[index], index)
                        : type == "DYNAMIC_TYPE_FORWARD"
                            ? buildDynamicTypeForward(items[index], index)
                            : Text(items[index].type),
          );
        },
        itemCount: items.length,
        separatorBuilder: (BuildContext context, int index) {
          return 10.verticalSpace;
        },
      ),
    );
  }

  ///DYNAMIC_TYPE_FORWARD类型
  Widget buildDynamicTypeForward(DataItem item, index) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildDynamicTypeHeader(item.modules.moduleAuthor),
        8.verticalSpace,
        buildDynamicTypeForwardContent(item.modules.moduleDynamic),
        8.verticalSpace,
        buildDynamicTypeForwardOrigin(item.orig!),
        25.verticalSpace,
        buildDynamicTypeFooter(item.modules.moduleStat),
      ],
    );
  }

  Widget buildDynamicTypeForwardContent(PurpleModuleDynamic moduleDynamic) {
    return Container(
      margin: EdgeInsets.only(left: 5.r),
      child: CommonRichText(
        text: moduleDynamic.desc!.text,
        richTextNodes: moduleDynamic.desc!.richTextNodes,
        richText: buildRichTextNodes(moduleDynamic.desc!),
        textStyle: TextStyle(
          height: 1.5,
          color: HYAppTheme.norTextColors,
          fontSize: 14.sp,
          fontWeight: FontWeight.normal,
          fontFamily: 'bilibiliFonts',
        ),
      ),
    );
  }

  ///DYNAMIC_TYPE_WORD类型
  Widget buildDynamicTypeWord(DataItem item, index) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildDynamicTypeHeader(item.modules.moduleAuthor),
        8.verticalSpace,
        buildDynamicTypeWordContent(item.modules.moduleDynamic),
        25.verticalSpace,
        buildDynamicTypeFooter(item.modules.moduleStat),
      ],
    );
  }

  Widget buildDynamicTypeForwardOrigin(Orig orig) {
    return orig.type == "DYNAMIC_TYPE_AV"
        ? Container(
            padding: EdgeInsets.symmetric(vertical: 12.r, horizontal: 4.r),
            decoration: BoxDecoration(
                color: HYAppTheme.norGrayColor.withOpacity(.1),
                borderRadius: BorderRadius.circular(5.r)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "@${orig.modules.moduleAuthor.name}",
                  style: TextStyle(
                    height: 1.5,
                    color: HYAppTheme.norBlue01Colors,
                    fontSize: 14.sp,
                  ),
                ),
                8.verticalSpace,
                buildDynamicTypeForwardOriginContent(
                    orig.modules.moduleDynamic),
              ],
            ),
          )
        : Text("位置类型");
  }

  Widget buildDynamicTypeForwardOriginContent(
      FluffyModuleDynamic moduleDynamic) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        // CommonRichText(
        //   text: moduleDynamic.desc!.text,
        //   richTextNodes: moduleDynamic.desc!.richTextNodes,
        //   richText: buildRichTextNodes(moduleDynamic.desc!),
        //   textStyle: TextStyle(
        //     height: 1.5,
        //     color: HYAppTheme.norTextColors,
        //     fontSize: 14.sp,
        //     fontWeight: FontWeight.normal,
        //     fontFamily: 'bilibiliFonts',
        //   ),
        // ),
        Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                boxShadow: [HYAppTheme.norBoxShadow],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5.r),
                child: DefaultFadeImage(
                  imageUrl: moduleDynamic.major!.archive!.cover,
                  width: 310.w,
                  height: 180.w,
                ),
              ),
            ),
            Positioned(
              left: 10.r,
              bottom: 10.r,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 2.r, horizontal: 4.r),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3.r),
                      color: HYAppTheme.norTextColors.withOpacity(.5),
                    ),
                    child: Text(
                      moduleDynamic.major!.archive!.durationText,
                      style: TextStyle(
                        color: HYAppTheme.norWhite01Color,
                        fontSize: 12.sp,
                      ),
                    ),
                  ),
                  8.horizontalSpace,
                  Text(
                    "${moduleDynamic.major!.archive!.stat.play}观看",
                    style: TextStyle(
                      color: HYAppTheme.norWhite01Color,
                      fontSize: 11.sp,
                    ),
                  ),
                  5.horizontalSpace,
                  Text(
                    "${moduleDynamic.major!.archive!.stat.danmaku}弹幕",
                    style: TextStyle(
                      color: HYAppTheme.norWhite01Color,
                      fontSize: 11.sp,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              width: 35.r,
              height: 35.r,
              right: 10.r,
              bottom: 10.r,
              child: Image.asset(ImageAssets.playVideoCustomPNG),
            )
          ],
        ),
        15.verticalSpace,
        Container(
          width: 1.sw,
          alignment: Alignment.centerLeft,
          child: Text(
            moduleDynamic.major!.archive!.title,
            style: TextStyle(
              fontSize: 14.sp,
              color: HYAppTheme.norTextColors,
            ),
          ),
        ),
      ],
    );
  }

  ///DYNAMIC_TYPE_AV类型
  Widget buildDynamicTypeAv(DataItem item, index) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        buildDynamicTypeHeader(item.modules.moduleAuthor),
        8.verticalSpace,
        buildDynamicTypeAvContent(item.modules.moduleDynamic),
        25.verticalSpace,
        buildDynamicTypeFooter(item.modules.moduleStat),
      ],
    );
  }

  ///DYNAMIC_TYPE_DRAW类型
  Widget buildDynamicTypeDraw(DataItem item, index) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        buildDynamicTypeHeader(item.modules.moduleAuthor),
        buildDynamicTypeDrawContent(item.modules.moduleDynamic),
        25.verticalSpace,
        buildDynamicTypeFooter(item.modules.moduleStat),
      ],
    );
  }

  ///顶部头像行
  Widget buildDynamicTypeHeader(ModuleAuthor moduleAuthor) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        buildDynamicTypeHeaderAvatar(moduleAuthor),
        buildDynamicTypeHeaderName(moduleAuthor),
        buildDynamicTypeHeaderDecorate(moduleAuthor),
        SizedBox(
          width: 20.r,
          height: 20.r,
          child: Image.asset(
            ImageAssets.moreBlackPNG,
          ),
        )
      ],
    );
  }

  Widget buildDynamicTypeWordContent(PurpleModuleDynamic moduleDynamic) {
    return Container(
      margin: EdgeInsets.only(left: 5.r),
      child: CommonRichText(
        text: moduleDynamic.desc!.text,
        richTextNodes: moduleDynamic.desc!.richTextNodes,
        richText: buildRichTextNodes(moduleDynamic.desc!),
        textStyle: TextStyle(
          height: 1.5,
          color: HYAppTheme.norTextColors,
          fontSize: 14.sp,
          fontWeight: FontWeight.normal,
          fontFamily: 'bilibiliFonts',
        ),
      ),
    );
  }

  ///DynamicTypeAv中间视频部分
  Widget buildDynamicTypeAvContent(PurpleModuleDynamic moduleDynamic) {
    return moduleDynamic.major!.type == "MAJOR_TYPE_ARCHIVE"
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              // CommonRichText(
              //   text: moduleDynamic.desc!.text,
              //   richTextNodes: moduleDynamic.desc!.richTextNodes,
              //   richText: buildRichTextNodes(moduleDynamic.desc!),
              //   textStyle: TextStyle(
              //     height: 1.5,
              //     color: HYAppTheme.norTextColors,
              //     fontSize: 14.sp,
              //     fontWeight: FontWeight.normal,
              //     fontFamily: 'bilibiliFonts',
              //   ),
              // ),
              Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      boxShadow: [HYAppTheme.norBoxShadow],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5.r),
                      child: DefaultFadeImage(
                        imageUrl: moduleDynamic.major!.archive!.cover,
                        width: 310.w,
                        height: 180.w,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 10.r,
                    bottom: 10.r,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 2.r, horizontal: 4.r),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3.r),
                            color: HYAppTheme.norTextColors.withOpacity(.5),
                          ),
                          child: Text(
                            moduleDynamic.major!.archive!.durationText,
                            style: TextStyle(
                              color: HYAppTheme.norWhite01Color,
                              fontSize: 12.sp,
                            ),
                          ),
                        ),
                        8.horizontalSpace,
                        Text(
                          "${moduleDynamic.major!.archive!.stat.play}观看",
                          style: TextStyle(
                            color: HYAppTheme.norWhite01Color,
                            fontSize: 11.sp,
                          ),
                        ),
                        5.horizontalSpace,
                        Text(
                          "${moduleDynamic.major!.archive!.stat.danmaku}弹幕",
                          style: TextStyle(
                            color: HYAppTheme.norWhite01Color,
                            fontSize: 11.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    width: 35.r,
                    height: 35.r,
                    right: 10.r,
                    bottom: 10.r,
                    child: Image.asset(ImageAssets.playVideoCustomPNG),
                  )
                ],
              ),
              15.verticalSpace,
              Container(
                width: 1.sw,
                alignment: Alignment.centerLeft,
                child: Text(
                  moduleDynamic.major!.archive!.title,
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: HYAppTheme.norTextColors,
                  ),
                ),
              ),
            ],
          )
        : Container(
            child: Text("未知类型"),
          );
  }

  Widget buildDynamicTypeDrawContent(PurpleModuleDynamic moduleDynamic) {
    return Container(
      width: 1.sw,
      padding: EdgeInsets.only(left: 45.r, right: 35.r),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          10.verticalSpace,
          CommonRichText(
            text: moduleDynamic.desc!.text,
            richTextNodes: moduleDynamic.desc!.richTextNodes,
            richText: buildRichTextNodes(moduleDynamic.desc!),
            textStyle: TextStyle(
              height: 1.5,
              color: HYAppTheme.norTextColors,
              fontSize: 14.sp,
              fontWeight: FontWeight.normal,
              fontFamily: 'bilibiliFonts',
            ),
          ),
          30.verticalSpace,
          buildDynamicTypeDrawMajor(moduleDynamic.major!.draw!.items),
        ],
      ),
    );
  }

  ///转发、评论、点赞三个按钮
  Widget buildDynamicTypeFooter(ModuleStat moduleStat) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 3.r, horizontal: 15.r),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: 14.r,
                height: 14.r,
                child: Image.asset(ImageAssets.forwardPNG),
              ),
              5.horizontalSpace,
              Container(
                alignment: Alignment.center,
                height: 18.r,
                child: Text(
                  "转发",
                  style: TextStyle(
                    color: HYAppTheme.norGrayColor,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 3.r, horizontal: 15.r),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: 14.r,
                height: 14.r,
                child: Image.asset(ImageAssets.commentPNG),
              ),
              5.horizontalSpace,
              Container(
                alignment: Alignment.center,
                height: 18.r,
                child: Text(
                  moduleStat.comment.count.toString(),
                  style: TextStyle(
                    color: HYAppTheme.norGrayColor,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 3.r, horizontal: 15.r),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: 14.r,
                height: 14.r,
                child: Image.asset(ImageAssets.likePNG),
              ),
              5.horizontalSpace,
              Container(
                alignment: Alignment.center,
                height: 18.r,
                child: Text(
                  moduleStat.like.count.toString(),
                  style: TextStyle(
                    color: HYAppTheme.norGrayColor,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  ///动态人头像
  Widget buildDynamicTypeHeaderAvatar(ModuleAuthor moduleAuthor) {
    return moduleAuthor.pendant!.image.isNotEmpty
        ? Stack(
            alignment: Alignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(180.r),
                child: DefaultFadeImage(
                  imageUrl: moduleAuthor.face,
                  width: 27.r,
                  height: 27.r,
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(
                  180.r,
                ),
                child: Image.network(
                  moduleAuthor.pendant!.image,
                  width: 35.r,
                  height: 45.r,
                  fit: BoxFit.fitHeight,
                ),
              ),
            ],
          )
        : ClipRRect(
            borderRadius: BorderRadius.circular(180.r),
            child: Image.network(
              moduleAuthor.face,
              width: 35.r,
              height: 35.r,
            ),
          );
  }

  Widget buildDynamicTypeHeaderName(ModuleAuthor moduleAuthor) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(left: 10.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              moduleAuthor.name,
              style: TextStyle(
                color: HYAppTheme.norMainThemeColors,
                fontWeight: FontWeight.normal,
                fontSize: 13.sp,
              ),
            ),
            Text(
              "${moduleAuthor.pubTime}·${moduleAuthor.pubAction}",
              style: TextStyle(
                color: HYAppTheme.norGrayColor,
                fontSize: 10.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildDynamicTypeHeaderDecorate(ModuleAuthor moduleAuthor) {
    return moduleAuthor.decorate != null
        ? moduleAuthor.decorate!.fan.numStr.isNotEmpty
            ? Stack(
                alignment: Alignment.centerLeft,
                children: [
                  DefaultFadeImage(
                    height: 30.r,
                    width: 110.r,
                    imageUrl: moduleAuthor.decorate!.cardUrl,
                    fit: BoxFit.contain,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 30.r),
                    child: Text(
                      moduleAuthor.decorate!.fan.numStr,
                      style: TextStyle(
                        color: HYAppTheme.norMainThemeColors,
                        fontSize: 12.sp,
                      ),
                    ),
                  ),
                ],
              )
            : Container(
                height: 30.r,
                width: 90.r,
                child: DefaultFadeImage(
                  imageUrl: moduleAuthor.decorate!.cardUrl,
                  height: 30.r,
                  fit: BoxFit.contain,
                ),
              )
        : Container();
  }

  ///动态文字内容
  List<InlineSpan> buildRichTextNodes(ItemDesc itemDesc) {
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
            fontFamily: 'bilibiliFonts',
          ),
        );
        children.add(widget);
      } else if (item.type == "RICH_TEXT_NODE_TYPE_TOPIC") {
        final Widget svg = SvgPicture.asset(
          ImageAssets.topicSVG,
          semanticsLabel: 'topic svg',
          width: 10.r,
          height: 10.r,
        );
        children.add(WidgetSpan(child: svg));
        widget = TextSpan(
          text: item.text,
          style: TextStyle(
            height: 1.5,
            color: HYAppTheme.norBlue01Colors,
            fontSize: 13.sp,
            fontWeight: FontWeight.normal,
            fontFamily: 'bilibiliFonts',
          ),
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
            fontFamily: 'bilibiliFonts',
          ),
        );
        children.add(widget);
      } else if (item.type == "RICH_TEXT_NODE_TYPE_WEB") {
        widget = TextSpan(
          text: item.text,
          style: TextStyle(
            height: 1.5,
            color: HYAppTheme.norBlue01Colors,
            fontSize: 13.sp,
            fontWeight: FontWeight.normal,
            fontFamily: 'bilibiliFonts',
          ),
        );
        children.add(widget);
      } else if (item.type == "RICH_TEXT_NODE_TYPE_AT") {
        widget = TextSpan(
          text: item.text,
          style: TextStyle(
            height: 1.5,
            color: HYAppTheme.norBlue01Colors,
            fontSize: 13.sp,
            fontWeight: FontWeight.normal,
            fontFamily: 'bilibiliFonts',
          ),
        );
        children.add(widget);
      } else {
        print(item.type);
      }
    }
    return children;
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
            return Container(
              decoration: BoxDecoration(boxShadow: [HYAppTheme.norBoxShadow]),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5.r),
                child: DefaultFadeImage(
                  imageUrl: items[index].src,
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
          itemCount: items.length,
        );
      } else {
        return Container(
          decoration: BoxDecoration(boxShadow: [HYAppTheme.norBoxShadow]),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(5.r),
            child: DefaultFadeImage(
              width: (items[0].width / 7).r,
              height: (items[0].height / 7).r,
              imageUrl: items[0].src,
            ),
          ),
        );
      }
      return widget;
    }
  }
}
