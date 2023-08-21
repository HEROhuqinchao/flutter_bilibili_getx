import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

///正则匹配字符串
class StringRegUtil {
  ///匹配手机号码
  bool matchTelPhone(String input) {
    if (input.length == 11) {
      RegExp regExp = RegExp(r'[^0-9]');
      return !regExp.hasMatch(input);
    } else {
      SmartDialog.showToast("手机号码需要11位");
      return false;
    }
  }

  ///匹配邮箱
}
