import 'package:bilibili_getx/ui/shared/app_theme.dart';
import 'package:bilibili_getx/ui/shared/image_asset.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'wechat_mine_logic.dart';

class WechatMineView extends StatefulWidget {
  @override
  State<WechatMineView> createState() => _WechatMineViewState();
}

class _WechatMineViewState extends State<WechatMineView>
    with AutomaticKeepAliveClientMixin {
  final logic = Get.find<WechatMineLogic>();
  final state = Get.find<WechatMineLogic>().state;

  @override
  void initState() {
    logic.initWechatMine();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return GetBuilder<WechatMineLogic>(builder: (logic) {
      return SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: HYAppTheme.norWhite01Color,
              padding: EdgeInsets.only(
                top: 80.r,
                bottom: 25.r,
                left: 35.r,
                right: 35.r,
              ),
              child: Row(
                children: [
                  Image.network(
                    state.wechatLoginData.avatar!,
                    width: 50.r,
                    height: 50.r,
                    fit: BoxFit.cover,
                  ),
                  10.horizontalSpace,
                  Expanded(
                    child: SizedBox(
                      height: 50.r,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            state.wechatLoginData.userName!,
                            style: TextStyle(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "微信号:${state.wechatLoginData.userId!}",
                            style: TextStyle(
                              fontSize: 13.sp,
                              color: HYAppTheme.norGrayColor,
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            8.verticalSpace,
            ListView.separated(
              padding: EdgeInsets.zero,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (ctx, index) {
                return GestureDetector(
                  onTap: state.textButtons[index].onTap,
                  child: Container(
                    color: HYAppTheme.norWhite01Color,
                    padding: EdgeInsets.symmetric(
                      vertical: 10.r,
                      horizontal: 10.r,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RichText(
                          text: TextSpan(
                            children: [
                              WidgetSpan(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 10.r,
                                  ),
                                  child: Image.asset(
                                    state.textButtons[index].icon!,
                                    width: 20.r,
                                    height: 20.r,
                                  ),
                                ),
                              ),
                              TextSpan(
                                text: state.textButtons[index].text,
                                style: TextStyle(
                                  color: HYAppTheme.norBlackColors,
                                  fontSize: 13.sp,
                                ),
                              )
                            ],
                          ),
                        ),
                        Icon(
                          Icons.keyboard_arrow_right,
                          color: HYAppTheme.norGrayColor,
                        )
                      ],
                    ),
                  ),
                );
              },
              separatorBuilder: (ctx, index) {
                if (index == 0 || index == state.textButtons.length - 2) {
                  return 8.verticalSpace;
                } else {
                  return Container(
                    height: .4.r,
                    color: HYAppTheme.norGrayColor,
                    width: 1.sw,
                  );
                }
              },
              itemCount: state.textButtons.length,
            )
          ],
        ),
      );
    });
  }

  @override
  bool get wantKeepAlive => true;
}
