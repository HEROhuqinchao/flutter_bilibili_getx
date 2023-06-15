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
    title: json["title"],
    pages: json["pages"],
  );

  Map<String, dynamic> toJson() => {
    "trackid": trackid,
    "list": List<dynamic>.from(list!.map((x) => x.toJson())),
    "exp_str": expStr,
    "title": title,
    "pages": pages,
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
    keyword: json["keyword"],
    status: json["status"],
    nameType: json["name_type"],
    showName: json["show_name"],
    wordType: json["word_type"],
    icon: json["icon"],
    position: json["position"],
    moduleId: json["module_id"],
    hotId: json["hot_id"],
    title: json["title"],
    param: json["param"],
    type: json["type"],
    id: json["id"] == null ? null : json["id"].toDouble(),
    pubTime: json["pub_time"],
    moreSearchType: json["more_search_type"],
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
    "title": title,
    "param": param,
    "type": type,
    "id": id,
    "pub_time": pubTime,
    "more_search_type": moreSearchType,
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
