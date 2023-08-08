// To parse this JSON data, do
//
//     final wechatUsersModel = wechatUsersModelFromJson(jsonString);

import 'dart:convert';

WechatUsersModel wechatUsersModelFromJson(String str) =>
    WechatUsersModel.fromJson(json.decode(str));

class WechatUsersModel {
  int? code;
  String? message;
  List<UserModel>? data;

  WechatUsersModel({
    this.code,
    this.message,
    this.data,
  });

  factory WechatUsersModel.fromJson(Map<String, dynamic> json) =>
      WechatUsersModel(
        code: json["code"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<UserModel>.from(
                json["data"]!.map((x) => UserModel.fromJson(x))),
      );
}

///用户类
class UserModel {
  String? userId; //用户Id
  String? userName; //名称
  String? latestMsg; //最新消息
  String? avatar; //头像

  UserModel({
    required this.userId,
    required this.userName,
    this.latestMsg,
    required this.avatar,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      userId: json["userId"],
      userName: json["userName"],
      avatar: json["avatar"],
    );
  }
}
