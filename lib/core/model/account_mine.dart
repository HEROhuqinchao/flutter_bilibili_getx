// To parse this JSON data, do
//
//     final hyAccountMineModel = hyAccountMineModelFromJson(jsonString);

import 'dart:convert';

HYAccountMineModel hyAccountMineModelFromJson(String str) =>
    HYAccountMineModel.fromJson(json.decode(str));

String hyAccountMineModelToJson(HYAccountMineModel data) =>
    json.encode(data.toJson());

class HYAccountMineModel {
  HYAccountMineModel({
    required this.code,
    required this.message,
    required this.ttl,
    required this.data,
  });

  int code;
  String message;
  int ttl;
  Data data;

  factory HYAccountMineModel.fromJson(Map<String, dynamic> json) =>
      HYAccountMineModel(
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
    required this.mid,
    required this.name,
    required this.showNameGuide,
    required this.face,
    required this.showFaceGuide,
    required this.coin,
    required this.bcoin,
    required this.sex,
    required this.rank,
    required this.silence,
    required this.showVideoup,
    required this.showCreative,
    required this.level,
    required this.vipType,
    required this.audioType,
    required this.dataDynamic,
    required this.following,
    required this.follower,
    required this.newFollowers,
    required this.newFollowersRtime,
    required this.officialVerify,
    required this.vipSection,
    required this.vipSectionV2,
    required this.vipSectionRight,
    required this.vip,
    required this.mallHome,
    required this.sectionsV2,
    required this.inRegAudit,
    required this.firstLiveTime,
    required this.liveTip,
    required this.enableBiliLink,
    required this.faceNftNew,
    required this.showNftFaceGuide,
    required this.seniorGate,
  });

  int mid;
  String name;
  bool showNameGuide;
  String face;
  bool showFaceGuide;
  double coin;
  int bcoin;
  int sex;
  int rank;
  int silence;
  int showVideoup;
  int showCreative;
  int level;
  int vipType;
  int audioType;
  int dataDynamic;
  int following;
  int follower;
  int newFollowers;
  int newFollowersRtime;
  OfficialVerify officialVerify;
  VipSection vipSection;
  VipSectionV2 vipSectionV2;
  VipSectionRight vipSectionRight;
  Vip vip;
  MallHome mallHome;
  List<SectionsV2> sectionsV2;
  int inRegAudit;
  int firstLiveTime;
  LiveTip? liveTip;
  bool enableBiliLink;
  int faceNftNew;
  bool showNftFaceGuide;
  SeniorGate? seniorGate;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        mid: json["mid"],
        name: json["name"],
        showNameGuide: json["show_name_guide"],
        face: json["face"],
        showFaceGuide: json["show_face_guide"],
        coin: json["coin"].toDouble(),
        bcoin: json["bcoin"],
        sex: json["sex"],
        rank: json["rank"],
        silence: json["silence"],
        showVideoup: json["show_videoup"],
        showCreative: json["show_creative"],
        level: json["level"],
        vipType: json["vip_type"],
        audioType: json["audio_type"],
        dataDynamic: json["dynamic"],
        following: json["following"],
        follower: json["follower"],
        newFollowers: json["new_followers"],
        newFollowersRtime: json["new_followers_rtime"],
        officialVerify: OfficialVerify.fromJson(json["official_verify"]),
        vipSection: VipSection.fromJson(json["vip_section"]),
        vipSectionV2: VipSectionV2.fromJson(json["vip_section_v2"]),
        vipSectionRight: VipSectionRight.fromJson(json["vip_section_right"]),
        vip: Vip.fromJson(json["vip"]),
        mallHome: MallHome.fromJson(json["mall_home"]),
        sectionsV2: List<SectionsV2>.from(
            json["sections_v2"].map((x) => SectionsV2.fromJson(x))),
        inRegAudit: json["in_reg_audit"],
        firstLiveTime: json["first_live_time"],
        liveTip: json["live_tip"] == null
            ? null
            : LiveTip.fromJson(json["live_tip"]),
        enableBiliLink: json["enable_bili_link"],
        faceNftNew: json["face_nft_new"],
        showNftFaceGuide: json["show_nft_face_guide"],
        seniorGate: json["senior_gate"] == null
            ? null
            : SeniorGate.fromJson(json["senior_gate"]),
      );

  Map<String, dynamic> toJson() => {
        "mid": mid,
        "name": name,
        "show_name_guide": showNameGuide,
        "face": face,
        "show_face_guide": showFaceGuide,
        "coin": coin,
        "bcoin": bcoin,
        "sex": sex,
        "rank": rank,
        "silence": silence,
        "show_videoup": showVideoup,
        "show_creative": showCreative,
        "level": level,
        "vip_type": vipType,
        "audio_type": audioType,
        "dynamic": dataDynamic,
        "following": following,
        "follower": follower,
        "new_followers": newFollowers,
        "new_followers_rtime": newFollowersRtime,
        "official_verify": officialVerify.toJson(),
        "vip_section": vipSection.toJson(),
        "vip_section_v2": vipSectionV2.toJson(),
        "vip_section_right": vipSectionRight.toJson(),
        "vip": vip.toJson(),
        "mall_home": mallHome.toJson(),
        "sections_v2": List<dynamic>.from(sectionsV2.map((x) => x.toJson())),
        "in_reg_audit": inRegAudit,
        "first_live_time": firstLiveTime,
        "live_tip": liveTip!.toJson(),
        "enable_bili_link": enableBiliLink,
        "face_nft_new": faceNftNew,
        "show_nft_face_guide": showNftFaceGuide,
        "senior_gate": seniorGate!.toJson(),
      };
}

class LiveTip {
  LiveTip({
    required this.icon,
    required this.mod,
    required this.url,
    required this.text,
    required this.buttonText,
    required this.buttonIcon,
    required this.urlText,
    required this.id,
  });

  String icon;
  int mod;
  String url;
  String text;
  String buttonText;
  String buttonIcon;
  String urlText;
  int id;

  factory LiveTip.fromJson(Map<String, dynamic> json) => LiveTip(
        icon: json["icon"],
        mod: json["mod"],
        url: json["url"],
        text: json["text"],
        buttonText: json["button_text"],
        buttonIcon: json["button_icon"],
        urlText: json["url_text"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "icon": icon,
        "mod": mod,
        "url": url,
        "text": text,
        "button_text": buttonText,
        "button_icon": buttonIcon,
        "url_text": urlText,
        "id": id,
      };
}

class MallHome {
  MallHome({
    required this.icon,
    required this.uri,
    required this.title,
  });

  String icon;
  String uri;
  String title;

  factory MallHome.fromJson(Map<String, dynamic> json) => MallHome(
        icon: json["icon"],
        uri: json["uri"],
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "icon": icon,
        "uri": uri,
        "title": title,
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

class SectionsV2 {
  SectionsV2({
    required this.items,
    required this.style,
    required this.button,
    required this.type,
    required this.title,
    required this.upTitle,
  });

  List<Item> items;
  int style;
  Button button;
  int? type;
  String? title;
  String? upTitle;

  factory SectionsV2.fromJson(Map<String, dynamic> json) => SectionsV2(
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
        style: json["style"],
        button: Button.fromJson(json["button"]),
        type: json["type"] == null ? null : json["type"],
        title: json["title"] ?? "",
        upTitle: json["up_title"] == null ? null : json["up_title"],
      );

  Map<String, dynamic> toJson() => {
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
        "style": style,
        "button": button.toJson(),
        "type": type == null ? null : type,
        "title": title == null ? null : title,
        "up_title": upTitle == null ? null : upTitle,
      };
}

class Button {
  Button({
    required this.text,
    required this.url,
    required this.icon,
    required this.style,
  });

  String? text;
  String? url;
  String? icon;
  int? style;

  factory Button.fromJson(Map<String, dynamic> json) => Button(
        text: json["text"] == null ? null : json["text"],
        url: json["url"] == null ? null : json["url"],
        icon: json["icon"] == null ? null : json["icon"],
        style: json["style"] == null ? null : json["style"],
      );

  Map<String, dynamic> toJson() => {
        "text": text == null ? null : text,
        "url": url == null ? null : url,
        "icon": icon == null ? null : icon,
        "style": style == null ? null : style,
      };
}

class Item {
  Item({
    required this.id,
    required this.title,
    required this.uri,
    required this.icon,
    required this.needLogin,
    required this.commonOpItem,
    required this.globalRedDot,
    required this.display,
    required this.redDot,
    required this.redDotForNew,
  });

  int id;
  String title;
  String uri;
  String icon;
  int? needLogin;
  CommonOpItem? commonOpItem;
  int? globalRedDot;
  int? display;
  int? redDot;
  bool? redDotForNew;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        id: json["id"],
        title: json["title"],
        uri: json["uri"],
        icon: json["icon"],
        needLogin: json["need_login"] == null ? null : json["need_login"],
        commonOpItem: json["common_op_item"] == null
            ? null
            : CommonOpItem.fromJson(json["common_op_item"]),
        globalRedDot:
            json["global_red_dot"] == null ? null : json["global_red_dot"],
        display: json["display"] == null ? null : json["display"],
        redDot: json["red_dot"] == null ? null : json["red_dot"],
        redDotForNew:
            json["red_dot_for_new"] == null ? null : json["red_dot_for_new"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "uri": uri,
        "icon": icon,
        "need_login": needLogin == null ? null : needLogin,
        "common_op_item": commonOpItem == null ? null : commonOpItem!.toJson(),
        "global_red_dot": globalRedDot == null ? null : globalRedDot,
        "display": display == null ? null : display,
        "red_dot": redDot == null ? null : redDot,
        "red_dot_for_new": redDotForNew == null ? null : redDotForNew,
      };
}

class CommonOpItem {
  CommonOpItem({
    required this.title,
    required this.titleIcon,
    required this.linkType,
    required this.titleColor,
    required this.backgroundColor,
    required this.linkContainerColor,
  });

  String? title;
  String? titleIcon;
  int? linkType;
  String? titleColor;
  String? backgroundColor;
  String? linkContainerColor;

  factory CommonOpItem.fromJson(Map<String, dynamic> json) => CommonOpItem(
        title: json["title"] == null ? null : json["title"],
        titleIcon: json["title_icon"] == null ? null : json["title_icon"],
        linkType: json["link_type"] == null ? null : json["link_type"],
        titleColor: json["title_color"] == null ? null : json["title_color"],
        backgroundColor:
            json["background_color"] == null ? null : json["background_color"],
        linkContainerColor: json["link_container_color"] == null
            ? null
            : json["link_container_color"],
      );

  Map<String, dynamic> toJson() => {
        "title": title == null ? null : title,
        "title_icon": titleIcon == null ? null : titleIcon,
        "link_type": linkType == null ? null : linkType,
        "title_color": titleColor == null ? null : titleColor,
        "background_color": backgroundColor == null ? null : backgroundColor,
        "link_container_color":
            linkContainerColor == null ? null : linkContainerColor,
      };
}

class SeniorGate {
  SeniorGate({
    required this.memberText,
  });

  String memberText;

  factory SeniorGate.fromJson(Map<String, dynamic> json) => SeniorGate(
        memberText: json["member_text"],
      );

  Map<String, dynamic> toJson() => {
        "member_text": memberText,
      };
}

class Vip {
  Vip({
    required this.type,
    required this.status,
    required this.dueDate,
    required this.vipPayType,
    required this.vipThemeType,
    required this.themeType,
    required this.label,
    required this.avatarSubscript,
    required this.nicknameColor,
    required this.role,
    required this.avatarSubscriptUrl,
  });

  int type;
  int status;
  int dueDate;
  int vipPayType;
  int vipThemeType;
  int themeType;
  Label label;
  int avatarSubscript;
  String nicknameColor;
  int role;
  String avatarSubscriptUrl;

  factory Vip.fromJson(Map<String, dynamic> json) => Vip(
        type: json["type"],
        status: json["status"],
        dueDate: json["due_date"],
        vipPayType: json["vip_pay_type"],
        vipThemeType: json["theme_type"],
        themeType: json["themeType"],
        label: Label.fromJson(json["label"]),
        avatarSubscript: json["avatar_subscript"],
        nicknameColor: json["nickname_color"],
        role: json["role"],
        avatarSubscriptUrl: json["avatar_subscript_url"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "status": status,
        "due_date": dueDate,
        "vip_pay_type": vipPayType,
        "theme_type": vipThemeType,
        "themeType": themeType,
        "label": label.toJson(),
        "avatar_subscript": avatarSubscript,
        "nickname_color": nicknameColor,
        "role": role,
        "avatar_subscript_url": avatarSubscriptUrl,
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
    required this.image,
  });

  String path;
  String text;
  String labelTheme;
  String textColor;
  int bgStyle;
  String bgColor;
  String borderColor;
  String image;

  factory Label.fromJson(Map<String, dynamic> json) => Label(
        path: json["path"],
        text: json["text"],
        labelTheme: json["label_theme"],
        textColor: json["text_color"],
        bgStyle: json["bg_style"],
        bgColor: json["bg_color"],
        borderColor: json["border_color"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "path": path,
        "text": text,
        "label_theme": labelTheme,
        "text_color": textColor,
        "bg_style": bgStyle,
        "bg_color": bgColor,
        "border_color": borderColor,
        "image": image,
      };
}

class VipSection {
  VipSection({
    required this.title,
    required this.url,
    required this.startTime,
    required this.endTime,
  });

  String title;
  String url;
  int startTime;
  int endTime;

  factory VipSection.fromJson(Map<String, dynamic> json) => VipSection(
        title: json["title"],
        url: json["url"],
        startTime: json["start_time"],
        endTime: json["end_time"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "url": url,
        "start_time": startTime,
        "end_time": endTime,
      };
}

class VipSectionRight {
  VipSectionRight({
    required this.id,
  });

  int id;

  factory VipSectionRight.fromJson(Map<String, dynamic> json) =>
      VipSectionRight(
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
      };
}

class VipSectionV2 {
  VipSectionV2({
    required this.id,
    required this.title,
    required this.desc,
    required this.url,
  });

  int id;
  String title;
  String desc;
  String url;

  factory VipSectionV2.fromJson(Map<String, dynamic> json) => VipSectionV2(
        id: json["id"],
        title: json["title"],
        desc: json["desc"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "desc": desc,
        "url": url,
      };
}
