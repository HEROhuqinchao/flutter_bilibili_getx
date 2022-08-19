// To parse this JSON data, do
//
//     final hyPopularSeriesOneModel = hyPopularSeriesOneModelFromJson(jsonString);

import 'dart:convert';

HYPopularSeriesOneModel hyPopularSeriesOneModelFromJson(String str) =>
    HYPopularSeriesOneModel.fromJson(json.decode(str));

String hyPopularSeriesOneModelToJson(HYPopularSeriesOneModel data) =>
    json.encode(data.toJson());

class HYPopularSeriesOneModel {
  HYPopularSeriesOneModel({
    required this.config,
    required this.reminder,
    required this.list,
  });

  Config config;
  String reminder;
  List<ListElement> list;

  factory HYPopularSeriesOneModel.fromJson(Map<String, dynamic> json) =>
      HYPopularSeriesOneModel(
        config: Config.fromJson(json["config"]),
        reminder: json["reminder"],
        list: List<ListElement>.from(
            json["list"].map((x) => ListElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "config": config.toJson(),
        "reminder": reminder,
        "list": List<dynamic>.from(list.map((x) => x.toJson())),
      };
}

class Config {
  Config({
    required this.id,
    required this.type,
    required this.number,
    required this.subject,
    required this.stime,
    required this.etime,
    required this.status,
    required this.name,
    required this.label,
    required this.hint,
    required this.color,
    required this.cover,
    required this.shareTitle,
    required this.shareSubtitle,
    required this.mediaId,
  });

  int id;
  String type;
  int number;
  String subject;
  int stime;
  int etime;
  int status;
  String name;
  String label;
  String hint;
  int color;
  String cover;
  String shareTitle;
  String shareSubtitle;
  int mediaId;

  factory Config.fromJson(Map<String, dynamic> json) => Config(
        id: json["id"],
        type: json["type"],
        number: json["number"],
        subject: json["subject"],
        stime: json["stime"],
        etime: json["etime"],
        status: json["status"],
        name: json["name"],
        label: json["label"],
        hint: json["hint"],
        color: json["color"],
        cover: json["cover"],
        shareTitle: json["share_title"],
        shareSubtitle: json["share_subtitle"],
        mediaId: json["media_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
        "number": number,
        "subject": subject,
        "stime": stime,
        "etime": etime,
        "status": status,
        "name": name,
        "label": label,
        "hint": hint,
        "color": color,
        "cover": cover,
        "share_title": shareTitle,
        "share_subtitle": shareSubtitle,
        "media_id": mediaId,
      };
}

class ListElement {
  ListElement({
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
    required this.missionId,
    required this.rights,
    required this.owner,
    required this.stat,
    required this.listDynamic,
    required this.cid,
    required this.dimension,
    required this.shortLink,
    required this.shortLinkV2,
    required this.bvid,
    required this.seasonType,
    required this.isOgv,
    required this.ogvInfo,
    required this.rcmdReason,
    required this.orderId,
    required this.seasonId,
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
  int missionId;
  Map<String, int> rights;
  Owner owner;
  Map<String, int> stat;
  String listDynamic;
  int cid;
  Dimension dimension;
  String shortLink;
  String shortLinkV2;
  String bvid;
  int seasonType;
  bool isOgv;
  dynamic ogvInfo;
  String rcmdReason;
  int orderId = 0;
  int seasonId = 0;

  factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
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
        missionId: json["mission_id"] ?? 0,
        rights:
            Map.from(json["rights"]).map((k, v) => MapEntry<String, int>(k, v)),
        owner: Owner.fromJson(json["owner"]),
        stat: Map.from(json["stat"]).map((k, v) => MapEntry<String, int>(k, v)),
        listDynamic: json["dynamic"],
        cid: json["cid"],
        dimension: Dimension.fromJson(json["dimension"]),
        shortLink: json["short_link"],
        shortLinkV2: json["short_link_v2"],
        bvid: json["bvid"],
        seasonType: json["season_type"],
        isOgv: json["is_ogv"],
        ogvInfo: json["ogv_info"],
        rcmdReason: json["rcmd_reason"],
        orderId: json["order_id"] ?? 0,
        seasonId: json["season_id"] ?? 0,
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
        "mission_id": missionId,
        "rights":
            Map.from(rights).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "owner": owner.toJson(),
        "stat": Map.from(stat).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "dynamic": listDynamic,
        "cid": cid,
        "dimension": dimension.toJson(),
        "short_link": shortLink,
        "short_link_v2": shortLinkV2,
        "bvid": bvid,
        "season_type": seasonType,
        "is_ogv": isOgv,
        "ogv_info": ogvInfo,
        "rcmd_reason": rcmdReason,
        "order_id": orderId,
        "season_id": seasonId,
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
