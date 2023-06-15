// To parse this JSON data, do
//
//     final videoProfileModel = videoProfileModelFromJson(jsonString);

import 'dart:convert';

VideoProfileModel videoProfileModelFromJson(String str) =>
    VideoProfileModel.fromJson(json.decode(str));

String videoProfileModelToJson(VideoProfileModel data) =>
    json.encode(data.toJson());

class VideoProfileModel {
  VideoProfileModel({
    required this.code,
    required this.message,
    required this.ttl,
    required this.data,
  });

  int? code;
  String? message;
  int? ttl;
  VideoProfileData data;

  factory VideoProfileModel.fromJson(Map<String, dynamic> json) =>
      VideoProfileModel(
        code: json["code"],
        message: json["message"],
        ttl: json["ttl"],
        data: VideoProfileData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "ttl": ttl,
        "data": data.toJson(),
      };
}

class VideoProfileData {
  VideoProfileData({
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
    required this.rights,
    required this.owner,
    required this.stat,
    required this.dataDynamic,
    required this.cid,
    required this.dimension,
    required this.shortLinkV2,
    required this.upFromV2,
    required this.firstFrame,
    required this.pubLocation,
    required this.pages,
    required this.ownerExt,
    required this.reqUser,
    required this.tag,
    required this.tIcon,
    required this.elec,
    required this.relates,
    required this.dislikeReasons,
    required this.dislikeReasonsV2,
    required this.dmSeg,
    // required this.cms,
    required this.cmConfig,
    required this.shortLink,
    required this.playParam,
    required this.config,
    required this.shareSubtitle,
    required this.bvid,
    required this.likeCustom,
    required this.premiereResource,
  });

  int? aid;
  int? videos;
  int? tid;
  String? tname;
  int? copyright;
  String? pic;
  String? title;
  int? pubdate;
  int? ctime;
  String? desc;
  int? state;
  int? duration;
  Map<String, int>? rights;
  Owner? owner;
  Map<String, int>? stat;
  String? dataDynamic;
  int? cid;
  Dimension? dimension;
  String? shortLinkV2;
  int? upFromV2;
  String? firstFrame;
  String? pubLocation;
  List<Page>? pages;
  OwnerExt? ownerExt;
  ReqUser? reqUser;
  List<Tag>? tag;
  TIcon? tIcon;
  Elec? elec;
  List<Relate>? relates;
  List<DislikeReason>? dislikeReasons;
  DislikeReasonsV2? dislikeReasonsV2;
  int? dmSeg;
  // List<Cm>? cms;
  CmConfig? cmConfig;
  String? shortLink;
  int? playParam;
  Config? config;
  String? shareSubtitle;
  String? bvid;
  LikeCustom? likeCustom;
  dynamic premiereResource;

  factory VideoProfileData.fromJson(Map<String, dynamic> json) =>
      VideoProfileData(
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
        rights:
            Map.from(json["rights"]).map((k, v) => MapEntry<String, int>(k, v)),
        owner: Owner.fromJson(json["owner"]),
        stat: Map.from(json["stat"]).map((k, v) => MapEntry<String, int>(k, v)),
        dataDynamic: json["dynamic"],
        cid: json["cid"],
        dimension: Dimension.fromJson(json["dimension"]),
        shortLinkV2: json["short_link_v2"],
        upFromV2: json["up_from_v2"],
        firstFrame: json["first_frame"],
        pubLocation: json["pub_location"],
        pages: List<Page>.from(json["pages"].map((x) => Page.fromJson(x))),
        ownerExt: OwnerExt.fromJson(json["owner_ext"]),
        reqUser: ReqUser.fromJson(json["req_user"]),
        tag: List<Tag>.from(json["tag"].map((x) => Tag.fromJson(x))),
        tIcon: TIcon.fromJson(json["t_icon"]),
        elec: json["elec"] == null ? null : Elec.fromJson(json["elec"]),
        relates:
            List<Relate>.from(json["relates"].map((x) => Relate.fromJson(x))),
        dislikeReasons: List<DislikeReason>.from(
            json["dislike_reasons"].map((x) => DislikeReason.fromJson(x))),
        dislikeReasonsV2: DislikeReasonsV2.fromJson(json["dislike_reasons_v2"]),
        dmSeg: json["dm_seg"],
        // cms: List<Cm>.from(json["cms"].map((x) => Cm.fromJson(x))),
        cmConfig: CmConfig.fromJson(json["cm_config"]),
        shortLink: json["short_link"],
        playParam: json["play_param"],
        config: Config.fromJson(json["config"]),
        shareSubtitle: json["share_subtitle"],
        bvid: json["bvid"],
        likeCustom: LikeCustom.fromJson(json["like_custom"]),
        premiereResource: json["premiere_resource"],
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
        "rights":
            Map.from(rights!).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "owner": owner!.toJson(),
        "stat": Map.from(stat!).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "dynamic": dataDynamic,
        "cid": cid,
        "dimension": dimension!.toJson(),
        "short_link_v2": shortLinkV2,
        "up_from_v2": upFromV2,
        "first_frame": firstFrame,
        "pub_location": pubLocation,
        "pages": List<dynamic>.from(pages!.map((x) => x.toJson())),
        "owner_ext": ownerExt!.toJson(),
        "req_user": reqUser!.toJson(),
        "tag": List<dynamic>.from(tag!.map((x) => x.toJson())),
        "t_icon": tIcon!.toJson(),
        "elec": elec!.toJson(),
        "relates": List<dynamic>.from(relates!.map((x) => x.toJson())),
        "dislike_reasons":
            List<dynamic>.from(dislikeReasons!.map((x) => x.toJson())),
        "dislike_reasons_v2": dislikeReasonsV2!.toJson(),
        "dm_seg": dmSeg,
        // "cms": List<dynamic>.from(cms!.map((x) => x.toJson())),
        "cm_config": cmConfig!.toJson(),
        "short_link": shortLink,
        "play_param": playParam,
        "config": config!.toJson(),
        "share_subtitle": shareSubtitle,
        "bvid": bvid,
        "like_custom": likeCustom!.toJson(),
        "premiere_resource": premiereResource,
      };
}

class CmConfig {
  CmConfig({
    required this.adsControl,
  });

  AdsControl? adsControl;

  factory CmConfig.fromJson(Map<String, dynamic> json) => CmConfig(
        adsControl: AdsControl.fromJson(json["ads_control"]),
      );

  Map<String, dynamic> toJson() => {
        "ads_control": adsControl!.toJson(),
      };
}

class AdsControl {
  AdsControl({
    required this.hasDanmu,
  });

  int? hasDanmu;

  factory AdsControl.fromJson(Map<String, dynamic> json) => AdsControl(
        hasDanmu: json["has_danmu"],
      );

  Map<String, dynamic> toJson() => {
        "has_danmu": hasDanmu,
      };
}

class Cm {
  Cm({
    required this.requestId,
    required this.rscId,
    required this.srcId,
    required this.isAdLoc,
    required this.clientIp,
    required this.index,
    required this.adInfo,
  });

  String? requestId;
  int? rscId;
  int? srcId;
  bool? isAdLoc;
  String? clientIp;
  int? index;
  AdInfo? adInfo;

  factory Cm.fromJson(Map<String, dynamic> json) => Cm(
        requestId: json["request_id"],
        rscId: json["rsc_id"],
        srcId: json["src_id"],
        isAdLoc: json["is_ad_loc"],
        clientIp: json["client_ip"],
        index: json["index"],
        adInfo: AdInfo.fromJson(json["ad_info"]),
      );

  Map<String, dynamic> toJson() => {
        "request_id": requestId,
        "rsc_id": rscId,
        "src_id": srcId,
        "is_ad_loc": isAdLoc,
        "client_ip": clientIp,
        "index": index,
        "ad_info": adInfo!.toJson(),
      };
}

class AdInfo {
  AdInfo();

  factory AdInfo.fromJson(Map<String, dynamic> json) => AdInfo();

  Map<String, dynamic> toJson() => {};
}

class Config {
  Config({
    required this.relatesTitle,
    required this.shareStyle,
    required this.recThreePointStyle,
    required this.isAbsoluteTime,
    required this.feedStyle,
    required this.hasGuide,
    required this.feedHasNext,
    required this.localPlay,
  });

  String? relatesTitle;
  int? shareStyle;
  int? recThreePointStyle;
  bool? isAbsoluteTime;
  String? feedStyle;
  bool? hasGuide;
  bool? feedHasNext;
  int? localPlay;

  factory Config.fromJson(Map<String, dynamic> json) => Config(
        relatesTitle: json["relates_title"],
        shareStyle: json["share_style"],
        recThreePointStyle: json["rec_three_point_style"],
        isAbsoluteTime: json["is_absolute_time"],
        feedStyle: json["feed_style"],
        hasGuide: json["has_guide"],
        feedHasNext: json["feed_has_next"],
        localPlay: json["local_play"],
      );

  Map<String, dynamic> toJson() => {
        "relates_title": relatesTitle,
        "share_style": shareStyle,
        "rec_three_point_style": recThreePointStyle,
        "is_absolute_time": isAbsoluteTime,
        "feed_style": feedStyle,
        "has_guide": hasGuide,
        "feed_has_next": feedHasNext,
        "local_play": localPlay,
      };
}

class Dimension {
  Dimension({
    required this.width,
    required this.height,
    required this.rotate,
  });

  int? width;
  int? height;
  int? rotate;

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

class DislikeReason {
  DislikeReason({
    required this.reasonId,
    required this.reasonName,
  });

  int? reasonId;
  String? reasonName;

  factory DislikeReason.fromJson(Map<String, dynamic> json) => DislikeReason(
        reasonId: json["reason_id"],
        reasonName: json["reason_name"],
      );

  Map<String, dynamic> toJson() => {
        "reason_id": reasonId,
        "reason_name": reasonName,
      };
}

class DislikeReasonsV2 {
  DislikeReasonsV2({
    required this.title,
    required this.subtitle,
    required this.reasons,
  });

  String? title;
  String? subtitle;
  List<Reason>? reasons;

  factory DislikeReasonsV2.fromJson(Map<String, dynamic> json) =>
      DislikeReasonsV2(
        title: json["title"],
        subtitle: json["subtitle"],
        reasons:
            List<Reason>.from(json["reasons"].map((x) => Reason.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "subtitle": subtitle,
        "reasons": List<dynamic>.from(reasons!.map((x) => x.toJson())),
      };
}

class Reason {
  Reason({
    required this.id,
    required this.mid,
    required this.name,
    required this.tagId,
    required this.rid,
  });

  int? id;
  int? mid;
  String? name;
  int? tagId;
  int? rid;

  factory Reason.fromJson(Map<String, dynamic> json) => Reason(
        id: json["id"],
        mid: json["mid"],
        name: json["name"],
        tagId: json["tag_id"],
        rid: json["rid"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "mid": mid,
        "name": name,
        "tag_id": tagId,
        "rid": rid,
      };
}

class Elec {
  Elec({
    required this.show,
    required this.total,
    required this.count,
    required this.elecNum,
    required this.list,
    required this.elecSet,
  });

  bool? show;
  int? total;
  int? count;
  int? elecNum;
  List<ListElement>? list;
  ElecSet? elecSet;

  factory Elec.fromJson(Map<String, dynamic> json) => Elec(
        show: json["show"],
        total: json["total"],
        count: json["count"],
        elecNum: json["elec_num"],
        list: json["list"] == null
            ? null
            : List<ListElement>.from(
                json["list"].map((x) => ListElement.fromJson(x))),
        elecSet: ElecSet.fromJson(json["elec_set"]),
      );

  Map<String, dynamic> toJson() => {
        "show": show,
        "total": total,
        "count": count,
        "elec_num": elecNum,
        // "list": List<dynamic>.from(list.map((x) => x.toJson())),
        // "elec_set": elecSet.toJson(),
      };
}

class ElecSet {
  ElecSet({
    required this.elecTheme,
    required this.rmbRate,
    required this.integrityRate,
    required this.roundMode,
    required this.elecList,
  });

  int elecTheme;
  int rmbRate;
  int integrityRate;
  int roundMode;
  List<ElecList> elecList;

  factory ElecSet.fromJson(Map<String, dynamic> json) => ElecSet(
        elecTheme: json["elec_theme"],
        rmbRate: json["rmb_rate"],
        integrityRate: json["integrity_rate"],
        roundMode: json["round_mode"],
        elecList: List<ElecList>.from(
            json["elec_list"].map((x) => ElecList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "elec_theme": elecTheme,
        "rmb_rate": rmbRate,
        "integrity_rate": integrityRate,
        "round_mode": roundMode,
        "elec_list": List<dynamic>.from(elecList.map((x) => x.toJson())),
      };
}

class ElecList {
  ElecList({
    required this.title,
    required this.elecNum,
    required this.isCustomize,
    required this.minElec,
    required this.maxElec,
  });

  String? title;
  int? elecNum;
  int? isCustomize;
  int? minElec;
  int? maxElec;

  factory ElecList.fromJson(Map<String, dynamic> json) => ElecList(
        title: json["title"],
        elecNum: json["elec_num"],
        isCustomize: json["is_customize"],
        minElec: json["min_elec"],
        maxElec: json["max_elec"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "elec_num": elecNum,
        "is_customize": isCustomize,
        "min_elec": minElec,
        "max_elec": maxElec,
      };
}

class ListElement {
  ListElement({
    required this.payMid,
    required this.rank,
    required this.trendType,
    required this.message,
    required this.mid,
    required this.vipInfo,
    required this.uname,
    required this.avatar,
  });

  int payMid;
  int rank;
  int trendType;
  String message;
  int mid;
  VipInfo vipInfo;
  String uname;
  String avatar;

  factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
        payMid: json["pay_mid"],
        rank: json["rank"],
        trendType: json["trend_type"],
        message: json["message"],
        mid: json["mid"],
        vipInfo: VipInfo.fromJson(json["vip_info"]),
        uname: json["uname"],
        avatar: json["avatar"],
      );

  Map<String, dynamic> toJson() => {
        "pay_mid": payMid,
        "rank": rank,
        "trend_type": trendType,
        "message": message,
        "mid": mid,
        "vip_info": vipInfo.toJson(),
        "uname": uname,
        "avatar": avatar,
      };
}

class VipInfo {
  VipInfo({
    required this.vipType,
    required this.vipStatus,
    required this.vipDueMsec,
  });

  int vipType;
  int vipStatus;
  int vipDueMsec;

  factory VipInfo.fromJson(Map<String, dynamic> json) => VipInfo(
        vipType: json["vipType"],
        vipStatus: json["vipStatus"],
        vipDueMsec: json["vipDueMsec"],
      );

  Map<String, dynamic> toJson() => {
        "vipType": vipType,
        "vipStatus": vipStatus,
        "vipDueMsec": vipDueMsec,
      };
}

class LikeCustom {
  LikeCustom({
    required this.likeSwitch,
    required this.fullToHalfProgress,
    required this.nonFullProgress,
    required this.updateCount,
  });

  bool? likeSwitch;
  int? fullToHalfProgress;
  int? nonFullProgress;
  int? updateCount;

  factory LikeCustom.fromJson(Map<String, dynamic> json) => LikeCustom(
        likeSwitch: json["like_switch"],
        fullToHalfProgress: json["full_to_half_progress"],
        nonFullProgress: json["non_full_progress"],
        updateCount: json["update_count"],
      );

  Map<String, dynamic> toJson() => {
        "like_switch": likeSwitch,
        "full_to_half_progress": fullToHalfProgress,
        "non_full_progress": nonFullProgress,
        "update_count": updateCount,
      };
}

class Owner {
  Owner({
    required this.mid,
    required this.name,
    required this.face,
  });

  int? mid;
  String? name;
  String? face;

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

class OwnerExt {
  OwnerExt({
    required this.officialVerify,
    required this.vip,
    required this.assists,
    required this.fans,
    required this.arcCount,
  });

  OfficialVerify? officialVerify;
  Vip? vip;
  dynamic assists;
  int? fans;
  String? arcCount;

  factory OwnerExt.fromJson(Map<String, dynamic> json) => OwnerExt(
        officialVerify: OfficialVerify.fromJson(json["official_verify"]),
        vip: Vip.fromJson(json["vip"]),
        assists: json["assists"],
        fans: json["fans"],
        arcCount: json["arc_count"],
      );

  Map<String, dynamic> toJson() => {
        // "official_verify": officialVerify.toJson(),
        // "vip": vip.toJson(),
        "assists": assists,
        "fans": fans,
        "arc_count": arcCount,
      };
}

class OfficialVerify {
  OfficialVerify({
    required this.type,
    required this.desc,
  });

  int? type;
  String? desc;

  factory OfficialVerify.fromJson(Map<String, dynamic> json) => OfficialVerify(
        type: json["type"],
        desc: json["desc"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "desc": desc,
      };
}

class Vip {
  Vip({
    required this.vipType,
    required this.vipDueDate,
    required this.dueRemark,
    required this.accessStatus,
    required this.vipStatus,
    required this.vipStatusWarn,
    required this.themeType,
    required this.label,
  });

  int? vipType;
  int? vipDueDate;
  String? dueRemark;
  int? accessStatus;
  int? vipStatus;
  String? vipStatusWarn;
  int? themeType;
  Label? label;

  factory Vip.fromJson(Map<String, dynamic> json) => Vip(
        vipType: json["vipType"],
        vipDueDate: json["vipDueDate"],
        dueRemark: json["dueRemark"],
        accessStatus: json["accessStatus"],
        vipStatus: json["vipStatus"],
        vipStatusWarn: json["vipStatusWarn"],
        themeType: json["themeType"],
        label: Label.fromJson(json["label"]),
      );

  Map<String, dynamic> toJson() => {
        "vipType": vipType,
        "vipDueDate": vipDueDate,
        "dueRemark": dueRemark,
        "accessStatus": accessStatus,
        "vipStatus": vipStatus,
        "vipStatusWarn": vipStatusWarn,
        "themeType": themeType,
        // "label": label.toJson(),
      };
}

class Label {
  Label({
    required this.path,
    required this.text,
    required this.labelTheme,
    required this.textColor,
    required this.bgStyle,
    required this.bgColor,
    required this.borderColor,
    required this.useImgLabel,
    required this.imgLabelUriHans,
    required this.imgLabelUriHant,
    required this.imgLabelUriHansStatic,
    required this.imgLabelUriHantStatic,
  });

  String? path;
  String? text;
  String? labelTheme;
  String? textColor;
  int? bgStyle;
  String? bgColor;
  String? borderColor;
  bool? useImgLabel;
  String? imgLabelUriHans;
  String? imgLabelUriHant;
  String? imgLabelUriHansStatic;
  String? imgLabelUriHantStatic;

  factory Label.fromJson(Map<String, dynamic> json) => Label(
        path: json["path"],
        text: json["text"],
        labelTheme: json["label_theme"],
        textColor: json["text_color"],
        bgStyle: json["bg_style"],
        bgColor: json["bg_color"],
        borderColor: json["border_color"],
        useImgLabel: json["use_img_label"],
        imgLabelUriHans: json["img_label_uri_hans"],
        imgLabelUriHant: json["img_label_uri_hant"],
        imgLabelUriHansStatic: json["img_label_uri_hans_static"],
        imgLabelUriHantStatic: json["img_label_uri_hant_static"],
      );

  Map<String, dynamic> toJson() => {
        "path": path,
        "text": text,
        "label_theme": labelTheme,
        "text_color": textColor,
        "bg_style": bgStyle,
        "bg_color": bgColor,
        "border_color": borderColor,
        "use_img_label": useImgLabel,
        "img_label_uri_hans": imgLabelUriHans,
        "img_label_uri_hant": imgLabelUriHant,
        "img_label_uri_hans_static": imgLabelUriHansStatic,
        "img_label_uri_hant_static": imgLabelUriHantStatic,
      };
}

class Page {
  Page({
    required this.cid,
    required this.page,
    required this.from,
    required this.pagePart,
    required this.duration,
    required this.vid,
    required this.weblink,
    required this.dimension,
    required this.firstFrame,
    required this.metas,
    required this.dmlink,
    required this.downloadTitle,
    required this.downloadSubtitle,
  });

  int? cid;
  int? page;
  String? from;
  String? pagePart;
  int? duration;
  String? vid;
  String? weblink;
  Dimension? dimension;
  String? firstFrame;
  List<Meta>? metas;
  String? dmlink;
  String? downloadTitle;
  String? downloadSubtitle;

  factory Page.fromJson(Map<String, dynamic> json) => Page(
        cid: json["cid"],
        page: json["page"],
        from: json["from"],
        pagePart: json["part"],
        duration: json["duration"],
        vid: json["vid"],
        weblink: json["weblink"],
        dimension: Dimension.fromJson(json["dimension"]),
        firstFrame: json["first_frame"],
        metas: List<Meta>.from(json["metas"].map((x) => Meta.fromJson(x))),
        dmlink: json["dmlink"],
        downloadTitle: json["download_title"],
        downloadSubtitle: json["download_subtitle"],
      );

  Map<String, dynamic> toJson() => {
        "cid": cid,
        "page": page,
        "from": from,
        "part": pagePart,
        "duration": duration,
        "vid": vid,
        "weblink": weblink,
        // "dimension": dimension.toJson(),
        "first_frame": firstFrame,
        // "metas": List<dynamic>.from(metas.map((x) => x.toJson())),
        "dmlink": dmlink,
        "download_title": downloadTitle,
        "download_subtitle": downloadSubtitle,
      };
}

class Meta {
  Meta({
    required this.quality,
    required this.format,
    required this.size,
  });

  int? quality;
  String? format;
  int? size;

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        quality: json["quality"],
        format: json["format"],
        size: json["size"],
      );

  Map<String, dynamic> toJson() => {
        "quality": quality,
        "format": format,
        "size": size,
      };
}

class Relate {
  Relate({
    required this.title,
    required this.owner,
    required this.stat,
    required this.goto,
    required this.param,
    required this.uri,
    required this.desc,
    required this.adIndex,
    required this.cmMark,
    required this.srcId,
    required this.requestId,
    required this.creativeId,
    required this.type,
    required this.cover,
    required this.isAd,
    required this.isAdLoc,
    required this.adCb,
    required this.showUrl,
    required this.clickUrl,
    required this.clientIp,
    required this.extra,
    required this.cardIndex,
    required this.trackid,
    required this.fromSourceType,
    required this.fromSourceId,
    required this.dimension,
    required this.badgeStyle,
    required this.powerIconStyle,
    required this.rankInfo,
    required this.aid,
    required this.pic,
    required this.duration,
    required this.cid,
  });

  String? title;
  Owner owner;
  Map<String, int> stat;
  String? goto;
  String? param;
  String? uri;
  String? desc;
  int? adIndex;
  int? cmMark;
  int? srcId;
  String? requestId;
  int? creativeId;
  int? type;
  String? cover;
  bool? isAd;
  bool? isAdLoc;
  String? adCb;
  String? showUrl;
  String? clickUrl;
  String? clientIp;
  Extra? extra;
  int? cardIndex;
  String? trackid;
  int? fromSourceType;
  String? fromSourceId;
  Dimension dimension;
  dynamic badgeStyle;
  dynamic powerIconStyle;
  dynamic rankInfo;
  int? aid;
  String? pic;
  int? duration;
  int? cid;

  factory Relate.fromJson(Map<String, dynamic> json) => Relate(
        title: json["title"],
        owner: Owner.fromJson(json["owner"]),
        stat: Map.from(json["stat"]).map((k, v) => MapEntry<String, int>(k, v)),
        goto: json["goto"],
        param: json["param"],
        uri: json["uri"],
        desc: json["desc"],
        adIndex: json["ad_index"],
        cmMark: json["cm_mark"],
        srcId: json["src_id"],
        requestId: json["request_id"],
        creativeId: json["creative_id"],
        type: json["type"],
        cover: json["cover"],
        isAd: json["is_ad"],
        isAdLoc: json["is_ad_loc"],
        adCb: json["ad_cb"],
        showUrl: json["show_url"],
        clickUrl: json["click_url"],
        clientIp: json["client_ip"],
        extra: json["extra"] == null ? null : Extra.fromJson(json["extra"]),
        cardIndex: json["card_index"],
        trackid: json["trackid"],
        fromSourceType: json["from_source_type"],
        fromSourceId: json["from_source_id"],
        dimension: Dimension.fromJson(json["dimension"]),
        badgeStyle: json["BadgeStyle"],
        powerIconStyle: json["PowerIconStyle"],
        rankInfo: json["rank_info"],
        aid: json["aid"],
        pic: json["pic"],
        duration: json["duration"],
        cid: json["cid"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "owner": owner.toJson(),
        "stat": Map.from(stat).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "goto": goto,
        "param": param,
        "uri": uri,
        "desc": desc,
        "ad_index": adIndex,
        "cm_mark": cmMark,
        "src_id": srcId,
        "request_id": requestId,
        "creative_id": creativeId,
        "type": type,
        "cover": cover,
        "is_ad": isAd,
        "is_ad_loc": isAdLoc,
        "ad_cb": adCb,
        "show_url": showUrl,
        "click_url": clickUrl,
        "client_ip": clientIp,
        "extra": extra == null ? null : extra!.toJson(),
        "card_index": cardIndex,
        "trackid": trackid,
        "from_source_type": fromSourceType,
        "from_source_id": fromSourceId,
        "dimension": dimension.toJson(),
        "BadgeStyle": badgeStyle,
        "PowerIconStyle": powerIconStyle,
        "rank_info": rankInfo,
        "aid": aid,
        "pic": pic,
        "duration": duration,
        "cid": cid,
      };
}

class Extra {
  Extra({
    required this.actImg,
    required this.adContentType,
    required this.appstorePriority,
    required this.appstoreUrl,
    required this.bgImg,
    required this.card,
    required this.clickArea,
    required this.clickUrls,
    required this.enableDoubleJump,
    required this.enableH5Alert,
    required this.enableH5PreLoad,
    required this.enableStoreDirectLaunch,
    required this.feedbackPanelStyle,
    required this.fromTrackId,
    required this.h5PreLoadUrl,
    required this.landingpageDownloadStyle,
    required this.layout,
    required this.macroReplacePriority,
    required this.preloadLandingpage,
    required this.productId,
    required this.reportTime,
    required this.salesType,
    required this.showUrls,
    required this.specialIndustry,
    required this.specialIndustryStyle,
    required this.specialIndustryTips,
    required this.storeCallupCard,
    required this.trackId,
    required this.upMid,
    required this.useAdWebV2,
  });

  String actImg;
  int adContentType;
  int appstorePriority;
  String appstoreUrl;
  String bgImg;
  Card card;
  int clickArea;
  List<String> clickUrls;
  bool enableDoubleJump;
  bool enableH5Alert;
  int enableH5PreLoad;
  int enableStoreDirectLaunch;
  int feedbackPanelStyle;
  String fromTrackId;
  String h5PreLoadUrl;
  int landingpageDownloadStyle;
  String layout;
  int macroReplacePriority;
  int preloadLandingpage;
  int productId;
  int reportTime;
  int salesType;
  List<String>? showUrls;
  bool specialIndustry;
  int specialIndustryStyle;
  String specialIndustryTips;
  bool storeCallupCard;
  String trackId;
  int upMid;
  bool useAdWebV2;

  factory Extra.fromJson(Map<String, dynamic> json) => Extra(
        actImg: json["act_img"],
        adContentType: json["ad_content_type"],
        appstorePriority: json["appstore_priority"],
        appstoreUrl: json["appstore_url"],
        bgImg: json["bg_img"],
        card: Card.fromJson(json["card"]),
        clickArea: json["click_area"],
        clickUrls: List<String>.from(json["click_urls"].map((x) => x)),
        enableDoubleJump: json["enable_double_jump"],
        enableH5Alert: json["enable_h5_alert"],
        enableH5PreLoad: json["enable_h5_pre_load"],
        enableStoreDirectLaunch: json["enable_store_direct_launch"],
        feedbackPanelStyle: json["feedback_panel_style"],
        fromTrackId: json["from_track_id"],
        h5PreLoadUrl: json["h5_pre_load_url"],
        landingpageDownloadStyle: json["landingpage_download_style"],
        layout: json["layout"],
        macroReplacePriority: json["macro_replace_priority"],
        preloadLandingpage: json["preload_landingpage"],
        productId: json["product_id"],
        reportTime: json["report_time"],
        salesType: json["sales_type"],
        showUrls: json["show_urls"] == null ? null : List<String>.from(json["show_urls"].map((x) => x)),
        specialIndustry: json["special_industry"],
        specialIndustryStyle: json["special_industry_style"],
        specialIndustryTips: json["special_industry_tips"],
        storeCallupCard: json["store_callup_card"],
        trackId: json["track_id"],
        upMid: json["up_mid"],
        useAdWebV2: json["use_ad_web_v2"],
      );

  Map<String, dynamic> toJson() => {
        "act_img": actImg,
        "ad_content_type": adContentType,
        "appstore_priority": appstorePriority,
        "appstore_url": appstoreUrl,
        "bg_img": bgImg,
        "card": card.toJson(),
        "click_area": clickArea,
        "click_urls": List<dynamic>.from(clickUrls.map((x) => x)),
        "enable_double_jump": enableDoubleJump,
        "enable_h5_alert": enableH5Alert,
        "enable_h5_pre_load": enableH5PreLoad,
        "enable_store_direct_launch": enableStoreDirectLaunch,
        "feedback_panel_style": feedbackPanelStyle,
        "from_track_id": fromTrackId,
        "h5_pre_load_url": h5PreLoadUrl,
        "landingpage_download_style": landingpageDownloadStyle,
        "layout": layout,
        "macro_replace_priority": macroReplacePriority,
        "preload_landingpage": preloadLandingpage,
        "product_id": productId,
        "report_time": reportTime,
        "sales_type": salesType,
        "show_urls": List<dynamic>.from(showUrls!.map((x) => x)),
        "special_industry": specialIndustry,
        "special_industry_style": specialIndustryStyle,
        "special_industry_tips": specialIndustryTips,
        "store_callup_card": storeCallupCard,
        "track_id": trackId,
        "up_mid": upMid,
        "use_ad_web_v2": useAdWebV2,
      };
}

class Card {
  Card({
    required this.adTag,
    required this.adTagStyle,
    required this.adver,
    required this.adverAccountId,
    required this.adverLogo,
    required this.adverMid,
    required this.adverName,
    required this.adverPageUrl,
    required this.callupUrl,
    required this.cardType,
    required this.covers,
    required this.desc,
    required this.duration,
    required this.dynamicText,
    required this.extraDesc,
    required this.extremeTeamIcon,
    required this.extremeTeamStatus,
    required this.feedbackPanel,
    required this.goodsCurPrice,
    required this.goodsOriPrice,
    required this.imaxLandingPageV2,
    required this.jumpUrl,
    required this.liveBookingPopulationThreshold,
    required this.liveRoomArea,
    required this.liveRoomPopularity,
    required this.liveRoomTitle,
    required this.liveStreamerFace,
    required this.liveStreamerName,
    required this.liveTagShow,
    required this.longDesc,
    required this.oriMarkHidden,
    required this.ottJumpUrl,
    required this.priceDesc,
    required this.priceSymbol,
    // required this.qualityInfos,
    required this.supportTransition,
    required this.title,
    required this.transition,
    required this.universalApp,
    required this.useMultiCover,
  });

  String adTag;
  AdTagStyle adTagStyle;
  Adver adver;
  int adverAccountId;
  String adverLogo;
  int adverMid;
  String adverName;
  String adverPageUrl;
  String callupUrl;
  int cardType;
  List<Cover> covers;
  String desc;
  String duration;
  String dynamicText;
  String extraDesc;
  String extremeTeamIcon;
  bool extremeTeamStatus;
  FeedbackPanel feedbackPanel;
  String goodsCurPrice;
  String goodsOriPrice;
  String imaxLandingPageV2;
  String jumpUrl;
  int liveBookingPopulationThreshold;
  String liveRoomArea;
  int liveRoomPopularity;
  String liveRoomTitle;
  String liveStreamerFace;
  String liveStreamerName;
  bool liveTagShow;
  String longDesc;
  int oriMarkHidden;
  String ottJumpUrl;
  String priceDesc;
  String priceSymbol;
  // List<QualityInfo> qualityInfos;
  bool supportTransition;
  String title;
  String transition;
  String universalApp;
  bool useMultiCover;

  factory Card.fromJson(Map<String, dynamic> json) => Card(
        adTag: json["ad_tag"],
        adTagStyle: AdTagStyle.fromJson(json["ad_tag_style"]),
        adver: Adver.fromJson(json["adver"]),
        adverAccountId: json["adver_account_id"],
        adverLogo: json["adver_logo"],
        adverMid: json["adver_mid"],
        adverName: json["adver_name"],
        adverPageUrl: json["adver_page_url"],
        callupUrl: json["callup_url"],
        cardType: json["card_type"],
        covers: List<Cover>.from(json["covers"].map((x) => Cover.fromJson(x))),
        desc: json["desc"],
        duration: json["duration"],
        dynamicText: json["dynamic_text"],
        extraDesc: json["extra_desc"],
        extremeTeamIcon: json["extreme_team_icon"],
        extremeTeamStatus: json["extreme_team_status"],
        feedbackPanel: FeedbackPanel.fromJson(json["feedback_panel"]),
        goodsCurPrice: json["goods_cur_price"],
        goodsOriPrice: json["goods_ori_price"],
        imaxLandingPageV2: json["imax_landing_page_v2"],
        jumpUrl: json["jump_url"],
        liveBookingPopulationThreshold:
            json["live_booking_population_threshold"],
        liveRoomArea: json["live_room_area"],
        liveRoomPopularity: json["live_room_popularity"],
        liveRoomTitle: json["live_room_title"],
        liveStreamerFace: json["live_streamer_face"],
        liveStreamerName: json["live_streamer_name"],
        liveTagShow: json["live_tag_show"],
        longDesc: json["long_desc"],
        oriMarkHidden: json["ori_mark_hidden"],
        ottJumpUrl: json["ott_jump_url"],
        priceDesc: json["price_desc"],
        priceSymbol: json["price_symbol"],
        // qualityInfos: List<QualityInfo>.from(
        //     json["quality_infos"].map((x) => QualityInfo.fromJson(x))),
        supportTransition: json["support_transition"],
        title: json["title"],
        transition: json["transition"],
        universalApp: json["universal_app"],
        useMultiCover: json["use_multi_cover"],
      );

  Map<String, dynamic> toJson() => {
        "ad_tag": adTag,
        "ad_tag_style": adTagStyle.toJson(),
        "adver": adver.toJson(),
        "adver_account_id": adverAccountId,
        "adver_logo": adverLogo,
        "adver_mid": adverMid,
        "adver_name": adverName,
        "adver_page_url": adverPageUrl,
        "callup_url": callupUrl,
        "card_type": cardType,
        "covers": List<dynamic>.from(covers.map((x) => x.toJson())),
        "desc": desc,
        "duration": duration,
        "dynamic_text": dynamicText,
        "extra_desc": extraDesc,
        "extreme_team_icon": extremeTeamIcon,
        "extreme_team_status": extremeTeamStatus,
        "feedback_panel": feedbackPanel.toJson(),
        "goods_cur_price": goodsCurPrice,
        "goods_ori_price": goodsOriPrice,
        "imax_landing_page_v2": imaxLandingPageV2,
        "jump_url": jumpUrl,
        "live_booking_population_threshold": liveBookingPopulationThreshold,
        "live_room_area": liveRoomArea,
        "live_room_popularity": liveRoomPopularity,
        "live_room_title": liveRoomTitle,
        "live_streamer_face": liveStreamerFace,
        "live_streamer_name": liveStreamerName,
        "live_tag_show": liveTagShow,
        "long_desc": longDesc,
        "ori_mark_hidden": oriMarkHidden,
        "ott_jump_url": ottJumpUrl,
        "price_desc": priceDesc,
        "price_symbol": priceSymbol,
        // "quality_infos":
        //     List<dynamic>.from(qualityInfos.map((x) => x.toJson())),
        "support_transition": supportTransition,
        "title": title,
        "transition": transition,
        "universal_app": universalApp,
        "use_multi_cover": useMultiCover,
      };
}

class AdTagStyle {
  AdTagStyle({
    required this.bgBorderColor,
    required this.bgColor,
    required this.bgColorNight,
    required this.borderColor,
    required this.borderColorNight,
    required this.imgHeight,
    required this.imgUrl,
    required this.imgWidth,
    required this.text,
    required this.textColor,
    required this.textColorNight,
    required this.type,
  });

  String bgBorderColor;
  String bgColor;
  String bgColorNight;
  String borderColor;
  String borderColorNight;
  int imgHeight;
  String imgUrl;
  int imgWidth;
  String text;
  String textColor;
  String textColorNight;
  int type;

  factory AdTagStyle.fromJson(Map<String, dynamic> json) => AdTagStyle(
        bgBorderColor: json["bg_border_color"],
        bgColor: json["bg_color"],
        bgColorNight: json["bg_color_night"],
        borderColor: json["border_color"],
        borderColorNight: json["border_color_night"],
        imgHeight: json["img_height"],
        imgUrl: json["img_url"],
        imgWidth: json["img_width"],
        text: json["text"],
        textColor: json["text_color"],
        textColorNight: json["text_color_night"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "bg_border_color": bgBorderColor,
        "bg_color": bgColor,
        "bg_color_night": bgColorNight,
        "border_color": borderColor,
        "border_color_night": borderColorNight,
        "img_height": imgHeight,
        "img_url": imgUrl,
        "img_width": imgWidth,
        "text": text,
        "text_color": textColor,
        "text_color_night": textColorNight,
        "type": type,
      };
}

class Adver {
  Adver({
    required this.adverDesc,
    required this.adverId,
    required this.adverLogo,
    required this.adverName,
    required this.adverPageUrl,
    required this.adverType,
  });

  String adverDesc;
  int adverId;
  String adverLogo;
  String adverName;
  String adverPageUrl;
  int adverType;

  factory Adver.fromJson(Map<String, dynamic> json) => Adver(
        adverDesc: json["adver_desc"],
        adverId: json["adver_id"],
        adverLogo: json["adver_logo"],
        adverName: json["adver_name"],
        adverPageUrl: json["adver_page_url"],
        adverType: json["adver_type"],
      );

  Map<String, dynamic> toJson() => {
        "adver_desc": adverDesc,
        "adver_id": adverId,
        "adver_logo": adverLogo,
        "adver_name": adverName,
        "adver_page_url": adverPageUrl,
        "adver_type": adverType,
      };
}

class Cover {
  Cover({
    required this.gifTagShow,
    required this.gifUrl,
    required this.imageHeight,
    required this.imageWidth,
    required this.loop,
    required this.url,
  });

  bool gifTagShow;
  String gifUrl;
  int imageHeight;
  int imageWidth;
  int loop;
  String url;

  factory Cover.fromJson(Map<String, dynamic> json) => Cover(
        gifTagShow: json["gif_tag_show"],
        gifUrl: json["gif_url"],
        imageHeight: json["image_height"],
        imageWidth: json["image_width"],
        loop: json["loop"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "gif_tag_show": gifTagShow,
        "gif_url": gifUrl,
        "image_height": imageHeight,
        "image_width": imageWidth,
        "loop": loop,
        "url": url,
      };
}

class FeedbackPanel {
  FeedbackPanel({
    required this.closeRecTips,
    required this.feedbackPanelDetail,
    required this.openRecTips,
    required this.panelTypeText,
    required this.toast,
  });

  String closeRecTips;
  List<FeedbackPanelDetail> feedbackPanelDetail;
  String openRecTips;
  String panelTypeText;
  String toast;

  factory FeedbackPanel.fromJson(Map<String, dynamic> json) => FeedbackPanel(
        closeRecTips: json["close_rec_tips"],
        feedbackPanelDetail: List<FeedbackPanelDetail>.from(
            json["feedback_panel_detail"]
                .map((x) => FeedbackPanelDetail.fromJson(x))),
        openRecTips: json["open_rec_tips"],
        panelTypeText: json["panel_type_text"],
        toast: json["toast"],
      );

  Map<String, dynamic> toJson() => {
        "close_rec_tips": closeRecTips,
        "feedback_panel_detail":
            List<dynamic>.from(feedbackPanelDetail.map((x) => x.toJson())),
        "open_rec_tips": openRecTips,
        "panel_type_text": panelTypeText,
        "toast": toast,
      };
}

class FeedbackPanelDetail {
  FeedbackPanelDetail({
    required this.iconUrl,
    required this.jumpType,
    required this.jumpUrl,
    required this.moduleId,
    required this.secondaryPanel,
    required this.subText,
    required this.text,
  });

  String iconUrl;
  int jumpType;
  String jumpUrl;
  int moduleId;
  List<SecondaryPanel>? secondaryPanel;
  String subText;
  String text;

  factory FeedbackPanelDetail.fromJson(Map<String, dynamic> json) =>
      FeedbackPanelDetail(
        iconUrl: json["icon_url"],
        jumpType: json["jump_type"],
        jumpUrl: json["jump_url"],
        moduleId: json["module_id"],
        secondaryPanel: json["secondary_panel"] == null
            ? null
            : List<SecondaryPanel>.from(
                json["secondary_panel"].map((x) => SecondaryPanel.fromJson(x))),
        subText: json["sub_text"],
        text: json["text"],
      );

  Map<String, dynamic> toJson() => {
        "icon_url": iconUrl,
        "jump_type": jumpType,
        "jump_url": jumpUrl,
        "module_id": moduleId,
        "secondary_panel": secondaryPanel == null
            ? null
            : List<dynamic>.from(secondaryPanel!.map((x) => x.toJson())),
        "sub_text": subText,
        "text": text,
      };
}

class SecondaryPanel {
  SecondaryPanel({
    required this.reasonId,
    required this.text,
  });

  int reasonId;
  String text;

  factory SecondaryPanel.fromJson(Map<String, dynamic> json) => SecondaryPanel(
        reasonId: json["reason_id"],
        text: json["text"],
      );

  Map<String, dynamic> toJson() => {
        "reason_id": reasonId,
        "text": text,
      };
}

class QualityInfo {
  QualityInfo({
    required this.icon,
    required this.isBg,
    required this.text,
  });

  String icon;
  bool isBg;
  String text;

  factory QualityInfo.fromJson(Map<String, dynamic> json) => QualityInfo(
        icon: json["icon"],
        isBg: json["is_bg"],
        text: json["text"],
      );

  Map<String, dynamic> toJson() => {
        "icon": icon,
        "is_bg": isBg,
        "text": text,
      };
}

class ReqUser {
  ReqUser({
    required this.attention,
    required this.guestAttention,
  });

  int attention;
  int guestAttention;

  factory ReqUser.fromJson(Map<String, dynamic> json) => ReqUser(
        attention: json["attention"],
        guestAttention: json["guest_attention"],
      );

  Map<String, dynamic> toJson() => {
        "attention": attention,
        "guest_attention": guestAttention,
      };
}

class TIcon {
  TIcon({
    required this.act,
    required this.tIconNew,
  });

  Act act;
  Act tIconNew;

  factory TIcon.fromJson(Map<String, dynamic> json) => TIcon(
        act: Act.fromJson(json["act"]),
        tIconNew: Act.fromJson(json["new"]),
      );

  Map<String, dynamic> toJson() => {
        "act": act.toJson(),
        "new": tIconNew.toJson(),
      };
}

class Act {
  Act({
    required this.icon,
  });

  String icon;

  factory Act.fromJson(Map<String, dynamic> json) => Act(
        icon: json["icon"],
      );

  Map<String, dynamic> toJson() => {
        "icon": icon,
      };
}

class Tag {
  Tag({
    required this.tagId,
    required this.tagName,
    required this.cover,
    required this.likes,
    required this.hates,
    required this.liked,
    required this.hated,
    required this.attribute,
    required this.isActivity,
    required this.uri,
    required this.tagType,
  });

  int tagId;
  String tagName;
  String cover;
  int likes;
  int hates;
  int liked;
  int hated;
  int attribute;
  int isActivity;
  String uri;
  String tagType;

  factory Tag.fromJson(Map<String, dynamic> json) => Tag(
        tagId: json["tag_id"],
        tagName: json["tag_name"],
        cover: json["cover"],
        likes: json["likes"],
        hates: json["hates"],
        liked: json["liked"],
        hated: json["hated"],
        attribute: json["attribute"],
        isActivity: json["is_activity"],
        uri: json["uri"],
        tagType: json["tag_type"],
      );

  Map<String, dynamic> toJson() => {
        "tag_id": tagId,
        "tag_name": tagName,
        "cover": cover,
        "likes": likes,
        "hates": hates,
        "liked": liked,
        "hated": hated,
        "attribute": attribute,
        "is_activity": isActivity,
        "uri": uri,
        "tag_type": tagType,
      };
}
