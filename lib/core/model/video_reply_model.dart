// To parse this JSON data, do
//
//     final hyVideoReplyModel = hyVideoReplyModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

HYVideoReplyModel hyVideoReplyModelFromJson(String str) =>
    HYVideoReplyModel.fromJson(json.decode(str));

String hyVideoReplyModelToJson(HYVideoReplyModel data) =>
    json.encode(data.toJson());

class HYVideoReplyModel {
  HYVideoReplyModel({
    required this.cursor,
    required this.hots,
    required this.notice,
    required this.replies,
    required this.top,
    required this.topReplies,
    required this.folder,
    required this.upSelection,
    required this.cm,
    required this.cmInfo,
    required this.effects,
    required this.assist,
    required this.blacklist,
    required this.vote,
    required this.config,
    required this.upper,
    required this.control,
    required this.note,
    required this.callbacks,
  });

  Cursor cursor;
  dynamic hots;
  dynamic notice;
  List<HYVideoReplyModelReply> replies;
  Top top;
  List<UpperElement>? topReplies;
  Folder folder;
  UpSelection upSelection;
  Cm cm;
  CmInfo cmInfo;
  Effects effects;
  int assist;
  int blacklist;
  int vote;
  Config config;
  PurpleUpper upper;
  Control control;
  int note;
  dynamic callbacks;

  factory HYVideoReplyModel.fromJson(Map<String, dynamic> json) =>
      HYVideoReplyModel(
        cursor: Cursor.fromJson(json["cursor"]),
        hots: json["hots"],
        notice: json["notice"],
        replies: List<HYVideoReplyModelReply>.from(
            json["replies"].map((x) => HYVideoReplyModelReply.fromJson(x))),
        top: Top.fromJson(json["top"]),
        topReplies: json["top_replies"] == null
            ? null
            : List<UpperElement>.from(
                json["top_replies"].map((x) => UpperElement.fromJson(x))),
        folder: Folder.fromJson(json["folder"]),
        upSelection: UpSelection.fromJson(json["up_selection"]),
        cm: Cm.fromJson(json["cm"]),
        cmInfo: CmInfo.fromJson(json["cm_info"]),
        effects: Effects.fromJson(json["effects"]),
        assist: json["assist"],
        blacklist: json["blacklist"],
        vote: json["vote"],
        config: Config.fromJson(json["config"]),
        upper: PurpleUpper.fromJson(json["upper"]),
        control: Control.fromJson(json["control"]),
        note: json["note"],
        callbacks: json["callbacks"],
      );

  Map<String, dynamic> toJson() => {
        "cursor": cursor.toJson(),
        "hots": hots,
        "notice": notice,
        "replies": List<dynamic>.from(replies.map((x) => x.toJson())),
        "top": top.toJson(),
    // "top_replies": List<dynamic>.from(topReplies.map((x) => x.toJson())),
        "folder": folder.toJson(),
        "up_selection": upSelection.toJson(),
        "cm": cm.toJson(),
        "cm_info": cmInfo.toJson(),
        "effects": effects.toJson(),
        "assist": assist,
        "blacklist": blacklist,
        "vote": vote,
        "config": config.toJson(),
        "upper": upper.toJson(),
        "control": control.toJson(),
        "note": note,
        "callbacks": callbacks,
      };
}

class Cm {
  Cm();

  factory Cm.fromJson(Map<String, dynamic> json) => Cm();

  Map<String, dynamic> toJson() => {};
}

class CmInfo {
  CmInfo({
    required this.ads,
  });

  dynamic ads;

  factory CmInfo.fromJson(Map<String, dynamic> json) => CmInfo(
        ads: json["ads"],
      );

  Map<String, dynamic> toJson() => {
        "ads": ads,
      };
}

class Config {
  Config({
    required this.showtopic,
    required this.showUpFlag,
    required this.readOnly,
  });

  int showtopic;
  bool showUpFlag;
  bool readOnly;

  factory Config.fromJson(Map<String, dynamic> json) => Config(
        showtopic: json["showtopic"],
        showUpFlag: json["show_up_flag"],
        readOnly: json["read_only"],
      );

  Map<String, dynamic> toJson() => {
        "showtopic": showtopic,
        "show_up_flag": showUpFlag,
        "read_only": readOnly,
      };
}

class Control {
  Control({
    required this.inputDisable,
    required this.rootInputText,
    required this.childInputText,
    required this.giveupInputText,
    required this.bgText,
    required this.webSelection,
    required this.answerGuideText,
    required this.answerGuideIconUrl,
    required this.answerGuideIosUrl,
    required this.answerGuideAndroidUrl,
    required this.showType,
    required this.showText,
    required this.disableJumpEmote,
  });

  bool inputDisable;
  String rootInputText;
  String childInputText;
  String giveupInputText;
  String bgText;
  bool webSelection;
  String answerGuideText;
  String answerGuideIconUrl;
  String answerGuideIosUrl;
  String answerGuideAndroidUrl;
  int showType;
  String showText;
  bool disableJumpEmote;

  factory Control.fromJson(Map<String, dynamic> json) => Control(
        inputDisable: json["input_disable"],
        rootInputText: json["root_input_text"],
        childInputText: json["child_input_text"],
        giveupInputText: json["giveup_input_text"],
        bgText: json["bg_text"],
        webSelection: json["web_selection"],
        answerGuideText: json["answer_guide_text"],
        answerGuideIconUrl: json["answer_guide_icon_url"],
        answerGuideIosUrl: json["answer_guide_ios_url"],
        answerGuideAndroidUrl: json["answer_guide_android_url"],
        showType: json["show_type"],
        showText: json["show_text"],
        disableJumpEmote: json["disable_jump_emote"],
      );

  Map<String, dynamic> toJson() => {
        "input_disable": inputDisable,
        "root_input_text": rootInputText,
        "child_input_text": childInputText,
        "giveup_input_text": giveupInputText,
        "bg_text": bgText,
        "web_selection": webSelection,
        "answer_guide_text": answerGuideText,
        "answer_guide_icon_url": answerGuideIconUrl,
        "answer_guide_ios_url": answerGuideIosUrl,
        "answer_guide_android_url": answerGuideAndroidUrl,
        "show_type": showType,
        "show_text": showText,
        "disable_jump_emote": disableJumpEmote,
      };
}

class Cursor {
  Cursor({
    required this.allCount,
    required this.isBegin,
    required this.prev,
    required this.next,
    required this.isEnd,
    required this.mode,
    required this.showType,
    required this.supportMode,
    required this.name,
  });

  int allCount;
  bool isBegin;
  int prev;
  int next;
  bool isEnd;
  int mode;
  int? showType;
  List<int> supportMode;
  String name;

  factory Cursor.fromJson(Map<String, dynamic> json) => Cursor(
    allCount: json["all_count"] ?? 0,
        isBegin: json["is_begin"],
        prev: json["prev"],
        next: json["next"],
        isEnd: json["is_end"],
        mode: json["mode"],
        showType: json["show_type"],
        supportMode: List<int>.from(json["support_mode"].map((x) => x)),
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "all_count": allCount,
        "is_begin": isBegin,
        "prev": prev,
        "next": next,
        "is_end": isEnd,
        "mode": mode,
        "show_type": showType,
        "support_mode": List<dynamic>.from(supportMode.map((x) => x)),
        "name": name,
      };
}

class Effects {
  Effects({
    required this.preloading,
  });

  String preloading;

  factory Effects.fromJson(Map<String, dynamic> json) => Effects(
        preloading: json["preloading"],
      );

  Map<String, dynamic> toJson() => {
        "preloading": preloading,
      };
}

class Folder {
  Folder({
    required this.hasFolded,
    required this.isFolded,
    required this.rule,
  });

  bool hasFolded;
  bool isFolded;
  String rule;

  factory Folder.fromJson(Map<String, dynamic> json) => Folder(
        hasFolded: json["has_folded"],
        isFolded: json["is_folded"],
        rule: json["rule"],
      );

  Map<String, dynamic> toJson() => {
        "has_folded": hasFolded,
        "is_folded": isFolded,
        "rule": rule,
      };
}

class HYVideoReplyModelReply {
  HYVideoReplyModelReply({
    required this.rpid,
    required this.oid,
    required this.type,
    required this.mid,
    required this.root,
    required this.parent,
    required this.dialog,
    required this.count,
    required this.rcount,
    required this.state,
    required this.fansgrade,
    required this.attr,
    required this.ctime,
    required this.rpidStr,
    required this.rootStr,
    required this.parentStr,
    required this.like,
    required this.action,
    required this.member,
    required this.content,
    required this.replies,
    required this.assist,
    required this.folder,
    required this.upAction,
    required this.showFollow,
    required this.invisible,
    required this.replyControl,
  });

  int rpid;
  int oid;
  int type;
  int mid;
  int root;
  int parent;
  int dialog;
  int count;
  int rcount;
  int state;
  int fansgrade;
  int attr;
  int ctime;
  String rpidStr;
  String rootStr;
  String parentStr;
  int like;
  int action;
  ReplyMember member;
  PurpleContent content;
  List<ReplyReply>? replies;
  int assist;
  Folder folder;
  UpAction upAction;
  bool showFollow;
  bool invisible;
  UpperReplyControl replyControl;

  factory HYVideoReplyModelReply.fromJson(Map<String, dynamic> json) =>
      HYVideoReplyModelReply(
        rpid: json["rpid"],
        oid: json["oid"],
        type: json["type"],
        mid: json["mid"],
        root: json["root"],
        parent: json["parent"],
        dialog: json["dialog"],
        count: json["count"],
        rcount: json["rcount"],
        state: json["state"],
        fansgrade: json["fansgrade"],
        attr: json["attr"],
        ctime: json["ctime"],
        rpidStr: json["rpid_str"],
        rootStr: json["root_str"],
        parentStr: json["parent_str"],
        like: json["like"],
        action: json["action"],
        member: ReplyMember.fromJson(json["member"]),
        content: PurpleContent.fromJson(json["content"]),
        replies: json["replies"] == null
            ? null
            : List<ReplyReply>.from(
                json["replies"].map((x) => ReplyReply.fromJson(x))),
        assist: json["assist"],
        folder: Folder.fromJson(json["folder"]),
        upAction: UpAction.fromJson(json["up_action"]),
        showFollow: json["show_follow"],
        invisible: json["invisible"],
        replyControl: UpperReplyControl.fromJson(json["reply_control"]),
      );

  Map<String, dynamic> toJson() => {
        "rpid": rpid,
        "oid": oid,
        "type": type,
        "mid": mid,
        "root": root,
        "parent": parent,
        "dialog": dialog,
        "count": count,
        "rcount": rcount,
        "state": state,
        "fansgrade": fansgrade,
        "attr": attr,
        "ctime": ctime,
        "rpid_str": rpidStr,
        "root_str": rootStr,
        "parent_str": parentStr,
        "like": like,
        "action": action,
        "member": member.toJson(),
        "content": content.toJson(),
        "replies": replies == null
            ? null
            : List<dynamic>.from(replies!.map((x) => x.toJson())),
        "assist": assist,
        "folder": folder.toJson(),
        "up_action": upAction.toJson(),
        "show_follow": showFollow,
        "invisible": invisible,
        "reply_control": replyControl.toJson(),
      };
}

class PurpleContent {
  PurpleContent({
    required this.message,
    required this.plat,
    required this.device,
    required this.members,
    required this.emote,
    required this.jumpUrl,
    required this.maxLine,
  });

  String message;
  int plat;
  String device;
  List<dynamic> members;
  Map<String, EmoteValue>? emote;
  Cm jumpUrl;
  int maxLine;

  factory PurpleContent.fromJson(Map<String, dynamic> json) => PurpleContent(
        message: json["message"],
        plat: json["plat"],
        device: json["device"],
        members: List<dynamic>.from(json["members"].map((x) => x)),
        emote: json["emote"] == null
            ? null
            : Map.from(json["emote"]).map((k, v) =>
                MapEntry<String, EmoteValue>(k, EmoteValue.fromJson(v))),
        jumpUrl: Cm.fromJson(json["jump_url"]),
        maxLine: json["max_line"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "plat": plat,
        "device": device,
        "members": List<dynamic>.from(members.map((x) => x)),
        "emote": emote == null
            ? null
            : Map.from(emote!)
                .map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
        "jump_url": jumpUrl.toJson(),
        "max_line": maxLine,
      };
}

class EmoteValue {
  EmoteValue({
    required this.id,
    required this.packageId,
    required this.state,
    required this.type,
    required this.attr,
    required this.text,
    required this.url,
    required this.meta,
    required this.mtime,
    required this.jumpTitle,
    required this.gifUrl,
  });

  int id;
  int packageId;
  int state;
  int type;
  int attr;
  String text;
  String url;
  Meta meta;
  int mtime;
  String jumpTitle;
  String? gifUrl;

  factory EmoteValue.fromJson(Map<String, dynamic> json) => EmoteValue(
        id: json["id"],
        packageId: json["package_id"],
        state: json["state"],
        type: json["type"],
        attr: json["attr"],
        text: json["text"],
        url: json["url"],
        meta: Meta.fromJson(json["meta"]),
        mtime: json["mtime"],
        jumpTitle: json["jump_title"],
        gifUrl: json["gif_url"] == null ? null : json["gif_url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "package_id": packageId,
        "state": state,
        "type": type,
        "attr": attr,
        "text": text,
        "url": url,
        "meta": meta.toJson(),
        "mtime": mtime,
        "jump_title": jumpTitle,
        "gif_url": gifUrl == null ? null : gifUrl,
      };
}

class Meta {
  Meta({
    required this.size,
  });

  int size;

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        size: json["size"],
      );

  Map<String, dynamic> toJson() => {
        "size": size,
      };
}

class ReplyMember {
  ReplyMember({
    required this.mid,
    required this.uname,
    required this.sex,
    required this.sign,
    required this.avatar,
    required this.rank,
    required this.displayRank,
    required this.faceNftNew,
    required this.isSeniorMember,
    required this.levelInfo,
    required this.pendant,
    required this.nameplate,
    required this.officialVerify,
    required this.vip,
    required this.fansDetail,
    required this.following,
    required this.isFollowed,
    required this.userSailing,
    required this.isContractor,
    required this.contractDesc,
    required this.nftInteraction,
  });

  String mid;
  String uname;
  Sex? sex;
  String sign;
  String avatar;
  String rank;
  String? displayRank;
  int faceNftNew;
  int isSeniorMember;
  LevelInfo levelInfo;
  MemberPendant pendant;
  Nameplate nameplate;
  OfficialVerify officialVerify;
  Vip vip;
  dynamic fansDetail;
  int following;
  int isFollowed;
  UserSailing userSailing;
  bool isContractor;
  String contractDesc;
  dynamic nftInteraction;

  factory ReplyMember.fromJson(Map<String, dynamic> json) => ReplyMember(
        mid: json["mid"],
        uname: json["uname"],
        sex: sexValues.map[json["sex"]],
        sign: json["sign"],
        avatar: json["avatar"],
        rank: json["rank"],
        displayRank: json["DisplayRank"],
        faceNftNew: json["face_nft_new"],
        isSeniorMember: json["is_senior_member"],
        levelInfo: LevelInfo.fromJson(json["level_info"]),
        pendant: MemberPendant.fromJson(json["pendant"]),
        nameplate: Nameplate.fromJson(json["nameplate"]),
        officialVerify: OfficialVerify.fromJson(json["official_verify"]),
        vip: Vip.fromJson(json["vip"]),
        fansDetail: json["fans_detail"],
        following: json["following"],
        isFollowed: json["is_followed"],
        userSailing: UserSailing.fromJson(json["user_sailing"]),
        isContractor: json["is_contractor"],
        contractDesc: json["contract_desc"],
        nftInteraction: json["nft_interaction"],
      );

  Map<String, dynamic> toJson() => {
        "mid": mid,
        "uname": uname,
        "sex": sexValues.reverse[sex],
        "sign": sign,
        "avatar": avatar,
        "rank": rank,
        "DisplayRank": displayRank,
        "face_nft_new": faceNftNew,
        "is_senior_member": isSeniorMember,
        "level_info": levelInfo.toJson(),
        "pendant": pendant.toJson(),
        "nameplate": nameplate.toJson(),
        "official_verify": officialVerify.toJson(),
        "vip": vip.toJson(),
        "fans_detail": fansDetail,
        "following": following,
        "is_followed": isFollowed,
        "user_sailing": userSailing.toJson(),
        "is_contractor": isContractor,
        "contract_desc": contractDesc,
        "nft_interaction": nftInteraction,
      };
}

class LevelInfo {
  LevelInfo({
    required this.currentLevel,
    required this.currentMin,
    required this.currentExp,
    required this.nextExp,
  });

  int currentLevel;
  int currentMin;
  int currentExp;
  int nextExp;

  factory LevelInfo.fromJson(Map<String, dynamic> json) => LevelInfo(
        currentLevel: json["current_level"],
        currentMin: json["current_min"],
        currentExp: json["current_exp"],
        nextExp: json["next_exp"],
      );

  Map<String, dynamic> toJson() => {
        "current_level": currentLevel,
        "current_min": currentMin,
        "current_exp": currentExp,
        "next_exp": nextExp,
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
  Name? name;
  String image;
  String imageSmall;
  Level? level;
  Condition? condition;

  factory Nameplate.fromJson(Map<String, dynamic> json) => Nameplate(
        nid: json["nid"],
        name: nameValues.map[json["name"]],
        image: json["image"],
        imageSmall: json["image_small"],
        level: levelValues.map[json["level"]],
        condition: conditionValues.map[json["condition"]],
      );

  Map<String, dynamic> toJson() => {
        "nid": nid,
        "name": nameValues.reverse[name],
        "image": image,
        "image_small": imageSmall,
        "level": levelValues.reverse[level],
        "condition": conditionValues.reverse[condition],
      };
}

enum Condition { EMPTY, THE_5, THE_10, CONDITION_5, THE_15, THE_100 }

final conditionValues = EnumValues({
  "当前持有粉丝勋章最高等级>=5级": Condition.CONDITION_5,
  "": Condition.EMPTY,
  "当前持有粉丝勋章最高等级>=10级": Condition.THE_10,
  "所有自制视频总播放数>=100万": Condition.THE_100,
  "当前持有粉丝勋章最高等级>=15级": Condition.THE_15,
  "同时拥有粉丝勋章>=5个": Condition.THE_5
});

enum Level { EMPTY, LEVEL, PURPLE }

final levelValues =
    EnumValues({"": Level.EMPTY, "普通勋章": Level.LEVEL, "稀有勋章": Level.PURPLE});

enum Name { EMPTY, NAME, PURPLE, FLUFFY, TENTACLED, STICKY }

final nameValues = EnumValues({
  "": Name.EMPTY,
  "有爱萌新": Name.FLUFFY,
  "收集萌新": Name.NAME,
  "有爱楷模": Name.PURPLE,
  "知名偶像": Name.STICKY,
  "有爱大佬": Name.TENTACLED
});

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

class MemberPendant {
  MemberPendant({
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

  factory MemberPendant.fromJson(Map<String, dynamic> json) => MemberPendant(
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

enum Sex { EMPTY, SEX, PURPLE }

final sexValues = EnumValues({"保密": Sex.EMPTY, "男": Sex.PURPLE, "女": Sex.SEX});

class UserSailing {
  UserSailing({
    required this.pendant,
    required this.cardbg,
    required this.cardbgWithFocus,
  });

  UserSailingPendant? pendant;
  Cardbg? cardbg;
  dynamic cardbgWithFocus;

  factory UserSailing.fromJson(Map<String, dynamic> json) => UserSailing(
        pendant: json["pendant"] == null
            ? null
            : UserSailingPendant.fromJson(json["pendant"]),
        cardbg: json["cardbg"] == null ? null : Cardbg.fromJson(json["cardbg"]),
        cardbgWithFocus: json["cardbg_with_focus"],
      );

  Map<String, dynamic> toJson() => {
        "pendant": pendant == null ? null : pendant?.toJson(),
        "cardbg": cardbg == null ? null : cardbg?.toJson(),
        "cardbg_with_focus": cardbgWithFocus,
      };
}

class Cardbg {
  Cardbg({
    required this.id,
    required this.name,
    required this.image,
    required this.jumpUrl,
    required this.fan,
    required this.type,
  });

  int id;
  String name;
  String image;
  String jumpUrl;
  Fan fan;
  String type;

  factory Cardbg.fromJson(Map<String, dynamic> json) => Cardbg(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        jumpUrl: json["jump_url"],
        fan: Fan.fromJson(json["fan"]),
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "jump_url": jumpUrl,
        "fan": fan.toJson(),
        "type": type,
      };
}

class Fan {
  Fan({
    required this.isFan,
    required this.number,
    required this.color,
    required this.name,
    required this.numDesc,
  });

  int isFan;
  int number;
  String color;
  String name;
  String numDesc;

  factory Fan.fromJson(Map<String, dynamic> json) => Fan(
        isFan: json["is_fan"],
        number: json["number"],
        color: json["color"],
        name: json["name"],
        numDesc: json["num_desc"],
      );

  Map<String, dynamic> toJson() => {
        "is_fan": isFan,
        "number": number,
        "color": color,
        "name": name,
        "num_desc": numDesc,
      };
}

class UserSailingPendant {
  UserSailingPendant({
    required this.id,
    required this.name,
    required this.image,
    required this.jumpUrl,
    required this.type,
    required this.imageEnhance,
    required this.imageEnhanceFrame,
  });

  int id;
  String name;
  String image;
  String jumpUrl;
  String type;
  String imageEnhance;
  String imageEnhanceFrame;

  factory UserSailingPendant.fromJson(Map<String, dynamic> json) =>
      UserSailingPendant(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        jumpUrl: json["jump_url"],
        type: json["type"],
        imageEnhance: json["image_enhance"],
        imageEnhanceFrame: json["image_enhance_frame"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "jump_url": jumpUrl,
        "type": type,
        "image_enhance": imageEnhance,
        "image_enhance_frame": imageEnhanceFrame,
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
    required this.avatarSubscript,
    required this.nicknameColor,
  });

  int vipType;
  int vipDueDate;
  String dueRemark;
  int accessStatus;
  int vipStatus;
  String vipStatusWarn;
  int themeType;
  Label label;
  int avatarSubscript;
  CColor? nicknameColor;

  factory Vip.fromJson(Map<String, dynamic> json) => Vip(
        vipType: json["vipType"],
        vipDueDate: json["vipDueDate"],
        dueRemark: json["dueRemark"],
        accessStatus: json["accessStatus"],
        vipStatus: json["vipStatus"],
        vipStatusWarn: json["vipStatusWarn"],
        themeType: json["themeType"],
        label: Label.fromJson(json["label"]),
        avatarSubscript: json["avatar_subscript"],
        nicknameColor: colorValues.map[json["nickname_color"]],
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
        "avatar_subscript": avatarSubscript,
        "nickname_color": colorValues.reverse[nicknameColor],
      };
}

class Label {
  Label({
    required this.path,
    required this.labelText,
    required this.labelTheme,
    required this.labelTextColor,
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
  TText? labelText;
  LabelTheme? labelTheme;
  TTextColor? labelTextColor;
  int bgStyle;
  CColor? bgColor;
  String borderColor;
  bool useImgLabel;
  String imgLabelUriHans;
  String imgLabelUriHant;
  String imgLabelUriHansStatic;
  String imgLabelUriHantStatic;

  factory Label.fromJson(Map<String, dynamic> json) => Label(
        path: json["path"],
        labelText: textValues.map[json["text"]],
        labelTheme: labelThemeValues.map[json["label_theme"]],
        labelTextColor: textColorValues.map[json["text_color"]],
        bgStyle: json["bg_style"],
        bgColor: colorValues.map[json["bg_color"]],
        borderColor: json["border_color"],
        useImgLabel: json["use_img_label"],
        imgLabelUriHans: json["img_label_uri_hans"],
        imgLabelUriHant: json["img_label_uri_hant"],
        imgLabelUriHansStatic: json["img_label_uri_hans_static"],
        imgLabelUriHantStatic: json["img_label_uri_hant_static"],
      );

  Map<String, dynamic> toJson() =>
      {
        "path": path,
        "text": textValues.reverse[labelText],
        "label_theme": labelThemeValues.reverse[labelTheme],
        "text_color": textColorValues.reverse[labelTextColor],
        "bg_style": bgStyle,
        "bg_color": colorValues.reverse[bgColor],
        "border_color": borderColor,
        "use_img_label": useImgLabel,
        "img_label_uri_hans": imgLabelUriHans,
        "img_label_uri_hant": imgLabelUriHant,
        "img_label_uri_hans_static": imgLabelUriHansStatic,
        "img_label_uri_hant_static": imgLabelUriHantStatic,
      };
}

enum CColor { EMPTY, FB7299 }

final colorValues = EnumValues({"": CColor.EMPTY, "#FB7299": CColor.FB7299});

enum LabelTheme { EMPTY, VIP, ANNUAL_VIP }

final labelThemeValues = EnumValues({
  "annual_vip": LabelTheme.ANNUAL_VIP,
  "": LabelTheme.EMPTY,
  "vip": LabelTheme.VIP
});

enum TText { EMPTY, TEXT, PURPLE }

final textValues =
    EnumValues({"": TText.EMPTY, "年度大会员": TText.PURPLE, "大会员": TText.TEXT});

enum TTextColor { EMPTY, FFFFFF }

final textColorValues =
    EnumValues({"": TTextColor.EMPTY, "#FFFFFF": TTextColor.FFFFFF});

class ReplyReply {
  ReplyReply({
    required this.rpid,
    required this.oid,
    required this.type,
    required this.mid,
    required this.root,
    required this.parent,
    required this.dialog,
    required this.count,
    required this.rcount,
    required this.state,
    required this.fansgrade,
    required this.attr,
    required this.ctime,
    required this.rpidStr,
    required this.rootStr,
    required this.parentStr,
    required this.like,
    required this.action,
    required this.member,
    required this.content,
    required this.replies,
    required this.assist,
    required this.folder,
    required this.upAction,
    required this.showFollow,
    required this.invisible,
    required this.replyControl,
  });

  int rpid;
  int oid;
  int type;
  int mid;
  int root;
  int parent;
  int dialog;
  int count;
  int rcount;
  int state;
  int fansgrade;
  int attr;
  int ctime;
  String rpidStr;
  String rootStr;
  String parentStr;
  int like;
  int action;
  ReplyMember member;
  FluffyContent content;
  dynamic replies;
  int assist;
  Folder folder;
  UpAction upAction;
  bool showFollow;
  bool invisible;
  PurpleReplyControl replyControl;

  factory ReplyReply.fromJson(Map<String, dynamic> json) => ReplyReply(
        rpid: json["rpid"],
        oid: json["oid"],
        type: json["type"],
        mid: json["mid"],
        root: json["root"],
        parent: json["parent"],
        dialog: json["dialog"],
        count: json["count"],
        rcount: json["rcount"],
        state: json["state"],
        fansgrade: json["fansgrade"],
        attr: json["attr"],
        ctime: json["ctime"],
        rpidStr: json["rpid_str"],
        rootStr: json["root_str"],
        parentStr: json["parent_str"],
        like: json["like"],
        action: json["action"],
        member: ReplyMember.fromJson(json["member"]),
        content: FluffyContent.fromJson(json["content"]),
        replies: json["replies"],
        assist: json["assist"],
        folder: Folder.fromJson(json["folder"]),
        upAction: UpAction.fromJson(json["up_action"]),
        showFollow: json["show_follow"],
        invisible: json["invisible"],
        replyControl: PurpleReplyControl.fromJson(json["reply_control"]),
      );

  Map<String, dynamic> toJson() => {
        "rpid": rpid,
        "oid": oid,
        "type": type,
        "mid": mid,
        "root": root,
        "parent": parent,
        "dialog": dialog,
        "count": count,
        "rcount": rcount,
        "state": state,
        "fansgrade": fansgrade,
        "attr": attr,
        "ctime": ctime,
        "rpid_str": rpidStr,
        "root_str": rootStr,
        "parent_str": parentStr,
        "like": like,
        "action": action,
        "member": member.toJson(),
        "content": content.toJson(),
        "replies": replies,
        "assist": assist,
        "folder": folder.toJson(),
        "up_action": upAction.toJson(),
        "show_follow": showFollow,
        "invisible": invisible,
        "reply_control": replyControl.toJson(),
      };
}

class FluffyContent {
  FluffyContent({
    required this.message,
    required this.plat,
    required this.device,
    required this.members,
    required this.emote,
    required this.jumpUrl,
    required this.maxLine,
  });

  String message;
  int plat;
  String device;
  List<MemberElement> members;
  Map<String, EmoteValue>? emote;
  Cm jumpUrl;
  int maxLine;

  factory FluffyContent.fromJson(Map<String, dynamic> json) => FluffyContent(
        message: json["message"],
        plat: json["plat"],
        device: json["device"],
        members: List<MemberElement>.from(
            json["members"].map((x) => MemberElement.fromJson(x))),
        emote: json["emote"] == null
            ? null
            : Map.from(json["emote"]).map((k, v) =>
                MapEntry<String, EmoteValue>(k, EmoteValue.fromJson(v))),
        jumpUrl: Cm.fromJson(json["jump_url"]),
        maxLine: json["max_line"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "plat": plat,
        "device": device,
        "members": List<dynamic>.from(members.map((x) => x.toJson())),
        "emote": emote == null
            ? null
            : Map.from(emote!)
                .map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
        "jump_url": jumpUrl.toJson(),
        "max_line": maxLine,
      };
}

class MemberElement {
  MemberElement({
    required this.mid,
    required this.uname,
    required this.sex,
    required this.sign,
    required this.avatar,
    required this.rank,
    required this.displayRank,
    required this.faceNftNew,
    required this.isSeniorMember,
    required this.levelInfo,
    required this.pendant,
    required this.nameplate,
    required this.officialVerify,
    required this.vip,
  });

  String mid;
  String uname;
  Sex? sex;
  String sign;
  String avatar;
  String rank;
  String displayRank;
  int faceNftNew;
  int isSeniorMember;
  LevelInfo levelInfo;
  MemberPendant pendant;
  Nameplate nameplate;
  OfficialVerify officialVerify;
  Vip vip;

  factory MemberElement.fromJson(Map<String, dynamic> json) => MemberElement(
        mid: json["mid"],
        uname: json["uname"],
        sex: sexValues.map[json["sex"]],
        sign: json["sign"],
        avatar: json["avatar"],
        rank: json["rank"],
        displayRank: json["DisplayRank"],
        faceNftNew: json["face_nft_new"],
        isSeniorMember: json["is_senior_member"],
        levelInfo: LevelInfo.fromJson(json["level_info"]),
        pendant: MemberPendant.fromJson(json["pendant"]),
        nameplate: Nameplate.fromJson(json["nameplate"]),
        officialVerify: OfficialVerify.fromJson(json["official_verify"]),
        vip: Vip.fromJson(json["vip"]),
      );

  Map<String, dynamic> toJson() => {
        "mid": mid,
        "uname": uname,
        "sex": sexValues.reverse[sex],
        "sign": sign,
        "avatar": avatar,
        "rank": rank,
        "DisplayRank": displayRank,
        "face_nft_new": faceNftNew,
        "is_senior_member": isSeniorMember,
        "level_info": levelInfo.toJson(),
        "pendant": pendant.toJson(),
        "nameplate": nameplate.toJson(),
        "official_verify": officialVerify.toJson(),
        "vip": vip.toJson(),
      };
}

class PurpleReplyControl {
  PurpleReplyControl({
    required this.timeDesc,
  });

  String timeDesc;

  factory PurpleReplyControl.fromJson(Map<String, dynamic> json) =>
      PurpleReplyControl(
        timeDesc: json["time_desc"],
      );

  Map<String, dynamic> toJson() => {
        "time_desc": timeDesc,
      };
}

class UpAction {
  UpAction({
    required this.like,
    required this.reply,
  });

  bool like;
  bool reply;

  factory UpAction.fromJson(Map<String, dynamic> json) => UpAction(
        like: json["like"],
        reply: json["reply"],
      );

  Map<String, dynamic> toJson() => {
        "like": like,
        "reply": reply,
      };
}

class UpperReplyControl {
  UpperReplyControl({
    required this.subReplyEntryText,
    required this.subReplyTitleText,
    required this.timeDesc,
  });

  String? subReplyEntryText;
  String? subReplyTitleText;
  String? timeDesc;

  factory UpperReplyControl.fromJson(Map<String, dynamic> json) =>
      UpperReplyControl(
        subReplyEntryText: json["sub_reply_entry_text"] == null
            ? null
            : json["sub_reply_entry_text"],
        subReplyTitleText: json["sub_reply_title_text"] == null
            ? null
            : json["sub_reply_title_text"],
        timeDesc: json["time_desc"],
      );

  Map<String, dynamic> toJson() => {
        "sub_reply_entry_text":
            subReplyEntryText == null ? null : subReplyEntryText,
        "sub_reply_title_text":
            subReplyTitleText == null ? null : subReplyTitleText,
        "time_desc": timeDesc,
      };
}

class Top {
  Top({
    required this.admin,
    required this.upper,
    required this.vote,
  });

  dynamic admin;
  UpperElement? upper;
  dynamic vote;

  factory Top.fromJson(Map<String, dynamic> json) => Top(
        admin: json["admin"],
        upper:
            json["upper"] == null ? null : UpperElement.fromJson(json["upper"]),
        vote: json["vote"],
      );

  Map<String, dynamic> toJson() => {
        "admin": admin,
        "upper": upper?.toJson(),
        "vote": vote,
      };
}

class UpperElement {
  UpperElement({
    required this.rpid,
    required this.oid,
    required this.type,
    required this.mid,
    required this.root,
    required this.parent,
    required this.dialog,
    required this.count,
    required this.rcount,
    required this.state,
    required this.fansgrade,
    required this.attr,
    required this.ctime,
    required this.rpidStr,
    required this.rootStr,
    required this.parentStr,
    required this.like,
    required this.action,
    required this.member,
    required this.content,
    required this.replies,
    required this.assist,
    required this.folder,
    required this.upAction,
    required this.showFollow,
    required this.invisible,
    required this.replyControl,
  });

  int rpid;
  int oid;
  int type;
  int mid;
  int root;
  int parent;
  int dialog;
  int count;
  int rcount;
  int state;
  int fansgrade;
  int attr;
  int ctime;
  String rpidStr;
  String rootStr;
  String parentStr;
  int like;
  int action;
  ReplyMember member;
  UpperContent content;
  List<UpperReply>? replies;
  int assist;
  Folder folder;
  UpAction upAction;
  bool showFollow;
  bool invisible;
  UpperReplyControl replyControl;

  factory UpperElement.fromJson(Map<String, dynamic> json) => UpperElement(
        rpid: json["rpid"],
        oid: json["oid"],
        type: json["type"],
        mid: json["mid"],
        root: json["root"],
        parent: json["parent"],
        dialog: json["dialog"],
        count: json["count"],
        rcount: json["rcount"],
        state: json["state"],
        fansgrade: json["fansgrade"],
        attr: json["attr"],
        ctime: json["ctime"],
        rpidStr: json["rpid_str"],
        rootStr: json["root_str"],
        parentStr: json["parent_str"],
        like: json["like"],
        action: json["action"],
        member: ReplyMember.fromJson(json["member"]),
        content: UpperContent.fromJson(json["content"]),
        replies: List<UpperReply>.from(
            json["replies"].map((x) => UpperReply.fromJson(x))),
        assist: json["assist"],
        folder: Folder.fromJson(json["folder"]),
        upAction: UpAction.fromJson(json["up_action"]),
        showFollow: json["show_follow"],
        invisible: json["invisible"],
        replyControl: UpperReplyControl.fromJson(json["reply_control"]),
      );

  Map<String, dynamic> toJson() => {
        "rpid": rpid,
        "oid": oid,
        "type": type,
        "mid": mid,
        "root": root,
        "parent": parent,
        "dialog": dialog,
        "count": count,
        "rcount": rcount,
        "state": state,
        "fansgrade": fansgrade,
        "attr": attr,
        "ctime": ctime,
        "rpid_str": rpidStr,
        "root_str": rootStr,
        "parent_str": parentStr,
        "like": like,
        "action": action,
        "member": member.toJson(),
        "content": content.toJson(),
    // "replies": List<dynamic>.from(replies.map((x) => x.toJson())),
        "assist": assist,
        "folder": folder.toJson(),
        "up_action": upAction.toJson(),
        "show_follow": showFollow,
        "invisible": invisible,
        "reply_control": replyControl.toJson(),
      };
}

class UpperContent {
  UpperContent({
    required this.message,
    required this.plat,
    required this.device,
    required this.members,
    required this.jumpUrl,
    required this.maxLine,
  });

  String message;
  int plat;
  String device;
  List<dynamic> members;
  Cm jumpUrl;
  int maxLine;

  factory UpperContent.fromJson(Map<String, dynamic> json) => UpperContent(
        message: json["message"],
        plat: json["plat"],
        device: json["device"],
        members: List<dynamic>.from(json["members"].map((x) => x)),
        jumpUrl: Cm.fromJson(json["jump_url"]),
        maxLine: json["max_line"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "plat": plat,
        "device": device,
        "members": List<dynamic>.from(members.map((x) => x)),
        "jump_url": jumpUrl.toJson(),
        "max_line": maxLine,
      };
}

class UpperReply {
  UpperReply({
    required this.rpid,
    required this.oid,
    required this.type,
    required this.mid,
    required this.root,
    required this.parent,
    required this.dialog,
    required this.count,
    required this.rcount,
    required this.state,
    required this.fansgrade,
    required this.attr,
    required this.ctime,
    required this.rpidStr,
    required this.rootStr,
    required this.parentStr,
    required this.like,
    required this.action,
    required this.member,
    required this.content,
    required this.replies,
    required this.assist,
    required this.folder,
    required this.upAction,
    required this.showFollow,
    required this.invisible,
    required this.replyControl,
  });

  int rpid;
  int oid;
  int type;
  int mid;
  int root;
  int parent;
  int dialog;
  int count;
  int rcount;
  int state;
  int fansgrade;
  int attr;
  int ctime;
  String rpidStr;
  String rootStr;
  String parentStr;
  int like;
  int action;
  ReplyMember member;
  TentacledContent content;
  dynamic replies;
  int assist;
  Folder folder;
  UpAction upAction;
  bool showFollow;
  bool invisible;
  PurpleReplyControl replyControl;

  factory UpperReply.fromJson(Map<String, dynamic> json) => UpperReply(
        rpid: json["rpid"],
        oid: json["oid"],
        type: json["type"],
        mid: json["mid"],
        root: json["root"],
        parent: json["parent"],
        dialog: json["dialog"],
        count: json["count"],
        rcount: json["rcount"],
        state: json["state"],
        fansgrade: json["fansgrade"],
        attr: json["attr"],
        ctime: json["ctime"],
        rpidStr: json["rpid_str"],
        rootStr: json["root_str"],
        parentStr: json["parent_str"],
        like: json["like"],
        action: json["action"],
        member: ReplyMember.fromJson(json["member"]),
        content: TentacledContent.fromJson(json["content"]),
        replies: json["replies"],
        assist: json["assist"],
        folder: Folder.fromJson(json["folder"]),
        upAction: UpAction.fromJson(json["up_action"]),
        showFollow: json["show_follow"],
        invisible: json["invisible"],
        replyControl: PurpleReplyControl.fromJson(json["reply_control"]),
      );

  Map<String, dynamic> toJson() => {
        "rpid": rpid,
        "oid": oid,
        "type": type,
        "mid": mid,
        "root": root,
        "parent": parent,
        "dialog": dialog,
        "count": count,
        "rcount": rcount,
        "state": state,
        "fansgrade": fansgrade,
        "attr": attr,
        "ctime": ctime,
        "rpid_str": rpidStr,
        "root_str": rootStr,
        "parent_str": parentStr,
        "like": like,
        "action": action,
        "member": member.toJson(),
        "content": content.toJson(),
        "replies": replies,
        "assist": assist,
        "folder": folder.toJson(),
        "up_action": upAction.toJson(),
        "show_follow": showFollow,
        "invisible": invisible,
        "reply_control": replyControl.toJson(),
      };
}

class TentacledContent {
  TentacledContent({
    required this.message,
    required this.plat,
    required this.device,
    required this.members,
    required this.jumpUrl,
    required this.maxLine,
    // required this.emote,
  });

  String message;
  int plat;
  String device;
  List<dynamic> members;
  Cm jumpUrl;
  int maxLine;

  // PurpleEmote? emote;

  factory TentacledContent.fromJson(Map<String, dynamic> json) =>
      TentacledContent(
        message: json["message"],
        plat: json["plat"],
        device: json["device"],
        members: List<dynamic>.from(json["members"].map((x) => x)),
        jumpUrl: Cm.fromJson(json["jump_url"]),
        maxLine: json["max_line"],
        // emote:
        //     json["emote"] == null ? null : PurpleEmote.fromJson(json["emote"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "plat": plat,
        "device": device,
        "members": List<dynamic>.from(members.map((x) => x)),
        "jump_url": jumpUrl.toJson(),
        "max_line": maxLine,
        // "emote": emote == null ? null : emote?.toJson(),
      };
}

// class PurpleEmote {
//   PurpleEmote({
//     required this.empty,
//   });
//
//   EmoteValue empty;
//
//   factory PurpleEmote.fromJson(Map<String, dynamic> json) => PurpleEmote(
//         empty: EmoteValue.fromJson(json["[辣眼睛]"]),
//       );
//
//   Map<String, dynamic> toJson() => {
//         "[辣眼睛]": empty.toJson(),
//       };
// }

class UpSelection {
  UpSelection({
    required this.pendingCount,
    required this.ignoreCount,
  });

  int pendingCount;
  int ignoreCount;

  factory UpSelection.fromJson(Map<String, dynamic> json) => UpSelection(
        pendingCount: json["pending_count"],
        ignoreCount: json["ignore_count"],
      );

  Map<String, dynamic> toJson() => {
        "pending_count": pendingCount,
        "ignore_count": ignoreCount,
      };
}

class PurpleUpper {
  PurpleUpper({
    required this.mid,
  });

  int mid;

  factory PurpleUpper.fromJson(Map<String, dynamic> json) => PurpleUpper(
        mid: json["mid"],
      );

  Map<String, dynamic> toJson() => {
        "mid": mid,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
