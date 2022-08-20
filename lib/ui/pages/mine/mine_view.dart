import 'package:bilibili_getx/ui/pages/scan_login/scan_login_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../core/I18n/str_res_keys.dart';
import '../../../core/model/account_mine.dart';
import '../../shared/app_theme.dart';
import '../../shared/image_asset.dart';
import '../../widgets/advertising_row.dart';
import '../../widgets/icon_button_row.dart';
import '../../widgets/user_level.dart';
import 'mine_logic.dart';

class MineScreen extends StatelessWidget {
  static const String routeName = "/mine";
  final logic = Get.find<MineLogic>();
  final state = Get.find<MineLogic>().state;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MineLogic>(builder: (logic) {
      return SafeArea(
          child: state.finishLoading == true
              ? Scaffold(
                  appBar: AppBar(
                    backgroundColor: Theme.of(context).primaryColor,
                    elevation: .5,
                    actions: buildMineActions(),
                    bottom: PreferredSize(
                      preferredSize: Size(double.infinity, 200.h),
                      child: Container(
                        padding:
                            const EdgeInsets.only(left: 15, right: 15, top: 25)
                                .r,
                        child: Column(
                          children: [
                            buildMineUserInfoRow(),
                            20.verticalSpace,
                            buildMineUserDetailsRow(),
                            20.verticalSpace,
                            buildMineAppBarFooter(),
                          ],
                        ),
                      ),
                    ),
                  ),
                  body: SingleChildScrollView(child: buildMineContentBody()),
                )
              : Scaffold(
                  body: Center(
                    child: SizedBox(
                      width: 50.r,
                      height: 50.r,
                      child: const CircularProgressIndicator(),
                    ),
                  ),
                ));
    });
  }

  ///按钮列表
  Widget buildMineContentBody() {
    int index = 0;
    List<Widget> widgets = [];
    if (state.isLogin == true) {
      for (var item in state.accountMineData.data.sectionsV2) {
        ///广告B
        if (index == 3 && state.accountMineData.data.liveTip != null) {
          widgets.add(buildMineAdvertisingB());
        }
        if (item.items.length == 1) {
          ///广告A
          widgets.add(buildMineAdvertisingA(item));
        } else {
          ///按钮列表顶部的标题
          item.title != null
              ? widgets.add(
                  buildMineTitleAndButton(
                    item.title!,
                    item.button.icon != null
                        ? Container(
                            decoration: BoxDecoration(
                                color: HYAppTheme.norPink04Colors,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(15.r),
                                )),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 6,
                            ).r,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Image.network(
                                  item.button.icon!,
                                  width: HYAppTheme.xSmallFontSize,
                                  height: HYAppTheme.xSmallFontSize,
                                ),
                                5.verticalSpace,
                                Text(
                                  item.button.text!,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: HYAppTheme.xxSmallFontSize,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          )
                        : Container(),
                  ),
                )
              : Container();

          ///最后一块采用垂直的排布（联系客服、听视频等）
          if (index == state.accountMineData.data.sectionsV2.length - 1) {
            widgets.add(Container(
              margin: const EdgeInsets.symmetric(horizontal: 10).r,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  15.verticalSpace,
                  buildMineMoreServiceItem(
                      item.items[0].icon, item.items[0].title),
                  15.verticalSpace,
                  buildMineMoreServiceItem(
                      item.items[1].icon, item.items[1].title),
                  15.verticalSpace,
                  buildMineMoreServiceItem(
                      item.items[2].icon, item.items[2].title),
                  buildSettingButton(),
                ],
              ),
            ));
          } else {
            ///按钮列表
            widgets.add(Container(
              padding: const EdgeInsets.symmetric(vertical: 15).r,
              child: HYIconButtonRow(
                size: HYAppTheme.normalFontSize,
                items: item.items,
              ),
            ));
          }
        }
        index++;
      }
      return Container(
        padding: const EdgeInsets.all(15).r,
        color: Colors.white,
        child: Column(
          children: widgets,
        ),
      );
    } else {
      ///未登录时
      return Container(
        padding: const EdgeInsets.all(15).r,
        color: Colors.white,
        child: Column(
          children: [
            // buildMineAdvertisingA(accountMineData.data.sectionsV2[0]),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 15).r,
              child: HYIconButtonRow(
                items: state.accountMineData.data.sectionsV2[0].items,
                size: HYAppTheme.normalFontSize,
              ),
            ),
            buildMineTitleAndButton(
                state.accountMineData.data.sectionsV2[1].title!,
                const Center()),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 15).r,
              child: HYIconButtonRow(
                items: state.accountMineData.data.sectionsV2[1].items,
                size: HYAppTheme.normalFontSize,
              ),
            ),
            buildMineTitleAndButton(
                state.accountMineData.data.sectionsV2[2].title!,
                const Center()),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10).r,
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 15).r,
                    child: buildMineMoreServiceItem(
                        state.accountMineData.data.sectionsV2[2].items[0].icon,
                        state
                            .accountMineData.data.sectionsV2[2].items[0].title),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 15).r,
                    child: buildMineMoreServiceItem(
                        state.accountMineData.data.sectionsV2[2].items[1].icon,
                        state
                            .accountMineData.data.sectionsV2[2].items[1].title),
                  ),
                  buildSettingButton(),
                ],
              ),
            ),
          ],
        ),
      );
    }
  }

  ///设置按钮
  Widget buildSettingButton() {
    return GestureDetector(
      onTap: () {
        ///跳转至设置界面
        // Get.toNamed(HYSettingScreen.routeName);
      },
      child: Container(
        margin: const EdgeInsets.only(top: 15).r,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  ImageAssets.settingPNG,
                  width: HYAppTheme.smallFontSize,
                  height: HYAppTheme.smallFontSize,
                  color: HYAppTheme.norMainThemeColors,
                ),
                10.horizontalSpace,
                Text(
                  "设置",
                  style: TextStyle(
                      fontSize: HYAppTheme.smallFontSize,
                      color: HYAppTheme.norTextColors),
                ),
              ],
            ),
            Icon(
              Icons.arrow_forward_ios,
              size: HYAppTheme.xxSmallFontSize,
              color: HYAppTheme.norGrayColor,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildMineMoreServiceItem(String icon, String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.network(
              icon,
              width: HYAppTheme.smallFontSize,
              height: HYAppTheme.smallFontSize,
              color: HYAppTheme.norMainThemeColors,
            ),
            10.horizontalSpace,
            Text(
              text,
              style: TextStyle(
                  fontSize: HYAppTheme.smallFontSize,
                  color: HYAppTheme.norTextColors),
            ),
          ],
        ),
        Icon(
          Icons.arrow_forward_ios,
          size: HYAppTheme.xxSmallFontSize,
          color: HYAppTheme.norGrayColor,
        ),
      ],
    );
  }

  scan() async {
    var status = await Permission.camera.request();
    if (status.isGranted) {
      Get.toNamed(ScanLoginScreen.routeName);
    }
  }

  List<Widget> buildMineActions() {
    return [
      IconButton(
          onPressed: () => print("bilibili_connect"),
          icon: Image.asset(
            ImageAssets.bilibiliConnectPNG,
            width: HYAppTheme.commonFontSize,
            height: HYAppTheme.commonFontSize,
            color: HYAppTheme.norGrayColor,
          )),
      IconButton(
          onPressed: () {
            scan();
          },
          icon: Image.asset(
            ImageAssets.scanPNG,
            width: HYAppTheme.commonFontSize,
            height: HYAppTheme.commonFontSize,
            color: HYAppTheme.norGrayColor,
          )),
      IconButton(
          onPressed: () => print("clothes"),
          icon: Image.network(
            state.accountMineData.data.mallHome.icon,
            width: HYAppTheme.commonFontSize,
            height: HYAppTheme.commonFontSize,
            color: HYAppTheme.norGrayColor,
          )),
      IconButton(
          onPressed: () => print("dark_model"),
          icon: Image.asset(
            ImageAssets.darkModelPNG,
            width: HYAppTheme.commonFontSize,
            height: HYAppTheme.commonFontSize,
            color: HYAppTheme.norGrayColor,
          )),
    ];
  }

  ///用户的粉丝数、动态数、关注数
  Widget buildMineUserDetailsRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        buildUserInfo(
            state.isLogin == false
                ? "—"
                : state.accountMineData.data.dataDynamic.toString(),
            SR.dynamic),
        Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Container(
              child: buildUserInfo(
                  state.isLogin == false
                      ? "—"
                      : state.accountMineData.data.following.toString(),
                  SR.follower),
            ),
            Container(
              height: 20.h,
              padding: const EdgeInsets.symmetric(horizontal: 60).r,
              decoration: BoxDecoration(
                  border: Border.symmetric(vertical: BorderSide(width: .2.w))),
            ),
          ],
        ),
        buildUserInfo(
            state.isLogin == false
                ? "—"
                : state.accountMineData.data.follower.toString(),
            SR.fan),
      ],
    );
  }

  Widget buildUserInfo(String num, String text) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          num,
          style: TextStyle(
              color: HYAppTheme.norTextColors,
              fontSize: HYAppTheme.xSmallFontSize),
        ),
        Text(
          text.tr,
          style: TextStyle(
              color: HYAppTheme.norGrayColor,
              fontSize: HYAppTheme.xxSmallFontSize),
        ),
      ],
    );
  }

  Widget buildMineUserInfoRow() {
    return state.isLogin == true
        ? Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 50.r,
                width: 50.r,
                child: CircleAvatar(
                  backgroundImage:
                      NetworkImage(state.accountMineData.data.face),
                ),
              ),
              20.horizontalSpace,
              Expanded(
                child: Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              state.accountMineData.data.name,
                              style: TextStyle(
                                  color: HYAppTheme.norTextColors,
                                  fontSize: HYAppTheme.smallFontSize),
                            ),
                            5.horizontalSpace,
                            UserLevel(level: state.accountMineData.data.level)
                          ],
                        ),
                        5.verticalSpace,
                        Container(
                          padding: const EdgeInsets.symmetric(
                                  horizontal: 2, vertical: 0)
                              .r,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: HYAppTheme.norMainThemeColors),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(3.r))),
                          child: Text(
                            "正式会员",
                            style: TextStyle(
                                color: HYAppTheme.norMainThemeColors,
                                fontSize: HYAppTheme.xxxSmallFontSize),
                          ),
                        ),
                        5.verticalSpace,
                        Text(
                          "${SR.bCoin.tr}: ${state.accountMineData.data.bcoin}   ${SR.coin.tr}: ${state.accountMineData.data.coin}",
                          style: TextStyle(
                              color: HYAppTheme.norGrayColor,
                              fontSize: HYAppTheme.xxSmallFontSize),
                        )
                      ],
                    ),
                    Positioned(
                      right: 0,
                      top: 0,
                      bottom: 0,
                      child: Row(
                        children: [
                          Text(
                            SR.space.tr,
                            style: TextStyle(
                                color: HYAppTheme.norGrayColor,
                                fontSize: HYAppTheme.xxSmallFontSize),
                          ),
                          5.horizontalSpace,
                          Icon(
                            Icons.arrow_forward_ios,
                            size: HYAppTheme.xxSmallFontSize,
                            color: HYAppTheme.norGrayColor,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        : Row(
            children: [
              10.horizontalSpace,
              Opacity(
                opacity: .8,
                child: CircleAvatar(
                  radius: 25.r,
                  backgroundColor: HYAppTheme.norWhite01Color,
                  child: Image.asset(ImageAssets.unLoginPNG),
                ),
              ),
              20.horizontalSpace,
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      SR.click2Login.tr.toUpperCase(),
                      style: TextStyle(
                          fontSize: HYAppTheme.xSmallFontSize,
                          color: HYAppTheme.norTextColors,
                          fontWeight: FontWeight.bold),
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: HYAppTheme.xxSmallFontSize,
                      color: HYAppTheme.norGrayColor,
                    )
                  ],
                ),
              ),
            ],
          );
  }

  Widget buildMineAppBarFooter() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15).r,
      decoration: BoxDecoration(
        color: HYAppTheme.norWhite03Color,
        borderRadius: BorderRadius.vertical(top: Radius.circular(4.r)),
        border: Border.all(color: HYAppTheme.norPink05Colors, width: .5.w),
      ),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                state.accountMineData.data.vipSectionV2.title,
                style: TextStyle(
                    color: HYAppTheme.norPink06Colors,
                    fontSize: HYAppTheme.smallFontSize),
              ),
              Text(
                state.accountMineData.data.vipSectionV2.desc,
                style: TextStyle(
                    color: HYAppTheme.norPink06Colors,
                    fontSize: HYAppTheme.xxSmallFontSize),
              )
            ],
          ),
          Positioned(
            right: 0,
            top: 0,
            bottom: 0,
            child: Icon(
              Icons.arrow_forward_ios,
              size: HYAppTheme.xxSmallFontSize,
              color: HYAppTheme.norPink08Colors,
            ),
          )
        ],
      ),
    );
  }

  ///广告栏A
  Widget buildMineAdvertisingA(SectionsV2 sectionsV2) {
    return AdvertisingRow(
      image: sectionsV2.items[0].commonOpItem!.titleIcon!,
      title: sectionsV2.items[0].commonOpItem!.title!,
      rightBtn: Icon(
        Icons.close,
        size: HYAppTheme.normalFontSize,
        color: HYAppTheme.norGrayColor,
      ),
    );
  }

  ///广告栏B
  Widget buildMineAdvertisingB() {
    return AdvertisingRow(
      image: state.accountMineData.data.liveTip!.icon,
      title: state.accountMineData.data.liveTip!.text,
      rightBtn: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            state.accountMineData.data.liveTip!.buttonText,
            style: TextStyle(
              color: HYAppTheme.norMainThemeColors,
              fontSize: HYAppTheme.xxSmallFontSize,
            ),
          ),
          state.accountMineData.data.liveTip!.buttonIcon.isEmpty
              ? Container()
              : SizedBox(
                  width: HYAppTheme.xxSmallFontSize,
                  height: HYAppTheme.xxSmallFontSize,
                  child: Image.network(
                    state.accountMineData.data.liveTip!.buttonIcon,
                  ),
                )
        ],
      ),
    );
  }

  Widget buildMineTitleAndButton(String title, Widget button) {
    return Container(
      padding: const EdgeInsets.only(top: 5, bottom: 0, left: 10, right: 5).r,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
                color: HYAppTheme.norTextColors,
                fontSize: HYAppTheme.xSmallFontSize,
                fontWeight: FontWeight.bold),
          ),
          button
        ],
      ),
    );
  }
}
