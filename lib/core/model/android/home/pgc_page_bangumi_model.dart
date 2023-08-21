// To parse this JSON data, do
//
//     final pgcPageBangumiModel = pgcPageBangumiModelFromJson(jsonString);

import 'dart:convert';

PgcPageBangumiModel? pgcPageBangumiModelFromJson(String str) =>
    PgcPageBangumiModel.fromJson(json.decode(str));

String pgcPageBangumiModelToJson(PgcPageBangumiModel? data) =>
    json.encode(data!.toJson());

class PgcPageBangumiModel {
  PgcPageBangumiModel({
    this.code,
    this.message,
    this.result,
  });

  int? code;
  String? message;
  Result? result;

  factory PgcPageBangumiModel.fromJson(Map<String, dynamic> json) =>
      PgcPageBangumiModel(
        code: json["code"],
        message: json["message"],
        result: Result.fromJson(json["result"]),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "result": result!.toJson(),
      };
}

class Result {
  Result({
    this.hasNext,
    this.hot,
    this.jumpModuleId,
    this.modules,
    this.nextCursor,
    this.regions,
    this.report,
    this.style,
  });

  int? hasNext;
  Hot? hot;
  int? jumpModuleId;
  List<Module?>? modules;
  String? nextCursor;
  List<Region?>? regions;
  ResultReport? report;
  Style? style;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        hasNext: json["has_next"],
        hot: Hot.fromJson(json["hot"]),
        jumpModuleId: json["jump_module_id"],
        modules: json["modules"] == null
            ? []
            : List<Module?>.from(
                json["modules"]!.map((x) => Module.fromJson(x))),
        nextCursor: json["next_cursor"],
        regions: json["regions"] == null
            ? []
            : List<Region?>.from(
                json["regions"]!.map((x) => Region.fromJson(x))),
        report: ResultReport.fromJson(json["report"]),
        style: Style.fromJson(json["style"]),
      );

  Map<String, dynamic> toJson() => {
        "has_next": hasNext,
        "hot": hot!.toJson(),
        "jump_module_id": jumpModuleId,
        "modules": modules == null
            ? []
            : List<dynamic>.from(modules!.map((x) => x!.toJson())),
        "next_cursor": nextCursor,
        "regions": regions == null
            ? []
            : List<dynamic>.from(regions!.map((x) => x!.toJson())),
        "report": report!.toJson(),
        "style": style!.toJson(),
      };
}

class Hot {
  Hot({
    this.desc,
    this.items,
    this.title,
    this.wid,
  });

  String? desc;
  List<dynamic>? items;
  String? title;
  int? wid;

  factory Hot.fromJson(Map<String, dynamic> json) => Hot(
        desc: json["desc"],
        items: json["items"] == null
            ? []
            : List<dynamic>.from(json["items"]!.map((x) => x)),
        title: json["title"],
        wid: json["wid"],
      );

  Map<String, dynamic> toJson() => {
        "desc": desc,
        "items": items == null ? [] : List<dynamic>.from(items!.map((x) => x)),
        "title": title,
        "wid": wid,
      };
}

class Module {
  Module({
    this.attr,
    this.bgColor,
    this.bgImg,
    this.headers,
    this.headersType,
    this.items,
    this.jumpModuleId,
    this.moduleId,
    this.moduleTag,
    this.report,
    this.size,
    this.style,
    this.subTitle,
    this.title,
    this.type,
    this.wid,
    this.skin,
    this.colorControl,
    this.desc,
    this.firstModuleTitle,
    this.multiStyle,
    this.cover,
  });

  Attr? attr;
  String? bgColor;
  String? bgImg;
  List<Header?>? headers;
  int? headersType;
  List<Item?>? items;
  int? jumpModuleId;
  int? moduleId;
  String? moduleTag;
  ItemReport? report;
  int? size;
  String? style;
  String? subTitle;
  String? title;
  int? type;
  List<int?>? wid;
  ModuleSkin? skin;
  int? colorControl;
  String? desc;
  String? firstModuleTitle;
  String? multiStyle;
  String? cover;

  factory Module.fromJson(Map<String, dynamic> json) => Module(
        attr: json["attr"] == null ? null : Attr.fromJson(json["attr"]),
        bgColor: json["bg_color"],
        bgImg: json["bg_img"],
        headers: json["headers"] == null
            ? []
            : json["headers"] == null
                ? []
                : List<Header?>.from(
                    json["headers"]!.map((x) => Header.fromJson(x))),
        headersType: json["headers_type"],
        items: json["items"] == null
            ? []
            : List<Item?>.from(json["items"]!.map((x) => Item.fromJson(x))),
        jumpModuleId: json["jump_module_id"],
        moduleId: json["module_id"],
        moduleTag: json["module_tag"],
        report:
            json["report"] == null ? null : ItemReport.fromJson(json["report"]),
        size: json["size"],
        style: json["style"],
        subTitle: json["sub_title"],
        title: json["title"],
        type: json["type"],
        wid: json["wid"] == null
            ? []
            : json["wid"] == null
                ? []
                : List<int?>.from(json["wid"]!.map((x) => x)),
        skin: json["skin"] == null ? null : ModuleSkin.fromJson(json["skin"]),
        colorControl: json["color_control"],
        desc: json["desc"],
        firstModuleTitle: json["first_module_title"],
        multiStyle: json["multi_style"],
        cover: json["cover"],
      );

  Map<String, dynamic> toJson() => {
        "attr": attr,
        "bg_color": bgColor,
        "bg_img": bgImg,
        "headers": headers == null
            ? []
            : headers == null
                ? []
                : List<dynamic>.from(headers!.map((x) => x!.toJson())),
        "headers_type": headersType,
        "items": items == null
            ? []
            : List<dynamic>.from(items!.map((x) => x!.toJson())),
        "jump_module_id": jumpModuleId,
        "module_id": moduleId,
        "module_tag": moduleTag,
        "report": report,
        "size": size,
        "style": style,
        "sub_title": subTitle,
        "title": title,
        "type": type,
        "wid": wid == null
            ? []
            : wid == null
                ? []
                : List<dynamic>.from(wid!.map((x) => x)),
        "skin": skin,
        "color_control": colorControl,
        "desc": desc,
        "first_module_title": firstModuleTitle,
        "multi_style": multiStyle,
        "cover": cover,
      };
}

class Attr {
  Attr({
    this.auto,
    this.follow,
    this.header,
    this.random,
  });

  int? auto;
  int? follow;
  int? header;
  int? random;

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
    this.title,
    this.url,
  });

  String? title;
  String? url;

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
    this.aid,
    this.badge,
    this.badgeInfo,
    this.badgeType,
    this.blink,
    this.cardMaterialId,
    this.cid,
    this.cover,
    this.desc,
    this.dynamicBanner,
    this.episodeId,
    this.isPreview,
    this.itemId,
    this.itemShowStatus,
    this.items,
    this.link,
    this.linkType,
    this.linkValue,
    this.newEp,
    this.oid,
    this.report,
    this.score,
    this.seasonId,
    this.seasonStyles,
    this.seasonType,
    this.skin,
    this.sourceContent,
    this.stat,
    this.title,
    this.type,
    this.videoUrl,
    this.wid,
    this.fromSpmid,
    this.gif,
    this.bottomLeftBadge,
    this.descType,
    this.isAuto,
    this.itemShowType,
    this.rcmdOid,
    this.rcmdOtype,
    this.sources,
    this.status,
    this.subTitleLeftBadge,
    this.uniqueId,
    this.buttonType,
    this.dimension,
    this.feedbackContent,
    this.fullscreenButton,
    this.playerInfo,
    this.previewEpisodeId,
    this.previewSeasonId,
    this.spmid,
    this.tags,
    this.titleRightBadge,
    this.video,
    this.bottomRightBadge,
  });

  int? aid;
  String? badge;
  BadgeInfo? badgeInfo;
  int? badgeType;
  String? blink;
  double? cardMaterialId;
  int? cid;
  String? cover;
  String? desc;
  DynamicBanner? dynamicBanner;
  int? episodeId;
  int? isPreview;
  int? itemId;
  int? itemShowStatus;
  List<dynamic>? items;
  String? link;
  int? linkType;
  int? linkValue;
  NewEp? newEp;
  int? oid;
  ItemReport? report;
  int? score;
  int? seasonId;
  String? seasonStyles;
  int? seasonType;
  ItemSkin? skin;
  SourceContent? sourceContent;
  Stat? stat;
  String? title;
  String? type;
  String? videoUrl;
  int? wid;
  String? fromSpmid;
  String? gif;
  TBadge? bottomLeftBadge;
  int? descType;
  int? isAuto;
  int? itemShowType;
  int? rcmdOid;
  int? rcmdOtype;
  String? sources;
  Status? status;
  TBadge? subTitleLeftBadge;
  String? uniqueId;
  int? buttonType;
  Dimension? dimension;
  String? feedbackContent;
  int? fullscreenButton;
  PlayerInfo? playerInfo;
  int? previewEpisodeId;
  int? previewSeasonId;
  String? spmid;
  List<Tag?>? tags;
  TBadge? titleRightBadge;
  Video? video;
  TBadge? bottomRightBadge;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        aid: json["aid"],
        badge: json["badge"],
        badgeInfo: json["badge_info"] == null
            ? null
            : BadgeInfo.fromJson(json["badge_info"]),
        badgeType: json["badge_type"],
        blink: json["blink"],
        cardMaterialId: json["cardMaterialId"].toDouble(),
        cid: json["cid"],
        cover: json["cover"],
        desc: json["desc"],
        dynamicBanner: json["dynamic_banner"] == null
            ? null
            : DynamicBanner.fromJson(json["dynamic_banner"]),
        episodeId: json["episode_id"],
        isPreview: json["is_preview"],
        itemId: json["item_id"],
        itemShowStatus: json["item_show_status"],
        items: json["items"] == null
            ? []
            : json["items"] == null
                ? []
                : List<dynamic>.from(json["items"]!.map((x) => x)),
        link: json["link"],
        linkType: json["link_type"],
        linkValue: json["link_value"],
        newEp: json["new_ep"] == null ? null : NewEp.fromJson(json["new_ep"]),
        oid: json["oid"],
        report:
            json["report"] == null ? null : ItemReport.fromJson(json["report"]),
        score: json["score"],
        seasonId: json["season_id"],
        seasonStyles: json["season_styles"],
        seasonType: json["season_type"],
        skin: json["skin"] == null ? null : ItemSkin.fromJson(json["skin"]),
        sourceContent: json["source_content"] == null
            ? null
            : SourceContent.fromJson(json["source_content"]),
        stat: json["stat"] == null ? null : Stat.fromJson(json["stat"]),
        title: json["title"],
        type: json["type"],
        videoUrl: json["video_url"],
        wid: json["wid"],
        fromSpmid: json["from_spmid"],
        gif: json["gif"],
        bottomLeftBadge: json["bottom_left_badge"] == null
            ? null
            : TBadge.fromJson(json["bottom_left_badge"]),
        descType: json["desc_type"],
        isAuto: json["is_auto"],
        itemShowType: json["item_show_type"],
        rcmdOid: json["rcmd_oid"],
        rcmdOtype: json["rcmd_otype"],
        sources: json["sources"],
        status: json["status"] == null ? null : Status.fromJson(json["status"]),
        subTitleLeftBadge: json["sub_title_left_badge"] == null
            ? null
            : TBadge.fromJson(json["sub_title_left_badge"]),
        uniqueId: json["unique_id"],
        buttonType: json["button_type"],
        dimension: json["dimension"] == null
            ? null
            : Dimension.fromJson(json["dimension"]),
        feedbackContent: json["feedback_content"],
        fullscreenButton: json["fullscreen_button"],
        playerInfo: json["player_info"] == null
            ? null
            : PlayerInfo.fromJson(json["player_info"]),
        previewEpisodeId: json["preview_episode_id"],
        previewSeasonId: json["preview_season_id"],
        spmid: json["spmid"],
        tags: json["tags"] == null
            ? []
            : json["tags"] == null
                ? []
                : List<Tag?>.from(json["tags"]!.map((x) => Tag.fromJson(x))),
        titleRightBadge: json["title_right_badge"] == null
            ? null
            : TBadge.fromJson(json["title_right_badge"]),
        video: json["video"] == null ? null : Video.fromJson(json["video"]),
        bottomRightBadge: json["bottom_right_badge"] == null
            ? null
            : TBadge.fromJson(json["bottom_right_badge"]),
      );

  Map<String, dynamic> toJson() => {
        "aid": aid,
        "badge": badge,
        "badge_info": badgeInfo,
        "badge_type": badgeType,
        "blink": blink,
        "cardMaterialId": cardMaterialId,
        "cid": cid,
        "cover": cover,
        "desc": desc,
        "dynamic_banner": dynamicBanner,
        "episode_id": episodeId,
        "is_preview": isPreview,
        "item_id": itemId,
        "item_show_status": itemShowStatus,
        "items": items == null
            ? []
            : items == null
                ? []
                : List<dynamic>.from(items!.map((x) => x)),
        "link": link,
        "link_type": linkType,
        "link_value": linkValue,
        "new_ep": newEp,
        "oid": oid,
        "report": report!.toJson(),
        "score": score,
        "season_id": seasonId,
        "season_styles": seasonStyles,
        "season_type": seasonType,
        "skin": skin,
        "source_content": sourceContent,
        "stat": stat,
        "title": title,
        "type": type,
        "video_url": videoUrl,
        "wid": wid,
        "from_spmid": fromSpmid,
        "gif": gif,
        "bottom_left_badge": bottomLeftBadge,
        "desc_type": descType,
        "is_auto": isAuto,
        "item_show_type": itemShowType,
        "rcmd_oid": rcmdOid,
        "rcmd_otype": rcmdOtype,
        "sources": sources,
        "status": status,
        "sub_title_left_badge": subTitleLeftBadge,
        "unique_id": uniqueId,
        "button_type": buttonType,
        "dimension": dimension,
        "feedback_content": feedbackContent,
        "fullscreen_button": fullscreenButton,
        "player_info": playerInfo,
        "preview_episode_id": previewEpisodeId,
        "preview_season_id": previewSeasonId,
        "spmid": spmid,
        "tags": tags == null
            ? []
            : tags == null
                ? []
                : List<dynamic>.from(tags!.map((x) => x!.toJson())),
        "title_right_badge": titleRightBadge,
        "video": video,
        "bottom_right_badge": bottomRightBadge,
      };
}

class BadgeInfo {
  BadgeInfo({
    this.bgColor,
    this.bgColorNight,
    this.img,
    this.text,
    this.textSize,
  });

  String? bgColor;
  String? bgColorNight;
  String? img;
  String? text;
  int? textSize;

  factory BadgeInfo.fromJson(Map<String, dynamic> json) => BadgeInfo(
        bgColor: json["bg_color"],
        bgColorNight: json["bg_color_night"],
        img: json["img"],
        text: json["text"],
        textSize: json["text_size"],
      );

  Map<String, dynamic> toJson() => {
        "bg_color": bgColor,
        "bg_color_night": bgColorNight,
        "img": img,
        "text": text,
        "text_size": textSize,
      };
}

class TBadge {
  TBadge({
    this.text,
    this.textColor,
    this.textSize,
  });

  String? text;
  String? textColor;
  int? textSize;

  factory TBadge.fromJson(Map<String, dynamic> json) => TBadge(
        text: json["text"],
        textColor: json["text_color"],
        textSize: json["text_size"],
      );

  Map<String, dynamic> toJson() => {
        "text": text,
        "text_color": textColor,
        "text_size": textSize,
      };
}

class Dimension {
  Dimension({
    this.height,
    this.rotate,
    this.width,
  });

  int? height;
  int? rotate;
  int? width;

  factory Dimension.fromJson(Map<String, dynamic> json) => Dimension(
        height: json["height"],
        rotate: json["rotate"],
        width: json["width"],
      );

  Map<String, dynamic> toJson() => {
        "height": height,
        "rotate": rotate,
        "width": width,
      };
}

class DynamicBanner {
  DynamicBanner({
    this.bgImg,
    this.buttonImg,
    this.link,
  });

  String? bgImg;
  String? buttonImg;
  String? link;

  factory DynamicBanner.fromJson(Map<String, dynamic> json) => DynamicBanner(
        bgImg: json["bg_img"],
        buttonImg: json["button_img"],
        link: json["link"],
      );

  Map<String, dynamic> toJson() => {
        "bg_img": bgImg,
        "button_img": buttonImg,
        "link": link,
      };
}

class NewEp {
  NewEp({
    this.cover,
    this.id,
    this.indexShow,
  });

  String? cover;
  int? id;
  String? indexShow;

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

class PlayerInfo {
  PlayerInfo({
    this.noRexcode,
    this.videoProject,
    this.fnval,
    this.expireTime,
    this.fnver,
    this.backupUrl,
    this.supportFormats,
    this.oid,
    this.supportDescription,
    this.url,
    this.quality,
    this.acceptFormats,
    this.supportQuality,
    this.fileInfo,
    this.videoCodecid,
    this.cid,
  });

  int? noRexcode;
  bool? videoProject;
  int? fnval;
  int? expireTime;
  int? fnver;
  List<dynamic>? backupUrl;
  List<dynamic>? supportFormats;
  double? oid;
  List<dynamic>? supportDescription;
  String? url;
  int? quality;
  List<AcceptFormat?>? acceptFormats;
  List<dynamic>? supportQuality;
  Map<String, FileInfo?>? fileInfo;
  int? videoCodecid;
  int? cid;

  factory PlayerInfo.fromJson(Map<String, dynamic> json) => PlayerInfo(
        noRexcode: json["no_rexcode"],
        videoProject: json["video_project"],
        fnval: json["fnval"],
        expireTime: json["expire_time"],
        fnver: json["fnver"],
        backupUrl: json["backup_url"] == null
            ? []
            : List<dynamic>.from(json["backup_url"]!.map((x) => x)),
        supportFormats: json["support_formats"] == null
            ? []
            : List<dynamic>.from(json["support_formats"]!.map((x) => x)),
        oid: json["oid"].toDouble(),
        supportDescription: json["support_description"] == null
            ? []
            : List<dynamic>.from(json["support_description"]!.map((x) => x)),
        url: json["url"],
        quality: json["quality"],
        acceptFormats: json["accept_formats"] == null
            ? []
            : List<AcceptFormat?>.from(
                json["accept_formats"]!.map((x) => AcceptFormat.fromJson(x))),
        supportQuality: json["support_quality"] == null
            ? []
            : List<dynamic>.from(json["support_quality"]!.map((x) => x)),
        fileInfo: Map.from(json["file_info"]!).map(
            (k, v) => MapEntry<String, FileInfo?>(k, FileInfo.fromJson(v))),
        videoCodecid: json["video_codecid"],
        cid: json["cid"],
      );

  Map<String, dynamic> toJson() => {
        "no_rexcode": noRexcode,
        "video_project": videoProject,
        "fnval": fnval,
        "expire_time": expireTime,
        "fnver": fnver,
        "backup_url": backupUrl == null
            ? []
            : List<dynamic>.from(backupUrl!.map((x) => x)),
        "support_formats": supportFormats == null
            ? []
            : List<dynamic>.from(supportFormats!.map((x) => x)),
        "oid": oid,
        "support_description": supportDescription == null
            ? []
            : List<dynamic>.from(supportDescription!.map((x) => x)),
        "url": url,
        "quality": quality,
        "accept_formats": acceptFormats == null
            ? []
            : List<dynamic>.from(acceptFormats!.map((x) => x!.toJson())),
        "support_quality": supportQuality == null
            ? []
            : List<dynamic>.from(supportQuality!.map((x) => x)),
        "file_info": Map.from(fileInfo!)
            .map((k, v) => MapEntry<String, dynamic>(k, v!.toJson())),
        "video_codecid": videoCodecid,
        "cid": cid,
      };
}

class AcceptFormat {
  AcceptFormat({
    this.displayDesc,
    this.superscript,
    this.format,
    this.description,
    this.quality,
    this.newDescription,
  });

  String? displayDesc;
  String? superscript;
  String? format;
  String? description;
  int? quality;
  String? newDescription;

  factory AcceptFormat.fromJson(Map<String, dynamic> json) => AcceptFormat(
        displayDesc: json["display_desc"],
        superscript: json["superscript"],
        format: json["format"],
        description: json["description"],
        quality: json["quality"],
        newDescription: json["new_description"],
      );

  Map<String, dynamic> toJson() => {
        "display_desc": displayDesc,
        "superscript": superscript,
        "format": format,
        "description": description,
        "quality": quality,
        "new_description": newDescription,
      };
}

class FileInfo {
  FileInfo({
    this.infos,
  });

  List<Info?>? infos;

  factory FileInfo.fromJson(Map<String, dynamic> json) => FileInfo(
        infos: json["infos"] == null
            ? []
            : List<Info?>.from(json["infos"]!.map((x) => Info.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "infos": infos == null
            ? []
            : List<dynamic>.from(infos!.map((x) => x!.toJson())),
      };
}

class Info {
  Info({
    this.ahead,
    this.vhead,
    this.filesize,
    this.timelength,
    this.order,
  });

  String? ahead;
  String? vhead;
  int? filesize;
  int? timelength;
  int? order;

  factory Info.fromJson(Map<String, dynamic> json) => Info(
        ahead: json["ahead"],
        vhead: json["vhead"],
        filesize: json["filesize"],
        timelength: json["timelength"],
        order: json["order"],
      );

  Map<String, dynamic> toJson() => {
        "ahead": ahead,
        "vhead": vhead,
        "filesize": filesize,
        "timelength": timelength,
        "order": order,
      };
}

class ItemReport {
  ItemReport({
    this.cardType,
    this.epid,
    this.index,
    this.itemId,
    this.itemShowStatus,
    this.moduleId,
    this.moduleType,
    this.oid,
    this.playlistId,
    this.positionId,
    this.seasonId,
    this.seasonType,
    this.avid,
    this.cardMaterialId,
    this.contentType,
    this.lsource,
    this.reasonType,
    this.rid,
    this.score,
    this.sources,
    this.trackId,
    this.trackid,
    this.isWtgt,
    this.inlineScene,
    this.inlineEpid,
    this.inlineType,
    this.materialNo,
    this.multicardType,
    this.ranklistId,
    this.styleId,
  });

  String? cardType;
  String? epid;
  String? index;
  String? itemId;
  String? itemShowStatus;
  String? moduleId;
  String? moduleType;
  String? oid;
  String? playlistId;
  String? positionId;
  String? seasonId;
  String? seasonType;
  String? avid;
  String? cardMaterialId;
  String? contentType;
  String? lsource;
  String? reasonType;
  String? rid;
  String? score;
  String? sources;
  String? trackId;
  String? trackid;
  String? isWtgt;
  String? inlineScene;
  String? inlineEpid;
  String? inlineType;
  String? materialNo;
  String? multicardType;
  String? ranklistId;
  String? styleId;

  factory ItemReport.fromJson(Map<String, dynamic> json) => ItemReport(
        cardType: json["card_type"],
        epid: json["epid"],
        index: json["index"],
        itemId: json["item_id"],
        itemShowStatus: json["item_show_status"],
        moduleId: json["module_id"],
        moduleType: json["module_type"],
        oid: json["oid"],
        playlistId: json["playlist_id"],
        positionId: json["position_id"],
        seasonId: json["season_id"],
        seasonType: json["season_type"],
        avid: json["avid"],
        cardMaterialId: json["card_material_id"],
        contentType: json["content_type"],
        lsource: json["lsource"],
        reasonType: json["reason_type"],
        rid: json["rid"],
        score: json["score"],
        sources: json["sources"],
        trackId: json["track_id"],
        trackid: json["trackid"],
        isWtgt: json["is_wtgt"],
        inlineScene: json["inline_scene"],
        inlineEpid: json["inline_epid"],
        inlineType: json["inline_type"],
        materialNo: json["material_no"],
        multicardType: json["multicard_type"],
        ranklistId: json["ranklist_id"],
        styleId: json["style_id"],
      );

  Map<String, dynamic> toJson() => {
        "card_type": cardType,
        "epid": epid,
        "index": index,
        "item_id": itemId,
        "item_show_status": itemShowStatus,
        "module_id": moduleId,
        "module_type": moduleType,
        "oid": oid,
        "playlist_id": playlistId,
        "position_id": positionId,
        "season_id": seasonId,
        "season_type": seasonType,
        "avid": avid,
        "card_material_id": cardMaterialId,
        "content_type": contentType,
        "lsource": lsource,
        "reason_type": reasonType,
        "rid": rid,
        "score": score,
        "sources": sources,
        "track_id": trackId,
        "trackid": trackid,
        "is_wtgt": isWtgt,
        "inline_scene": inlineScene,
        "inline_epid": inlineEpid,
        "inline_type": inlineType,
        "material_no": materialNo,
        "multicard_type": multicardType,
        "ranklist_id": ranklistId,
        "style_id": styleId,
      };
}

class ItemSkin {
  ItemSkin({
    this.bgEndColor,
    this.bgStartColor,
    this.bgType,
    this.itemTabBarBgEndColor,
    this.itemTabBarBgStartColor,
    this.statusBarColorType,
    this.topBgType,
    this.topLowerBgImg,
    this.topSearchBarBgColor,
    this.topStatusBarBgColor,
    this.topStatusBarColorType,
    this.topTabBarBgColor,
    this.topTabTextHighlightColor,
    this.topUpperBgImg,
  });

  String? bgEndColor;
  String? bgStartColor;
  int? bgType;
  String? itemTabBarBgEndColor;
  String? itemTabBarBgStartColor;
  int? statusBarColorType;
  int? topBgType;
  String? topLowerBgImg;
  String? topSearchBarBgColor;
  String? topStatusBarBgColor;
  int? topStatusBarColorType;
  String? topTabBarBgColor;
  String? topTabTextHighlightColor;
  String? topUpperBgImg;

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
    this.cardIndex,
    this.clientIp,
    this.index,
    this.isAdLoc,
    this.requestId,
    this.resourceId,
    this.serverType,
    this.sourceId,
  });

  int? cardIndex;
  String? clientIp;
  int? index;
  int? isAdLoc;
  String? requestId;
  int? resourceId;
  int? serverType;
  int? sourceId;

  factory SourceContent.fromJson(Map<String, dynamic> json) => SourceContent(
        cardIndex: json["card_index"],
        clientIp: json["client_ip"],
        index: json["index"],
        isAdLoc: json["is_ad_loc"],
        requestId: json["request_id"],
        resourceId: json["resource_id"],
        serverType: json["server_type"],
        sourceId: json["source_id"],
      );

  Map<String, dynamic> toJson() => {
        "card_index": cardIndex,
        "client_ip": clientIp,
        "index": index,
        "is_ad_loc": isAdLoc,
        "request_id": requestId,
        "resource_id": resourceId,
        "server_type": serverType,
        "source_id": sourceId,
      };
}

class Stat {
  Stat({
    this.danmaku,
    this.follow,
    this.followView,
    this.view,
  });

  int? danmaku;
  int? follow;
  String? followView;
  int? view;

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
    this.follow,
    this.followStatus,
    this.like,
  });

  int? follow;
  int? followStatus;
  int? like;

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

class Tag {
  Tag({
    this.text,
    this.type,
  });

  String? text;
  int? type;

  factory Tag.fromJson(Map<String, dynamic> json) => Tag(
        text: json["text"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "text": text,
        "type": type,
      };
}

class Video {
  Video({
    this.clipInfo,
    this.inlineScene,
    this.inlineType,
    this.totalDuration,
  });

  ClipInfo? clipInfo;
  int? inlineScene;
  int? inlineType;
  int? totalDuration;

  factory Video.fromJson(Map<String, dynamic> json) => Video(
        clipInfo: ClipInfo.fromJson(json["clip_info"]),
        inlineScene: json["inline_scene"],
        inlineType: json["inline_type"],
        totalDuration: json["total_duration"],
      );

  Map<String, dynamic> toJson() => {
        "clip_info": clipInfo!.toJson(),
        "inline_scene": inlineScene,
        "inline_type": inlineType,
        "total_duration": totalDuration,
      };
}

class ClipInfo {
  ClipInfo({
    this.end,
    this.id,
    this.start,
  });

  int? end;
  double? id;
  int? start;

  factory ClipInfo.fromJson(Map<String, dynamic> json) => ClipInfo(
        end: json["end"],
        id: json["id"].toDouble(),
        start: json["start"],
      );

  Map<String, dynamic> toJson() => {
        "end": end,
        "id": id,
        "start": start,
      };
}

class ModuleSkin {
  ModuleSkin({
    this.type,
  });

  int? type;

  factory ModuleSkin.fromJson(Map<String, dynamic> json) => ModuleSkin(
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
      };
}

class Region {
  Region({
    this.icon,
    this.report,
    this.title,
    this.url,
  });

  String? icon;
  RegionReport? report;
  String? title;
  String? url;

  factory Region.fromJson(Map<String, dynamic> json) => Region(
        icon: json["icon"],
        report: RegionReport.fromJson(json["report"]),
        title: json["title"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "icon": icon,
        "report": report!.toJson(),
        "title": title,
        "url": url,
      };
}

class RegionReport {
  RegionReport({
    this.cardType,
    this.itemId,
    this.moduleId,
    this.moduleType,
  });

  String? cardType;
  String? itemId;
  String? moduleId;
  String? moduleType;

  factory RegionReport.fromJson(Map<String, dynamic> json) => RegionReport(
        cardType: json["card_type"],
        itemId: json["item_id"],
        moduleId: json["module_id"],
        moduleType: json["module_type"],
      );

  Map<String, dynamic> toJson() => {
        "card_type": cardType,
        "item_id": itemId,
        "module_id": moduleId,
        "module_type": moduleType,
      };
}

class ResultReport {
  ResultReport({
    this.pageId,
  });

  String? pageId;

  factory ResultReport.fromJson(Map<String, dynamic> json) => ResultReport(
        pageId: json["page_id"],
      );

  Map<String, dynamic> toJson() => {
        "page_id": pageId,
      };
}

class Style {
  Style({
    this.pinned,
    this.statusBarColorType,
  });

  int? pinned;
  int? statusBarColorType;

  factory Style.fromJson(Map<String, dynamic> json) => Style(
        pinned: json["pinned"],
        statusBarColorType: json["status_bar_color_type"],
      );

  Map<String, dynamic> toJson() => {
        "pinned": pinned,
        "status_bar_color_type": statusBarColorType,
      };
}
