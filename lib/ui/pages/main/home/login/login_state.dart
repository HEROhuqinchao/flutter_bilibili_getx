import 'package:flutter/cupertino.dart';

import '../../../../../core/model/region_model.dart';

class LoginState {
  late TextEditingController telTextEditController;
  late TextEditingController verifyPasswordTextFieldController;
  late TextEditingController userNameTextEditController;
  late TextEditingController passwordTextFieldController;

  ///电话号码
  late String telText;

  ///验证码
  late String verifyText;

  ///用户名
  late String userNameText;

  ///登录密码
  late String passwordText;

  ///判断当前是以什么方式登录的
  late bool loginTypeIsMessage;

  ///网页地址
  late String webViewUrl;

  ///appKey和appSec用于安卓端接口（传值、计算sign）
  late String appKey;
  late String appSec;

  ///发送验证码后得到key
  late String captchaKey;

  ///电话的地区前缀
  late String cid;

  ///地区选择
  late int regionIndex;
  late List<RegionModel> regionList;

  ///是否同意协议
  late bool isAgree;

  ///是否正在输入密码(用于2233娘)
  late bool isInputPassword;

  ///监听是否正在输入数据
  late FocusNode verifyCodeFocusNode;
  late FocusNode telFocusNode;
  late FocusNode userNameFocusNode;
  late FocusNode passwordFocusNode;

  ///隐藏密码
  late bool isObscure;

  LoginState() {
    telText = "";
    verifyText = "";
    userNameText = "";
    passwordText = "";
    loginTypeIsMessage = true;
    captchaKey = "";
    cid = "86";
    appKey = '1d8b6e7d45233436';
    appSec = '560c52ccd288fed045859ed18bffd973';
    webViewUrl = "";
    telTextEditController = TextEditingController();
    verifyPasswordTextFieldController = TextEditingController();
    userNameTextEditController = TextEditingController();
    passwordTextFieldController = TextEditingController();
    regionIndex = 0;
    regionList = [
      RegionModel("中国大陆", "+86"),
      RegionModel("美国", "+21"),
      RegionModel("意大利", "+156"),
      RegionModel("西班牙", "+56"),
      RegionModel("泰国", "+65"),
      RegionModel("韩国", "+53"),
      RegionModel("英国", "+78"),
      RegionModel("印度", "+12"),
      RegionModel("埃及", "+82"),
    ];
    isAgree = true;
    isInputPassword = false;
    verifyCodeFocusNode = FocusNode();
    telFocusNode = FocusNode();
    userNameFocusNode = FocusNode();
    passwordFocusNode = FocusNode();
    isObscure = true;
  }
}
