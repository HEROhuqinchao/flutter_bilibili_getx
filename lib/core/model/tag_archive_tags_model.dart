// To parse this JSON data, do
//
//     final hyTagArchiveTagModel = hyTagArchiveTagModelFromJson(jsonString);

import 'dart:convert';

List<HYTagArchiveTagsModel> hyTagArchiveTagModelFromJson(String str) => List<HYTagArchiveTagsModel>.from(json.decode(str).map((x) => HYTagArchiveTagsModel.fromJson(x)));

String hyTagArchiveTagModelToJson(List<HYTagArchiveTagsModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class HYTagArchiveTagsModel {
  HYTagArchiveTagsModel({
    required this.tagId,
    required this.tagName,
    required this.cover,
    required this.headCover,
    required this.content,
    required this.shortContent,
    required this.type,
    required this.state,
    required this.ctime,
    required this.count,
    required this.isAtten,
    required this.likes,
    required this.hates,
    required this.attribute,
    required this.liked,
    required this.hated,
    required this.extraAttr,
  });

  int tagId;
  String tagName;
  String cover;
  String headCover;
  String content;
  String shortContent;
  int type;
  int state;
  int ctime;
  Count count;
  int isAtten;
  int likes;
  int hates;
  int attribute;
  int liked;
  int hated;
  int extraAttr;

  factory HYTagArchiveTagsModel.fromJson(Map<String, dynamic> json) => HYTagArchiveTagsModel(
    tagId: json["tag_id"],
    tagName: json["tag_name"],
    cover: json["cover"],
    headCover: json["head_cover"],
    content: json["content"],
    shortContent: json["short_content"],
    type: json["type"],
    state: json["state"],
    ctime: json["ctime"],
    count: Count.fromJson(json["count"]),
    isAtten: json["is_atten"],
    likes: json["likes"],
    hates: json["hates"],
    attribute: json["attribute"],
    liked: json["liked"],
    hated: json["hated"],
    extraAttr: json["extra_attr"],
  );

  Map<String, dynamic> toJson() => {
    "tag_id": tagId,
    "tag_name": tagName,
    "cover": cover,
    "head_cover": headCover,
    "content": content,
    "short_content": shortContent,
    "type": type,
    "state": state,
    "ctime": ctime,
    "count": count.toJson(),
    "is_atten": isAtten,
    "likes": likes,
    "hates": hates,
    "attribute": attribute,
    "liked": liked,
    "hated": hated,
    "extra_attr": extraAttr,
  };
}

class Count {
  Count({
    required this.view,
    required this.use,
    required this.atten,
  });

  int view;
  int use;
  int atten;

  factory Count.fromJson(Map<String, dynamic> json) => Count(
    view: json["view"],
    use: json["use"],
    atten: json["atten"],
  );

  Map<String, dynamic> toJson() => {
    "view": view,
    "use": use,
    "atten": atten,
  };
}
