// To parse this JSON data, do
//
//     final videoProfileModel = videoProfileModelFromJson(jsonString);


import 'dart:convert';

VideoProfileModel videoProfileModelFromJson(String str) => VideoProfileModel.fromJson(json.decode(str));

String videoProfileModelToJson(VideoProfileModel data) => json.encode(data.toJson());

class VideoProfileModel {
  VideoProfileModel({
    required this.code,
    required this.message,
    required this.ttl,
    required this.data,
  });

  int code;
  String message;
  int ttl;
  VideoProfileData data;

  factory VideoProfileModel.fromJson(Map<String, dynamic> json) => VideoProfileModel(
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
    required this.cms,
    required this.cmConfig,
    required this.shortLink,
    required this.playParam,
    required this.config,
    required this.shareSubtitle,
    required this.bvid,
    required this.likeCustom,
    required this.premiereResource,
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
  Map<String, int> rights;
  Owner owner;
  Map<String, int> stat;
  String dataDynamic;
  int cid;
  Dimension dimension;
  String shortLinkV2;
  int? upFromV2;
  String firstFrame;
  String? pubLocation;
  List<Page> pages;
  OwnerExt ownerExt;
  ReqUser reqUser;
  List<Tag> tag;
  TIcon tIcon;
  Elec elec;
  List<Relate> relates;
  List<DislikeReason> dislikeReasons;
  DislikeReasonsV2 dislikeReasonsV2;
  int dmSeg;
  List<Cm> cms;
  CmConfig cmConfig;
  String shortLink;
  int playParam;
  Config config;
  String? shareSubtitle;
  String bvid;
  LikeCustom likeCustom;
  dynamic premiereResource;

  factory VideoProfileData.fromJson(Map<String, dynamic> json) => VideoProfileData(
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
    rights: Map.from(json["rights"]).map((k, v) => MapEntry<String, int>(k, v)),
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
    elec: Elec.fromJson(json["elec"]),
    relates: List<Relate>.from(json["relates"].map((x) => Relate.fromJson(x))),
    dislikeReasons: List<DislikeReason>.from(json["dislike_reasons"].map((x) => DislikeReason.fromJson(x))),
    dislikeReasonsV2: DislikeReasonsV2.fromJson(json["dislike_reasons_v2"]),
    dmSeg: json["dm_seg"],
    cms: List<Cm>.from(json["cms"].map((x) => Cm.fromJson(x))),
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
    "rights": Map.from(rights).map((k, v) => MapEntry<String, dynamic>(k, v)),
    "owner": owner.toJson(),
    "stat": Map.from(stat).map((k, v) => MapEntry<String, dynamic>(k, v)),
    "dynamic": dataDynamic,
    "cid": cid,
    "dimension": dimension.toJson(),
    "short_link_v2": shortLinkV2,
    "up_from_v2": upFromV2,
    "first_frame": firstFrame,
    "pub_location": pubLocation,
    "pages": List<dynamic>.from(pages.map((x) => x.toJson())),
    "owner_ext": ownerExt.toJson(),
    "req_user": reqUser.toJson(),
    "tag": List<dynamic>.from(tag.map((x) => x.toJson())),
    "t_icon": tIcon.toJson(),
    "elec": elec.toJson(),
    "relates": List<dynamic>.from(relates.map((x) => x.toJson())),
    "dislike_reasons": List<dynamic>.from(dislikeReasons.map((x) => x.toJson())),
    "dislike_reasons_v2": dislikeReasonsV2.toJson(),
    "dm_seg": dmSeg,
    "cms": List<dynamic>.from(cms.map((x) => x.toJson())),
    "cm_config": cmConfig.toJson(),
    "short_link": shortLink,
    "play_param": playParam,
    "config": config.toJson(),
    "share_subtitle": shareSubtitle,
    "bvid": bvid,
    "like_custom": likeCustom.toJson(),
    "premiere_resource": premiereResource,
  };
}

class CmConfig {
  CmConfig({
    required this.adsControl,
  });

  AdsControl adsControl;

  factory CmConfig.fromJson(Map<String, dynamic> json) => CmConfig(
    adsControl: AdsControl.fromJson(json["ads_control"]),
  );

  Map<String, dynamic> toJson() => {
    "ads_control": adsControl.toJson(),
  };
}

class AdsControl {
  AdsControl({
    required this.hasDanmu,
  });

  int hasDanmu;

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

  String requestId;
  int rscId;
  int srcId;
  bool isAdLoc;
  String clientIp;
  int index;
  AdInfo adInfo;

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
    "ad_info": adInfo.toJson(),
  };
}

class AdInfo {
  AdInfo();

  factory AdInfo.fromJson(Map<String, dynamic> json) => AdInfo(
  );

  Map<String, dynamic> toJson() => {
  };
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

  String relatesTitle;
  int shareStyle;
  int recThreePointStyle;
  bool isAbsoluteTime;
  String feedStyle;
  bool hasGuide;
  bool feedHasNext;
  int localPlay;

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

class DislikeReason {
  DislikeReason({
    required this.reasonId,
    required this.reasonName,
  });

  int reasonId;
  String reasonName;

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

  String title;
  String subtitle;
  List<Reason> reasons;

  factory DislikeReasonsV2.fromJson(Map<String, dynamic> json) => DislikeReasonsV2(
    title: json["title"],
    subtitle: json["subtitle"],
    reasons: List<Reason>.from(json["reasons"].map((x) => Reason.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "subtitle": subtitle,
    "reasons": List<dynamic>.from(reasons.map((x) => x.toJson())),
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

  int id;
  int? mid;
  String name;
  int? tagId;
  int? rid;

  factory Reason.fromJson(Map<String, dynamic> json) => Reason(
    id: json["id"],
    mid: json["mid"] == null ? null : json["mid"],
    name: json["name"],
    tagId: json["tag_id"] == null ? null : json["tag_id"],
    rid: json["rid"] == null ? null : json["rid"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "mid": mid == null ? null : mid,
    "name": name,
    "tag_id": tagId == null ? null : tagId,
    "rid": rid == null ? null : rid,
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

  bool show;
  int total;
  int count;
  int elecNum;
  List<ListElement> list;
  ElecSet elecSet;

  factory Elec.fromJson(Map<String, dynamic> json) => Elec(
    show: json["show"],
    total: json["total"],
    count: json["count"],
    elecNum: json["elec_num"],
    list: List<ListElement>.from(json["list"].map((x) => ListElement.fromJson(x))),
    elecSet: ElecSet.fromJson(json["elec_set"]),
  );

  Map<String, dynamic> toJson() => {
    "show": show,
    "total": total,
    "count": count,
    "elec_num": elecNum,
    "list": List<dynamic>.from(list.map((x) => x.toJson())),
    "elec_set": elecSet.toJson(),
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
    elecList: List<ElecList>.from(json["elec_list"].map((x) => ElecList.fromJson(x))),
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

  String title;
  int? elecNum;
  int? isCustomize;
  int? minElec;
  int? maxElec;

  factory ElecList.fromJson(Map<String, dynamic> json) => ElecList(
    title: json["title"],
    elecNum: json["elec_num"],
    isCustomize: json["is_customize"],
    minElec: json["min_elec"] == null ? null : json["min_elec"],
    maxElec: json["max_elec"] == null ? null : json["max_elec"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "elec_num": elecNum,
    "is_customize": isCustomize,
    "min_elec": minElec == null ? null : minElec,
    "max_elec": maxElec == null ? null : maxElec,
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

  bool likeSwitch;
  int fullToHalfProgress;
  int nonFullProgress;
  int updateCount;

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

class OwnerExt {
  OwnerExt({
    required this.officialVerify,
    required this.vip,
    required this.assists,
    required this.fans,
    required this.arcCount,
  });

  OfficialVerify officialVerify;
  Vip vip;
  dynamic assists;
  int fans;
  String arcCount;

  factory OwnerExt.fromJson(Map<String, dynamic> json) => OwnerExt(
    officialVerify: OfficialVerify.fromJson(json["official_verify"]),
    vip: Vip.fromJson(json["vip"]),
    assists: json["assists"],
    fans: json["fans"],
    arcCount: json["arc_count"],
  );

  Map<String, dynamic> toJson() => {
    "official_verify": officialVerify.toJson(),
    "vip": vip.toJson(),
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

  int type;
  String desc;

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

  int vipType;
  int vipDueDate;
  String dueRemark;
  int accessStatus;
  int vipStatus;
  String vipStatusWarn;
  int themeType;
  Label label;

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
    "label": label.toJson(),
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

  String path;
  String text;
  String labelTheme;
  String textColor;
  int bgStyle;
  String bgColor;
  String borderColor;
  bool useImgLabel;
  String imgLabelUriHans;
  String imgLabelUriHant;
  String imgLabelUriHansStatic;
  String imgLabelUriHantStatic;

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

  int cid;
  int page;
  String from;
  String pagePart;
  int duration;
  String vid;
  String weblink;
  Dimension dimension;
  String firstFrame;
  List<Meta> metas;
  String dmlink;
  String downloadTitle;
  String downloadSubtitle;

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
    "dimension": dimension.toJson(),
    "first_frame": firstFrame,
    "metas": List<dynamic>.from(metas.map((x) => x.toJson())),
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

  int quality;
  String format;
  int size;

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
    required this.aid,
    required this.pic,
    required this.title,
    required this.owner,
    required this.stat,
    required this.duration,
    required this.goto,
    required this.param,
    required this.uri,
    required this.cid,
    required this.adIndex,
    required this.srcId,
    required this.requestId,
    required this.isAdLoc,
    required this.clientIp,
    required this.cardIndex,
    required this.trackid,
    required this.fromSourceType,
    required this.fromSourceId,
    required this.dimension,
    required this.badgeStyle,
    required this.powerIconStyle,
    required this.rankInfo,
  });

  int aid;
  String pic;
  String title;
  Owner owner;
  Map<String, int> stat;
  int duration;
  String? goto;
  String param;
  String uri;
  int cid;
  int? adIndex;
  int? srcId;
  String? requestId;
  bool? isAdLoc;
  String? clientIp;
  int? cardIndex;
  String trackid;
  int fromSourceType;
  String fromSourceId;
  Dimension dimension;
  dynamic badgeStyle;
  dynamic powerIconStyle;
  dynamic rankInfo;

  factory Relate.fromJson(Map<String, dynamic> json) => Relate(
    aid: json["aid"],
    pic: json["pic"],
    title: json["title"],
    owner: Owner.fromJson(json["owner"]),
    stat: Map.from(json["stat"]).map((k, v) => MapEntry<String, int>(k, v)),
    duration: json["duration"],
    goto: json["goto"],
    param: json["param"],
    uri: json["uri"],
    cid: json["cid"],
    adIndex: json["ad_index"] == null ? null : json["ad_index"],
    srcId: json["src_id"] == null ? null : json["src_id"],
    requestId: json["request_id"] == null ? null : json["request_id"],
    isAdLoc: json["is_ad_loc"] == null ? null : json["is_ad_loc"],
    clientIp: json["client_ip"] == null ? null : json["client_ip"],
    cardIndex: json["card_index"] == null ? null : json["card_index"],
    trackid: json["trackid"],
    fromSourceType: json["from_source_type"],
    fromSourceId: json["from_source_id"],
    dimension: Dimension.fromJson(json["dimension"]),
    badgeStyle: json["BadgeStyle"],
    powerIconStyle: json["PowerIconStyle"],
    rankInfo: json["rank_info"],
  );

  Map<String, dynamic> toJson() => {
    "aid": aid,
    "pic": pic,
    "title": title,
    "owner": owner.toJson(),
    "stat": Map.from(stat).map((k, v) => MapEntry<String, dynamic>(k, v)),
    "duration": duration,
    "goto": goto,
    "param": param,
    "uri": uri,
    "cid": cid,
    "ad_index": adIndex == null ? null : adIndex,
    "src_id": srcId == null ? null : srcId,
    "request_id": requestId == null ? null : requestId,
    "is_ad_loc": isAdLoc == null ? null : isAdLoc,
    "client_ip": clientIp == null ? null : clientIp,
    "card_index": cardIndex == null ? null : cardIndex,
    "trackid": trackid,
    "from_source_type": fromSourceType,
    "from_source_id": fromSourceId,
    "dimension": dimension.toJson(),
    "BadgeStyle": badgeStyle,
    "PowerIconStyle": powerIconStyle,
    "rank_info": rankInfo,
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