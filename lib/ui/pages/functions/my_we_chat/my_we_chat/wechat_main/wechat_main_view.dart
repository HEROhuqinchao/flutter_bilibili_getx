import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../../core/model/wechat/receive_data_model.dart';
import '../../../../../shared/app_theme.dart';
import '../../../../../shared/image_asset.dart';
import '../../../../../shared/shared_util.dart';
import 'wechat_main_logic.dart';

class WechatMainView extends StatefulWidget {
  @override
  State<WechatMainView> createState() => _WechatMainViewState();
}

class _WechatMainViewState extends State<WechatMainView>
    with AutomaticKeepAliveClientMixin {
  final logic = Get.put(WechatMainLogic());
  final state = Get.find<WechatMainLogic>().state;

  @override
  void initState() {
    logic.iniWeChat();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (ctx, index) {
        String userId = state.userList[index].userId!;
        ReceiveDataModel? receiveData = state.latestMsgData[userId];

        ///去掉自己这个用户
        if (userId != state.isLoginUserId) {
          return InkWell(
            onTap: () {
              logic.go2ChatRoom(index);
            },
            child: Container(
              padding: EdgeInsets.symmetric(
                vertical: 8.r,
                horizontal: 15.r,
              ),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.all(
                      Radius.circular(4.r),
                    ),
                    child: Container(
                      color: HYAppTheme.norGrayColor,
                      width: 50.r,
                      height: 50.r,
                      child: Image.asset(
                        ImageAssets.arPNG,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 5.r,
                        horizontal: 10.r,
                      ),
                      height: 50.r,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(state.userList[index].userName!),
                              Text(receiveData != null
                                  ? datetimeStampToYearMonthDay(
                                      receiveData.date)
                                  : "")
                            ],
                          ),
                          Text(
                            receiveData != null ? receiveData.msg : "",
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        } else {
          return Container();
        }
      },
      itemCount: state.userList.length,
    );
  }

  @override
  bool get wantKeepAlive => true;
}
