// To parse this JSON data, do
//
//     final webDynamicV1FeedAllModel = webDynamicV1FeedAllModelFromJson(jsonString);

import 'dart:convert';

WebDynamicV1FeedAllModel webDynamicV1FeedAllModelFromJson(String str) =>
    WebDynamicV1FeedAllModel.fromJson(json.decode(str));

String webDynamicV1FeedAllModelToJson(WebDynamicV1FeedAllModel data) =>
    json.encode(data.toJson());

class WebDynamicV1FeedAllModel {
  WebDynamicV1FeedAllModel({
    required this.code,
    required this.message,
    required this.ttl,
    required this.data,
  });

  int code;
  String message;
  int ttl;
  WebDynamicV1FeedAllData? data;

  factory WebDynamicV1FeedAllModel.fromJson(Map<String, dynamic> json) =>
      WebDynamicV1FeedAllModel(
        code: json["code"],
        message: json["message"],
        ttl: json["ttl"],
        data: json["data"] == null ? null : WebDynamicV1FeedAllData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "ttl": ttl,
        "data": data!.toJson(),
      };
}

class WebDynamicV1FeedAllData {
  WebDynamicV1FeedAllData({
    required this.hasMore,
    required this.items,
    required this.offset,
    required this.updateBaseline,
    required this.updateNum,
  });

  bool hasMore;
  List<DataItem> items;
  String offset;
  String updateBaseline;
  int updateNum;

  factory WebDynamicV1FeedAllData.fromJson(Map<String, dynamic> json) =>
      WebDynamicV1FeedAllData(
        hasMore: json["has_more"],
        items:
            List<DataItem>.from(json["items"].map((x) => DataItem.fromJson(x))),
        offset: json["offset"],
        updateBaseline: json["update_baseline"],
        updateNum: json["update_num"],
      );

  Map<String, dynamic> toJson() => {
        "has_more": hasMore,
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
        "offset": offset,
        "update_baseline": updateBaseline,
        "update_num": updateNum,
      };
}

class DataItem {
  DataItem({
    required this.basic,
    required this.idStr,
    required this.modules,
    required this.type,
    required this.visible,
    required this.orig,
  });

  Basic basic;
  String idStr;
  ItemModules modules;
  String type;
  bool visible;
  Orig? orig;

  factory DataItem.fromJson(Map<String, dynamic> json) => DataItem(
        basic: Basic.fromJson(json["basic"]),
        idStr: json["id_str"],
        modules: ItemModules.fromJson(json["modules"]),
        type: json["type"],
        visible: json["visible"],
        orig: json["orig"] == null ? null : Orig.fromJson(json["orig"]),
      );

  Map<String, dynamic> toJson() => {
        "basic": basic.toJson(),
        "id_str": idStr,
        "modules": modules.toJson(),
        "type": type,
        "visible": visible,
        "orig": orig == null ? null : orig!.toJson(),
      };
}

class Basic {
  Basic({
    required this.commentIdStr,
    required this.commentType,
    required this.likeIcon,
    required this.ridStr,
  });

  String commentIdStr;
  int commentType;
  LikeIcon likeIcon;
  String ridStr;

  factory Basic.fromJson(Map<String, dynamic> json) => Basic(
        commentIdStr: json["comment_id_str"],
        commentType: json["comment_type"],
        likeIcon: LikeIcon.fromJson(json["like_icon"]),
        ridStr: json["rid_str"],
      );

  Map<String, dynamic> toJson() => {
        "comment_id_str": commentIdStr,
        "comment_type": commentType,
        "like_icon": likeIcon.toJson(),
        "rid_str": ridStr,
      };
}

class LikeIcon {
  LikeIcon({
    required this.actionUrl,
    required this.endUrl,
    required this.id,
    required this.startUrl,
  });

  String actionUrl;
  String endUrl;
  int id;
  String startUrl;

  factory LikeIcon.fromJson(Map<String, dynamic> json) => LikeIcon(
        actionUrl: json["action_url"],
        endUrl: json["end_url"],
        id: json["id"],
        startUrl: json["start_url"],
      );

  Map<String, dynamic> toJson() => {
        "action_url": actionUrl,
        "end_url": endUrl,
        "id": id,
        "start_url": startUrl,
      };
}

class ItemModules {
  ItemModules({
    required this.moduleAuthor,
    required this.moduleDynamic,
    required this.moduleInteraction,
    required this.moduleMore,
    required this.moduleStat,
  });

  ModuleAuthor moduleAuthor;
  PurpleModuleDynamic moduleDynamic;
  ModuleInteraction? moduleInteraction;
  ModuleMore moduleMore;
  ModuleStat moduleStat;

  factory ItemModules.fromJson(Map<String, dynamic> json) => ItemModules(
        moduleAuthor: ModuleAuthor.fromJson(json["module_author"]),
        moduleDynamic: PurpleModuleDynamic.fromJson(json["module_dynamic"]),
        moduleInteraction: json["module_interaction"] == null
            ? null
            : ModuleInteraction.fromJson(json["module_interaction"]),
        moduleMore: ModuleMore.fromJson(json["module_more"]),
        moduleStat: ModuleStat.fromJson(json["module_stat"]),
      );

  Map<String, dynamic> toJson() => {
        "module_author": moduleAuthor.toJson(),
        "module_dynamic": moduleDynamic.toJson(),
        "module_interaction":
            moduleInteraction == null ? null : moduleInteraction!.toJson(),
        "module_more": moduleMore.toJson(),
        "module_stat": moduleStat.toJson(),
      };
}

class ModuleAuthor {
  ModuleAuthor({
    required this.face,
    required this.faceNft,
    required this.following,
    required this.jumpUrl,
    required this.label,
    required this.mid,
    required this.name,
    required this.officialVerify,
    required this.pendant,
    required this.pubAction,
    required this.pubLocationText,
    required this.pubTime,
    required this.pubTs,
    required this.type,
    required this.vip,
    required this.decorate,
  });

  String face;
  bool faceNft;
  bool? following;
  String jumpUrl;
  String? label;
  int mid;
  String name;
  OfficialVerify? officialVerify;
  Pendant? pendant;
  String pubAction;
  String? pubLocationText;
  String pubTime;
  int pubTs;
  String type;
  Vip? vip;
  Decorate? decorate;

  factory ModuleAuthor.fromJson(Map<String, dynamic> json) => ModuleAuthor(
        face: json["face"],
        faceNft: json["face_nft"],
        following: json["following"] ,
        jumpUrl: json["jump_url"],
        label: json["label"],
        mid: json["mid"],
        name: json["name"],
        officialVerify: json["official_verify"] == null
            ? null
            : OfficialVerify.fromJson(json["official_verify"]),
        pendant:
            json["pendant"] == null ? null : Pendant.fromJson(json["pendant"]),
        pubAction: json["pub_action"],
        pubLocationText: json["pub_location_text"],
        pubTime: json["pub_time"],
        pubTs: json["pub_ts"],
        type: json["type"],
        vip: json["vip"] == null ? null : Vip.fromJson(json["vip"]),
        decorate: json["decorate"] == null
            ? null
            : Decorate.fromJson(json["decorate"]),
      );

  Map<String, dynamic> toJson() => {
        "face": face,
        "face_nft": faceNft,
        "following": following,
        "jump_url": jumpUrl,
        "label": label,
        "mid": mid,
        "name": name,
        "official_verify":
            officialVerify == null ? null : officialVerify!.toJson(),
        "pendant": pendant == null ? null : pendant!.toJson(),
        "pub_action": pubAction,
        "pub_location_text": pubLocationText,
        "pub_time": pubTime,
        "pub_ts": pubTs,
        "type": type,
        "vip": vip == null ? null : vip!.toJson(),
        "decorate": decorate == null ? null : decorate!.toJson(),
      };
}

class Decorate {
  Decorate({
    required this.cardUrl,
    required this.fan,
    required this.id,
    required this.jumpUrl,
    required this.name,
    required this.type,
  });

  String cardUrl;
  Fan fan;
  int id;
  String jumpUrl;
  String name;
  int type;

  factory Decorate.fromJson(Map<String, dynamic> json) => Decorate(
        cardUrl: json["card_url"],
        fan: Fan.fromJson(json["fan"]),
        id: json["id"],
        jumpUrl: json["jump_url"],
        name: json["name"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "card_url": cardUrl,
        "fan": fan.toJson(),
        "id": id,
        "jump_url": jumpUrl,
        "name": name,
        "type": type,
      };
}

class Fan {
  Fan({
    required this.color,
    required this.isFan,
    required this.numStr,
    required this.number,
  });

  String color;
  bool isFan;
  String numStr;
  int number;

  factory Fan.fromJson(Map<String, dynamic> json) => Fan(
        color: json["color"],
        isFan: json["is_fan"],
        numStr: json["num_str"],
        number: json["number"],
      );

  Map<String, dynamic> toJson() => {
        "color": color,
        "is_fan": isFan,
        "num_str": numStr,
        "number": number,
      };
}

class OfficialVerify {
  OfficialVerify({
    required this.desc,
    required this.type,
  });

  String desc;
  int type;

  factory OfficialVerify.fromJson(Map<String, dynamic> json) => OfficialVerify(
        desc: json["desc"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "desc": desc,
        "type": type,
      };
}

class Pendant {
  Pendant({
    required this.expire,
    required this.image,
    required this.imageEnhance,
    required this.imageEnhanceFrame,
    required this.name,
    required this.pid,
  });

  int expire;
  String image;
  String imageEnhance;
  String imageEnhanceFrame;
  String name;
  int pid;

  factory Pendant.fromJson(Map<String, dynamic> json) => Pendant(
        expire: json["expire"],
        image: json["image"],
        imageEnhance: json["image_enhance"],
        imageEnhanceFrame: json["image_enhance_frame"],
        name: json["name"],
        pid: json["pid"],
      );

  Map<String, dynamic> toJson() => {
        "expire": expire,
        "image": image,
        "image_enhance": imageEnhance,
        "image_enhance_frame": imageEnhanceFrame,
        "name": name,
        "pid": pid,
      };
}

class Vip {
  Vip({
    required this.avatarSubscript,
    required this.avatarSubscriptUrl,
    required this.dueDate,
    required this.label,
    required this.nicknameColor,
    required this.status,
    required this.themeType,
    required this.type,
  });

  int avatarSubscript;
  String avatarSubscriptUrl;
  int dueDate;
  LabelClass label;
  String nicknameColor;
  int status;
  int themeType;
  int type;

  factory Vip.fromJson(Map<String, dynamic> json) => Vip(
        avatarSubscript: json["avatar_subscript"],
        avatarSubscriptUrl: json["avatar_subscript_url"],
        dueDate: json["due_date"],
        label: LabelClass.fromJson(json["label"]),
        nicknameColor: json["nickname_color"],
        status: json["status"],
        themeType: json["theme_type"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "avatar_subscript": avatarSubscript,
        "avatar_subscript_url": avatarSubscriptUrl,
        "due_date": dueDate,
        "label": label.toJson(),
        "nickname_color": nicknameColor,
        "status": status,
        "theme_type": themeType,
        "type": type,
      };
}

class LabelClass {
  LabelClass({
    required this.bgColor,
    required this.bgStyle,
    required this.borderColor,
    required this.imgLabelUriHans,
    required this.imgLabelUriHansStatic,
    required this.imgLabelUriHant,
    required this.imgLabelUriHantStatic,
    required this.labelTheme,
    required this.path,
    required this.text,
    required this.textColor,
    required this.useImgLabel,
  });

  String bgColor;
  int bgStyle;
  String borderColor;
  String imgLabelUriHans;
  String imgLabelUriHansStatic;
  String imgLabelUriHant;
  String imgLabelUriHantStatic;
  String labelTheme;
  String path;
  String text;
  String textColor;
  bool useImgLabel;

  factory LabelClass.fromJson(Map<String, dynamic> json) => LabelClass(
        bgColor: json["bg_color"],
        bgStyle: json["bg_style"],
        borderColor: json["border_color"],
        imgLabelUriHans: json["img_label_uri_hans"],
        imgLabelUriHansStatic: json["img_label_uri_hans_static"],
        imgLabelUriHant: json["img_label_uri_hant"],
        imgLabelUriHantStatic: json["img_label_uri_hant_static"],
        labelTheme: json["label_theme"],
        path: json["path"],
        text: json["text"],
        textColor: json["text_color"],
        useImgLabel: json["use_img_label"],
      );

  Map<String, dynamic> toJson() => {
        "bg_color": bgColor,
        "bg_style": bgStyle,
        "border_color": borderColor,
        "img_label_uri_hans": imgLabelUriHans,
        "img_label_uri_hans_static": imgLabelUriHansStatic,
        "img_label_uri_hant": imgLabelUriHant,
        "img_label_uri_hant_static": imgLabelUriHantStatic,
        "label_theme": labelTheme,
        "path": path,
        "text": text,
        "text_color": textColor,
        "use_img_label": useImgLabel,
      };
}

class PurpleModuleDynamic {
  PurpleModuleDynamic({
    required this.additional,
    required this.desc,
    required this.major,
    required this.topic,
  });

  Additional? additional;
  ItemDesc? desc;
  PurpleMajor? major;
  dynamic topic;

  factory PurpleModuleDynamic.fromJson(Map<String, dynamic> json) =>
      PurpleModuleDynamic(
        additional: json["additional"] == null
            ? null
            : Additional.fromJson(json["additional"]),
        desc: json["desc"] == null ? null : ItemDesc.fromJson(json["desc"]),
        major:
            json["major"] == null ? null : PurpleMajor.fromJson(json["major"]),
        topic: json["topic"],
      );

  Map<String, dynamic> toJson() => {
        "additional": additional == null ? null : additional!.toJson(),
        "desc": desc == null ? null : desc!.toJson(),
        "major": major == null ? null : major!.toJson(),
        "topic": topic,
      };
}

class Additional {
  Additional({
    required this.common,
    required this.type,
  });

  Common common;
  String type;

  factory Additional.fromJson(Map<String, dynamic> json) => Additional(
        common: Common.fromJson(json["common"]),
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "common": common.toJson(),
        "type": type,
      };
}

class Common {
  Common({
    required this.button,
    required this.cover,
    required this.desc1,
    required this.desc2,
    required this.headText,
    required this.idStr,
    required this.jumpUrl,
    required this.style,
    required this.subType,
    required this.title,
  });

  Button button;
  String cover;
  String desc1;
  String desc2;
  String headText;
  String idStr;
  String jumpUrl;
  int style;
  String subType;
  String title;

  factory Common.fromJson(Map<String, dynamic> json) => Common(
        button: Button.fromJson(json["button"]),
        cover: json["cover"],
        desc1: json["desc1"],
        desc2: json["desc2"],
        headText: json["head_text"],
        idStr: json["id_str"],
        jumpUrl: json["jump_url"],
        style: json["style"],
        subType: json["sub_type"],
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "button": button.toJson(),
        "cover": cover,
        "desc1": desc1,
        "desc2": desc2,
        "head_text": headText,
        "id_str": idStr,
        "jump_url": jumpUrl,
        "style": style,
        "sub_type": subType,
        "title": title,
      };
}

class Button {
  Button({
    required this.jumpStyle,
    required this.jumpUrl,
    required this.type,
  });

  JumpStyle jumpStyle;
  String jumpUrl;
  int type;

  factory Button.fromJson(Map<String, dynamic> json) => Button(
        jumpStyle: JumpStyle.fromJson(json["jump_style"]),
        jumpUrl: json["jump_url"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "jump_style": jumpStyle.toJson(),
        "jump_url": jumpUrl,
        "type": type,
      };
}

class JumpStyle {
  JumpStyle({
    required this.iconUrl,
    required this.text,
  });

  String iconUrl;
  String text;

  factory JumpStyle.fromJson(Map<String, dynamic> json) => JumpStyle(
        iconUrl: json["icon_url"],
        text: json["text"],
      );

  Map<String, dynamic> toJson() => {
        "icon_url": iconUrl,
        "text": text,
      };
}

class ItemDesc {
  ItemDesc({
    required this.richTextNodes,
    required this.text,
  });

  List<PurpleRichTextNode> richTextNodes;
  String text;

  factory ItemDesc.fromJson(Map<String, dynamic> json) => ItemDesc(
        richTextNodes: List<PurpleRichTextNode>.from(
            json["rich_text_nodes"].map((x) => PurpleRichTextNode.fromJson(x))),
        text: json["text"],
      );

  Map<String, dynamic> toJson() => {
        "rich_text_nodes":
            List<dynamic>.from(richTextNodes.map((x) => x.toJson())),
        "text": text,
      };
}

class PurpleRichTextNode {
  PurpleRichTextNode({
    required this.origText,
    required this.text,
    required this.type,
    required this.rid,
    required this.jumpUrl,
    required this.emoji,
  });

  String origText;
  String text;
  String type;
  String? rid;
  String? jumpUrl;
  Emoji? emoji;

  factory PurpleRichTextNode.fromJson(Map<String, dynamic> json) =>
      PurpleRichTextNode(
        origText: json["orig_text"],
        text: json["text"],
        type: json["type"],
        rid: json["rid"],
        jumpUrl: json["jump_url"],
        emoji: json["emoji"] == null ? null : Emoji.fromJson(json["emoji"]),
      );

  Map<String, dynamic> toJson() => {
        "orig_text": origText,
        "text": text,
        "type": type,
        "rid": rid,
        "jump_url": jumpUrl,
        "emoji": emoji == null ? null : emoji!.toJson(),
      };
}

class Emoji {
  Emoji({
    required this.iconUrl,
    required this.size,
    required this.text,
    required this.type,
  });

  String iconUrl;
  int size;
  String text;
  int type;

  factory Emoji.fromJson(Map<String, dynamic> json) => Emoji(
        iconUrl: json["icon_url"],
        size: json["size"],
        text: json["text"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "icon_url": iconUrl,
        "size": size,
        "text": text,
        "type": type,
      };
}

class PurpleMajor {
  PurpleMajor({
    required this.archive,
    required this.type,
    required this.liveRcmd,
    required this.draw,
    required this.pgc,
  });

  Archive? archive;
  String type;
  LiveRcmd? liveRcmd;
  Draw? draw;
  Pgc? pgc;

  factory PurpleMajor.fromJson(Map<String, dynamic> json) => PurpleMajor(
        archive:
            json["archive"] == null ? null : Archive.fromJson(json["archive"]),
        type: json["type"],
        liveRcmd: json["live_rcmd"] == null
            ? null
            : LiveRcmd.fromJson(json["live_rcmd"]),
        draw: json["draw"] == null ? null : Draw.fromJson(json["draw"]),
        pgc: json["pgc"] == null ? null : Pgc.fromJson(json["pgc"]),
      );

  Map<String, dynamic> toJson() => {
        "archive": archive == null ? null : archive!.toJson(),
        "type": type,
        "live_rcmd": liveRcmd == null ? null : liveRcmd!.toJson(),
        "draw": draw == null ? null : draw!.toJson(),
        "pgc": pgc == null ? null : pgc!.toJson(),
      };
}

class Archive {
  Archive({
    required this.aid,
    required this.badge,
    required this.bvid,
    required this.cover,
    required this.desc,
    required this.disablePreview,
    required this.durationText,
    required this.jumpUrl,
    required this.stat,
    required this.title,
    required this.type,
  });

  String aid;
  Badge badge;
  String bvid;
  String cover;
  String desc;
  int disablePreview;
  String durationText;
  String jumpUrl;
  Stat stat;
  String title;
  int type;

  factory Archive.fromJson(Map<String, dynamic> json) => Archive(
        aid: json["aid"],
        badge: Badge.fromJson(json["badge"]),
        bvid: json["bvid"],
        cover: json["cover"],
        desc: json["desc"],
        disablePreview: json["disable_preview"],
        durationText: json["duration_text"],
        jumpUrl: json["jump_url"],
        stat: Stat.fromJson(json["stat"]),
        title: json["title"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "aid": aid,
        "badge": badge.toJson(),
        "bvid": bvid,
        "cover": cover,
        "desc": desc,
        "disable_preview": disablePreview,
        "duration_text": durationText,
        "jump_url": jumpUrl,
        "stat": stat.toJson(),
        "title": title,
        "type": type,
      };
}

class Badge {
  Badge({
    required this.bgColor,
    required this.color,
    required this.text,
  });

  String bgColor;
  String color;
  String text;

  factory Badge.fromJson(Map<String, dynamic> json) => Badge(
        bgColor: json["bg_color"],
        color: json["color"],
        text: json["text"],
      );

  Map<String, dynamic> toJson() => {
        "bg_color": bgColor,
        "color": color,
        "text": text,
      };
}

class Stat {
  Stat({
    required this.danmaku,
    required this.play,
  });

  String danmaku;
  String play;

  factory Stat.fromJson(Map<String, dynamic> json) => Stat(
        danmaku: json["danmaku"],
        play: json["play"],
      );

  Map<String, dynamic> toJson() => {
        "danmaku": danmaku,
        "play": play,
      };
}

class Draw {
  Draw({
    required this.id,
    required this.items,
  });

  int id;
  List<DrawItem> items;

  factory Draw.fromJson(Map<String, dynamic> json) => Draw(
        id: json["id"],
        items:
            List<DrawItem>.from(json["items"].map((x) => DrawItem.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
      };
}

class DrawItem {
  DrawItem({
    required this.height,
    required this.size,
    required this.src,
    required this.tags,
    required this.width,
  });

  int height;
  double size;
  String src;
  List<dynamic> tags;
  int width;

  factory DrawItem.fromJson(Map<String, dynamic> json) => DrawItem(
        height: json["height"],
        size: json["size"].toDouble(),
        src: json["src"],
        tags: List<dynamic>.from(json["tags"].map((x) => x)),
        width: json["width"],
      );

  Map<String, dynamic> toJson() => {
        "height": height,
        "size": size,
        "src": src,
        "tags": List<dynamic>.from(tags.map((x) => x)),
        "width": width,
      };
}

class LiveRcmd {
  LiveRcmd({
    required this.content,
    required this.reserveType,
  });

  String content;
  int reserveType;

  factory LiveRcmd.fromJson(Map<String, dynamic> json) => LiveRcmd(
        content: json["content"],
        reserveType: json["reserve_type"],
      );

  Map<String, dynamic> toJson() => {
        "content": content,
        "reserve_type": reserveType,
      };
}

class Pgc {
  Pgc({
    required this.badge,
    required this.cover,
    required this.epid,
    required this.jumpUrl,
    required this.seasonId,
    required this.stat,
    required this.subType,
    required this.title,
    required this.type,
  });

  Badge badge;
  String cover;
  int epid;
  String jumpUrl;
  int seasonId;
  Stat stat;
  int subType;
  String title;
  int type;

  factory Pgc.fromJson(Map<String, dynamic> json) => Pgc(
        badge: Badge.fromJson(json["badge"]),
        cover: json["cover"],
        epid: json["epid"],
        jumpUrl: json["jump_url"],
        seasonId: json["season_id"],
        stat: Stat.fromJson(json["stat"]),
        subType: json["sub_type"],
        title: json["title"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "badge": badge.toJson(),
        "cover": cover,
        "epid": epid,
        "jump_url": jumpUrl,
        "season_id": seasonId,
        "stat": stat.toJson(),
        "sub_type": subType,
        "title": title,
        "type": type,
      };
}

class ModuleInteraction {
  ModuleInteraction({
    required this.items,
  });

  List<ModuleInteractionItem> items;

  factory ModuleInteraction.fromJson(Map<String, dynamic> json) =>
      ModuleInteraction(
        items: List<ModuleInteractionItem>.from(
            json["items"].map((x) => ModuleInteractionItem.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
      };
}

class ModuleInteractionItem {
  ModuleInteractionItem({
    required this.desc,
    required this.type,
  });

  ItemDesc desc;
  int type;

  factory ModuleInteractionItem.fromJson(Map<String, dynamic> json) =>
      ModuleInteractionItem(
        desc: ItemDesc.fromJson(json["desc"]),
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "desc": desc.toJson(),
        "type": type,
      };
}

class ModuleMore {
  ModuleMore({
    required this.threePointItems,
  });

  List<ThreePointItem> threePointItems;

  factory ModuleMore.fromJson(Map<String, dynamic> json) => ModuleMore(
        threePointItems: List<ThreePointItem>.from(
            json["three_point_items"].map((x) => ThreePointItem.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "three_point_items":
            List<dynamic>.from(threePointItems.map((x) => x.toJson())),
      };
}

class ThreePointItem {
  ThreePointItem({
    required this.label,
    required this.type,
  });

  String label;
  String type;

  factory ThreePointItem.fromJson(Map<String, dynamic> json) => ThreePointItem(
        label: json["label"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "label": label,
        "type": type,
      };
}

class ModuleStat {
  ModuleStat({
    required this.comment,
    required this.forward,
    required this.like,
  });

  Comment comment;
  Forward forward;
  Like like;

  factory ModuleStat.fromJson(Map<String, dynamic> json) => ModuleStat(
        comment: Comment.fromJson(json["comment"]),
        forward: Forward.fromJson(json["forward"]),
        like: Like.fromJson(json["like"]),
      );

  Map<String, dynamic> toJson() => {
        "comment": comment.toJson(),
        "forward": forward.toJson(),
        "like": like.toJson(),
      };
}

class Comment {
  Comment({
    required this.count,
    required this.forbidden,
    required this.hidden,
  });

  int count;
  bool forbidden;
  bool? hidden;

  factory Comment.fromJson(Map<String, dynamic> json) => Comment(
        count: json["count"],
        forbidden: json["forbidden"],
        hidden: json["hidden"],
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "forbidden": forbidden,
        "hidden": hidden,
      };
}

class Forward {
  Forward({
    required this.count,
    required this.forbidden,
  });

  int count;
  bool forbidden;

  factory Forward.fromJson(Map<String, dynamic> json) => Forward(
        count: json["count"],
        forbidden: json["forbidden"],
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "forbidden": forbidden,
      };
}

class Like {
  Like({
    required this.count,
    required this.forbidden,
    required this.status,
  });

  int count;
  bool forbidden;
  bool status;

  factory Like.fromJson(Map<String, dynamic> json) => Like(
        count: json["count"],
        forbidden: json["forbidden"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "forbidden": forbidden,
        "status": status,
      };
}

class Orig {
  Orig({
    required this.basic,
    required this.idStr,
    required this.modules,
    required this.type,
    required this.visible,
  });

  Basic basic;
  String idStr;
  OrigModules modules;
  String type;
  bool visible;

  factory Orig.fromJson(Map<String, dynamic> json) => Orig(
        basic: Basic.fromJson(json["basic"]),
        idStr: json["id_str"],
        modules: OrigModules.fromJson(json["modules"]),
        type: json["type"],
        visible: json["visible"],
      );

  Map<String, dynamic> toJson() => {
        "basic": basic.toJson(),
        "id_str": idStr,
        "modules": modules.toJson(),
        "type": type,
        "visible": visible,
      };
}

class OrigModules {
  OrigModules({
    required this.moduleAuthor,
    required this.moduleDynamic,
  });

  ModuleAuthor moduleAuthor;
  FluffyModuleDynamic moduleDynamic;

  factory OrigModules.fromJson(Map<String, dynamic> json) => OrigModules(
        moduleAuthor: ModuleAuthor.fromJson(json["module_author"]),
        moduleDynamic: FluffyModuleDynamic.fromJson(json["module_dynamic"]),
      );

  Map<String, dynamic> toJson() => {
        "module_author": moduleAuthor.toJson(),
        "module_dynamic": moduleDynamic.toJson(),
      };
}

class FluffyModuleDynamic {
  FluffyModuleDynamic({
    required this.additional,
    required this.desc,
    required this.major,
    required this.topic,
  });

  dynamic additional;
  PurpleDesc? desc;
  FluffyMajor major;
  Topic? topic;

  factory FluffyModuleDynamic.fromJson(Map<String, dynamic> json) =>
      FluffyModuleDynamic(
        additional: json["additional"],
        desc: json["desc"] == null ? null : PurpleDesc.fromJson(json["desc"]),
        major: FluffyMajor.fromJson(json["major"]),
        topic: json["topic"] == null ? null : Topic.fromJson(json["topic"]),
      );

  Map<String, dynamic> toJson() => {
        "additional": additional,
        "desc": desc == null ? null : desc!.toJson(),
        "major": major.toJson(),
        "topic": topic == null ? null : topic!.toJson(),
      };
}

class PurpleDesc {
  PurpleDesc({
    required this.richTextNodes,
    required this.text,
  });

  List<FluffyRichTextNode> richTextNodes;
  String text;

  factory PurpleDesc.fromJson(Map<String, dynamic> json) => PurpleDesc(
        richTextNodes: List<FluffyRichTextNode>.from(
            json["rich_text_nodes"].map((x) => FluffyRichTextNode.fromJson(x))),
        text: json["text"],
      );

  Map<String, dynamic> toJson() => {
        "rich_text_nodes":
            List<dynamic>.from(richTextNodes.map((x) => x.toJson())),
        "text": text,
      };
}

class FluffyRichTextNode {
  FluffyRichTextNode({
    required this.origText,
    required this.text,
    required this.type,
    required this.jumpUrl,
  });

  String origText;
  String text;
  String type;
  String? jumpUrl;

  factory FluffyRichTextNode.fromJson(Map<String, dynamic> json) =>
      FluffyRichTextNode(
        origText: json["orig_text"],
        text: json["text"],
        type: json["type"],
        jumpUrl: json["jump_url"],
      );

  Map<String, dynamic> toJson() => {
        "orig_text": origText,
        "text": text,
        "type": type,
        "jump_url": jumpUrl,
      };
}

class FluffyMajor {
  FluffyMajor({
    required this.archive,
    required this.type,
    required this.draw,
  });

  Archive? archive;
  String type;
  Draw? draw;

  factory FluffyMajor.fromJson(Map<String, dynamic> json) => FluffyMajor(
        archive:
            json["archive"] == null ? null : Archive.fromJson(json["archive"]),
        type: json["type"],
        draw: json["draw"] == null ? null : Draw.fromJson(json["draw"]),
      );

  Map<String, dynamic> toJson() => {
        "archive": archive == null ? null : archive!.toJson(),
        "type": type,
        "draw": draw == null ? null : draw!.toJson(),
      };
}

class Topic {
  Topic({
    required this.id,
    required this.jumpUrl,
    required this.name,
  });

  int id;
  String jumpUrl;
  String name;

  factory Topic.fromJson(Map<String, dynamic> json) => Topic(
        id: json["id"],
        jumpUrl: json["jump_url"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "jump_url": jumpUrl,
        "name": name,
      };
}
