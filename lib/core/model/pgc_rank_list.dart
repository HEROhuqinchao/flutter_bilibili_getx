// To parse this JSON data, do
//
//     final hyPgcRankListModel = hyPgcRankListModelFromJson(jsonString);

import 'dart:convert';

List<HYPgcRankListModel> hyPgcRankListModelFromJson(String str) =>
    List<HYPgcRankListModel>.from(
        json.decode(str).map((x) => HYPgcRankListModel.fromJson(x)));

String hyPgcRankListModelToJson(List<HYPgcRankListModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class HYPgcRankListModel {
  HYPgcRankListModel({
    required this.badge,
    required this.badgeInfo,
    required this.badgeType,
    required this.copyright,
    required this.cover,
    required this.newEp,
    required this.pts,
    required this.rank,
    required this.rating,
    required this.seasonId,
    required this.ssHorizontalCover,
    required this.stat,
    required this.title,
    required this.url,
  });

  String? badge;
  BadgeInfo badgeInfo;
  int badgeType;
  String? copyright;
  String cover;
  NewEp newEp;
  int pts;
  int rank;
  String rating;
  int seasonId;
  String ssHorizontalCover;
  Stat stat;
  String title;
  String url;

  factory HYPgcRankListModel.fromJson(Map<String, dynamic> json) =>
      HYPgcRankListModel(
        badge: json["badge"],
        badgeInfo: BadgeInfo.fromJson(json["badge_info"]),
        badgeType: json["badge_type"],
        copyright: json["copyright"],
        // copyright: copyrightValues.map[json["copyright"]],
        cover: json["cover"],
        newEp: NewEp.fromJson(json["new_ep"]),
        pts: json["pts"],
        rank: json["rank"],
        rating: json["rating"],
        seasonId: json["season_id"],
        ssHorizontalCover: json["ss_horizontal_cover"],
        stat: Stat.fromJson(json["stat"]),
        title: json["title"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        // "badge": badgeValues.reverse[badge],
        // "badge_info": badgeInfo.toJson(),
        "badge_type": badgeType,
        // "copyright": copyrightValues.reverse[copyright],
        "cover": cover,
        "new_ep": newEp.toJson(),
        "pts": pts,
        "rank": rank,
        "rating": rating,
        "season_id": seasonId,
        "ss_horizontal_cover": ssHorizontalCover,
        "stat": stat.toJson(),
        "title": title,
        "url": url,
      };
}

// enum Badge { EMPTY, BADGE, PURPLE, FLUFFY }

// final badgeValues = EnumValues({
//   "独家": Badge.BADGE,
//   "会员抢先": Badge.EMPTY,
//   "会员专享": Badge.FLUFFY,
//   "出品": Badge.PURPLE
// });

class BadgeInfo {
  BadgeInfo({
    required this.bgColor,
    required this.bgColorNight,
    required this.text,
  });

  String? bgColor;
  String? bgColorNight;
  String? text;

  factory BadgeInfo.fromJson(Map<String, dynamic> json) => BadgeInfo(
        bgColor: json["bg_color"],
        bgColorNight: json["bg_color_night"],
        text: json["text"],
      );

// Map<String, dynamic> toJson() => {
//       "bg_color": bgColorValues.reverse[bgColor],
//       "bg_color_night": bgColorNightValues.reverse[bgColorNight],
//       "text": badgeValues.reverse[text],
//     };
}

// enum BgColor { FB7299, THE_00_C0_FF }
//
// final bgColorValues =
//     EnumValues({"#FB7299": BgColor.FB7299, "#00C0FF": BgColor.THE_00_C0_FF});
//
// enum BgColorNight { BB5_B76, THE_0_B91_BE }
//
// final bgColorNightValues = EnumValues(
//     {"#BB5B76": BgColorNight.BB5_B76, "#0B91BE": BgColorNight.THE_0_B91_BE});
//
// enum Copyright { BILIBILI, DUJIA }
//
// final copyrightValues =
//     EnumValues({"bilibili": Copyright.BILIBILI, "dujia": Copyright.DUJIA});

class NewEp {
  NewEp({
    required this.cover,
    required this.indexShow,
  });

  String cover;
  String indexShow;

  factory NewEp.fromJson(Map<String, dynamic> json) => NewEp(
        cover: json["cover"],
        indexShow: json["index_show"],
      );

  Map<String, dynamic> toJson() => {
        "cover": cover,
        "index_show": indexShow,
      };
}

class Stat {
  Stat({
    required this.danmaku,
    required this.follow,
    required this.seriesFollow,
    required this.view,
  });

  int danmaku;
  int follow;
  int seriesFollow;
  int view;

  factory Stat.fromJson(Map<String, dynamic> json) => Stat(
        danmaku: json["danmaku"],
        follow: json["follow"],
        seriesFollow: json["series_follow"],
        view: json["view"],
      );

  Map<String, dynamic> toJson() => {
        "danmaku": danmaku,
        "follow": follow,
        "series_follow": seriesFollow,
        "view": view,
      };
}

// class EnumValues<T> {
//   Map<String, T> map;
//   late Map<T, String> reverseMap;
//
//   EnumValues(this.map);
//
//   Map<T, String> get reverse {
//     if (reverseMap == null) {
//       reverseMap = map.map((k, v) => new MapEntry(v, k));
//     }
//     return reverseMap;
//   }
// }
