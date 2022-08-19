// To parse this JSON data, do
//
//     final hyGrcPageBangumiModel = hyGrcPageBangumiModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

HYGrcPageBangumiModel hyGrcPageBangumiModelFromJson(String str) =>
    HYGrcPageBangumiModel.fromJson(json.decode(str));

// String hyGrcPageBangumiModelToJson(HYGrcPageBangumiModel data) => json.encode(data.toJson());

class HYGrcPageBangumiModel {
  HYGrcPageBangumiModel({
    required this.hasNext,
    required this.hot,
    required this.jumpModuleId,
    required this.modules,
    required this.nextCursor,
    required this.regions,
    required this.report,
    required this.style,
  });

  int hasNext;
  Hot hot;
  int jumpModuleId;
  List<Module> modules;
  String nextCursor;
  List<Region> regions;
  HYGrcPageBangumiModelReport report;
  StyleClass style;

  factory HYGrcPageBangumiModel.fromJson(Map<String, dynamic> json) =>
      HYGrcPageBangumiModel(
        hasNext: json["has_next"],
        hot: Hot.fromJson(json["hot"]),
        jumpModuleId: json["jump_module_id"],
        modules:
            List<Module>.from(json["modules"].map((x) => Module.fromJson(x))),
        nextCursor: json["next_cursor"],
        regions:
            List<Region>.from(json["regions"].map((x) => Region.fromJson(x))),
        report: HYGrcPageBangumiModelReport.fromJson(json["report"]),
        style: StyleClass.fromJson(json["style"]),
      );

// Map<String, dynamic> toJson() => {
//   "has_next": hasNext,
//   "hot": hot.toJson(),
//   "jump_module_id": jumpModuleId,
//   "modules": List<dynamic>.from(modules.map((x) => x.toJson())),
//   "next_cursor": nextCursor,
//   "regions": List<dynamic>.from(regions.map((x) => x.toJson())),
//   "report": report.toJson(),
//   "style": style.toJson(),
// };
}

class Hot {
  Hot({
    required this.desc,
    required this.items,
    required this.title,
    required this.wid,
  });

  String desc;
  List<dynamic> items;
  String title;
  int wid;

  factory Hot.fromJson(Map<String, dynamic> json) => Hot(
        desc: json["desc"],
        items: List<dynamic>.from(json["items"].map((x) => x)),
        title: json["title"],
        wid: json["wid"],
      );

  Map<String, dynamic> toJson() => {
        "desc": desc,
        "items": List<dynamic>.from(items.map((x) => x)),
        "title": title,
        "wid": wid,
      };
}

class Module {
  Module({
    required this.attr,
    required this.bgColor,
    required this.bgImg,
    required this.headers,
    required this.headersType,
    required this.items,
    required this.moduleId,
    required this.report,
    required this.size,
    required this.style,
    required this.subTitle,
    required this.title,
    required this.type,
    required this.wid,
    required this.skin,
    required this.colorControl,
    required this.cover,
    required this.desc,
    required this.multiStyle,
  });

  Attr? attr;
  String? bgColor;
  String? bgImg;
  List<Header>? headers;
  int headersType;
  List<Item> items;
  int moduleId;
  ItemReport? report;
  int size;
  String? style;
  String? subTitle;
  String? title;
  int type;
  List<int>? wid;
  ModuleSkin? skin;
  int? colorControl;
  String? cover;
  String? desc;
  String? multiStyle;

  factory Module.fromJson(Map<String, dynamic> json) => Module(
        attr: json["attr"] == null ? null : Attr.fromJson(json["attr"]),
        bgColor: json["bg_color"] == null ? null : json["bg_color"],
        bgImg: json["bg_img"] == null ? null : json["bg_img"],
        headers: json["headers"] == null
            ? null
            : List<Header>.from(json["headers"].map((x) => Header.fromJson(x))),
        headersType: json["headers_type"],
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
        moduleId: json["module_id"],
        report:
            json["report"] == null ? null : ItemReport.fromJson(json["report"]),
        size: json["size"],
        style: json["style"],
        subTitle: json["sub_title"] == null ? null : json["sub_title"],
        title: json["title"] == null ? null : json["title"],
        type: json["type"],
        wid: json["wid"] == null
            ? null
            : List<int>.from(json["wid"].map((x) => x)),
        skin: json["skin"] == null ? null : ModuleSkin.fromJson(json["skin"]),
        colorControl:
            json["color_control"] == null ? null : json["color_control"],
        cover: json["cover"] == null ? null : json["cover"],
        desc: json["desc"] == null ? null : json["desc"],
        multiStyle: json["multi_style"] == null ? null : json["multi_style"],
      );

// Map<String, dynamic> toJson() => {
//   "attr": attr == null ? null : attr?.toJson(),
//   "bg_color": bgColor == null ? null : bgColor,
//   "bg_img": bgImg == null ? null : bgImg,
//   "headers": headers == null ? null : List<dynamic>.from(headers.map((x) => x.toJson())),
//   "headers_type": headersType,
//   "items": List<dynamic>.from(items.map((x) => x.toJson())),
//   "module_id": moduleId,
//   "report": report == null ? null : report?.toJson(),
//   "size": size,
//   "style": styleEnumValues.reverse[style],
//   "sub_title": subTitle == null ? null : subTitle,
//   "title": title == null ? null : title,
//   "type": type,
//   "wid": wid == null ? null : List<dynamic>.from(wid.map((x) => x)),
//   "skin": skin == null ? null : skin.toJson(),
//   "color_control": colorControl == null ? null : colorControl,
//   "cover": cover == null ? null : cover,
//   "desc": desc == null ? null : desc,
//   "multi_style": multiStyle == null ? null : multiStyle,
// };
}

class Attr {
  Attr({
    required this.auto,
    required this.follow,
    required this.header,
    required this.random,
  });

  int auto;
  int follow;
  int header;
  int random;

  factory Attr.fromJson(Map<String, dynamic> json) => Attr(
        auto: json["auto"],
        follow: json["follow"],
        header: json["header"],
        random: json["random"],
      );

  Map<String, dynamic> toJson() => {
        "auto": auto,
        "follow": follow,
        "header": header,
        "random": random,
      };
}

class Header {
  Header({
    required this.title,
    required this.url,
  });

  String title;
  String url;

  factory Header.fromJson(Map<String, dynamic> json) => Header(
        title: json["title"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "url": url,
      };
}

class Item {
  Item({
    required this.aid,
    required this.badge,
    required this.badgeInfo,
    required this.badgeType,
    required this.blink,
    required this.cid,
    required this.cover,
    required this.desc,
    required this.episodeId,
    required this.isPreview,
    required this.itemId,
    required this.itemShowStatus,
    required this.items,
    required this.link,
    required this.linkType,
    required this.linkValue,
    required this.newEp,
    required this.oid,
    required this.report,
    required this.score,
    required this.seasonId,
    required this.seasonStyles,
    required this.seasonType,
    required this.skin,
    required this.sourceContent,
    required this.stat,
    required this.title,
    required this.type,
    required this.videoUrl,
    required this.wid,
    required this.fromSpmid,
    required this.playlistId,
    required this.gif,
    required this.bottomLeftBadge,
    required this.descType,
    required this.isAuto,
    required this.itemShowType,
    required this.sources,
    required this.status,
    required this.subTitleLeftBadge,
    required this.uniqueId,
    required this.spmid,
    required this.bottomRightBadge,
  });

  int? aid;
  String? badge;
  BadgeInfo? badgeInfo;
  int? badgeType;
  String? blink;
  int? cid;
  String? cover;
  String? desc;
  int? episodeId;
  int isPreview;
  int? itemId;
  int itemShowStatus;
  List<dynamic>? items;
  String link;
  int? linkType;
  int? linkValue;
  NewEp? newEp;
  int? oid;
  ItemReport? report;
  int score;
  int? seasonId;
  String? seasonStyles;
  int? seasonType;
  ItemSkin? skin;
  SourceContent? sourceContent;
  Stat? stat;
  String title;
  String? type;
  String? videoUrl;
  int? wid;
  String? fromSpmid;
  int? playlistId;
  String? gif;
  TBadge? bottomLeftBadge;
  int? descType;
  int? isAuto;
  int? itemShowType;
  String? sources;
  Status? status;
  TBadge? subTitleLeftBadge;
  String? uniqueId;
  String? spmid;
  TBadge? bottomRightBadge;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        aid: json["aid"] == null ? null : json["aid"],
        badge: json["badge"] == null ? null : json["badge"],
        badgeInfo: json["badge_info"] == null
            ? null
            : BadgeInfo.fromJson(json["badge_info"]),
        badgeType: json["badge_type"] == null ? null : json["badge_type"],
        blink: json["blink"] == null ? null : json["blink"],
        cid: json["cid"] == null ? null : json["cid"],
        cover: json["cover"],
        desc: json["desc"] == null ? null : json["desc"],
        episodeId: json["episode_id"] == null ? null : json["episode_id"],
        isPreview: json["is_preview"],
        itemId: json["item_id"] == null ? null : json["item_id"],
        itemShowStatus: json["item_show_status"],
        items: json["items"] == null
            ? null
            : List<dynamic>.from(json["items"].map((x) => x)),
        link: json["link"],
        linkType: json["link_type"] == null ? null : json["link_type"],
        linkValue: json["link_value"] == null ? null : json["link_value"],
        newEp: json["new_ep"] == null ? null : NewEp.fromJson(json["new_ep"]),
        oid: json["oid"] == null ? null : json["oid"],
        report:
            json["report"] == null ? null : ItemReport.fromJson(json["report"]),
        score: json["score"],
        seasonId: json["season_id"] == null ? null : json["season_id"],
        seasonStyles:
            json["season_styles"] == null ? null : json["season_styles"],
        seasonType: json["season_type"] == null ? null : json["season_type"],
        skin: json["skin"] == null ? null : ItemSkin.fromJson(json["skin"]),
        sourceContent: json["source_content"] == null
            ? null
            : SourceContent.fromJson(json["source_content"]),
        stat: json["stat"] == null ? null : Stat.fromJson(json["stat"]),
        title: json["title"],
        type: json["type"] == null ? null : json["type"],
        videoUrl: json["video_url"] == null ? null : json["video_url"],
        wid: json["wid"] == null ? null : json["wid"],
        fromSpmid: json["from_spmid"] == null ? null : json["from_spmid"],
        playlistId: json["playlist_id"] == null ? null : json["playlist_id"],
        gif: json["gif"] == null ? null : json["gif"],
        bottomLeftBadge: json["bottom_left_badge"] == null
            ? null
            : TBadge.fromJson(json["bottom_left_badge"]),
        descType: json["desc_type"] == null ? null : json["desc_type"],
        isAuto: json["is_auto"] == null ? null : json["is_auto"],
        itemShowType:
            json["item_show_type"] == null ? null : json["item_show_type"],
        sources: json["sources"] == null ? null : json["sources"],
        status: json["status"] == null ? null : Status.fromJson(json["status"]),
        subTitleLeftBadge: json["sub_title_left_badge"] == null
            ? null
            : TBadge.fromJson(json["sub_title_left_badge"]),
        uniqueId: json["unique_id"] == null ? null : json["unique_id"],
        spmid: json["spmid"] == null ? null : json["spmid"],
        bottomRightBadge: json["bottom_right_badge"] == null
            ? null
            : TBadge.fromJson(json["bottom_right_badge"]),
      );

// Map<String, dynamic> toJson() => {
//   "aid": aid == null ? null : aid,
//   "badge": badge == null ? null : badgeValues.reverse[badge],
//   "badge_info": badgeInfo == null ? null : badgeInfo.toJson(),
//   "badge_type": badgeType == null ? null : badgeType,
//   "blink": blink == null ? null : blink,
//   "cid": cid == null ? null : cid,
//   "cover": cover,
//   "desc": desc == null ? null : desc,
//   "episode_id": episodeId == null ? null : episodeId,
//   "is_preview": isPreview,
//   "item_id": itemId == null ? null : itemId,
//   "item_show_status": itemShowStatus,
//   "items": items == null ? null : List<dynamic>.from(items.map((x) => x)),
//   "link": link,
//   "link_type": linkType == null ? null : linkType,
//   "link_value": linkValue == null ? null : linkValue,
//   "new_ep": newEp == null ? null : newEp.toJson(),
//   "oid": oid == null ? null : oid,
//   "report": report == null ? null : report.toJson(),
//   "score": score,
//   "season_id": seasonId == null ? null : seasonId,
//   "season_styles": seasonStyles == null ? null : seasonStyles,
//   "season_type": seasonType == null ? null : seasonType,
//   "skin": skin == null ? null : skin.toJson(),
//   "source_content": sourceContent == null ? null : sourceContent.toJson(),
//   "stat": stat == null ? null : stat.toJson(),
//   "title": title,
//   "type": type == null ? null : typeValues.reverse[type],
//   "video_url": videoUrl == null ? null : videoUrl,
//   "wid": wid == null ? null : wid,
//   "from_spmid": fromSpmid == null ? null : fromSpmid,
//   "playlist_id": playlistId == null ? null : playlistId,
//   "gif": gif == null ? null : gif,
//   "bottom_left_badge": bottomLeftBadge == null ? null : bottomLeftBadge.toJson(),
//   "desc_type": descType == null ? null : descType,
//   "is_auto": isAuto == null ? null : isAuto,
//   "item_show_type": itemShowType == null ? null : itemShowType,
//   "sources": sources == null ? null : sources,
//   "status": status == null ? null : status.toJson(),
//   "sub_title_left_badge": subTitleLeftBadge == null ? null : subTitleLeftBadge.toJson(),
//   "unique_id": uniqueId == null ? null : uniqueId,
//   "spmid": spmid == null ? null : spmidValues.reverse[spmid],
//   "bottom_right_badge": bottomRightBadge == null ? null : bottomRightBadge.toJson(),
// };
}

// enum Badge { EMPTY, BADGE, PURPLE, FLUFFY, TENTACLED }
//
// final badgeValues = EnumValues({
//   "会员抢先": Badge.BADGE,
//   "独家": Badge.EMPTY,
//   "出品": Badge.FLUFFY,
//   "": Badge.PURPLE,
//   "会员专享": Badge.TENTACLED
// });

class BadgeInfo {
  BadgeInfo({
    required this.bgColor,
    required this.bgColorNight,
    required this.text,
    required this.textSize,
  });

  String? bgColor;
  String? bgColorNight;
  String? text;
  int textSize;

  factory BadgeInfo.fromJson(Map<String, dynamic> json) => BadgeInfo(
        bgColor: json["bg_color"],
        bgColorNight: json["bg_color_night"],
        text: json["text"],
        textSize: json["text_size"],
      );

// Map<String, dynamic> toJson() => {
//   "bg_color": bgColorValues.reverse[bgColor],
//   "bg_color_night": bgColorNightValues.reverse[bgColorNight],
//   "text": badgeValues.reverse[text],
//   "text_size": textSize,
// };
}

// enum BgColor { THE_00_C0_FF, FB7299, EMPTY }
//
// final bgColorValues = EnumValues({
//   "": BgColor.EMPTY,
//   "#FB7299": BgColor.FB7299,
//   "#00C0FF": BgColor.THE_00_C0_FF
// });

// enum BgColorNight { THE_0_B91_BE, BB5_B76, EMPTY }
//
// final bgColorNightValues = EnumValues({
//   "#BB5B76": BgColorNight.BB5_B76,
//   "": BgColorNight.EMPTY,
//   "#0B91BE": BgColorNight.THE_0_B91_BE
// });

class TBadge {
  TBadge({
    required this.text,
    required this.textColor,
    required this.textSize,
  });

  String text;
  String? textColor;
  int textSize;

  factory TBadge.fromJson(Map<String, dynamic> json) => TBadge(
        text: json["text"],
        textColor: json["text_color"],
        textSize: json["text_size"],
      );

// Map<String, dynamic> toJson() => {
//   "text": text,
//   "text_color": textColorValues.reverse[textColor],
//   "text_size": textSize,
// };
}

// enum TextColor { FFFFFF, FF7_F24 }
//
// final textColorValues = EnumValues({
//   "#FF7F24": TextColor.FF7_F24,
//   "#FFFFFF": TextColor.FFFFFF
// });

class NewEp {
  NewEp({
    required this.cover,
    required this.id,
    required this.indexShow,
  });

  String cover;
  int id;
  String indexShow;

  factory NewEp.fromJson(Map<String, dynamic> json) => NewEp(
        cover: json["cover"],
        id: json["id"],
        indexShow: json["index_show"],
      );

  Map<String, dynamic> toJson() => {
        "cover": cover,
        "id": id,
        "index_show": indexShow,
      };
}

class ItemReport {
  ItemReport({
    required this.cardType,
    required this.epid,
    required this.index,
    required this.itemId,
    required this.itemShowStatus,
    required this.moduleId,
    required this.moduleType,
    required this.oid,
    required this.playlistId,
    required this.positionId,
    required this.seasonId,
    required this.seasonType,
    required this.avid,
    required this.lsource,
    required this.reasonType,
    required this.rid,
    required this.score,
    required this.sources,
    required this.trackId,
    required this.trackid,
    required this.isWtgt,
    required this.inlineEpid,
    required this.multicardType,
    required this.ranklistId,
    required this.styleId,
  });

  String? cardType;
  String? epid;
  String? index;
  String? itemId;
  String? itemShowStatus;
  String moduleId;
  String moduleType;
  String? oid;
  String? playlistId;
  String? positionId;
  String? seasonId;
  String? seasonType;
  String? avid;
  String? lsource;
  String? reasonType;
  String? rid;
  String? score;
  String? sources;
  String? trackId;
  String? trackid;
  String? isWtgt;
  String? inlineEpid;
  String? multicardType;
  String? ranklistId;
  String? styleId;

  factory ItemReport.fromJson(Map<String, dynamic> json) => ItemReport(
        cardType: json["card_type"] == null ? null : json["card_type"],
        epid: json["epid"] == null ? null : json["epid"],
        index: json["index"] == null ? null : json["index"],
        itemId: json["item_id"] == null ? null : json["item_id"],
        itemShowStatus:
            json["item_show_status"] == null ? null : json["item_show_status"],
        moduleId: json["module_id"],
        moduleType: json["module_type"],
        oid: json["oid"] == null ? null : json["oid"],
        playlistId: json["playlist_id"] == null ? null : json["playlist_id"],
        positionId: json["position_id"] == null ? null : json["position_id"],
        seasonId: json["season_id"] == null ? null : json["season_id"],
        seasonType: json["season_type"] == null ? null : json["season_type"],
        avid: json["avid"] == null ? null : json["avid"],
        lsource: json["lsource"] == null ? null : json["lsource"],
        reasonType: json["reason_type"] == null ? null : json["reason_type"],
        rid: json["rid"] == null ? null : json["rid"],
        score: json["score"] == null ? null : json["score"],
        sources: json["sources"] == null ? null : json["sources"],
        trackId: json["track_id"] == null ? null : json["track_id"],
        trackid: json["trackid"] == null ? null : json["trackid"],
        isWtgt: json["is_wtgt"] == null ? null : json["is_wtgt"],
        inlineEpid: json["inline_epid"] == null ? null : json["inline_epid"],
        multicardType:
            json["multicard_type"] == null ? null : json["multicard_type"],
        ranklistId: json["ranklist_id"] == null ? null : json["ranklist_id"],
        styleId: json["style_id"] == null ? null : json["style_id"],
      );

// Map<String, dynamic> toJson() => {
//   "card_type": cardType == null ? null : styleEnumValues.reverse[cardType],
//   "epid": epid == null ? null : epid,
//   "index": index == null ? null : index,
//   "item_id": itemId == null ? null : itemId,
//   "item_show_status": itemShowStatus == null ? null : itemShowStatus,
//   "module_id": moduleId,
//   "module_type": styleEnumValues.reverse[moduleType],
//   "oid": oid == null ? null : oid,
//   "playlist_id": playlistId == null ? null : playlistId,
//   "position_id": positionId == null ? null : positionId,
//   "season_id": seasonId == null ? null : seasonId,
//   "season_type": seasonType == null ? null : seasonType,
//   "avid": avid == null ? null : avid,
//   "lsource": lsource == null ? null : lsource,
//   "reason_type": reasonType == null ? null : reasonType,
//   "rid": rid == null ? null : rid,
//   "score": score == null ? null : scoreValues.reverse[score],
//   "sources": sources == null ? null : sources,
//   "track_id": trackId == null ? null : trackId,
//   "trackid": trackid == null ? null : trackid,
//   "is_wtgt": isWtgt == null ? null : isWtgt,
//   "inline_epid": inlineEpid == null ? null : inlineEpid,
//   "multicard_type": multicardType == null ? null : multicardType,
//   "ranklist_id": ranklistId == null ? null : ranklistId,
//   "style_id": styleId == null ? null : styleId,
// };
}

// enum StyleEnum { BANNER_V3, FUNCTION, CARD, DOUBLE_FEED, FALL_FEED_MULTI_CARD }

// final styleEnumValues = EnumValues({
//   "banner_v3": StyleEnum.BANNER_V3,
//   "card": StyleEnum.CARD,
//   "double_feed": StyleEnum.DOUBLE_FEED,
//   "fall_feed_multi_card": StyleEnum.FALL_FEED_MULTI_CARD,
//   "function": StyleEnum.FUNCTION
// });
//
// enum Score { EMPTY, THE_00 }
//
// final scoreValues = EnumValues({
//   "": Score.EMPTY,
//   "0.0": Score.THE_00
// });

class ItemSkin {
  ItemSkin({
    required this.bgEndColor,
    required this.bgStartColor,
    required this.bgType,
    required this.itemTabBarBgEndColor,
    required this.itemTabBarBgStartColor,
    required this.statusBarColorType,
    required this.topBgType,
    required this.topLowerBgImg,
    required this.topSearchBarBgColor,
    required this.topStatusBarBgColor,
    required this.topStatusBarColorType,
    required this.topTabBarBgColor,
    required this.topTabTextHighlightColor,
    required this.topUpperBgImg,
  });

  String bgEndColor;
  String bgStartColor;
  int bgType;
  String itemTabBarBgEndColor;
  String itemTabBarBgStartColor;
  int statusBarColorType;
  int topBgType;
  String topLowerBgImg;
  String topSearchBarBgColor;
  String topStatusBarBgColor;
  int topStatusBarColorType;
  String topTabBarBgColor;
  String topTabTextHighlightColor;
  String topUpperBgImg;

  factory ItemSkin.fromJson(Map<String, dynamic> json) => ItemSkin(
        bgEndColor: json["bg_end_color"],
        bgStartColor: json["bg_start_color"],
        bgType: json["bg_type"],
        itemTabBarBgEndColor: json["item_tab_bar_bg_end_color"],
        itemTabBarBgStartColor: json["item_tab_bar_bg_start_color"],
        statusBarColorType: json["status_bar_color_type"],
        topBgType: json["top_bg_type"],
        topLowerBgImg: json["top_lower_bg_img"],
        topSearchBarBgColor: json["top_search_bar_bg_color"],
        topStatusBarBgColor: json["top_status_bar_bg_color"],
        topStatusBarColorType: json["top_status_bar_color_type"],
        topTabBarBgColor: json["top_tab_bar_bg_color"],
        topTabTextHighlightColor: json["top_tab_text_highlight_color"],
        topUpperBgImg: json["top_upper_bg_img"],
      );

  Map<String, dynamic> toJson() => {
        "bg_end_color": bgEndColor,
        "bg_start_color": bgStartColor,
        "bg_type": bgType,
        "item_tab_bar_bg_end_color": itemTabBarBgEndColor,
        "item_tab_bar_bg_start_color": itemTabBarBgStartColor,
        "status_bar_color_type": statusBarColorType,
        "top_bg_type": topBgType,
        "top_lower_bg_img": topLowerBgImg,
        "top_search_bar_bg_color": topSearchBarBgColor,
        "top_status_bar_bg_color": topStatusBarBgColor,
        "top_status_bar_color_type": topStatusBarColorType,
        "top_tab_bar_bg_color": topTabBarBgColor,
        "top_tab_text_highlight_color": topTabTextHighlightColor,
        "top_upper_bg_img": topUpperBgImg,
      };
}

class SourceContent {
  SourceContent({
    required this.cardIndex,
    required this.clientIp,
    required this.index,
    required this.isAdLoc,
    required this.requestId,
    required this.resourceId,
    required this.serverType,
    required this.sourceId,
    required this.adContent,
  });

  int cardIndex;
  String clientIp;
  int index;
  int isAdLoc;
  String requestId;
  int resourceId;
  int serverType;
  int sourceId;
  AdContent? adContent;

  factory SourceContent.fromJson(Map<String, dynamic> json) => SourceContent(
        cardIndex: json["card_index"],
        clientIp: json["client_ip"],
        index: json["index"],
        isAdLoc: json["is_ad_loc"],
        requestId: json["request_id"],
        resourceId: json["resource_id"],
        serverType: json["server_type"],
        sourceId: json["source_id"],
        adContent: json["ad_content"] == null
            ? null
            : AdContent.fromJson(json["ad_content"]),
      );

// Map<String, dynamic> toJson() => {
//   "card_index": cardIndex,
//   "client_ip": clientIp,
//   "index": index,
//   "is_ad_loc": isAdLoc,
//   "request_id": requestId,
//   "resource_id": resourceId,
//   "server_type": serverType,
//   "source_id": sourceId,
//   "ad_content": adContent == null ? null : adContent.toJson(),
// };
}

class AdContent {
  AdContent({
    required this.adCb,
    required this.cmMark,
    required this.creativeId,
    required this.extra,
    required this.isAd,
  });

  String adCb;
  int cmMark;
  double creativeId;
  Extra extra;
  bool isAd;

  factory AdContent.fromJson(Map<String, dynamic> json) => AdContent(
        adCb: json["ad_cb"],
        cmMark: json["cm_mark"],
        creativeId: json["creative_id"].toDouble(),
        extra: Extra.fromJson(json["extra"]),
        isAd: json["is_ad"],
      );

  Map<String, dynamic> toJson() => {
        "ad_cb": adCb,
        "cm_mark": cmMark,
        "creative_id": creativeId,
        "extra": extra.toJson(),
        "is_ad": isAd,
      };
}

class Extra {
  Extra({
    required this.macroReplacePriority,
    required this.specialIndustryStyle,
    required this.landingpageDownloadStyle,
    required this.enableStoreDirectLaunch,
    required this.clickUrls,
    required this.upzoneEntranceReportId,
    required this.feedbackPanelStyle,
    required this.clickArea,
    required this.specialIndustry,
    required this.enableH5Alert,
    required this.openWhitelist,
    required this.productId,
    required this.upMid,
    required this.specialIndustryTips,
    required this.salesType,
    required this.shareInfo,
    required this.adContentType,
    required this.useAdWebV2,
    required this.showUrls,
    required this.enableH5PreLoad,
    required this.enableDoubleJump,
    required this.shopId,
    required this.upzoneEntranceType,
    required this.reportTime,
    required this.preloadLandingpage,
    required this.trackId,
    required this.storeCallupCard,
    required this.downloadWhitelist,
    required this.card,
  });

  int macroReplacePriority;
  int specialIndustryStyle;
  int landingpageDownloadStyle;
  int enableStoreDirectLaunch;
  List<dynamic> clickUrls;
  int upzoneEntranceReportId;
  int feedbackPanelStyle;
  int clickArea;
  bool specialIndustry;
  bool enableH5Alert;
  List<dynamic> openWhitelist;
  int productId;
  int upMid;
  String specialIndustryTips;
  int salesType;
  ShareInfo shareInfo;
  int adContentType;
  bool useAdWebV2;
  List<String> showUrls;
  int enableH5PreLoad;
  bool enableDoubleJump;
  int shopId;
  int upzoneEntranceType;
  int reportTime;
  int preloadLandingpage;
  String trackId;
  bool storeCallupCard;
  List<dynamic> downloadWhitelist;
  CCard card;

  factory Extra.fromJson(Map<String, dynamic> json) => Extra(
        macroReplacePriority: json["macro_replace_priority"],
        specialIndustryStyle: json["special_industry_style"],
        landingpageDownloadStyle: json["landingpage_download_style"],
        enableStoreDirectLaunch: json["enable_store_direct_launch"],
        clickUrls: List<dynamic>.from(json["click_urls"].map((x) => x)),
        upzoneEntranceReportId: json["upzone_entrance_report_id"],
        feedbackPanelStyle: json["feedback_panel_style"],
        clickArea: json["click_area"],
        specialIndustry: json["special_industry"],
        enableH5Alert: json["enable_h5_alert"],
        openWhitelist: List<dynamic>.from(json["open_whitelist"].map((x) => x)),
        productId: json["product_id"],
        upMid: json["up_mid"],
        specialIndustryTips: json["special_industry_tips"],
        salesType: json["sales_type"],
        shareInfo: ShareInfo.fromJson(json["share_info"]),
        adContentType: json["ad_content_type"],
        useAdWebV2: json["use_ad_web_v2"],
        showUrls: List<String>.from(json["show_urls"].map((x) => x)),
        enableH5PreLoad: json["enable_h5_pre_load"],
        enableDoubleJump: json["enable_double_jump"],
        shopId: json["shop_id"],
        upzoneEntranceType: json["upzone_entrance_type"],
        reportTime: json["report_time"],
        preloadLandingpage: json["preload_landingpage"],
        trackId: json["track_id"],
        storeCallupCard: json["store_callup_card"],
        downloadWhitelist:
            List<dynamic>.from(json["download_whitelist"].map((x) => x)),
        card: CCard.fromJson(json["card"]),
      );

  Map<String, dynamic> toJson() => {
        "macro_replace_priority": macroReplacePriority,
        "special_industry_style": specialIndustryStyle,
        "landingpage_download_style": landingpageDownloadStyle,
        "enable_store_direct_launch": enableStoreDirectLaunch,
        "click_urls": List<dynamic>.from(clickUrls.map((x) => x)),
        "upzone_entrance_report_id": upzoneEntranceReportId,
        "feedback_panel_style": feedbackPanelStyle,
        "click_area": clickArea,
        "special_industry": specialIndustry,
        "enable_h5_alert": enableH5Alert,
        "open_whitelist": List<dynamic>.from(openWhitelist.map((x) => x)),
        "product_id": productId,
        "up_mid": upMid,
        "special_industry_tips": specialIndustryTips,
        "sales_type": salesType,
        "share_info": shareInfo.toJson(),
        "ad_content_type": adContentType,
        "use_ad_web_v2": useAdWebV2,
        "show_urls": List<dynamic>.from(showUrls.map((x) => x)),
        "enable_h5_pre_load": enableH5PreLoad,
        "enable_double_jump": enableDoubleJump,
        "shop_id": shopId,
        "upzone_entrance_type": upzoneEntranceType,
        "report_time": reportTime,
        "preload_landingpage": preloadLandingpage,
        "track_id": trackId,
        "store_callup_card": storeCallupCard,
        "download_whitelist":
            List<dynamic>.from(downloadWhitelist.map((x) => x)),
        "card": card.toJson(),
      };
}

class CCard {
  CCard({
    required this.feedbackPanel,
    required this.starLevel,
    required this.gradeDenominator,
    required this.dynamicText,
    required this.adTag,
    required this.title,
    required this.extremeTeamStatus,
    required this.duration,
    required this.liveTagShow,
    required this.jumpUrl,
    required this.supportTransition,
    required this.foldTime,
    required this.universalApp,
    required this.callupUrl,
    required this.underPlayerInteractionStyle,
    required this.covers,
    required this.liveBookingPopulationThreshold,
    required this.adver,
    required this.liveRoomPopularity,
    required this.useMultiCover,
    required this.qualityInfos,
    required this.cardType,
    required this.extraDesc,
    required this.longDesc,
    required this.referralPopActiveTime,
    required this.gradeLevel,
    required this.adTagStyle,
    required this.oriMarkHidden,
    required this.desc,
  });

  FeedbackPanel feedbackPanel;
  int starLevel;
  int gradeDenominator;
  String dynamicText;
  String adTag;
  String title;
  bool extremeTeamStatus;
  String duration;
  bool liveTagShow;
  String jumpUrl;
  bool supportTransition;
  int foldTime;
  String universalApp;
  String callupUrl;
  int underPlayerInteractionStyle;
  List<Cover> covers;
  int liveBookingPopulationThreshold;
  Adver adver;
  int liveRoomPopularity;
  bool useMultiCover;
  List<dynamic> qualityInfos;
  int cardType;
  String extraDesc;
  String longDesc;
  int referralPopActiveTime;
  int gradeLevel;
  AdTagStyle adTagStyle;
  int oriMarkHidden;
  String desc;

  factory CCard.fromJson(Map<String, dynamic> json) => CCard(
        feedbackPanel: FeedbackPanel.fromJson(json["feedback_panel"]),
        starLevel: json["star_level"],
        gradeDenominator: json["grade_denominator"],
        dynamicText: json["dynamic_text"],
        adTag: json["ad_tag"],
        title: json["title"],
        extremeTeamStatus: json["extreme_team_status"],
        duration: json["duration"],
        liveTagShow: json["live_tag_show"],
        jumpUrl: json["jump_url"],
        supportTransition: json["support_transition"],
        foldTime: json["fold_time"],
        universalApp: json["universal_app"],
        callupUrl: json["callup_url"],
        underPlayerInteractionStyle: json["under_player_interaction_style"],
        covers: List<Cover>.from(json["covers"].map((x) => Cover.fromJson(x))),
        liveBookingPopulationThreshold:
            json["live_booking_population_threshold"],
        adver: Adver.fromJson(json["adver"]),
        liveRoomPopularity: json["live_room_popularity"],
        useMultiCover: json["use_multi_cover"],
        qualityInfos: List<dynamic>.from(json["quality_infos"].map((x) => x)),
        cardType: json["card_type"],
        extraDesc: json["extra_desc"],
        longDesc: json["long_desc"],
        referralPopActiveTime: json["referral_pop_active_time"],
        gradeLevel: json["grade_level"],
        adTagStyle: AdTagStyle.fromJson(json["ad_tag_style"]),
        oriMarkHidden: json["ori_mark_hidden"],
        desc: json["desc"],
      );

  Map<String, dynamic> toJson() => {
        "feedback_panel": feedbackPanel.toJson(),
        "star_level": starLevel,
        "grade_denominator": gradeDenominator,
        "dynamic_text": dynamicText,
        "ad_tag": adTag,
        "title": title,
        "extreme_team_status": extremeTeamStatus,
        "duration": duration,
        "live_tag_show": liveTagShow,
        "jump_url": jumpUrl,
        "support_transition": supportTransition,
        "fold_time": foldTime,
        "universal_app": universalApp,
        "callup_url": callupUrl,
        "under_player_interaction_style": underPlayerInteractionStyle,
        "covers": List<dynamic>.from(covers.map((x) => x.toJson())),
        "live_booking_population_threshold": liveBookingPopulationThreshold,
        "adver": adver.toJson(),
        "live_room_popularity": liveRoomPopularity,
        "use_multi_cover": useMultiCover,
        "quality_infos": List<dynamic>.from(qualityInfos.map((x) => x)),
        "card_type": cardType,
        "extra_desc": extraDesc,
        "long_desc": longDesc,
        "referral_pop_active_time": referralPopActiveTime,
        "grade_level": gradeLevel,
        "ad_tag_style": adTagStyle.toJson(),
        "ori_mark_hidden": oriMarkHidden,
        "desc": desc,
      };
}

class AdTagStyle {
  AdTagStyle({
    required this.bgColor,
    required this.text,
    required this.textColor,
    required this.borderColor,
    required this.type,
    required this.bgBorderColor,
  });

  String bgColor;
  String text;
  String textColor;
  String borderColor;
  int type;
  String bgBorderColor;

  factory AdTagStyle.fromJson(Map<String, dynamic> json) => AdTagStyle(
        bgColor: json["bg_color"],
        text: json["text"],
        textColor: json["text_color"],
        borderColor: json["border_color"],
        type: json["type"],
        bgBorderColor: json["bg_border_color"],
      );

  Map<String, dynamic> toJson() => {
        "bg_color": bgColor,
        "text": text,
        "text_color": textColor,
        "border_color": borderColor,
        "type": type,
        "bg_border_color": bgBorderColor,
      };
}

class Adver {
  Adver({
    required this.adverType,
    required this.adverId,
  });

  int adverType;
  int adverId;

  factory Adver.fromJson(Map<String, dynamic> json) => Adver(
        adverType: json["adver_type"],
        adverId: json["adver_id"],
      );

  Map<String, dynamic> toJson() => {
        "adver_type": adverType,
        "adver_id": adverId,
      };
}

class Cover {
  Cover({
    required this.imageHeight,
    required this.loop,
    required this.gifTagShow,
    required this.imageWidth,
    required this.url,
  });

  int imageHeight;
  int loop;
  bool gifTagShow;
  int imageWidth;
  String url;

  factory Cover.fromJson(Map<String, dynamic> json) => Cover(
        imageHeight: json["image_height"],
        loop: json["loop"],
        gifTagShow: json["gif_tag_show"],
        imageWidth: json["image_width"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "image_height": imageHeight,
        "loop": loop,
        "gif_tag_show": gifTagShow,
        "image_width": imageWidth,
        "url": url,
      };
}

class FeedbackPanel {
  FeedbackPanel({
    required this.toast,
    required this.feedbackPanelDetail,
    required this.closeRecTips,
    required this.panelTypeText,
    required this.openRecTips,
  });

  String toast;
  List<dynamic> feedbackPanelDetail;
  String closeRecTips;
  String panelTypeText;
  String openRecTips;

  factory FeedbackPanel.fromJson(Map<String, dynamic> json) => FeedbackPanel(
        toast: json["toast"],
        feedbackPanelDetail:
            List<dynamic>.from(json["feedback_panel_detail"].map((x) => x)),
        closeRecTips: json["close_rec_tips"],
        panelTypeText: json["panel_type_text"],
        openRecTips: json["open_rec_tips"],
      );

  Map<String, dynamic> toJson() => {
        "toast": toast,
        "feedback_panel_detail":
            List<dynamic>.from(feedbackPanelDetail.map((x) => x)),
        "close_rec_tips": closeRecTips,
        "panel_type_text": panelTypeText,
        "open_rec_tips": openRecTips,
      };
}

class ShareInfo {
  ShareInfo();

  factory ShareInfo.fromJson(Map<String, dynamic> json) => ShareInfo();

  Map<String, dynamic> toJson() => {};
}

// enum Spmid { PGC_BANGUMI_TAB_RECOMMEND_0 }
//
// final spmidValues = EnumValues({
//   "pgc.bangumi-tab.recommend.0": Spmid.PGC_BANGUMI_TAB_RECOMMEND_0
// });

class Stat {
  Stat({
    required this.danmaku,
    required this.follow,
    required this.followView,
    required this.view,
  });

  int danmaku;
  int follow;
  String followView;
  int view;

  factory Stat.fromJson(Map<String, dynamic> json) => Stat(
        danmaku: json["danmaku"],
        follow: json["follow"],
        followView: json["follow_view"],
        view: json["view"],
      );

  Map<String, dynamic> toJson() => {
        "danmaku": danmaku,
        "follow": follow,
        "follow_view": followView,
        "view": view,
      };
}

class Status {
  Status({
    required this.follow,
    required this.followStatus,
    required this.like,
  });

  int follow;
  int followStatus;
  int like;

  factory Status.fromJson(Map<String, dynamic> json) => Status(
        follow: json["follow"],
        followStatus: json["follow_status"],
        like: json["like"],
      );

  Map<String, dynamic> toJson() => {
        "follow": follow,
        "follow_status": followStatus,
        "like": like,
      };
}

// enum Type { PGC }

// final typeValues = EnumValues({
//   "PGC": Type.PGC
// });

class ModuleSkin {
  ModuleSkin({
    required this.type,
  });

  int type;

  factory ModuleSkin.fromJson(Map<String, dynamic> json) => ModuleSkin(
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
      };
}

class Region {
  Region({
    required this.icon,
    required this.report,
    required this.title,
    required this.url,
  });

  String icon;
  RegionReport report;
  String title;
  String url;

  factory Region.fromJson(Map<String, dynamic> json) => Region(
        icon: json["icon"],
        report: RegionReport.fromJson(json["report"]),
        title: json["title"],
        url: json["url"],
      );

// Map<String, dynamic> toJson() => {
//   "icon": icon,
//   "report": report.toJson(),
//   "title": title,
//   "url": url,
// };
}

class RegionReport {
  RegionReport({
    required this.cardType,
    required this.itemId,
    required this.moduleId,
    required this.moduleType,
  });

  String? cardType;
  String itemId;
  String moduleId;
  String? moduleType;

  factory RegionReport.fromJson(Map<String, dynamic> json) => RegionReport(
        cardType: json["card_type"],
        itemId: json["item_id"],
        moduleId: json["module_id"],
        moduleType: json["module_type"],
      );

// Map<String, dynamic> toJson() => {
//   "card_type": styleEnumValues.reverse[cardType],
//   "item_id": itemId,
//   "module_id": moduleId,
//   "module_type": styleEnumValues.reverse[moduleType],
// };
}

class HYGrcPageBangumiModelReport {
  HYGrcPageBangumiModelReport({
    required this.pageId,
  });

  String pageId;

  factory HYGrcPageBangumiModelReport.fromJson(Map<String, dynamic> json) =>
      HYGrcPageBangumiModelReport(
        pageId: json["page_id"],
      );

  Map<String, dynamic> toJson() => {
        "page_id": pageId,
      };
}

class StyleClass {
  StyleClass({
    required this.pinned,
    required this.statusBarColorType,
  });

  int pinned;
  int statusBarColorType;

  factory StyleClass.fromJson(Map<String, dynamic> json) => StyleClass(
        pinned: json["pinned"],
        statusBarColorType: json["status_bar_color_type"],
      );

  Map<String, dynamic> toJson() => {
        "pinned": pinned,
        "status_bar_color_type": statusBarColorType,
      };
}

// class EnumValues<T> {
//   Map<String, T> map;
//   Map<T, String> reverseMap;
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
