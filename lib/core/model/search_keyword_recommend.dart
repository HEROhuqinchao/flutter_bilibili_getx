// To parse this JSON data, do
//
//     final hySearchKeywordRecommendModel = hySearchKeywordRecommendModelFromJson(jsonString);

import 'dart:convert';

HYSearchKeywordRecommendModel hySearchKeywordRecommendModelFromJson(
        String str) =>
    HYSearchKeywordRecommendModel.fromJson(json.decode(str));

String hySearchKeywordRecommendModelToJson(
        HYSearchKeywordRecommendModel data) =>
    json.encode(data.toJson());

class HYSearchKeywordRecommendModel {
  HYSearchKeywordRecommendModel({
    required this.expStr,
    required this.code,
    required this.cost,
    required this.result,
    required this.pageCaches,
    required this.sengine,
    required this.stoken,
  });

  String expStr;
  int code;
  Cost cost;
  Result? result;
  PageCaches pageCaches;
  Sengine sengine;
  String stoken;

  factory HYSearchKeywordRecommendModel.fromJson(Map<String, dynamic> json) {
    return HYSearchKeywordRecommendModel(
        expStr: json["exp_str"],
        code: json["code"],
        cost: Cost.fromJson(json["cost"]),
        result: json["result"].runtimeType == List
            ? null
            : Result.fromJson(json["result"]),
        pageCaches: PageCaches.fromJson(json["page caches"]),
        sengine: Sengine.fromJson(json["sengine"]),
        stoken: json["stoken"]);
  }

  Map<String, dynamic> toJson() => {
        "exp_str": expStr,
        "code": code,
        "cost": cost.toJson(),
        "result": result?.toJson(),
        "page caches": pageCaches.toJson(),
        "sengine": sengine.toJson(),
        "stoken": stoken,
      };
}

class Cost {
  Cost({
    required this.about,
  });

  About about;

  factory Cost.fromJson(Map<String, dynamic> json) => Cost(
        about: About.fromJson(json["about"]),
      );

  Map<String, dynamic> toJson() => {
        "about": about.toJson(),
      };
}

class About {
  About({
    required this.paramsCheck,
    required this.total,
    required this.mainHandler,
  });

  String paramsCheck;
  String total;
  String? mainHandler;

  factory About.fromJson(Map<String, dynamic> json) => About(
        paramsCheck: json["params_check"],
        total: json["total"],
        mainHandler: json["main_handler"],
      );

  Map<String, dynamic> toJson() => {
        "params_check": paramsCheck,
        "total": total,
        "main_handler": mainHandler,
      };
}

class PageCaches {
  PageCaches({
    required this.saveCache,
  });

  String saveCache;

  factory PageCaches.fromJson(Map<String, dynamic> json) => PageCaches(
        saveCache: json["save cache"],
      );

  Map<String, dynamic> toJson() => {
        "save cache": saveCache,
      };
}

class Result {
  Result({
    required this.tag,
  });

  List<Tag> tag;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        tag: List<Tag>.from(json["tag"].map((x) => Tag.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "tag": List<dynamic>.from(tag.map((x) => x.toJson())),
      };
}

class Tag {
  Tag({
    required this.value,
    required this.term,
    required this.ref,
    required this.name,
    required this.spid,
  });

  String value;
  String term;
  int ref;
  String name;
  int spid;

  factory Tag.fromJson(Map<String, dynamic> json) => Tag(
        value: json["value"],
        term: json["term"],
        ref: json["ref"],
        name: json["name"],
        spid: json["spid"],
      );

  Map<String, dynamic> toJson() => {
        "value": value,
        "term": term,
        "ref": ref,
        "name": name,
        "spid": spid,
      };
}

class Sengine {
  Sengine({
    required this.usage,
  });

  int usage;

  factory Sengine.fromJson(Map<String, dynamic> json) => Sengine(
        usage: json["usage"],
      );

  Map<String, dynamic> toJson() => {
        "usage": usage,
      };
}
