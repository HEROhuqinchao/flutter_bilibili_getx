import 'package:bilibili_getx/core/I18n/str_res_en.dart';
import 'package:bilibili_getx/core/I18n/str_res_zh.dart';
import 'package:get/get_navigation/src/root/internacionalization.dart';

///语言种类
class StringRes extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        ///中文
        'zh_CN': strResZh,

        ///英文
        'en_US': strResEn,
      };
}
