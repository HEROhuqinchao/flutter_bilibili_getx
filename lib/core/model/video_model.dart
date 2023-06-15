// To parse this JSON data, do
//
//     final hyVideoModel = hyVideoModelFromJson(jsonString);

import 'dart:convert';

import '../../ui/shared/math_compute.dart';

HYVideoModel hyVideoModelFromJson(String str) =>
    HYVideoModel.fromJson(json.decode(str));

String hyVideoModelToJson(HYVideoModel data) => json.encode(data.toJson());

class HYVideoModel {
  HYVideoModel({
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
    required this.duration, //时间
    required this.durationText, //时间文本格式
    required this.rights,
    required this.owner,
    required this.stat,
    required this.hyVideoModelDynamic,
    required this.cid,
    required this.dimension,
    required this.seasonId,
    required this.shortLink,
    required this.shortLinkV2,
    required this.firstFrame,
    required this.bvid,
    required this.seasonType,
    required this.isOgv,
    required this.ogvInfo,
    required this.rcmdReason,
  });

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
  String durationText; //新增时间文本
  Map<String, int> rights;
  Owner owner;
  Map<String, int> stat;
  String hyVideoModelDynamic;
  int cid;
  Dimension dimension;
  int? seasonId;
  String shortLink;
  String shortLinkV2;

  String? firstFrame;
  String bvid;
  int seasonType;
  bool isOgv;
  dynamic ogvInfo;
  String rcmdReason;

  ///视频原mp4地址
  String _videoData = "";

  String get videoData => _videoData;

  set videoData(String value) {
    _videoData = value;
  }

  factory HYVideoModel.fromJson(Map<String, dynamic> json) {
    return HYVideoModel(
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
      durationText: changeToDurationText((json["duration"] as int).toDouble()),
      //初始化数值
      rights:
          Map.from(json["rights"]).map((k, v) => MapEntry<String, int>(k, v)),
      owner: Owner.fromJson(json["owner"]),
      stat: Map.from(json["stat"]).map((k, v) => MapEntry<String, int>(k, v)),
      hyVideoModelDynamic: json["dynamic"],
      cid: json["cid"],
      dimension: Dimension.fromJson(json["dimension"]),
      seasonId: json["season_id"],
      shortLink: json["short_link"],
      shortLinkV2: json["short_link_v2"],
      firstFrame: json["first_frame"],
      bvid: json["bvid"],
      seasonType: json["season_type"],
      isOgv: json["is_ogv"],
      ogvInfo: json["ogv_info"],
      rcmdReason: json["rcmd_reason"],
    );
  }

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
        "rights":
            Map.from(rights).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "owner": owner.toJson(),
        "stat": Map.from(stat).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "dynamic": hyVideoModelDynamic,
        "cid": cid,
        "dimension": dimension.toJson(),
        "season_id": seasonId,
        "short_link": shortLink,
        "short_link_v2": shortLinkV2,
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
