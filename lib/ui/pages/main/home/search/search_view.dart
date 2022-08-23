import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

import '../../../../../core/I18n/str_res_keys.dart';
import '../../../../../core/model/home_search_result.dart';
import '../../../../../core/service/request/search_request.dart';
import '../../../../shared/app_theme.dart';
import '../../../../shared/image_asset.dart';
import '../../../../shared/math_compute.dart';
import '../../../../widgets/highlight_str_in_text.dart';
import '../../../../widgets/user_level.dart';
import 'search_logic.dart';

class SearchScreen extends StatefulWidget {
  static const String routeName = "/home/search";

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen>
    with TickerProviderStateMixin {
  final logic = Get.find<SearchLogic>();
  final state = Get.find<SearchLogic>().state;

  ///TabBar和subTabBar
  late TabController _mainTabController;
  late TabController _subTabController;

  @override
  void initState() {
    _mainTabController = TabController(length: 6, vsync: this);
    _subTabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _mainTabController.dispose();
    _subTabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetBuilder<SearchLogic>(builder: (logic) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8).r,
            child: Column(
              children: [
                buildSearchTextField(),
                5.verticalSpace,

                ///显示热搜还是搜索的结果
                state.showResult == true
                    ? buildSearchResult()
                    : buildSearchRecommend(),
              ],
            ),
          ),
        );
      }),
    );
  }

  ///搜索框
  Widget buildSearchTextField() {
    return SizedBox(
      height: 50.h,
      width: 1.sw,
      child: Row(
        children: [
          Expanded(
            child: TextField(
              autofocus: true,
              controller: state.textEditingController,
              cursorColor: HYAppTheme.norMainThemeColors,
              cursorHeight: 18.sp,
              focusNode: state.focusNode,
              style: TextStyle(
                  color: Colors.black, fontSize: 14.sp),
              decoration: InputDecoration(
                hintText: "搜索视频、番剧或up主",
                hintStyle: TextStyle(
                    color: HYAppTheme.norGrayColor.withOpacity(.6),
                    fontSize: 12.sp),
                isCollapsed: true,
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 15).r,
                filled: true,
                fillColor: HYAppTheme.norGrayColor.withOpacity(.15),
                prefixIcon: Image.asset(
                  ImageAssets.searchCustomPNG,
                ),
                suffixIcon: GestureDetector(
                  onTap: () {
                    setState(() {
                      ///清空搜索内容
                      state.textEditingController.clear();
                      logic.getFocusFunction(context);
                    });
                  },
                  child: Image.asset(
                    ImageAssets.clearSearchPNG,
                  ),
                ),
                prefixIconConstraints: BoxConstraints(
                    maxHeight: 16.sp, minWidth: 50.w),
                suffixIconConstraints: BoxConstraints(
                    maxHeight: 14.sp, minWidth: 50.w),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.all(const Radius.circular(50).r),
                ),
              ),
              onSubmitted: (inputText) {
                if (inputText.isEmpty) {
                  SmartDialog.showToast("搜索内容不能为空");
                } else {
                  logic.finishInputAndStartSearch(inputText);
                }
              },
              onChanged: (inputText) {
                if (inputText.isNotEmpty) {
                  ///根据输入的关键词返回包含相关关键词
                  HYSearchRequest.getSearchKeywordRecommendData(inputText).then(
                    (value) {
                      ///若查询出结果
                      if (value.result != null) {
                        SmartDialog.dismiss();
                        SmartDialog.show(
                          useAnimation: false,
                          maskWidget: Container(),
                          builder: (ctx) {
                            return Container(
                              height: 1.sh - 70.h,
                              width: 1.sw,
                              color: Colors.black.withOpacity(.3),
                              alignment: Alignment.topCenter,
                              child: Container(
                                height: 0.5.sh,
                                color: Colors.white,
                                child: ListView.separated(
                                  shrinkWrap: true,
                                  itemBuilder: (ctx, index) {
                                    String searchItemText =
                                        value.result!.tag[index].name;
                                    return GestureDetector(
                                      onTap: () {
                                        logic.finishInputAndStartSearch(
                                            searchItemText);
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.only(
                                                bottom: 5, left: 20)
                                            .r,
                                        child: HYHighlightStrInText(
                                          originalColor: Colors.black,
                                          highlightColor:
                                              HYAppTheme.norMainThemeColors,
                                          highlightText: inputText,
                                          originalText:
                                              value.result!.tag[index].name,
                                        ),
                                      ),
                                    );
                                  },
                                  separatorBuilder: (ctx, index) {
                                    return Container(
                                      padding: const EdgeInsets.symmetric(
                                              horizontal: 20)
                                          .r,
                                      child: const Divider(),
                                    );
                                  },
                                  itemCount: value.result!.tag.length,
                                ),
                              ),
                            );
                          },
                          alignment: Alignment.bottomCenter,
                        );
                      } else {
                        SmartDialog.dismiss();
                      }
                    },
                  );
                }
              },
            ),
          ),
          10.horizontalSpace,
          GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Text(
              "取消",
              style: TextStyle(
                color: Colors.black,
                fontSize: 14.sp,
              ),
            ),
          )
        ],
      ),
    );
  }

  ///推荐搜索的关键词
  Widget buildSearchRecommend() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10).r,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ///b站热搜
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                SR.hotKeys.tr,
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  color: Colors.black,
                  fontSize: 14.sp,
                ),
              ),
              Text(
                SR.entireRanking.tr,
                style: TextStyle(
                  color: HYAppTheme.norGrayColor,
                  fontSize: 12.sp,
                ),
              ),
            ],
          ),

          ///热搜列表
          15.verticalSpace,
          state.trendingList.isNotEmpty
              ? GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200.w,
                    mainAxisExtent: 20.h,
                    mainAxisSpacing: 15.r,
                    crossAxisSpacing: 15.r,
                  ),
                  itemBuilder: (ctx, index) {
                    String searchItemText = state.trendingList[index].showName!;
                    return GestureDetector(
                      onTap: () {
                        logic.finishInputAndStartSearch(searchItemText);
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                            child: Text(
                              noMoreN(searchItemText, 10),
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12.sp,
                              ),
                            ),
                          ),
                          5.horizontalSpace,
                          state.trendingList[index].icon == null
                              ? Container()
                              : Image.network(
                                  state.trendingList[index].icon!,
                                  width: 15.r,
                                  height: 15.r,
                                ),
                        ],
                      ),
                    );
                  },
                  itemCount: state.trendingList.length,
                )
              : SizedBox(
                  height: 200.h,
                  child: Center(
                    child: SizedBox(
                      width: 30.r,
                      height: 30.r,
                      child: const CircularProgressIndicator(
                        color: HYAppTheme.norMainThemeColors,
                      ),
                    ),
                  ),
                )
        ],
      ),
    );
  }

  ///搜索结果
  Widget buildSearchResult() {
    List<Widget> mainTabs = [];
    List<Widget> subTabs = [];
    List<SearchResultDataItem> items = state.searchResult.data.item!;

    mainTabs.add(Tab(text: SR.synthesis.tr, height: 30.h));
    for (var item in state.searchResult.data.nav) {
      String num = item.total > 99 ? "99+" : item.total.toString();
      item.total > 0
          ? mainTabs.add(Tab(text: "${item.name}($num)", height: 30.h))
          : mainTabs.add(Tab(text: item.name, height: 30.h));
    }
    subTabs.add(Tab(text: SR.defaultOrder.tr, height: 40.h));
    subTabs.add(Tab(text: SR.newestPublish.tr, height: 40.h));
    subTabs.add(Tab(text: SR.highVideoPlay.tr, height: 40.h));
    subTabs.add(Tab(text: SR.highDanmaku.tr, height: 40.h));

    ///头部的（综合番剧用户直播影视）分类；（默认排序新发布播放多弹幕多）子分类
    ///主分类
    ///次分类
    List<Widget> staggeredGridChildren = [
      TabBar(
        tabs: mainTabs,
        controller: _mainTabController,
        indicatorColor: HYAppTheme.norMainThemeColors,
        unselectedLabelColor: HYAppTheme.unselectedLabelColor,
        labelColor: HYAppTheme.norMainThemeColors,
        indicatorSize: TabBarIndicatorSize.label,
        labelStyle: const TextStyle(fontWeight: FontWeight.bold, fontFamily: 'BilibiliFonts'),
        unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.normal, fontFamily: 'BilibiliFonts'),
        indicatorWeight: 2.h,
        isScrollable: true,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 0.7.sw,
            child: TabBar(
              tabs: subTabs,
              indicator: const BoxDecoration(),
              controller: _subTabController,
              indicatorColor: HYAppTheme.norMainThemeColors,
              unselectedLabelColor: HYAppTheme.unselectedLabelColor,
              labelColor: HYAppTheme.norMainThemeColors,
              indicatorSize: TabBarIndicatorSize.label,
              labelStyle: TextStyle(fontSize: 12.sp, fontFamily: 'BilibiliFonts'),
              unselectedLabelStyle:
                  TextStyle(fontSize: 12.sp, fontFamily: 'BilibiliFonts'),
              labelPadding: EdgeInsets.zero,
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 1.w,
                height: 15.h,
                color: HYAppTheme.norGrayColor.withOpacity(.5),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.r),
                child: Text(
                  SR.filter.tr,
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                      color: HYAppTheme.norGrayColor,
                      fontSize: 12.sp),
                ),
              ),
              Image.asset(
                ImageAssets.icFilterPNG,
                width: 12.sp,
                height: 12.sp,
              ),
            ],
          )
        ],
      ),
    ];

    ///搜索结果数据
    for (var item in items) {
      Widget child;
      if (item.linktype == "live") {
        ///直播类型的数据
        child = GestureDetector(
          onTap: () {
            // Navigator.of(context).pushNamed(HYLiveRoomPlayScreen.routeName,
            //     arguments: item.roomid!);
          },
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 15.r),
            decoration: BoxDecoration(
                border: BorderDirectional(
                    bottom: BorderSide(
                        color: HYAppTheme.norGrayColor.withOpacity(.1)))),
            child: Row(
              children: [
                ///封面
                Stack(
                  children: [
                    SizedBox(
                      width: 150.w,
                      height: 90.h,
                      child: ClipRRect(
                        borderRadius:
                            BorderRadius.all(const Radius.circular(4).r),
                        child: FadeInImage(
                          fit: BoxFit.fill,
                          placeholderFit: BoxFit.fill,
                          placeholder:
                              AssetImage(ImageAssets.icUpperVideoDefaultPNG),
                          image: NetworkImage(
                            item.cover,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      right: 5.w,
                      top: 5.h,
                      child: Container(
                        decoration: BoxDecoration(
                            color: HYAppTheme.norMainThemeColors,
                            borderRadius:
                                BorderRadius.all(const Radius.circular(3).r)),
                        padding: const EdgeInsets.symmetric(horizontal: 3).r,
                        child: Text(
                          item.badge!,
                          style: TextStyle(
                            fontSize: 10.sp,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                10.horizontalSpace,

                ///右侧视频信息
                Expanded(
                  child: SizedBox(
                    height: 90.h,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.title,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 12.sp),
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset(
                                  ImageAssets.upGrayPNG,
                                  width: 12.sp,
                                  height: 12.sp,
                                ),
                                5.horizontalSpace,
                                Text(
                                  item.author != null
                                      ? item.author!
                                      : item.name!,
                                  style: TextStyle(
                                    color: HYAppTheme.norGrayColor,
                                    fontSize: 12.sp,
                                  ),
                                ),
                              ],
                            ),
                            4.verticalSpace,
                            item.online != null
                                ? Row(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Image.asset(ImageAssets.viewGrayPNG,
                                          width: 12.sp,
                                          height: 12.sp),
                                      5.horizontalSpace,
                                      Text(
                                        changeToWan(item.online!),
                                        style: TextStyle(
                                          fontSize: 10.sp,
                                          color: HYAppTheme.norGrayColor,
                                        ),
                                      ),
                                    ],
                                  )
                                : Container()
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      } else if (item.linktype == "channel") {
        ///频道类型的数据
        child = Container(
          padding: EdgeInsets.symmetric(vertical: 15.r),
          decoration: BoxDecoration(
              border: BorderDirectional(
                  bottom: BorderSide(
                      color: HYAppTheme.norGrayColor.withOpacity(.1)))),
          child: Column(
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.all(const Radius.circular(3).r),
                    child: Image.network(
                      item.cover,
                      width: 43.r,
                      height: 43.r,
                    ),
                  ),
                  10.horizontalSpace,
                  Expanded(
                    child: SizedBox(
                      height: 43.r,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                item.title,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12.sp,
                                ),
                              ),
                              5.horizontalSpace,
                              Image.network(
                                item.typeIcon!,
                                width: 12.sp,
                                height: 12.sp,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                item.channelLabel1!.text,
                                style: TextStyle(
                                  color: HYAppTheme.norMainThemeColors,
                                  fontSize: 10.sp,
                                ),
                              ),
                              10.horizontalSpace,
                              Text(
                                item.channelLabel2!.text,
                                style: TextStyle(
                                  color: HYAppTheme.norMainThemeColors,
                                  fontSize: 10.sp,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 2, horizontal: 4)
                            .r,
                    decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.all(const Radius.circular(3).r),
                        border: Border.all(
                            color: HYAppTheme.norMainThemeColors, width: 1.r)),
                    child: Text(
                      item.channelButton!.text,
                      style: TextStyle(
                        color: HYAppTheme.norMainThemeColors,
                        fontSize: 12.sp,
                      ),
                    ),
                  ),
                  15.horizontalSpace,
                ],
              ),
              15.verticalSpace,
              item.items![0].goto! == "av"
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        buildChannelVideo(item, 0),
                        buildChannelVideo(item, 1),
                        buildChannelVideo(item, 2),
                      ],
                    )
                  : GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 70.r,
                        mainAxisSpacing: 10.r,
                      ),
                      itemBuilder: (ctx, i) {
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ClipRRect(
                              borderRadius:
                                  BorderRadius.all(const Radius.circular(3).r),
                              child: Image.network(
                                item.items![i].cover!,
                                width: 35.r,
                                height: 35.r,
                              ),
                            ),
                            5.verticalSpace,
                            Text(
                              item.items![i].title!,
                              style: TextStyle(
                                fontSize: 12.sp,
                              ),
                            ),
                          ],
                        );
                      },
                      itemCount: item.items!.length,
                    ),
            ],
          ),
        );
      } else if (item.linktype == "app_user") {
        ///用户
        child = Container(
          padding: EdgeInsets.symmetric(vertical: 15.r),
          decoration: BoxDecoration(
              border: BorderDirectional(
                  bottom: BorderSide(
                      color: HYAppTheme.norGrayColor.withOpacity(.1)))),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.only(
                            left: 4, top: 4, bottom: 4, right: 8)
                        .r,
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(item.cover),
                      radius: 22.r,
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              item.title,
                              style: TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.bold,
                                  color: HYAppTheme.norMainThemeColors),
                            ),
                            4.horizontalSpace,
                            UserLevel(level: item.level!)
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "粉丝:${changeToWan(item.fans!)}   视频:${changeToWan(item.archives!)}",
                              style: TextStyle(
                                fontSize: 12.sp,
                                color: HYAppTheme.norGrayColor,
                              ),
                            )
                          ],
                        ),
                        item.officialVerify!.desc != null
                            ? Text(
                                item.officialVerify!.desc!,
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  color: HYAppTheme.norGrayColor,
                                ),
                              )
                            : Container()
                      ],
                    ),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 2)
                            .r,
                    child: Text(
                      "+关注",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.sp,
                      ),
                    ),
                  ),
                  Image.asset(
                    ImageAssets.videoMoreCustomPNG,
                    width: 16.sp,
                    height: 16.sp,
                  ),
                ],
              ),
              15.verticalSpace,

              ///前三个视频
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildAppUserVideo(item, 0),
                  buildAppUserVideo(item, 1),
                  buildAppUserVideo(item, 2),
                ],
              ),
              15.verticalSpace,
              Text(
                "查看全部${item.archives}个视频>",
                style: TextStyle(
                  color: HYAppTheme.norMainThemeColors,
                  fontSize: 12.sp,
                ),
              ),
            ],
          ),
        );
      } else if (item.linktype == "esports") {
        ///赛事
        child = Container(
          padding: const EdgeInsets.only(bottom: 15, left: 5, right: 5).r,
          decoration: BoxDecoration(
              border: BorderDirectional(
                  bottom: BorderSide(
                      color: HYAppTheme.norGrayColor.withOpacity(.3)))),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                color: HYAppTheme.norBlue03Colors,
                width: 1.sw,
                height: 40.h,
                padding: const EdgeInsets.only(
                        left: 15, right: 10, top: 4, bottom: 4)
                    .r,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 4.r),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.network(
                            item.cover,
                            width: 40.r,
                            height: 40.r,
                            fit: BoxFit.cover,
                          ),
                          Text(
                            item.title,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.transparent,
                          border: Border.all(color: Colors.white),
                          borderRadius:
                              BorderRadius.all(const Radius.circular(4).r)),
                      padding: EdgeInsets.symmetric(horizontal: 3.r),
                      child: Text(
                        "赛事专题>",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12.sp,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              10.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      15.verticalSpace,
                      Image.network(
                        item.items![0].team1!.cover,
                        width: 45.r,
                        height: 45.r,
                      ),
                      25.verticalSpace,
                      Text(
                        item.items![0].team1!.title,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12.sp,
                        ),
                      )
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        item.items![0].matchStage!,
                        style: TextStyle(
                          fontSize: 10.sp,
                        ),
                      ),
                      10.verticalSpace,
                      Text(
                        "${item.items![0].team1!.score ?? "0"} : ${item.items![0].team2!.score ?? "0"}",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 32.sp,
                        ),
                      ),
                      5.verticalSpace,
                      item.items![0].matchLabel != null
                          ? Text(
                              item.items![0].matchLabel!.text,
                              style: TextStyle(
                                color: HYAppTheme.norMainThemeColors,
                                fontSize: 10.sp,
                              ),
                            )
                          : Container(),
                      5.verticalSpace,
                      Container(
                        padding: const EdgeInsets.symmetric(
                                vertical: 4, horizontal: 8)
                            .r,
                        decoration: BoxDecoration(
                            color: HYAppTheme.norMainThemeColors,
                            borderRadius:
                                BorderRadius.all(const Radius.circular(4).r)),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.asset(
                              ImageAssets.onlinePNG,
                              width: 10.sp,
                              height: 10.sp,
                            ),
                            4.horizontalSpace,
                            Text(
                              item.items![0].matchButton!.text,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14.sp,
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      15.verticalSpace,
                      Image.network(
                        item.items![0].team2!.cover,
                        width: 45.r,
                        height: 45.r,
                      ),
                      25.verticalSpace,
                      Text(
                        item.items![0].team2!.title,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12.sp,
                        ),
                      )
                    ],
                  ),
                ],
              ),
              10.verticalSpace,
              Divider(
                color: HYAppTheme.norGrayColor.withOpacity(.3),
              ),
              10.verticalSpace,
              buildESportsRow(item, 1),
              15.verticalSpace,
              buildESportsRow(item, 2),
              20.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildESportsBottomButton("全部赛事"),
                  buildESportsBottomButton("赛事视频"),
                  buildESportsBottomButton("征稿活动"),
                  buildESportsBottomButton("赛事话题"),
                ],
              ),
            ],
          ),
        );
      } else if (item.linktype == "video") {
        ///video视频类的数据
        child = GestureDetector(
          onTap: () {
            ///播放视频需要接受grpc型数据
            ///数据类型不符合，先放着
          },
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 10.r, horizontal: 5.r),
            decoration: BoxDecoration(
                border: BorderDirectional(
                    bottom: BorderSide(
                        color: HYAppTheme.norGrayColor.withOpacity(.1)))),
            child: Row(
              children: [
                ///封面
                Stack(
                  children: [
                    SizedBox(
                      width: 150.w,
                      height: 90.h,
                      child: ClipRRect(
                        borderRadius:
                            BorderRadius.all(const Radius.circular(4).r),
                        child: FadeInImage(
                          fit: BoxFit.fill,
                          placeholderFit: BoxFit.fill,
                          placeholder:
                              AssetImage(ImageAssets.icUpperVideoDefaultPNG),
                          image: NetworkImage(
                            item.cover,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      right: 5.w,
                      bottom: 5.h,
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.black.withOpacity(.6),
                            borderRadius:
                                BorderRadius.all(const Radius.circular(3).r)),
                        padding: const EdgeInsets.symmetric(horizontal: 3).r,
                        child: Text(
                          item.duration!,
                          style: TextStyle(
                            fontSize: 10.sp,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                10.horizontalSpace,

                ///右侧视频信息
                Expanded(
                  child: SizedBox(
                    height: 90.h,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        HYHighlightStrInText(
                          originalText: item.title,
                          highlightText: state.searchKeywordText,
                          highlightColor: HYAppTheme.norMainThemeColors,
                          originalColor: Colors.black,
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Image.asset(
                                  ImageAssets.upGrayPNG,
                                  width: 12.sp,
                                  height: 12.sp,
                                ),
                                5.horizontalSpace,
                                Text(
                                  item.author!,
                                  style: TextStyle(
                                    color: HYAppTheme.norGrayColor,
                                    fontSize: 12.sp,
                                  ),
                                ),
                              ],
                            ),
                            2.verticalSpace,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Image.asset(ImageAssets.iconListPlayerPNG,
                                        width: 12.sp,
                                        height: 12.sp),
                                    5.horizontalSpace,
                                    Text(
                                      "${changeToWan(item.play!)}${item.showCardDesc2}",
                                      style: TextStyle(
                                        fontSize: 10.sp,
                                        color: HYAppTheme.norGrayColor,
                                      ),
                                    ),
                                  ],
                                ),
                                Image.asset(ImageAssets.videoMoreCustomPNG,
                                    width: 12.sp,
                                    height: 12.sp),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      } else if (item.linktype == "bgm_media") {
        List<Widget> rowChildren = [];
        if (item.episodesNew!.length > 6) {
          for (int i = 0; i < 6; i++) {
            Widget child;
            if (i == 0 || i == 1) {
              child = buildNumberContainer(i.toString());
            } else if (i == 3) {
              child = buildNumberContainer(
                  (item.episodesNew!.length - 3).toString());
            } else if (i == 4) {
              child = buildNumberContainer(
                  (item.episodesNew!.length - 2).toString());
            } else if (i == 5) {
              child = buildNumberContainer(
                  (item.episodesNew!.length - 1).toString());
            } else {
              child = buildNumberContainer("...");
            }
            rowChildren.add(child);
          }
        } else {
          for (var i in item.episodesNew!) {
            rowChildren.add(buildNumberContainer(i.title));
          }
        }

        ///番剧
        child = Container(
          padding: EdgeInsets.symmetric(vertical: 15.r),
          decoration: BoxDecoration(
              border: BorderDirectional(
                  bottom: BorderSide(
                      color: HYAppTheme.norGrayColor.withOpacity(.1)))),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.all(const Radius.circular(4).r),
                    child: Image.network(
                      item.cover,
                      width: 90.w,
                      height: 120.h,
                      fit: BoxFit.contain,
                    ),
                  ),
                  10.horizontalSpace,
                  Expanded(
                    child: SizedBox(
                      height: 120.h,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item.title,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                              Text(
                                item.styles!,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: 12.sp,
                                    color: HYAppTheme.norGrayColor),
                              ),
                              Text(
                                item.style!,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: 12.sp,
                                    color: HYAppTheme.norGrayColor),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                        width: 1.r,
                                        color: HYAppTheme.norMainThemeColors),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(3.r))),
                                padding: const EdgeInsets.symmetric(
                                        horizontal: 6, vertical: 2)
                                    .r,
                                child: Text(
                                  item.watchButton!.title,
                                  style: TextStyle(
                                      fontSize: 14.sp,
                                      color: HYAppTheme.norMainThemeColors),
                                ),
                              ),
                              10.horizontalSpace,
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(3.r)),
                                  color: HYAppTheme.norMainThemeColors,
                                ),
                                padding: const EdgeInsets.symmetric(
                                        horizontal: 6, vertical: 2)
                                    .r,
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Image.network(
                                      item.followButton!.icon,
                                      width: 14.sp,
                                      height: 14.sp,
                                    ),
                                    Text(
                                      item.followButton!.texts["0"]!,
                                      style: TextStyle(
                                          fontSize: 14.sp,
                                          color: Colors.white),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: item.rating.toString(),
                              style: TextStyle(
                                  fontSize: 18.sp,
                                  color: HYAppTheme.norYellow02Colors),
                            ),
                            TextSpan(
                              text: "分",
                              style: TextStyle(
                                  fontSize: 12.sp,
                                  color: HYAppTheme.norYellow02Colors),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        "${item.vote}人",
                        style: TextStyle(
                            fontSize: 10.sp,
                            color: HYAppTheme.norGrayColor),
                      ),
                    ],
                  )
                ],
              ),
              10.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: rowChildren,
              ),
            ],
          ),
        );
      } else {
        return Container();
      }
      staggeredGridChildren.add(child);
    }
    return Expanded(
      child: EasyRefresh(
        child: StaggeredGrid.count(
          crossAxisCount: 1,
          children: staggeredGridChildren,
        ),
      ),
    );
  }

  Widget buildAppUserVideo(SearchResultDataItem item, int position) {
    return Container(
      width: 108.w,
      height: 130.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(const Radius.circular(3).r)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ///封面
          Stack(
            children: [
              SizedBox(
                width: 108.w,
                height: 70.h,
                child: ClipRRect(
                  borderRadius: BorderRadius.all(const Radius.circular(4).r),
                  child: FadeInImage(
                    fit: BoxFit.fill,
                    placeholderFit: BoxFit.fill,
                    placeholder: AssetImage(ImageAssets.icUpperVideoDefaultPNG),
                    image: NetworkImage(
                      item.avItems![position].cover,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 5.w,
                bottom: 5.h,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(ImageAssets.icPlayVideoWhitePNG,
                        width: 14.sp,
                        height: 14.sp),
                    3.horizontalSpace,
                    Text(
                      changeToWan(item.avItems![position].play),
                      style: TextStyle(
                        fontSize: 10.sp,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          ///标题
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 5).r,
            child: Text(
              item.avItems![position].title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Colors.black,
                fontSize: 10.sp,
              ),
            ),
          ),

          ///发布时间
          Text(
            item.avItems![position].ctimeLabel,
            style: TextStyle(
              color: HYAppTheme.norGrayColor,
              fontSize: 10.sp,
            ),
          )
        ],
      ),
    );
  }

  Widget buildChannelVideo(SearchResultDataItem item, int position) {
    return Container(
      width: 108.w,
      height: 115.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(const Radius.circular(3).r)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ///封面
          Stack(
            children: [
              SizedBox(
                width: 108.w,
                height: 70.h,
                child: ClipRRect(
                  borderRadius: BorderRadius.all(const Radius.circular(4).r),
                  child: FadeInImage(
                    fit: BoxFit.fill,
                    placeholderFit: BoxFit.fill,
                    placeholder: AssetImage(ImageAssets.icUpperVideoDefaultPNG),
                    image: NetworkImage(
                      item.items![position].cover!,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 5.w,
                bottom: 5.h,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(ImageAssets.icPlayVideoWhitePNG,
                        width: 14.sp,
                        height: 14.sp),
                    3.horizontalSpace,
                    Text(
                      item.items![position].coverLeftText1!,
                      style: TextStyle(
                        fontSize: 10.sp,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          ///标题
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 5).r,
            child: Text(
              item.items![position].title!,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Colors.black,
                fontSize: 10.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }

  ///第2,3条赛事
  Widget buildESportsRow(SearchResultDataItem item, int index) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          item.items![index].matchTime!.text,
          style: TextStyle(
            fontSize: 12.sp,
          ),
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(noMoreN(item.items![index].team1!.title, 5),
                style: TextStyle(
                  fontSize: 12.sp,
                )),
            20.horizontalSpace,
            Text("VS",
                style: TextStyle(
                  fontSize: 12.sp,
                  color: HYAppTheme.norGrayColor,
                )),
            20.horizontalSpace,
            Text(
              noMoreN(item.items![index].team2!.title, 5),
              style: TextStyle(
                fontSize: 12.sp,
              ),
            ),
          ],
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20.r, vertical: 3.r),
          decoration: BoxDecoration(
              border: Border.all(
                color: HYAppTheme.norMainThemeColors,
              ),
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(4.r))),
          child: Text(
            item.items![index].matchButton!.text,
            style: TextStyle(
              color: HYAppTheme.norMainThemeColors,
              fontSize: 12.sp,
            ),
          ),
        ),
      ],
    );
  }

  ///全部赛事、赛事视频、征稿活动、赛事话题
  Widget buildESportsBottomButton(String title) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 4).r,
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: HYAppTheme.norGrayColor.withOpacity(.3))),
      child: Text(
        title,
        style: TextStyle(
          color: Colors.black,
          fontSize: 12.sp,
        ),
      ),
    );
  }

  Widget buildNumberContainer(String num) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(const Radius.circular(4).r),
          border: Border.all(
            color: HYAppTheme.norGrayColor.withOpacity(.15),
          )),
      alignment: Alignment.center,
      width: 45.r,
      height: 45.r,
      child: Text(num),
    );
  }
}
