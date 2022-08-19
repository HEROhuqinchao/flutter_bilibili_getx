// To parse this JSON data, do
//
//     final hyRankingRegionModel = hyRankingRegionModelFromJson(jsonString);

import 'dart:convert';

HYRankingRegionModel hyRankingRegionModelFromJson(String str) =>
    HYRankingRegionModel.fromJson(json.decode(str));

String hyRankingRegionModelToJson(HYRankingRegionModel data) =>
    json.encode(data.toJson());

class HYRankingRegionModel {
  HYRankingRegionModel({
    required this.aid,
    required this.bvid,
    required this.typename,
    required this.title,
    required this.subtitle,
    required this.play,
    required this.review,
    required this.videoReview,
    required this.favorites,
    required this.mid,
    required this.author,
    required this.description,
    required this.create,
    required this.pic,
    required this.coins,
    required this.duration,
    required this.badgepay,
    required this.pts,
    required this.rights,
    required this.redirectUrl,
  });

  String aid;
  String bvid;
  String typename;
  String title;
  String subtitle;
  int play;
  int review;
  int videoReview;
  int favorites;
  int mid;
  String author;
  String description;
  String create;
  String pic;
  int coins;
  String duration;
  bool badgepay;
  int pts;
  Map<String, int> rights;
  String redirectUrl;

  factory HYRankingRegionModel.fromJson(Map<String, dynamic> json) =>
      HYRankingRegionModel(
        aid: json["aid"],
        bvid: json["bvid"],
        typename: json["typename"],
        title: json["title"],
        subtitle: json["subtitle"],
        play: json["play"],
        review: json["review"],
        videoReview: json["video_review"],
        favorites: json["favorites"],
        mid: json["mid"],
        author: json["author"],
        description: json["description"],
        create: json["create"],
        pic: json["pic"],
        coins: json["coins"],
        duration: json["duration"],
        badgepay: json["badgepay"],
        pts: json["pts"],
        rights:
            Map.from(json["rights"]).map((k, v) => MapEntry<String, int>(k, v)),
        redirectUrl: json["redirect_url"],
      );

  Map<String, dynamic> toJson() => {
        "aid": aid,
        "bvid": bvid,
        "typename": typename,
        "title": title,
        "subtitle": subtitle,
        "play": play,
        "review": review,
        "video_review": videoReview,
        "favorites": favorites,
        "mid": mid,
        "author": author,
        "description": description,
        "create": create,
        "pic": pic,
        "coins": coins,
        "duration": duration,
        "badgepay": badgepay,
        "pts": pts,
        "rights":
            Map.from(rights).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "redirect_url": redirectUrl,
      };
}
