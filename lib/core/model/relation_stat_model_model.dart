// To parse required this JSON data, do
//
//     final hyRelationStatModel = hyRelationStatModelFromJson(jsonString);

import 'dart:convert';

import '../../ui/shared/math_compute.dart';

HYRelationStatModel hyRelationStatModelFromJson(String str) =>
    HYRelationStatModel.fromJson(json.decode(str));

String hyRelationStatModelToJson(HYRelationStatModel data) =>
    json.encode(data.toJson());

class HYRelationStatModel {
  HYRelationStatModel({
    required this.code,
    required this.message,
    required this.ttl,
    required this.data,
  });

  int code;
  String message;
  int ttl;
  Data data;

  factory HYRelationStatModel.fromJson(Map<String, dynamic> json) =>
      HYRelationStatModel(
        code: json["code"],
        message: json["message"],
        ttl: json["ttl"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "ttl": ttl,
        "data": data.toJson(),
      };
}

class Data {
  Data(
      {required this.mid,
      required this.following,
      required this.whisper,
      required this.black,
      required this.follower,
      required this.followerText});

  int mid;
  int following;
  int whisper;
  int black;
  int follower;
  String followerText; //以万为单位

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      mid: json["mid"],
      following: json["following"],
      whisper: json["whisper"],
      black: json["black"],
      follower: json["follower"],
      followerText: changeToWan(json["follower"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "mid": mid,
        "following": following,
        "whisper": whisper,
        "black": black,
        "follower": follower,
      };
}
