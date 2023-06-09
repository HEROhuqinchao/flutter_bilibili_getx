import 'package:bilibili_getx/ui/pages/functions/my_we_chat/my_we_chat/wechat_mine/we_chat_setting/we_chat_setting_view.dart';
import 'package:bilibili_getx/ui/pages/functions/my_we_chat/wechat_login/wechat_login_view.dart';
import 'package:get/get.dart';

import '../../../../../../core/model/wechat/text_button_model.dart';
import '../../../../../shared/image_asset.dart';
import '../wechat_main/wechat_main_logic.dart';
import 'wechat_mine_state.dart';

class WechatMineLogic extends GetxController {
  final WechatMineState state = WechatMineState();

  initWechatMine() {
    state.textButtons = [
      TextButtonModel(
        text: "服务",
        icon: ImageAssets.wechatServicePng,
        onTap: () {},
      ),
      TextButtonModel(
        text: "收藏",
        icon: ImageAssets.wechatCollectionPng,
        onTap: () {},
      ),
      TextButtonModel(
        text: "朋友圈",
        icon: ImageAssets.wechatFriendCirclePng,
        onTap: () {},
      ),
      TextButtonModel(
        text: "卡包",
        icon: ImageAssets.wechatPackagePng,
        onTap: () {},
      ),
      TextButtonModel(
        text: "表情",
        icon: ImageAssets.wechatEmojiPng,
        onTap: () {},
      ),
      TextButtonModel(
        text: "设置",
        icon: ImageAssets.wechatSettingPng,
        onTap: () {
          Get.toNamed(WeChatSettingView.routeName);
        },
      ),
    ];
  }
}
