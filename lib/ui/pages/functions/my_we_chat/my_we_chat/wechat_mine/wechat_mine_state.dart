import 'package:bilibili_getx/ui/pages/functions/my_we_chat/my_we_chat/wechat_mine/we_chat_setting/we_chat_setting_view.dart';
import 'package:bilibili_getx/ui/shared/image_asset.dart';
import 'package:get/get.dart';

import '../../../../../../core/model/wechat/text_button_model.dart';
import '../../../../../../core/model/wechat_login_model.dart';

class WechatMineState {
  late WechatLoginData wechatLoginData;
  late List<TextButtonModel> textButtons;

  WechatMineState() {
    textButtons = [];
  }
}
