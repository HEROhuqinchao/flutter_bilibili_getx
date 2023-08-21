// To parse this JSON data, do
//
//     final hyOnlineGoldRankModel = hyOnlineGoldRankModelFromJson(jsonString);

import 'dart:convert';

HYOnlineGoldRankModel hyOnlineGoldRankModelFromJson(String str) =>
    HYOnlineGoldRankModel.fromJson(json.decode(str));

String hyOnlineGoldRankModelToJson(HYOnlineGoldRankModel data) =>
    json.encode(data.toJson());

class HYOnlineGoldRankModel {
  HYOnlineGoldRankModel({
    required this.onlineNum,
    required this.onlineRankItem,
    required this.ownInfo,
    required this.tipsText,
  });

  int onlineNum;
  List<OnlineRankItem> onlineRankItem;
  OwnInfo ownInfo;
  String tipsText;

  factory HYOnlineGoldRankModel.fromJson(Map<String, dynamic> json) =>
      HYOnlineGoldRankModel(
        onlineNum: json["onlineNum"],
        onlineRankItem: List<OnlineRankItem>.from(
            json["OnlineRankItem"].map((x) => OnlineRankItem.fromJson(x))),
        ownInfo: OwnInfo.fromJson(json["ownInfo"]),
        tipsText: json["tips_text"],
      );

  Map<String, dynamic> toJson() => {
        "onlineNum": onlineNum,
        "OnlineRankItem":
            List<dynamic>.from(onlineRankItem.map((x) => x.toJson())),
        "ownInfo": ownInfo.toJson(),
        "tips_text": tipsText,
      };
}

class OnlineRankItem {
  OnlineRankItem({
    required this.userRank,
    required this.uid,
    required this.name,
    required this.face,
    required this.score,
    required this.medalInfo,
    required this.guardLevel,
  });

  int userRank;
  int uid;
  String name;
  String face;
  int score;
  MedalInfo? medalInfo;
  int guardLevel;

  factory OnlineRankItem.fromJson(Map<String, dynamic> json) => OnlineRankItem(
        userRank: json["userRank"],
        uid: json["uid"],
        name: json["name"],
        face: json["face"],
        score: json["score"],
        medalInfo: json["medalInfo"] == null
            ? null
            : MedalInfo.fromJson(json["medalInfo"]),
        guardLevel: json["guard_level"],
      );

  Map<String, dynamic> toJson() => {
        "userRank": userRank,
        "uid": uid,
        "name": name,
        "face": face,
        "score": score,
        "medalInfo": medalInfo == null ? "" : medalInfo?.toJson(),
        "guard_level": guardLevel,
      };
}

class MedalInfo {
  MedalInfo({
    required this.guardLevel,
    required this.medalColorStart,
    required this.medalColorEnd,
    required this.medalColorBorder,
    required this.medalName,
    required this.level,
    required this.targetId,
    required this.isLight,
  });

  int guardLevel;
  int medalColorStart;
  int medalColorEnd;
  int medalColorBorder;
  String medalName;
  int level;
  int targetId;
  int isLight;

  factory MedalInfo.fromJson(Map<String, dynamic> json) => MedalInfo(
        guardLevel: json["guardLevel"],
        medalColorStart: json["medalColorStart"],
        medalColorEnd: json["medalColorEnd"],
        medalColorBorder: json["medalColorBorder"],
        medalName: json["medalName"],
        level: json["level"],
        targetId: json["targetId"],
        isLight: json["isLight"],
      );

  Map<String, dynamic> toJson() => {
        "guardLevel": guardLevel,
        "medalColorStart": medalColorStart,
        "medalColorEnd": medalColorEnd,
        "medalColorBorder": medalColorBorder,
        "medalName": medalName,
        "level": level,
        "targetId": targetId,
        "isLight": isLight,
      };
}

class OwnInfo {
  OwnInfo({
    required this.uid,
    required this.name,
    required this.face,
    required this.rank,
    required this.needScore,
    required this.score,
    required this.guardLevel,
  });

  int uid;
  String name;
  String face;
  int rank;
  int needScore;
  int score;
  int guardLevel;

  factory OwnInfo.fromJson(Map<String, dynamic> json) => OwnInfo(
        uid: json["uid"],
        name: json["name"],
        face: json["face"],
        rank: json["rank"],
        needScore: json["needScore"],
        score: json["score"],
        guardLevel: json["guard_level"],
      );

  Map<String, dynamic> toJson() => {
        "uid": uid,
        "name": name,
        "face": face,
        "rank": rank,
        "needScore": needScore,
        "score": score,
        "guard_level": guardLevel,
      };
}
