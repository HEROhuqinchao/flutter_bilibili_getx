// To parse this JSON data, do
//
//     final hyArchiveRelatedModel = hyArchiveRelatedModelFromJson(jsonString);

/**
 * 废除，暂时用不上，先留着
 */

/*

import 'dart:convert';

import 'dart:math';

import 'package:flutter_bilibili/core/model/video_data.dart';

import '../../ui/shared/math_compute.dart';

List<HYArchiveRelatedModel> hyArchiveRelatedModelFromJson(String str) => List<HYArchiveRelatedModel>.from(json.decode(str).map((x) => HYArchiveRelatedModel.fromJson(x)));

String hyArchiveRelatedModelToJson(List<HYArchiveRelatedModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));


VideoData randomGetVideo() {
  int randomNum = Random().nextInt(videoList.length);
  return videoList[randomNum];
}

class HYArchiveRelatedModel {

  HYArchiveRelatedModel({
    required this.aid,
    required this.videos,
    required this.tid,
    required this.tname,
    required this.copyright,
    required this.pic,
    required this.title,
    required this.pubdate,
    required this.ctime,
    required this.desc,
    required this.state,
    required this.duration,
    required this.durationText,  //时间文本格式
    required this.rights,
    required this.owner,
    required this.stat,
    required this.hyArchiveRelatedModelDynamic,
    required this.cid,
    required this.dimension,
    required this.shortLink,
    required this.shortLinkV2,
    videoData,
    required this.upFromV2,
    required this.firstFrame,
    required this.bvid,
    required this.seasonType,
    required this.isOgv,
    required this.ogvInfo,
    required this.rcmdReason,
  }) : videoData = randomGetVideo();

  int aid;
  int videos;
  int tid;
  String tname;
  int copyright;
  String pic;
  String title;
  int pubdate;
  int ctime;
  String desc;
  int state;
  int duration;
  String durationText;  //新增时间文本
  Map<String, int> rights;
  Owner owner;
  Map<String, int> stat;
  String hyArchiveRelatedModelDynamic;
  int cid;
  Dimension dimension;
  String shortLink;
  String shortLinkV2;
  VideoData videoData;
  dynamic upFromV2;
  dynamic firstFrame;
  String bvid;
  int seasonType;
  bool isOgv;
  dynamic ogvInfo;
  String rcmdReason;

  factory HYArchiveRelatedModel.fromJson(Map<String, dynamic> json) => HYArchiveRelatedModel(
    aid: json["aid"],
    videos: json["videos"],
    tid: json["tid"],
    tname: json["tname"],
    copyright: json["copyright"],
    pic: json["pic"],
    title: json["title"],
    pubdate: json["pubdate"],
    ctime: json["ctime"],
    desc: json["desc"],
    state: json["state"],
    duration: json["duration"],
    durationText: changeToDurationText((json["duration"] as int).toDouble()),  //初始化数值
    rights: Map.from(json["rights"]).map((k, v) => MapEntry<String, int>(k, v)),
    owner: Owner.fromJson(json["owner"]),
    stat: Map.from(json["stat"]).map((k, v) => MapEntry<String, int>(k, v)),
    hyArchiveRelatedModelDynamic: json["dynamic"],
    cid: json["cid"],
    dimension: Dimension.fromJson(json["dimension"]),
    shortLink: json["short_link"],
    shortLinkV2: json["short_link_v2"],
    upFromV2: json["up_from_v2"],
    firstFrame: json["first_frame"],
    bvid: json["bvid"],
    seasonType: json["season_type"],
    isOgv: json["is_ogv"],
    ogvInfo: json["ogv_info"],
    rcmdReason: json["rcmd_reason"],
  );

  Map<String, dynamic> toJson() => {
    "aid": aid,
    "videos": videos,
    "tid": tid,
    "tname": tname,
    "copyright": copyright,
    "pic": pic,
    "title": title,
    "pubdate": pubdate,
    "ctime": ctime,
    "desc": desc,
    "state": state,
    "duration": duration,
    "durationText": durationText,
    "rights": Map.from(rights).map((k, v) => MapEntry<String, dynamic>(k, v)),
    "owner": owner.toJson(),
    "stat": Map.from(stat).map((k, v) => MapEntry<String, dynamic>(k, v)),
    "dynamic": hyArchiveRelatedModelDynamic,
    "cid": cid,
    "dimension": dimension.toJson(),
    "short_link": shortLink,
    "short_link_v2": shortLinkV2,
    "up_from_v2": upFromV2,
    "first_frame": firstFrame,
    "bvid": bvid,
    "season_type": seasonType,
    "is_ogv": isOgv,
    "ogv_info": ogvInfo,
    "rcmd_reason": rcmdReason,
  };
}


class Dimension {
  Dimension({
    required this.width,
    required this.height,
    required this.rotate,
  });

  int width;
  int height;
  int rotate;

  factory Dimension.fromJson(Map<String, dynamic> json) => Dimension(
    width: json["width"],
    height: json["height"],
    rotate: json["rotate"],
  );

  Map<String, dynamic> toJson() => {
    "width": width,
    "height": height,
    "rotate": rotate,
  };
}

class Owner {
  Owner({
    required this.mid,
    required this.name,
    required this.face,
  });

  int mid;
  String name;
  String face;

  factory Owner.fromJson(Map<String, dynamic> json) => Owner(
    mid: json["mid"],
    name: json["name"],
    face: json["face"],
  );

  Map<String, dynamic> toJson() => {
    "mid": mid,
    "name": name,
    "face": face,
  };
}

 */