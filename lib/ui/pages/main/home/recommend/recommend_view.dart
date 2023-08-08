import 'package:bilibili_getx/ui/shared/app_theme.dart';
import 'package:bilibili_getx/ui/widgets/custom/bilibili_classical_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../core/I18n/str_res_keys.dart';
import '../../../../shared/image_asset.dart';
import 'recommend_logic.dart';

class RecommendScreen extends StatefulWidget {
  static const String routeName = "/home/recommend";

  const RecommendScreen({super.key});

  @override
  State<RecommendScreen> createState() => _RecommendScreenState();
}

class _RecommendScreenState extends State<RecommendScreen>
    with AutomaticKeepAliveClientMixin {
  final logic = Get.find<RecommendLogic>();
  final state = Get.find<RecommendLogic>().state;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    ///未加载出数据时显示
    return GetBuilder<RecommendLogic>(builder: (logic) {
      if (state.feedIndexItemList.isEmpty) {
        return Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                ImageAssets.holderLoadingPNG,
                width: 150.r,
                height: 150.r,
              ),
              10.verticalSpace,
              TextButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        HYAppTheme.norMainThemeColors),
                  ),
                  onPressed: () {
                    ///有网络时拉取数据
                    logic.clearFeedIndexData();
                  },
                  child: Text(
                    SR.refresh.tr,
                    style: TextStyle(
                        color: HYAppTheme.norWhite01Color, fontSize: 12.sp),
                  ))
            ],
          ),
        );
      } else {
        return EasyRefresh(
          // controller: state.easyRefreshController,
          // scrollController: state.easyRefreshScrollController,
          header: BilibiliClassicalHeader(
            enableHapticFeedback: false,
            float: true,
          ),
          footer: ClassicalFooter(
            showInfo: false,
          ),
          onRefresh: () async {
            logic.refreshRecommendItemData();
          },
          onLoad: () async {
            logic.loadRecommendItemData();
          },
          child: Padding(
              padding:
                  EdgeInsets.only(left: 6.r, right: 6.r, top: 4.r, bottom: 0.r),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: state.homeRecommendWidgets,
              )),
        );
      }
    });
  }

  @override
  bool get wantKeepAlive => true;
}
