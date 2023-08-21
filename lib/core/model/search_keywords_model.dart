// To parse this JSON data, do
//
//     final hySearchKeywordModel = hySearchKeywordModelFromJson(jsonString);

import 'dart:convert';

HYSearchKeywordModel hySearchKeywordModelFromJson(String str) =>
    HYSearchKeywordModel.fromJson(json.decode(str));

String hySearchKeywordModelToJson(HYSearchKeywordModel data) =>
    json.encode(data.toJson());

class HYSearchKeywordModel {
  HYSearchKeywordModel({
    required this.code,
    required this.message,
    required this.ttl,
    required this.data,
  });

  int code;
  String message;
  int ttl;
  List<Datum> data;

  factory HYSearchKeywordModel.fromJson(Map<String, dynamic> json) =>
      HYSearchKeywordModel(
        code: json["code"],
        message: json["message"],
        ttl: json["ttl"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "ttl": ttl,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    required this.type,
    required this.title,
    required this.data,
  });

  String type;
  String? title;
  Data? data;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        type: json["type"],
        title: json["title"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "title": title,
        "data": data == null ? "" : data?.toJson(),
      };
}

class Data {
  Data({
    required this.trackid,
    required this.list,
    required this.expStr,
    required this.title,
    required this.pages,
  });

  String? trackid;
  List<ListElement>? list;
  String? expStr;
  String? title;
  int? pages;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        trackid: json["trackid"],
        list: json["list"] == null
            ? null
            : List<ListElement>.from(
                json["list"].map((x) => ListElement.fromJson(x))),
        expStr: json["exp_str"],
        title: json["title"],
        pages: json["pages"],
      );

  Map<String, dynamic> toJson() => {
        "trackid": trackid,
        "list": list == null
            ? null
            : List<dynamic>.from(list!.map((x) => x.toJson())),
        "exp_str": expStr,
        "title": title,
        "pages": pages,
      };
}

class ListElement {
  ListElement({
    required this.keyword,
    required this.status,
    required this.nameType,
    required this.showName,
    required this.wordType,
    required this.icon,
    required this.position,
    required this.moduleId,
    required this.hotId,
  });

  String? keyword;
  String? status;
  String? nameType;
  String? showName;
  int? wordType;
  String? icon;
  int? position;
  int? moduleId;
  int? hotId;

  factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
        keyword: json["keyword"],
        status: json["status"],
        nameType: json["name_type"],
        showName: json["show_name"],
        wordType: json["word_type"],
        icon: json["icon"],
        position: json["position"],
        moduleId: json["module_id"],
        hotId: json["hot_id"],
      );

  Map<String, dynamic> toJson() => {
        "keyword": keyword,
        "status": status,
        "name_type": nameType,
        "show_name": showName,
        "word_type": wordType,
        "icon": icon,
        "position": position,
        "module_id": moduleId,
        "hot_id": hotId,
      };
}
