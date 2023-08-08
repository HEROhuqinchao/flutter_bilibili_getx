import '../../../../../../core/model/wechat/text_button_model.dart';
import '../../../../../../core/model/wechat_login_model.dart';

class WechatMineState {
  late WechatLoginData wechatLoginData;
  late List<TextButtonModel> textButtons;

  WechatMineState() {
    textButtons = [];
  }
}
