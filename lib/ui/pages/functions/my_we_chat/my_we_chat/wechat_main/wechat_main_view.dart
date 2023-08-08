import 'package:bilibili_getx/ui/widgets/widget_factory/abstract_factory/widget_factory_singleton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../../core/model/wechat/receive_data_model.dart';
import '../../../../../shared/app_theme.dart';
import '../../../../../shared/image_asset.dart';
import '../../../../../shared/shared_util.dart';
import '../message_change_notifier/message_change_notifier.dart';
import 'wechat_main_logic.dart';

class WechatMainView extends StatefulWidget {
  const WechatMainView({super.key});

  @override
  State<WechatMainView> createState() => _WechatMainViewState();
}

class _WechatMainViewState extends State<WechatMainView>
    with AutomaticKeepAliveClientMixin, WidgetFactoryPlugin {
  final logic = Get.find<WechatMainLogic>();
  final state = Get.find<WechatMainLogic>().state;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return GetBuilder<WechatMainLogic>(
      builder: (logic) {
        return ListView.builder(
          itemBuilder: (ctx, index) {
            String userId = state.userList[index].userId!;
            ReceiveDataModel? receiveData = state.latestMsgData[userId];
            return _buildWechatMainUserContent(index, userId, receiveData);
          },
          itemCount: state.userList.length,
        );
      },
    );
  }

  @override
  bool get wantKeepAlive => true;

  _buildWechatMainUserContent(
      int index, String userId, ReceiveDataModel? receiveData) {
    ///去掉自己这个用户
    return userId != state.isLoginUserId
        ? InkWell(
            onTap: () {
              logic.go2ChatRoom(index);
            },
            child: Container(
              padding: EdgeInsets.symmetric(
                vertical: 8.r,
                horizontal: 10.r,
              ),
              child: Row(
                children: [
                  buildWechatMainUserLogo(userId),
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
          )
        : Container();
  }

  ///头像部分
  Widget buildWechatMainUserLogo(String userId) {
    return ValueListenableBuilder(
      valueListenable: MessageChangeNotifier.getInstance(),
      builder: (_, __, ___) {
        return wFactory().buildRightTag(
          mainPart: Container(
            padding: EdgeInsets.all(6.sp),
            child: Container(
              padding: EdgeInsets.all(3.r),
              decoration: BoxDecoration(
                  color: HYAppTheme.norGrayColor,
                  borderRadius: BorderRadius.all(Radius.circular(3.r))),
              width: 43.sp,
              height: 43.sp,
              child: Image.asset(
                ImageAssets.arPNG,
              ),
            ),
          ),
          tagPart: Text(
            "${MessageChangeNotifier.getInstance().userUnReadMessage(userId)}",
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        );
      },
    );
  }
}
