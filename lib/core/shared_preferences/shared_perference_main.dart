import 'package:bilibili_getx/core/shared_preferences/shared_preference_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///测试SharedPreference
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferenceUtil.initSharedPreference();
  await saveKeys();
  readKeys();
  await removeKey();
}

Future saveKeys() async {
  //存储bool
  await SharedPreferenceUtil.setBool("test_bool", true);

  /// 存储浮点
  await SharedPreferenceUtil.setDouble('test_double', 1.5);

  ///存储int
  await SharedPreferenceUtil.setInt('test_int', 1);

  ///存储字符串
  await SharedPreferenceUtil.setString('test_string', 'text');

  ///存储字符串列表
  await SharedPreferenceUtil.setStringList('items', ['earth', 'moon']);
}

void readKeys() async {
  final bool? state = SharedPreferenceUtil.getBool('test_bool');
  final double? doubleValue = SharedPreferenceUtil.getDouble('test_double');
  final int? intValue = SharedPreferenceUtil.getInt('test_int');
  final String? stringValue = SharedPreferenceUtil.getString('test_string');
  final List<String>? items = SharedPreferenceUtil.getStringList('items');
  print(state); // true
  print(doubleValue); //1.5
  print(intValue); // 1
  print(stringValue); // text
  print(items.toString()); // [earth, moon]
}

Future removeKey() async {
  final bool? state = SharedPreferenceUtil.getBool('test_bool');
  print(state); // true
  await SharedPreferenceUtil.remove('test_bool');
  final bool? afterRemoveState = SharedPreferenceUtil.getBool('test_bool');
  print(afterRemoveState); // false
}
