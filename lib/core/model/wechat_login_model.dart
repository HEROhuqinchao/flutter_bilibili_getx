// To parse this JSON data, do
//
//     final wechatLoginModel = wechatLoginModelFromJson(jsonString);

import 'dart:convert';

WechatLoginModel wechatLoginModelFromJson(String str) =>
    WechatLoginModel.fromJson(json.decode(str));

String wechatLoginModelToJson(WechatLoginModel data) =>
    json.encode(data.toJson());

class WechatLoginModel {
  int? code;
  String? message;
  WechatLoginData? data;

  WechatLoginModel({
    this.code,
    this.message,
    this.data,
  });

  factory WechatLoginModel.fromJson(Map<String, dynamic> json) =>
      WechatLoginModel(
        code: json["code"],
        message: json["message"],
        data: json["data"] == null
            ? null
            : WechatLoginData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "data": data?.toJson(),
      };
}

class WechatLoginData {
  String? userId;
  String? userName;
  String? avatar;

  WechatLoginData({
    this.userId,
    this.userName,
    this.avatar,
  });

  factory WechatLoginData.fromJson(Map<String, dynamic> json) =>
      WechatLoginData(
        userId: json["userId"],
        userName: json["userName"],
        avatar: json["avatar"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "userName": userName,
        "avatar": avatar,
      };
}
