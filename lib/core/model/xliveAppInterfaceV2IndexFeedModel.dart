// To parse this JSON data, do
//
//     final xliveAppInterfaceV2IndexFeedModel = xliveAppInterfaceV2IndexFeedModelFromJson(jsonString);

import 'dart:convert';

XliveAppInterfaceV2IndexFeedModel xliveAppInterfaceV2IndexFeedModelFromJson(
        String str) =>
    XliveAppInterfaceV2IndexFeedModel.fromJson(json.decode(str));

String xliveAppInterfaceV2IndexFeedModelToJson(
        XliveAppInterfaceV2IndexFeedModel data) =>
    json.encode(data.toJson());

class XliveAppInterfaceV2IndexFeedModel {
  XliveAppInterfaceV2IndexFeedModel({
    required this.code,
    required this.message,
    required this.ttl,
    required this.data,
  });

  int code;
  String message;
  int ttl;
  Data data;

  factory XliveAppInterfaceV2IndexFeedModel.fromJson(
          Map<String, dynamic> json) =>
      XliveAppInterfaceV2IndexFeedModel(
        code: json["code"],
        message: json["message"],
        ttl: json["ttl"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "ttl": ttl,
        "data": data.toJson(),
      };
}

class Data {
  Data({
    required this.cardList,
    required this.isRollback,
    required this.hasMore,
    required this.triggerTime,
    required this.isNeedRefresh,
  });

  List<CardList> cardList;
  int isRollback;
  int hasMore;
  int triggerTime;
  int isNeedRefresh;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        cardList: List<CardList>.from(
            json["card_list"].map((x) => CardList.fromJson(x))),
        isRollback: json["is_rollback"],
        hasMore: json["has_more"],
        triggerTime: json["trigger_time"],
        isNeedRefresh: json["is_need_refresh"],
      );

  Map<String, dynamic> toJson() => {
        "card_list": List<dynamic>.from(cardList.map((x) => x.toJson())),
        "is_rollback": isRollback,
        "has_more": hasMore,
        "trigger_time": triggerTime,
        "is_need_refresh": isNeedRefresh,
      };
}

class CardList {
  CardList({
    required this.cardType,
    required this.cardData,
  });

  String cardType;
  CardData cardData;

  factory CardList.fromJson(Map<String, dynamic> json) => CardList(
        cardType: json["card_type"],
        cardData: CardData.fromJson(json["card_data"]),
      );

  Map<String, dynamic> toJson() => {
        "card_type": cardType,
        "card_data": cardData.toJson(),
      };
}

class CardData {
  CardData({
    required this.bannerV1,
    required this.areaEntranceV3,
    required this.activityCardV1,
    required this.smallCardV1,
  });

  BannerV1? bannerV1;
  AreaEntranceV3? areaEntranceV3;
  ActivityCardV1? activityCardV1;
  SmallCardV1? smallCardV1;

  factory CardData.fromJson(Map<String, dynamic> json) => CardData(
        bannerV1: json["banner_v1"] == null ? null : BannerV1.fromJson(json["banner_v1"]),
        areaEntranceV3: json["area_entrance_v3"] == null ? null : AreaEntranceV3.fromJson(json["area_entrance_v3"]),
        activityCardV1: json["activity_card_v1"] == null ? null : ActivityCardV1.fromJson(json["activity_card_v1"]),
        smallCardV1: json["small_card_v1"] == null
            ? null
            : SmallCardV1.fromJson(json["small_card_v1"]),
      );

  Map<String, dynamic> toJson() => {
        "banner_v1": bannerV1!.toJson(),
        "area_entrance_v3": areaEntranceV3!.toJson(),
        "activity_card_v1": activityCardV1!.toJson(),
        "small_card_v1": smallCardV1 == null ? null : smallCardV1!.toJson(),
      };
}

class ActivityCardV1 {
  ActivityCardV1({
    required this.moduleInfo,
    required this.list,
  });

  ModuleInfo moduleInfo;
  List<ActivityCardV1List> list;

  factory ActivityCardV1.fromJson(Map<String, dynamic> json) => ActivityCardV1(
        moduleInfo: ModuleInfo.fromJson(json["module_info"]),
        list: List<ActivityCardV1List>.from(
            json["list"].map((x) => ActivityCardV1List.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "module_info": moduleInfo.toJson(),
        "list": List<dynamic>.from(list.map((x) => x.toJson())),
      };
}

class ActivityCardV1List {
  ActivityCardV1List({
    required this.aid,
    required this.type,
    required this.title,
    required this.logoUrl,
    required this.startAt,
    required this.endAt,
    required this.timeText,
    required this.buttonUrl,
    required this.buttonText,
    required this.activityUrl,
    required this.status,
    required this.onLive,
  });

  int aid;
  int type;
  String title;
  String logoUrl;
  int startAt;
  int endAt;
  String timeText;
  String buttonUrl;
  String buttonText;
  String activityUrl;
  int status;
  int onLive;

  factory ActivityCardV1List.fromJson(Map<String, dynamic> json) =>
      ActivityCardV1List(
        aid: json["aid"],
        type: json["type"],
        title: json["title"],
        logoUrl: json["logo_url"],
        startAt: json["start_at"],
        endAt: json["end_at"],
        timeText: json["time_text"],
        buttonUrl: json["button_url"],
        buttonText: json["button_text"],
        activityUrl: json["activity_url"],
        status: json["status"],
        onLive: json["on_live"],
      );

  Map<String, dynamic> toJson() => {
        "aid": aid,
        "type": type,
        "title": title,
        "logo_url": logoUrl,
        "start_at": startAt,
        "end_at": endAt,
        "time_text": timeText,
        "button_url": buttonUrl,
        "button_text": buttonText,
        "activity_url": activityUrl,
        "status": status,
        "on_live": onLive,
      };
}

class ModuleInfo {
  ModuleInfo({
    required this.id,
    required this.link,
    required this.pic,
    required this.title,
    required this.type,
    required this.sort,
    required this.count,
  });

  int id;
  String link;
  String pic;
  String title;
  int type;
  int sort;
  int count;

  factory ModuleInfo.fromJson(Map<String, dynamic> json) => ModuleInfo(
        id: json["id"],
        link: json["link"],
        pic: json["pic"],
        title: json["title"],
        type: json["type"],
        sort: json["sort"],
        count: json["count"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "link": link,
        "pic": pic,
        "title": title,
        "type": type,
        "sort": sort,
        "count": count,
      };
}

class AreaEntranceV3 {
  AreaEntranceV3({
    required this.moduleInfo,
    required this.extraInfo,
    required this.list,
    required this.entranceType,
  });

  ModuleInfo moduleInfo;
  ExtraInfo extraInfo;
  List<AreaEntranceV3List> list;
  int entranceType;

  factory AreaEntranceV3.fromJson(Map<String, dynamic> json) => AreaEntranceV3(
        moduleInfo: ModuleInfo.fromJson(json["module_info"]),
        extraInfo: ExtraInfo.fromJson(json["extra_info"]),
        list: List<AreaEntranceV3List>.from(
            json["list"].map((x) => AreaEntranceV3List.fromJson(x))),
        entranceType: json["entrance_type"],
      );

  Map<String, dynamic> toJson() => {
        "module_info": moduleInfo.toJson(),
        "extra_info": extraInfo.toJson(),
        "list": List<dynamic>.from(list.map((x) => x.toJson())),
        "entrance_type": entranceType,
      };
}

class ExtraInfo {
  ExtraInfo({
    required this.offline,
  });

  List<dynamic> offline;

  factory ExtraInfo.fromJson(Map<String, dynamic> json) => ExtraInfo(
        offline: List<dynamic>.from(json["offline"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "offline": List<dynamic>.from(offline.map((x) => x)),
      };
}

class AreaEntranceV3List {
  AreaEntranceV3List({
    required this.id,
    required this.link,
    required this.pic,
    required this.title,
    required this.areaV2Id,
    required this.areaV2ParentId,
    required this.tagType,
  });

  int id;
  String link;
  String pic;
  String title;
  int areaV2Id;
  int areaV2ParentId;
  int tagType;

  factory AreaEntranceV3List.fromJson(Map<String, dynamic> json) =>
      AreaEntranceV3List(
        id: json["id"],
        link: json["link"],
        pic: json["pic"],
        title: json["title"],
        areaV2Id: json["area_v2_id"],
        areaV2ParentId: json["area_v2_parent_id"],
        tagType: json["tag_type"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "link": link,
        "pic": pic,
        "title": title,
        "area_v2_id": areaV2Id,
        "area_v2_parent_id": areaV2ParentId,
        "tag_type": tagType,
      };
}

class BannerV1 {
  BannerV1({
    required this.moduleInfo,
    required this.list,
  });

  ModuleInfo moduleInfo;
  List<BannerV1List> list;

  factory BannerV1.fromJson(Map<String, dynamic> json) => BannerV1(
        moduleInfo: ModuleInfo.fromJson(json["module_info"]),
        list: List<BannerV1List>.from(
            json["list"].map((x) => BannerV1List.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "module_info": moduleInfo.toJson(),
        "list": List<dynamic>.from(list.map((x) => x.toJson())),
      };
}

class BannerV1List {
  BannerV1List({
    required this.id,
    required this.link,
    required this.pic,
    required this.title,
    required this.content,
    required this.sessionId,
    required this.groupId,
    required this.isAd,
    required this.adTransparentContent,
    required this.showAdIcon,
  });

  int id;
  String link;
  String pic;
  String title;
  String content;
  String sessionId;
  int groupId;
  bool isAd;
  AdTransparentContent? adTransparentContent;
  bool showAdIcon;

  factory BannerV1List.fromJson(Map<String, dynamic> json) => BannerV1List(
        id: json["id"],
        link: json["link"],
        pic: json["pic"],
        title: json["title"],
        content: json["content"],
        sessionId: json["session_id"],
        groupId: json["group_id"],
        isAd: json["is_ad"],
        adTransparentContent: json["ad_transparent_content"] == null ? null : AdTransparentContent.fromJson(json["ad_transparent_content"]),
        showAdIcon: json["show_ad_icon"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "link": link,
        "pic": pic,
        "title": title,
        "content": content,
        "session_id": sessionId,
        "group_id": groupId,
        "is_ad": isAd,
        "ad_transparent_content":
            adTransparentContent == null ? null : adTransparentContent!.toJson(),
        "show_ad_icon": showAdIcon,
      };
}

class AdTransparentContent {
  AdTransparentContent({
    required this.requestId,
    required this.sourceId,
    required this.resourceId,
    required this.isAdLoc,
    required this.serverType,
    required this.clientIp,
    required this.index,
    required this.srcId,
  });

  String requestId;
  int sourceId;
  int resourceId;
  bool isAdLoc;
  int serverType;
  String clientIp;
  int index;
  int srcId;

  factory AdTransparentContent.fromJson(Map<String, dynamic> json) =>
      AdTransparentContent(
        requestId: json["request_id"],
        sourceId: json["source_id"],
        resourceId: json["resource_id"],
        isAdLoc: json["is_ad_loc"],
        serverType: json["server_type"],
        clientIp: json["client_ip"],
        index: json["index"],
        srcId: json["src_id"],
      );

  Map<String, dynamic> toJson() => {
        "request_id": requestId,
        "source_id": sourceId,
        "resource_id": resourceId,
        "is_ad_loc": isAdLoc,
        "server_type": serverType,
        "client_ip": clientIp,
        "index": index,
        "src_id": srcId,
      };
}

class SmallCardV1 {
  SmallCardV1({
    required this.id,
    required this.title,
    required this.cover,
    required this.link,
    required this.areaId,
    required this.areaName,
    required this.parentAreaId,
    required this.parentAreaName,
    required this.uid,
    required this.online,
    required this.pendentList,
    required this.coverLeftStyle,
    required this.coverRightStyle,
    required this.subtitleStyle,
    required this.sessionId,
    required this.groupId,
    required this.jumpfromExtend,
    required this.showCallback,
    required this.clickCallback,
    required this.feedbackImg,
    required this.feedbackNightImg,
    required this.feedback,
    required this.flag,
    required this.broadcastType,
    required this.acceptQuality,
    required this.currentQn,
    required this.currentQuality,
    required this.playUrl,
    required this.playUrlH265,
    required this.qualityDescription,
    required this.playUrlCard,
    required this.p2PType,
    required this.pkId,
    required this.index,
    required this.isHideFeedback,
    required this.isFullScreenList,
    required this.recTagStyle,
    required this.watchedShow,
    required this.isAd,
    required this.adTransparentContent,
    required this.showAdIcon,
    required this.uname,
  });

  int id;
  String title;
  String cover;
  String link;
  int areaId;
  String areaName;
  int parentAreaId;
  String parentAreaName;
  int uid;
  int online;
  List<PendentList> pendentList;
  CoverLeftStyle coverLeftStyle;
  CoverRightStyle coverRightStyle;
  SubtitleStyle subtitleStyle;
  String sessionId;
  int groupId;
  int jumpfromExtend;
  String showCallback;
  String clickCallback;
  String feedbackImg;
  String feedbackNightImg;
  List<Feedback> feedback;
  int flag;
  int broadcastType;
  List<int> acceptQuality;
  int currentQn;
  int currentQuality;
  String playUrl;
  String playUrlH265;
  List<QualityDescription> qualityDescription;
  String playUrlCard;
  int p2PType;
  int pkId;
  int index;
  int isHideFeedback;
  int isFullScreenList;
  dynamic recTagStyle;
  WatchedShow watchedShow;
  bool isAd;
  dynamic adTransparentContent;
  bool showAdIcon;
  String uname;

  factory SmallCardV1.fromJson(Map<String, dynamic> json) => SmallCardV1(
        id: json["id"],
        title: json["title"],
        cover: json["cover"],
        link: json["link"],
        areaId: json["area_id"],
        areaName: json["area_name"],
        parentAreaId: json["parent_area_id"],
        parentAreaName: json["parent_area_name"],
        uid: json["uid"],
        online: json["online"],
        pendentList: List<PendentList>.from(
            json["pendent_list"].map((x) => PendentList.fromJson(x))),
        coverLeftStyle: CoverLeftStyle.fromJson(json["cover_left_style"]),
        coverRightStyle: CoverRightStyle.fromJson(json["cover_right_style"]),
        subtitleStyle: SubtitleStyle.fromJson(json["subtitle_style"]),
        sessionId: json["session_id"],
        groupId: json["group_id"],
        jumpfromExtend: json["jumpfrom_extend"],
        showCallback: json["show_callback"],
        clickCallback: json["click_callback"],
        feedbackImg: json["feedback_img"],
        feedbackNightImg: json["feedback_night_img"],
        feedback: List<Feedback>.from(
            json["feedback"].map((x) => Feedback.fromJson(x))),
        flag: json["flag"],
        broadcastType: json["broadcast_type"],
        acceptQuality: List<int>.from(json["accept_quality"].map((x) => x)),
        currentQn: json["current_qn"],
        currentQuality: json["current_quality"],
        playUrl: json["play_url"],
        playUrlH265: json["play_url_h265"],
        qualityDescription: List<QualityDescription>.from(
            json["quality_description"]
                .map((x) => QualityDescription.fromJson(x))),
        playUrlCard: json["play_url_card"],
        p2PType: json["p2p_type"],
        pkId: json["pk_id"],
        index: json["index"],
        isHideFeedback: json["is_hide_feedback"],
        isFullScreenList: json["is_full_screen_list"],
        recTagStyle: json["rec_tag_style"],
        watchedShow: WatchedShow.fromJson(json["watched_show"]),
        isAd: json["is_ad"],
        adTransparentContent: json["ad_transparent_content"],
        showAdIcon: json["show_ad_icon"],
        uname: json["uname"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "cover": cover,
        "link": link,
        "area_id": areaId,
        "area_name": areaName,
        "parent_area_id": parentAreaId,
        "parent_area_name": parentAreaName,
        "uid": uid,
        "online": online,
        "pendent_list": List<dynamic>.from(pendentList.map((x) => x.toJson())),
        "cover_left_style": coverLeftStyle.toJson(),
        "cover_right_style": coverRightStyle.toJson(),
        "subtitle_style": subtitleStyle.toJson(),
        "session_id": sessionId,
        "group_id": groupId,
        "jumpfrom_extend": jumpfromExtend,
        "show_callback": showCallback,
        "click_callback": clickCallback,
        "feedback_img": feedbackImg,
        "feedback_night_img": feedbackNightImg,
        "feedback": List<dynamic>.from(feedback.map((x) => x.toJson())),
        "flag": flag,
        "broadcast_type": broadcastType,
        "accept_quality": List<dynamic>.from(acceptQuality.map((x) => x)),
        "current_qn": currentQn,
        "current_quality": currentQuality,
        "play_url": playUrl,
        "play_url_h265": playUrlH265,
        "quality_description":
            List<dynamic>.from(qualityDescription.map((x) => x.toJson())),
        "play_url_card": playUrlCard,
        "p2p_type": p2PType,
        "pk_id": pkId,
        "index": index,
        "is_hide_feedback": isHideFeedback,
        "is_full_screen_list": isFullScreenList,
        "rec_tag_style": recTagStyle,
        "watched_show": watchedShow.toJson(),
        "is_ad": isAd,
        "ad_transparent_content": adTransparentContent,
        "show_ad_icon": showAdIcon,
        "uname": uname,
      };
}

class CoverLeftStyle {
  CoverLeftStyle({
    required this.text,
  });

  String text;

  factory CoverLeftStyle.fromJson(Map<String, dynamic> json) => CoverLeftStyle(
        text: json["text"],
      );

  Map<String, dynamic> toJson() => {
        "text": text,
      };
}

class CoverRightStyle {
  CoverRightStyle({
    required this.text,
    required this.img,
  });

  String text;
  String img;

  factory CoverRightStyle.fromJson(Map<String, dynamic> json) =>
      CoverRightStyle(
        text: json["text"],
        img: json["img"],
      );

  Map<String, dynamic> toJson() => {
        "text": text,
        "img": img,
      };
}

class Feedback {
  Feedback({
    required this.title,
    required this.subtitle,
    required this.type,
    required this.reasons,
  });

  String title;
  String subtitle;
  String type;
  List<Reason> reasons;

  factory Feedback.fromJson(Map<String, dynamic> json) => Feedback(
        title: json["title"],
        subtitle: json["subtitle"],
        type: json["type"],
        reasons:
            List<Reason>.from(json["reasons"].map((x) => Reason.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "subtitle": subtitle,
        "type": type,
        "reasons": List<dynamic>.from(reasons.map((x) => x.toJson())),
      };
}

class Reason {
  Reason({
    required this.id,
    required this.name,
    required this.idType,
  });

  int id;
  String name;
  String idType;

  factory Reason.fromJson(Map<String, dynamic> json) => Reason(
        id: json["id"],
        name: json["name"],
        idType: json["id_type"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "id_type": idType,
      };
}

class PendentList {
  PendentList({
    required this.content,
    required this.position,
    required this.color,
    required this.pic,
    required this.pendentId,
  });

  String content;
  int position;
  String color;
  String pic;
  int pendentId;

  factory PendentList.fromJson(Map<String, dynamic> json) => PendentList(
        content: json["content"],
        position: json["position"],
        color: json["color"],
        pic: json["pic"],
        pendentId: json["pendent_id"],
      );

  Map<String, dynamic> toJson() => {
        "content": content,
        "position": position,
        "color": color,
        "pic": pic,
        "pendent_id": pendentId,
      };
}

class QualityDescription {
  QualityDescription({
    required this.qn,
    required this.desc,
  });

  int qn;
  String desc;

  factory QualityDescription.fromJson(Map<String, dynamic> json) =>
      QualityDescription(
        qn: json["qn"],
        desc: json["desc"],
      );

  Map<String, dynamic> toJson() => {
        "qn": qn,
        "desc": desc,
      };
}

class SubtitleStyle {
  SubtitleStyle({
    required this.text,
    required this.textColor,
    required this.textNightColor,
    required this.type,
  });

  String text;
  String textColor;
  String textNightColor;
  String type;

  factory SubtitleStyle.fromJson(Map<String, dynamic> json) => SubtitleStyle(
        text: json["text"],
        textColor: json["text_color"],
        textNightColor: json["text_night_color"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "text": text,
        "text_color": textColor,
        "text_night_color": textNightColor,
        "type": type,
      };
}

class WatchedShow {
  WatchedShow({
    required this.watchedShowSwitch,
    required this.num,
    required this.textSmall,
    required this.textLarge,
    required this.icon,
    required this.iconLocation,
    required this.iconWeb,
  });

  bool watchedShowSwitch;
  int num;
  String textSmall;
  String textLarge;
  String icon;
  int iconLocation;
  String iconWeb;

  factory WatchedShow.fromJson(Map<String, dynamic> json) => WatchedShow(
        watchedShowSwitch: json["switch"],
        num: json["num"],
        textSmall: json["text_small"],
        textLarge: json["text_large"],
        icon: json["icon"],
        iconLocation: json["icon_location"],
        iconWeb: json["icon_web"],
      );

  Map<String, dynamic> toJson() => {
        "switch": watchedShowSwitch,
        "num": num,
        "text_small": textSmall,
        "text_large": textLarge,
        "icon": icon,
        "icon_location": iconLocation,
        "icon_web": iconWeb,
      };
}
