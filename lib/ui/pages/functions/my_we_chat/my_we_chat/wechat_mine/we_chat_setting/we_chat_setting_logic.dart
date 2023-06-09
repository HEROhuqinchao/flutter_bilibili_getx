import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../../../../../core/model/wechat/text_button_model.dart';
import '../../../../../../widgets/show_bottom_menu.dart';
import '../../../wechat_login/wechat_login_view.dart';
import '../../../wechat_register/wechat_register_view.dart';
import '../../wechat_main/wechat_main_logic.dart';
import 'we_chat_setting_state.dart';

class WeChatSettingLogic extends GetxController {
  final WeChatSettingState state = WeChatSettingState();

  @override
  void onReady() {
    state.textButtons = [
      TextButtonModel(
        text: "账号与安全",
        onTap: () {},
      ),
      TextButtonModel(
        text: "青少年模式",
        onTap: () {},
      ),
      TextButtonModel(
        text: "关怀模式",
        onTap: () {},
      ),
      TextButtonModel(
        text: "新消息通知",
        onTap: () {},
      ),
      TextButtonModel(
        text: "聊天",
        onTap: () {},
      ),
      TextButtonModel(
        text: "设备",
        onTap: () {},
      ),
      TextButtonModel(
        text: "通用",
        onTap: () {},
      ),
      TextButtonModel(
        text: "朋友权限",
        onTap: () {},
      ),
      TextButtonModel(
        text: "个人信息与权限",
        onTap: () {},
      ),
      TextButtonModel(
        text: "个人信息收集清单",
        onTap: () {},
      ),
      TextButtonModel(
        text: "第三方信息共享清单",
        onTap: () {},
      ),
      TextButtonModel(
        text: "插件",
        onTap: () {},
      ),
      TextButtonModel(
        text: "关于微信",
        onTap: () {},
      ),
      TextButtonModel(
        text: "帮助与反馈",
        onTap: () {},
      ),
      TextButtonModel(
        text: "切换账号",
        onTap: () {},
      ),
      TextButtonModel(
        text: "退出",
        onTapContext: (BuildContext context) {
          showBottomMenu(
            context,
            [
              buildTextButton(
                text: "退出登录",
                onTap: () {
                  loginOut();
                },
              ),
              buildTextButton(
                text: "关闭微信",
                onTap: () {},
              ),
              buildTextButton(
                text: "取消",
                onTap: () {},
              ),
            ],
          );
        },
      ),
    ];
    update();
    super.onReady();
  }

  ///退出登录
  loginOut() {
    WechatMainLogic wechatMainLogic = Get.find<WechatMainLogic>();
    wechatMainLogic.state.webSocketChannel.sink.close();
    Get.offAllNamed(WechatLoginView.routeName);
  }
}
