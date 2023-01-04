// To parse this JSON data, do
//
//     final searchSquareModel = searchSquareModelFromJson(jsonString);

import 'dart:convert';

SearchSquareModel searchSquareModelFromJson(String str) => SearchSquareModel.fromJson(json.decode(str));

String searchSquareModelToJson(SearchSquareModel data) => json.encode(data.toJson());

class SearchSquareModel {
  SearchSquareModel({
    this.code,
    this.message,
    this.ttl,
    this.data,
  });

  int? code;
  String? message;
  int? ttl;
  List<Datum>? data;

  factory SearchSquareModel.fromJson(Map<String, dynamic> json) => SearchSquareModel(
    code: json["code"],
    message: json["message"],
    ttl: json["ttl"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "message": message,
    "ttl": ttl,
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    this.type,
    this.title,
    this.data,
    this.searchRankingMeta,
  });

  String? type;
  String? title;
  Data? data;
  SearchRankingMeta? searchRankingMeta;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    type: json["type"],
    title: json["title"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
    searchRankingMeta: json["search_ranking_meta"] == null ? null : SearchRankingMeta.fromJson(json["search_ranking_meta"]),
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "title": title,
    "data": data == null ? null : data!.toJson(),
    "search_ranking_meta": searchRankingMeta == null ? null : searchRankingMeta!.toJson(),
  };
}

class Data {
  Data({
    this.trackid,
    this.list,
    this.expStr,
    this.title,
    this.pages,
  });

  String? trackid;
  List<ListElement>? list;
  String? expStr;
  String? title;
  int? pages;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    trackid: json["trackid"],
    list: List<ListElement>.from(json["list"].map((x) => ListElement.fromJson(x))),
    expStr: json["exp_str"],
    title: json["title"] == null ? null : json["title"],
    pages: json["pages"] == null ? null : json["pages"],
  );

  Map<String, dynamic> toJson() => {
    "trackid": trackid,
    "list": List<dynamic>.from(list!.map((x) => x.toJson())),
    "exp_str": expStr,
    "title": title == null ? null : title,
    "pages": pages == null ? null : pages,
  };
}

class ListElement {
  ListElement({
    this.keyword,
    this.status,
    this.nameType,
    this.showName,
    this.wordType,
    this.icon,
    this.position,
    this.moduleId,
    this.hotId,
    this.title,
    this.param,
    this.type,
    this.id,
    this.pubTime,
    this.moreSearchType,
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
  String? title;
  String? param;
  String? type;
  double? id;
  String? pubTime;
  int? moreSearchType;

  factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
    keyword: json["keyword"] == null ? null : json["keyword"],
    status: json["status"] == null ? null : json["status"],
    nameType: json["name_type"] == null ? null : json["name_type"],
    showName: json["show_name"] == null ? null : json["show_name"],
    wordType: json["word_type"] == null ? null : json["word_type"],
    icon: json["icon"] == null ? null : json["icon"],
    position: json["position"],
    moduleId: json["module_id"] == null ? null : json["module_id"],
    hotId: json["hot_id"] == null ? null : json["hot_id"],
    title: json["title"] == null ? null : json["title"],
    param: json["param"] == null ? null : json["param"],
    type: json["type"] == null ? null : json["type"],
    id: json["id"] == null ? null : json["id"].toDouble(),
    pubTime: json["pub_time"] == null ? null : json["pub_time"],
    moreSearchType: json["more_search_type"] == null ? null : json["more_search_type"],
  );

  Map<String, dynamic> toJson() => {
    "keyword": keyword == null ? null : keyword,
    "status": status == null ? null : status,
    "name_type": nameType == null ? null : nameType,
    "show_name": showName == null ? null : showName,
    "word_type": wordType == null ? null : wordType,
    "icon": icon == null ? null : icon,
    "position": position,
    "module_id": moduleId == null ? null : moduleId,
    "hot_id": hotId == null ? null : hotId,
    "title": title == null ? null : title,
    "param": param == null ? null : param,
    "type": type == null ? null : type,
    "id": id == null ? null : id,
    "pub_time": pubTime == null ? null : pubTime,
    "more_search_type": moreSearchType == null ? null : moreSearchType,
  };
}

class SearchRankingMeta {
  SearchRankingMeta({
    this.openSearchRanking,
    this.text,
    this.link,
  });

  bool? openSearchRanking;
  String? text;
  String? link;

  factory SearchRankingMeta.fromJson(Map<String, dynamic> json) => SearchRankingMeta(
    openSearchRanking: json["open_search_ranking"],
    text: json["text"],
    link: json["link"],
  );

  Map<String, dynamic> toJson() => {
    "open_search_ranking": openSearchRanking,
    "text": text,
    "link": link,
  };
}
