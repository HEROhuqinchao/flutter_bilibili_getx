// To parse this JSON data, do
//
//     final hyComicTimelineModel = hyComicTimelineModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

HyComicTimelineModel hyComicTimelineModelFromJson(String str) =>
    HyComicTimelineModel.fromJson(json.decode(str));

String hyComicTimelineModelToJson(HyComicTimelineModel data) =>
    json.encode(data.toJson());

class HyComicTimelineModel {
  HyComicTimelineModel({
    required this.latest,
    required this.timeline,
  });

  List<Latest> latest;
  List<Timeline> timeline;

  factory HyComicTimelineModel.fromJson(Map<String, dynamic> json) =>
      HyComicTimelineModel(
        latest:
            List<Latest>.from(json["latest"].map((x) => Latest.fromJson(x))),
        timeline: List<Timeline>.from(
            json["timeline"].map((x) => Timeline.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "latest": List<dynamic>.from(latest.map((x) => x.toJson())),
        "timeline": List<dynamic>.from(timeline.map((x) => x.toJson())),
      };
}

class Latest {
  Latest({
    required this.cover,
    required this.delay,
    required this.delayId,
    required this.delayIndex,
    required this.delayReason,
    required this.epCover,
    required this.episodeId,
    required this.follows,
    required this.plays,
    required this.pubIndex,
    required this.pubTime,
    required this.pubTs,
    required this.published,
    required this.seasonId,
    required this.squareCover,
    required this.title,
  });

  String cover;
  int delay;
  int delayId;
  String delayIndex;
  String delayReason;
  String epCover;
  int episodeId;
  String follows;
  String plays;
  String pubIndex;
  String pubTime;
  int pubTs;
  int published;
  int seasonId;
  String squareCover;
  String title;

  factory Latest.fromJson(Map<String, dynamic> json) => Latest(
        cover: json["cover"],
        delay: json["delay"],
        delayId: json["delay_id"],
        delayIndex: json["delay_index"],
        delayReason: json["delay_reason"],
        epCover: json["ep_cover"],
        episodeId: json["episode_id"],
        follows: json["follows"],
        plays: json["plays"],
        pubIndex: json["pub_index"],
        pubTime: json["pub_time"],
        pubTs: json["pub_ts"],
        published: json["published"],
        seasonId: json["season_id"],
        squareCover: json["square_cover"],
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "cover": cover,
        "delay": delay,
        "delay_id": delayId,
        "delay_index": delayIndex,
        "delay_reason": delayReason,
        "ep_cover": epCover,
        "episode_id": episodeId,
        "follows": follows,
        "plays": plays,
        "pub_index": pubIndex,
        "pub_time": pubTime,
        "pub_ts": pubTs,
        "published": published,
        "season_id": seasonId,
        "square_cover": squareCover,
        "title": title,
      };
}

class Timeline {
  Timeline({
    required this.date,
    required this.dateTs,
    required this.dayOfWeek,
    required this.episodes,
    required this.isToday,
  });

  String date;
  int dateTs;
  int dayOfWeek;
  List<Latest> episodes;
  int isToday;

  factory Timeline.fromJson(Map<String, dynamic> json) => Timeline(
        date: json["date"],
        dateTs: json["date_ts"],
        dayOfWeek: json["day_of_week"],
        episodes:
            List<Latest>.from(json["episodes"].map((x) => Latest.fromJson(x))),
        isToday: json["is_today"],
      );

  Map<String, dynamic> toJson() => {
        "date": date,
        "date_ts": dateTs,
        "day_of_week": dayOfWeek,
        "episodes": List<dynamic>.from(episodes.map((x) => x.toJson())),
        "is_today": isToday,
      };
}
