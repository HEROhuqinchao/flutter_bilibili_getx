// To parse this JSON data, do
//
//     final hyAccountMineModel = hyAccountMineModelFromJson(jsonString);
import 'dart:convert';
import 'dart:core';

HYFeedIndexModel hyAccountMineModelFromJson(String str) =>
    HYFeedIndexModel.fromJson(json.decode(str));

class HYFeedIndexModel {
  HYFeedIndexModel({
    required this.code,
    required this.message,
    required this.ttl,
    required this.data,
  });

  int code;
  String message;
  int ttl;
  FeedIndexData data;

  factory HYFeedIndexModel.fromJson(Map<String, dynamic> json) =>
      HYFeedIndexModel(
        code: json["code"],
        message: json["message"],
        ttl: json["ttl"],
        data: FeedIndexData.fromJson(json["data"]),
      );
}

class FeedIndexData {
  FeedIndexData({
    required this.items,
    required this.config,
  });

  List<FeedIndexItem> items;
  Config config;

  factory FeedIndexData.fromJson(Map<String, dynamic> json) => FeedIndexData(
        items: List<FeedIndexItem>.from(
            json["items"].map((x) => FeedIndexItem.fromJson(x))),
        config: Config.fromJson(json["config"]),
      );
}

class Config {
  Config({
    required this.column,
    required this.autoplayCard,
    required this.feedCleanAbtest,
    required this.homeTransferTest,
    required this.autoRefreshTime,
    required this.showInlineDanmaku,
    required this.toast,
    required this.singleAutoplayFlag,
    required this.isBackToHomepage,
    required this.enableRcmdGuide,
    required this.inlineSound,
    required this.autoRefreshTimeByAppear,
    required this.autoRefreshTimeByActive,
    required this.visibleArea,
    required this.cardDensityExp,
  });

  int column;
  int autoplayCard;
  int feedCleanAbtest;
  int homeTransferTest;
  int autoRefreshTime;
  int showInlineDanmaku;
  ToastClass toast;
  int singleAutoplayFlag;
  bool isBackToHomepage;
  bool enableRcmdGuide;
  int inlineSound;
  int autoRefreshTimeByAppear;
  int autoRefreshTimeByActive;
  int visibleArea;
  int cardDensityExp;

  factory Config.fromJson(Map<String, dynamic> json) => Config(
        column: json["column"],
        autoplayCard: json["autoplay_card"],
        feedCleanAbtest: json["feed_clean_abtest"],
        homeTransferTest: json["home_transfer_test"],
        autoRefreshTime: json["auto_refresh_time"],
        showInlineDanmaku: json["show_inline_danmaku"],
        toast: ToastClass.fromJson(json["toast"]),
        singleAutoplayFlag: json["single_autoplay_flag"],
        isBackToHomepage: json["is_back_to_homepage"],
        enableRcmdGuide: json["enable_rcmd_guide"],
        inlineSound: json["inline_sound"],
        autoRefreshTimeByAppear: json["auto_refresh_time_by_appear"],
        autoRefreshTimeByActive: json["auto_refresh_time_by_active"],
        visibleArea: json["visible_area"],
        cardDensityExp: json["card_density_exp"],
      );
}

class ToastClass {
  ToastClass({
    required this.hasToast,
    required this.toastMessage,
  });

  bool hasToast;
  String toastMessage;

  factory ToastClass.fromJson(Map<String, dynamic> json) => ToastClass(
        hasToast: json["has_toast"],
        toastMessage: json["toast_message"],
      );
}

class FeedIndexItem {
  FeedIndexItem({
    required this.cardType,
    required this.cardGoto,
    required this.goto,
    required this.param,
    required this.cover,
    required this.title,
    required this.uri,
    required this.threePoint,
    required this.args,
    required this.playerArgs,
    required this.idx,
    required this.threePointV2,
    required this.talkBack,
    required this.coverLeftText1,
    required this.coverLeftIcon1,
    required this.coverLeft1ContentDescription,
    required this.coverLeftText2,
    required this.coverLeftIcon2,
    required this.coverLeft2ContentDescription,
    required this.coverRightText,
    required this.coverRightContentDescription,
    required this.descButton,
    required this.officialIcon,
    required this.canPlay,
    required this.bannerItems,
    required this.up,
    required this.badgeStyle,
    required this.rcmdReasonStyle,
    required this.adInfo,
    required this.badge,
  });

  String cardType;
  String cardGoto;
  String? goto;
  String? param;
  String? cover;
  String? title;
  String? uri;
  ThreePoint? threePoint;
  Args? args;
  PlayerArgs? playerArgs;
  int idx;
  List<ThreePointV2>? threePointV2;
  String? talkBack;
  String? coverLeftText1;
  int? coverLeftIcon1;
  String? coverLeft1ContentDescription;
  String? coverLeftText2;
  int? coverLeftIcon2;
  String? coverLeft2ContentDescription;
  String? coverRightText;
  String? coverRightContentDescription;
  DescButton? descButton;
  int? officialIcon;
  int? canPlay;
  List<BannerItem>? bannerItems;
  Up? up;
  BadgeStyle? badgeStyle;
  RcmdReasonStyle? rcmdReasonStyle;
  AdInfo? adInfo;
  String? badge;

  ///视频原mp4地址
  String _videoData = "";

  String get videoData => _videoData;

  set videoData(String value) {
    _videoData = value;
  }

  factory FeedIndexItem.fromJson(Map<String, dynamic> json) => FeedIndexItem(
        cardType: json["card_type"],
        cardGoto: json["card_goto"],
        goto: json["goto"],
        param: json["param"],
        cover: json["cover"],
        title: json["title"],
        uri: json["uri"],
        threePoint: json["three_point"] == null
            ? null
            : ThreePoint.fromJson(json["three_point"]),
        args: json["args"] == null ? null : Args.fromJson(json["args"]),
        playerArgs: json["player_args"] == null
            ? null
            : PlayerArgs.fromJson(json["player_args"]),
        idx: json["idx"],
        threePointV2: json["three_point_v2"] == null
            ? null
            : List<ThreePointV2>.from(
                json["three_point_v2"].map((x) => ThreePointV2.fromJson(x))),
        talkBack: json["talk_back"],
        coverLeftText1: json["cover_left_text_1"],
        coverLeftIcon1: json["cover_left_icon_1"],
        coverLeft1ContentDescription: json["cover_left_1_content_description"],
        coverLeftText2: json["cover_left_text_2"],
        coverLeftIcon2: json["cover_left_icon_2"],
        coverLeft2ContentDescription: json["cover_left_2_content_description"],
        coverRightText: json["cover_right_text"],
        coverRightContentDescription: json["cover_right_content_description"],
        descButton: json["desc_button"] == null
            ? null
            : DescButton.fromJson(json["desc_button"]),
        officialIcon: json["official_icon"],
        canPlay: json["can_play"],
        badge: json["badge"],
        adInfo:
            json["ad_info"] == null ? null : AdInfo.fromJson(json["ad_info"]),
        up: json["up"] == null ? null : Up.fromJson(json["up"]),
        rcmdReasonStyle: json["rcmd_reason_style"] == null
            ? null
            : RcmdReasonStyle.fromJson(json["rcmd_reason_style"]),
        badgeStyle: json["badge_style"] == null
            ? null
            : BadgeStyle.fromJson(json["badge_style"]),
        bannerItems: json["banner_item"] == null
            ? null
            : List<BannerItem>.from(
                json["banner_item"].map((x) => BannerItem.fromJson(x))),
      );
}

class BadgeStyle {
  String? text;
  String? textColor;
  String? borderColor;

  BadgeStyle({this.text, this.textColor, this.borderColor});

  factory BadgeStyle.fromJson(Map<String, dynamic> json) => BadgeStyle(
        text: json["text"],
        textColor: json["text_color"],
        borderColor: json["border_color"],
      );
}

class AdInfo {
  CreativeContent? creativeContent;

  AdInfo({this.creativeContent});

  factory AdInfo.fromJson(Map<String, dynamic> json) => AdInfo(
      creativeContent: json["creative_content"] == null ? null : CreativeContent.fromJson(json["creative_content"]));
}

class CreativeContent {
  String? title;
  String? imageUrl;

  CreativeContent({this.title, this.imageUrl});

  factory CreativeContent.fromJson(Map<String, dynamic> json) =>
      CreativeContent(
        title: json["title"],
        imageUrl: json["image_url"],
      );
}

class Up {
  int? id;
  String? name;
  Avatar? avatar;

  Up({this.id, this.name, this.avatar});

  factory Up.fromJson(Map<String, dynamic> json) => Up(
        id: json["id"],
        name: json["name"],
        avatar: Avatar.fromJson(json["avatar"]),
      );
}

class RcmdReasonStyle {
  String? textColor;
  String? bgColor;
  String? borderColor;
  String? text;

  RcmdReasonStyle({this.textColor, this.bgColor, this.borderColor, this.text});

  factory RcmdReasonStyle.fromJson(Map<String, dynamic> json) =>
      RcmdReasonStyle(
        textColor: json["text_color"],
        bgColor: json["bg_color"],
        borderColor: json["border_color"],
        text: json["text"],
      );
}

class Avatar {
  String? cover;
  String? event;
  String? uri;

  Avatar({required this.cover, required this.event, required this.uri});

  factory Avatar.fromJson(Map<String, dynamic> json) => Avatar(
        cover: json["cover"],
        event: json["event"],
        uri: json["uri"],
      );
}

class BannerItem {
  int? id;
  int? index;
  int? resourceId;
  StaticBanner? staticBanner;
  String? type;

  BannerItem(
      {required this.id,
      required this.index,
      required this.resourceId,
      required this.staticBanner,
      required this.type});

  factory BannerItem.fromJson(Map<String, dynamic> json) => BannerItem(
        id: json["id"],
        index: json["index"],
        resourceId: json["resource_id"],
        staticBanner: json["static_banner"] != null
            ? StaticBanner.fromJson(json["static_banner"])
            : json["ad_banner"] != null
                ? StaticBanner.fromJson(json["ad_banner"])
                : StaticBanner.fromJson(json["inline_av"]),
        type: json["type"],
      );
}

class StaticBanner {
  String? clientIp;
  int? cmMark;
  String? hash;
  int? id;
  String? image;
  int? index;
  bool? isAdLoc;
  String? requestId;
  int? resourceId;
  int? serverType;
  int? srcId;
  String? title;
  String? uri;

  StaticBanner(
      {required this.clientIp,
      required this.cmMark,
      required this.hash,
      required this.id,
      required this.image,
      required this.index,
      required this.isAdLoc,
      required this.requestId,
      required this.resourceId,
      required this.serverType,
      required this.srcId,
      required this.title,
      required this.uri});

  factory StaticBanner.fromJson(Map<String, dynamic> json) => StaticBanner(
        clientIp: json["client_ip"],
        cmMark: json["cm_mark"],
        hash: json["hash"],
        id: json["id"],
        image: json["image"] ?? json["cover"],
        index: json["index"],
        isAdLoc: json["is_ad_loc"],
        requestId: json["request_id"],
        resourceId: json["resource_id"],
        serverType: json["server_type"],
        srcId: json["src_id"],
        title: json["title"],
        uri: json["uri"],
      );
}

class Args {
  Args({
    required this.upId,
    required this.upName,
    required this.rid,
    required this.rname,
    required this.tid,
    required this.tname,
    required this.aid,
  });

  int? upId;
  String? upName;
  int? rid;
  String? rname;
  int? tid;
  String? tname;
  int? aid;

  factory Args.fromJson(Map<String, dynamic> json) => Args(
        upId: json["up_id"],
        upName: json["up_name"],
        rid: json["rid"],
        rname: json["rname"],
        tid: json["tid"],
        tname: json["tname"],
        aid: json["aid"],
      );
}

class DescButton {
  DescButton({
    required this.text,
    required this.uri,
    required this.event,
    required this.type,
    required this.eventV2,
  });

  String? text;
  String? uri;
  String event;
  int type;
  String eventV2;

  factory DescButton.fromJson(Map<String, dynamic> json) => DescButton(
        text: json["text"] ?? "",
        uri: json["uri"],
        event: json["event"],
        type: json["type"],
        eventV2: json["event_v2"],
      );
}

class PlayerArgs {
  PlayerArgs({
    required this.aid,
    required this.cid,
    required this.type,
    required this.duration,
  });

  int? aid;
  int? cid;
  String? type;
  int? duration;

  factory PlayerArgs.fromJson(Map<String, dynamic> json) => PlayerArgs(
        aid: json["aid"],
        cid: json["cid"],
        type: json["type"],
        duration: json["duration"],
      );
}

class ThreePoint {
  ThreePoint({
    required this.dislikeReasons,
    required this.feedbacks,
    required this.watchLater,
  });

  List<DislikeReason> dislikeReasons;
  List<DislikeReason>? feedbacks;
  int? watchLater;

  factory ThreePoint.fromJson(Map<String, dynamic> json) => ThreePoint(
        dislikeReasons: List<DislikeReason>.from(
            json["dislike_reasons"].map((x) => DislikeReason.fromJson(x))),
        feedbacks: json["feedbacks"] == null
            ? null
            : List<DislikeReason>.from(
                json["feedbacks"].map((x) => DislikeReason.fromJson(x))),
        watchLater: json["watch_later"],
      );
}

class DislikeReason {
  DislikeReason({
    required this.id,
    required this.name,
    required this.toast,
  });

  int id;
  String name;
  String toast;

  factory DislikeReason.fromJson(Map<String, dynamic> json) => DislikeReason(
        id: json["id"],
        name: json["name"],
        toast: json["toast"],
      );
}

class ThreePointV2 {
  ThreePointV2({
    required this.title,
    required this.type,
    required this.icon,
    required this.subtitle,
    required this.reasons,
  });

  String title;
  String type;
  String? icon;
  String? subtitle;
  List<DislikeReason>? reasons;

  factory ThreePointV2.fromJson(Map<String, dynamic> json) => ThreePointV2(
        title: json["title"],
        type: json["type"],
        icon: json["icon"],
        subtitle: json["subtitle"],
        reasons: json["reasons"] == null
            ? null
            : List<DislikeReason>.from(
                json["reasons"].map((x) => DislikeReason.fromJson(x))),
      );
}
