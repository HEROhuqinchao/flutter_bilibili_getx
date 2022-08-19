// To parse this JSON data, do
//
//     final hySpaceAccInfoModel = hySpaceAccInfoModelFromJson(jsonString);

import 'dart:convert';

HYSpaceAccInfoModel hySpaceAccInfoModelFromJson(String str) =>
    HYSpaceAccInfoModel.fromJson(json.decode(str));

String hySpaceAccInfoModelToJson(HYSpaceAccInfoModel data) =>
    json.encode(data.toJson());

class HYSpaceAccInfoModel {
  HYSpaceAccInfoModel({
    required this.mid,
    required this.name,
    required this.sex,
    required this.face,
    required this.faceNft,
    required this.faceNftType,
    required this.sign,
    required this.rank,
    required this.level,
    required this.jointime,
    required this.moral,
    required this.silence,
    required this.coins,
    required this.fansBadge,
    required this.fansMedal,
    required this.official,
    required this.vip,
    required this.pendant,
    required this.nameplate,
    required this.userHonourInfo,
    required this.isFollowed,
    required this.topPhoto,
    required this.theme,
    required this.sysNotice,
    required this.liveRoom,
    required this.birthday,
    required this.school,
    required this.profession,
    required this.tags,
    required this.series,
    required this.isSeniorMember,
  });

  int mid;
  String name;
  String sex;
  String face;
  int faceNft;
  int faceNftType;
  String sign;
  int rank;
  int level;
  int jointime;
  int moral;
  int silence;
  int coins;
  bool fansBadge;
  FansMedal fansMedal;
  Official official;
  Vip vip;
  Pendant pendant;
  Nameplate nameplate;
  UserHonourInfo userHonourInfo;
  bool isFollowed;
  String topPhoto;
  SysNotice theme;
  SysNotice sysNotice;
  LiveRoom liveRoom;
  String birthday;
  School school;
  Profession profession;
  dynamic tags;
  Series series;
  int isSeniorMember;

  factory HYSpaceAccInfoModel.fromJson(Map<String, dynamic> json) =>
      HYSpaceAccInfoModel(
        mid: json["mid"],
        name: json["name"],
        sex: json["sex"],
        face: json["face"],
        faceNft: json["face_nft"],
        faceNftType: json["face_nft_type"],
        sign: json["sign"],
        rank: json["rank"],
        level: json["level"],
        jointime: json["jointime"],
        moral: json["moral"],
        silence: json["silence"],
        coins: json["coins"],
        fansBadge: json["fans_badge"],
        fansMedal: FansMedal.fromJson(json["fans_medal"]),
        official: Official.fromJson(json["official"]),
        vip: Vip.fromJson(json["vip"]),
        pendant: Pendant.fromJson(json["pendant"]),
        nameplate: Nameplate.fromJson(json["nameplate"]),
        userHonourInfo: UserHonourInfo.fromJson(json["user_honour_info"]),
        isFollowed: json["is_followed"],
        topPhoto: json["top_photo"],
        theme: SysNotice.fromJson(json["theme"]),
        sysNotice: SysNotice.fromJson(json["sys_notice"]),
        liveRoom: LiveRoom.fromJson(json["live_room"]),
        birthday: json["birthday"],
        school: School.fromJson(json["school"]),
        profession: Profession.fromJson(json["profession"]),
        tags: json["tags"],
        series: Series.fromJson(json["series"]),
        isSeniorMember: json["is_senior_member"],
      );

  Map<String, dynamic> toJson() => {
        "mid": mid,
        "name": name,
        "sex": sex,
        "face": face,
        "face_nft": faceNft,
        "face_nft_type": faceNftType,
        "sign": sign,
        "rank": rank,
        "level": level,
        "jointime": jointime,
        "moral": moral,
        "silence": silence,
        "coins": coins,
        "fans_badge": fansBadge,
        "fans_medal": fansMedal.toJson(),
        "official": official.toJson(),
        "vip": vip.toJson(),
        "pendant": pendant.toJson(),
        "nameplate": nameplate.toJson(),
        "user_honour_info": userHonourInfo.toJson(),
        "is_followed": isFollowed,
        "top_photo": topPhoto,
        "theme": theme.toJson(),
        "sys_notice": sysNotice.toJson(),
        "live_room": liveRoom.toJson(),
        "birthday": birthday,
        "school": school.toJson(),
        "profession": profession.toJson(),
        "tags": tags,
        "series": series.toJson(),
        "is_senior_member": isSeniorMember,
      };
}

class FansMedal {
  FansMedal({
    required this.show,
    required this.wear,
    required this.medal,
  });

  bool show;
  bool wear;
  Medal medal;

  factory FansMedal.fromJson(Map<String, dynamic> json) => FansMedal(
        show: json["show"],
        wear: json["wear"],
        medal: Medal.fromJson(json["medal"]),
      );

  Map<String, dynamic> toJson() => {
        "show": show,
        "wear": wear,
        "medal": medal.toJson(),
      };
}

class Medal {
  Medal({
    required this.uid,
    required this.targetId,
    required this.medalId,
    required this.level,
    required this.medalName,
    required this.medalColor,
    required this.intimacy,
    required this.nextIntimacy,
    required this.dayLimit,
    required this.medalColorStart,
    required this.medalColorEnd,
    required this.medalColorBorder,
    required this.isLighted,
    required this.lightStatus,
    required this.wearingStatus,
    required this.score,
  });

  int uid;
  int targetId;
  int medalId;
  int level;
  String medalName;
  int medalColor;
  int intimacy;
  int nextIntimacy;
  int dayLimit;
  int medalColorStart;
  int medalColorEnd;
  int medalColorBorder;
  int isLighted;
  int lightStatus;
  int wearingStatus;
  int score;

  factory Medal.fromJson(Map<String, dynamic> json) => Medal(
        uid: json["uid"],
        targetId: json["target_id"],
        medalId: json["medal_id"],
        level: json["level"],
        medalName: json["medal_name"],
        medalColor: json["medal_color"],
        intimacy: json["intimacy"],
        nextIntimacy: json["next_intimacy"],
        dayLimit: json["day_limit"],
        medalColorStart: json["medal_color_start"],
        medalColorEnd: json["medal_color_end"],
        medalColorBorder: json["medal_color_border"],
        isLighted: json["is_lighted"],
        lightStatus: json["light_status"],
        wearingStatus: json["wearing_status"],
        score: json["score"],
      );

  Map<String, dynamic> toJson() => {
        "uid": uid,
        "target_id": targetId,
        "medal_id": medalId,
        "level": level,
        "medal_name": medalName,
        "medal_color": medalColor,
        "intimacy": intimacy,
        "next_intimacy": nextIntimacy,
        "day_limit": dayLimit,
        "medal_color_start": medalColorStart,
        "medal_color_end": medalColorEnd,
        "medal_color_border": medalColorBorder,
        "is_lighted": isLighted,
        "light_status": lightStatus,
        "wearing_status": wearingStatus,
        "score": score,
      };
}

class LiveRoom {
  LiveRoom({
    required this.roomStatus,
    required this.liveStatus,
    required this.url,
    required this.title,
    required this.cover,
    required this.roomid,
    required this.roundStatus,
    required this.broadcastType,
    required this.watchedShow,
  });

  int roomStatus;
  int liveStatus;
  String url;
  String title;
  String cover;
  int roomid;
  int roundStatus;
  int broadcastType;
  WatchedShow watchedShow;

  factory LiveRoom.fromJson(Map<String, dynamic> json) => LiveRoom(
        roomStatus: json["roomStatus"],
        liveStatus: json["liveStatus"],
        url: json["url"],
        title: json["title"],
        cover: json["cover"],
        roomid: json["roomid"],
        roundStatus: json["roundStatus"],
        broadcastType: json["broadcast_type"],
        watchedShow: WatchedShow.fromJson(json["watched_show"]),
      );

  Map<String, dynamic> toJson() => {
        "roomStatus": roomStatus,
        "liveStatus": liveStatus,
        "url": url,
        "title": title,
        "cover": cover,
        "roomid": roomid,
        "roundStatus": roundStatus,
        "broadcast_type": broadcastType,
        "watched_show": watchedShow.toJson(),
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
  String iconLocation;
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

class Nameplate {
  Nameplate({
    required this.nid,
    required this.name,
    required this.image,
    required this.imageSmall,
    required this.level,
    required this.condition,
  });

  int nid;
  String name;
  String image;
  String imageSmall;
  String level;
  String condition;

  factory Nameplate.fromJson(Map<String, dynamic> json) => Nameplate(
        nid: json["nid"],
        name: json["name"],
        image: json["image"],
        imageSmall: json["image_small"],
        level: json["level"],
        condition: json["condition"],
      );

  Map<String, dynamic> toJson() => {
        "nid": nid,
        "name": name,
        "image": image,
        "image_small": imageSmall,
        "level": level,
        "condition": condition,
      };
}

class Official {
  Official({
    required this.role,
    required this.title,
    required this.desc,
    required this.type,
  });

  int role;
  String title;
  String desc;
  int type;

  factory Official.fromJson(Map<String, dynamic> json) => Official(
        role: json["role"],
        title: json["title"],
        desc: json["desc"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "role": role,
        "title": title,
        "desc": desc,
        "type": type,
      };
}

class Pendant {
  Pendant({
    required this.pid,
    required this.name,
    required this.image,
    required this.expire,
    required this.imageEnhance,
    required this.imageEnhanceFrame,
  });

  int pid;
  String name;
  String image;
  int expire;
  String imageEnhance;
  String imageEnhanceFrame;

  factory Pendant.fromJson(Map<String, dynamic> json) => Pendant(
        pid: json["pid"],
        name: json["name"],
        image: json["image"],
        expire: json["expire"],
        imageEnhance: json["image_enhance"],
        imageEnhanceFrame: json["image_enhance_frame"],
      );

  Map<String, dynamic> toJson() => {
        "pid": pid,
        "name": name,
        "image": image,
        "expire": expire,
        "image_enhance": imageEnhance,
        "image_enhance_frame": imageEnhanceFrame,
      };
}

class Profession {
  Profession({
    required this.name,
    required this.department,
    required this.title,
    required this.isShow,
  });

  String name;
  String department;
  String title;
  int isShow;

  factory Profession.fromJson(Map<String, dynamic> json) => Profession(
        name: json["name"],
        department: json["department"],
        title: json["title"],
        isShow: json["is_show"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "department": department,
        "title": title,
        "is_show": isShow,
      };
}

class School {
  School({
    required this.name,
  });

  String name;

  factory School.fromJson(Map<String, dynamic> json) => School(
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
      };
}

class Series {
  Series({
    required this.userUpgradeStatus,
    required this.showUpgradeWindow,
  });

  int userUpgradeStatus;
  bool showUpgradeWindow;

  factory Series.fromJson(Map<String, dynamic> json) => Series(
        userUpgradeStatus: json["user_upgrade_status"],
        showUpgradeWindow: json["show_upgrade_window"],
      );

  Map<String, dynamic> toJson() => {
        "user_upgrade_status": userUpgradeStatus,
        "show_upgrade_window": showUpgradeWindow,
      };
}

class SysNotice {
  SysNotice();

  factory SysNotice.fromJson(Map<String, dynamic> json) => SysNotice();

  Map<String, dynamic> toJson() => {};
}

class UserHonourInfo {
  UserHonourInfo({
    required this.mid,
    required this.colour,
    required this.tags,
  });

  int mid;
  dynamic colour;
  List<dynamic> tags;

  factory UserHonourInfo.fromJson(Map<String, dynamic> json) => UserHonourInfo(
        mid: json["mid"],
        colour: json["colour"],
        tags: List<dynamic>.from(json["tags"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "mid": mid,
        "colour": colour,
        "tags": List<dynamic>.from(tags.map((x) => x)),
      };
}

class Vip {
  Vip({
    required this.type,
    required this.status,
    required this.dueDate,
    required this.vipPayType,
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
        themeType: json["theme_type"],
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
        "theme_type": themeType,
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
  });

  String path;
  String text;
  String labelTheme;
  String textColor;
  int bgStyle;
  String bgColor;
  String borderColor;

  factory Label.fromJson(Map<String, dynamic> json) => Label(
        path: json["path"],
        text: json["text"],
        labelTheme: json["label_theme"],
        textColor: json["text_color"],
        bgStyle: json["bg_style"],
        bgColor: json["bg_color"],
        borderColor: json["border_color"],
      );

  Map<String, dynamic> toJson() => {
        "path": path,
        "text": text,
        "label_theme": labelTheme,
        "text_color": textColor,
        "bg_style": bgStyle,
        "bg_color": bgColor,
        "border_color": borderColor,
      };
}
