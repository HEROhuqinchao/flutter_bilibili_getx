// To parse this JSON data, do
//
//     final hyInfoByLiveRoomModel = hyInfoByLiveRoomModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

HYInfoByLiveRoomModel hyInfoByLiveRoomModelFromJson(String str) =>
    HYInfoByLiveRoomModel.fromJson(json.decode(str));

String hyInfoByLiveRoomModelToJson(HYInfoByLiveRoomModel data) =>
    json.encode(data.toJson());

class HYInfoByLiveRoomModel {
  HYInfoByLiveRoomModel({
    required this.roomInfo,
    required this.anchorInfo,
    required this.newsInfo,
    required this.rankdbInfo,
    required this.areaRankInfo,
    required this.battleRankEntryInfo,
    required this.tabInfo,
    required this.activityInitInfo,
    required this.voiceJoinInfo,
    required this.adBannerInfo,
    required this.skinInfo,
    required this.webBannerInfo,
    required this.lolInfo,
    required this.pkInfo,
    required this.battleInfo,
    required this.silentRoomInfo,
    required this.switchInfo,
    required this.recordSwitchInfo,
    required this.roomConfigInfo,
    required this.giftMemoryInfo,
    required this.newSwitchInfo,
    required this.superChatInfo,
    required this.onlineGoldRankInfoV2,
    required this.dmBrushInfo,
    required this.dmEmoticonInfo,
    required this.dmTagInfo,
    required this.topicInfo,
    required this.gameInfo,
    required this.watchedShow,
    required this.topicRoomInfo,
    required this.showReserveStatus,
    required this.secondCreateInfo,
    required this.playTogetherInfo,
    required this.videoConnectionInfo,
    required this.playerThrottleInfo,
    required this.guardInfo,
    required this.hotRankInfo,
  });

  RoomInfo roomInfo;
  AnchorInfo anchorInfo;
  NewsInfo newsInfo;
  RankdbInfo rankdbInfo;
  AreaRankInfo areaRankInfo;
  BattleRankEntryInfo battleRankEntryInfo;
  GiftMemoryInfo tabInfo;
  ActivityInitInfo activityInitInfo;
  VoiceJoinInfo voiceJoinInfo;
  AdBannerInfo adBannerInfo;
  SkinInfo skinInfo;
  WebBannerInfo webBannerInfo;
  LolInfo lolInfo;
  dynamic pkInfo;
  dynamic battleInfo;
  SilentRoomInfo silentRoomInfo;
  SwitchInfo switchInfo;
  RecordSwitchInfo recordSwitchInfo;
  RoomConfigInfo roomConfigInfo;
  GiftMemoryInfo giftMemoryInfo;
  Map<String, int> newSwitchInfo;
  SuperChatInfo superChatInfo;
  GiftMemoryInfo onlineGoldRankInfoV2;
  DmBrushInfo dmBrushInfo;
  DmEmoticonInfo dmEmoticonInfo;
  DmTagInfo dmTagInfo;
  TopicInfo topicInfo;
  GameInfo gameInfo;
  WatchedShow watchedShow;
  TopicRoomInfo topicRoomInfo;
  bool showReserveStatus;
  SecondCreateInfo secondCreateInfo;
  PlayTogetherInfo playTogetherInfo;
  dynamic videoConnectionInfo;
  PlayerThrottleInfo playerThrottleInfo;
  GuardInfo guardInfo;
  dynamic hotRankInfo;

  factory HYInfoByLiveRoomModel.fromJson(Map<String, dynamic> json) =>
      HYInfoByLiveRoomModel(
        roomInfo: RoomInfo.fromJson(json["room_info"]),
        anchorInfo: AnchorInfo.fromJson(json["anchor_info"]),
        newsInfo: NewsInfo.fromJson(json["news_info"]),
        rankdbInfo: RankdbInfo.fromJson(json["rankdb_info"]),
        areaRankInfo: AreaRankInfo.fromJson(json["area_rank_info"]),
        battleRankEntryInfo:
            BattleRankEntryInfo.fromJson(json["battle_rank_entry_info"]),
        tabInfo: GiftMemoryInfo.fromJson(json["tab_info"]),
        activityInitInfo: ActivityInitInfo.fromJson(json["activity_init_info"]),
        voiceJoinInfo: VoiceJoinInfo.fromJson(json["voice_join_info"]),
        adBannerInfo: AdBannerInfo.fromJson(json["ad_banner_info"]),
        skinInfo: SkinInfo.fromJson(json["skin_info"]),
        webBannerInfo: WebBannerInfo.fromJson(json["web_banner_info"]),
        lolInfo: LolInfo.fromJson(json["lol_info"]),
        pkInfo: json["pk_info"],
        battleInfo: json["battle_info"],
        silentRoomInfo: SilentRoomInfo.fromJson(json["silent_room_info"]),
        switchInfo: SwitchInfo.fromJson(json["switch_info"]),
        recordSwitchInfo: RecordSwitchInfo.fromJson(json["record_switch_info"]),
        roomConfigInfo: RoomConfigInfo.fromJson(json["room_config_info"]),
        giftMemoryInfo: GiftMemoryInfo.fromJson(json["gift_memory_info"]),
        newSwitchInfo: Map.from(json["new_switch_info"])
            .map((k, v) => MapEntry<String, int>(k, v)),
        superChatInfo: SuperChatInfo.fromJson(json["super_chat_info"]),
        onlineGoldRankInfoV2:
            GiftMemoryInfo.fromJson(json["online_gold_rank_info_v2"]),
        dmBrushInfo: DmBrushInfo.fromJson(json["dm_brush_info"]),
        dmEmoticonInfo: DmEmoticonInfo.fromJson(json["dm_emoticon_info"]),
        dmTagInfo: DmTagInfo.fromJson(json["dm_tag_info"]),
        topicInfo: TopicInfo.fromJson(json["topic_info"]),
        gameInfo: GameInfo.fromJson(json["game_info"]),
        watchedShow: WatchedShow.fromJson(json["watched_show"]),
        topicRoomInfo: TopicRoomInfo.fromJson(json["topic_room_info"]),
        showReserveStatus: json["show_reserve_status"],
        secondCreateInfo: SecondCreateInfo.fromJson(json["second_create_info"]),
        playTogetherInfo: PlayTogetherInfo.fromJson(json["play_together_info"]),
        videoConnectionInfo: json["video_connection_info"],
        playerThrottleInfo:
            PlayerThrottleInfo.fromJson(json["player_throttle_info"]),
        guardInfo: GuardInfo.fromJson(json["guard_info"]),
        hotRankInfo: json["hot_rank_info"],
      );

  Map<String, dynamic> toJson() => {
        "room_info": roomInfo.toJson(),
        "anchor_info": anchorInfo.toJson(),
        "news_info": newsInfo.toJson(),
        "rankdb_info": rankdbInfo.toJson(),
        "area_rank_info": areaRankInfo.toJson(),
        "battle_rank_entry_info": battleRankEntryInfo.toJson(),
        "tab_info": tabInfo.toJson(),
        "activity_init_info": activityInitInfo.toJson(),
        "voice_join_info": voiceJoinInfo.toJson(),
        "ad_banner_info": adBannerInfo.toJson(),
        "skin_info": skinInfo.toJson(),
        "web_banner_info": webBannerInfo.toJson(),
        "lol_info": lolInfo.toJson(),
        "pk_info": pkInfo,
        "battle_info": battleInfo,
        "silent_room_info": silentRoomInfo.toJson(),
        "switch_info": switchInfo.toJson(),
        "record_switch_info": recordSwitchInfo.toJson(),
        "room_config_info": roomConfigInfo.toJson(),
        "gift_memory_info": giftMemoryInfo.toJson(),
        "new_switch_info": Map.from(newSwitchInfo)
            .map((k, v) => MapEntry<String, dynamic>(k, v)),
        "super_chat_info": superChatInfo.toJson(),
        "online_gold_rank_info_v2": onlineGoldRankInfoV2.toJson(),
        "dm_brush_info": dmBrushInfo.toJson(),
        "dm_emoticon_info": dmEmoticonInfo.toJson(),
        "dm_tag_info": dmTagInfo.toJson(),
        "topic_info": topicInfo.toJson(),
        "game_info": gameInfo.toJson(),
        "watched_show": watchedShow.toJson(),
        "topic_room_info": topicRoomInfo.toJson(),
        "show_reserve_status": showReserveStatus,
        "second_create_info": secondCreateInfo.toJson(),
        "play_together_info": playTogetherInfo.toJson(),
        "video_connection_info": videoConnectionInfo,
        "player_throttle_info": playerThrottleInfo.toJson(),
        "guard_info": guardInfo.toJson(),
        "hot_rank_info": hotRankInfo,
      };
}

class ActivityInitInfo {
  ActivityInitInfo({
    required this.eventList,
    required this.weekInfo,
    required this.giftName,
    required this.lego,
  });

  List<dynamic> eventList;
  WeekInfo weekInfo;
  dynamic giftName;
  Lego lego;

  factory ActivityInitInfo.fromJson(Map<String, dynamic> json) =>
      ActivityInitInfo(
        eventList: List<dynamic>.from(json["eventList"].map((x) => x)),
        weekInfo: WeekInfo.fromJson(json["weekInfo"]),
        giftName: json["giftName"],
        lego: Lego.fromJson(json["lego"]),
      );

  Map<String, dynamic> toJson() => {
        "eventList": List<dynamic>.from(eventList.map((x) => x)),
        "weekInfo": weekInfo.toJson(),
        "giftName": giftName,
        "lego": lego.toJson(),
      };
}

class Lego {
  Lego({
    required this.timestamp,
    required this.config,
  });

  int timestamp;
  String config;

  factory Lego.fromJson(Map<String, dynamic> json) => Lego(
        timestamp: json["timestamp"],
        config: json["config"],
      );

  Map<String, dynamic> toJson() => {
        "timestamp": timestamp,
        "config": config,
      };
}

class WeekInfo {
  WeekInfo({
    required this.bannerInfo,
    required this.giftName,
  });

  dynamic bannerInfo;
  dynamic giftName;

  factory WeekInfo.fromJson(Map<String, dynamic> json) => WeekInfo(
        bannerInfo: json["bannerInfo"],
        giftName: json["giftName"],
      );

  Map<String, dynamic> toJson() => {
        "bannerInfo": bannerInfo,
        "giftName": giftName,
      };
}

class AdBannerInfo {
  AdBannerInfo({
    required this.data,
  });

  dynamic data;

  factory AdBannerInfo.fromJson(Map<String, dynamic> json) => AdBannerInfo(
        data: json["data"],
      );

  Map<String, dynamic> toJson() => {
        "data": data,
      };
}

class AnchorInfo {
  AnchorInfo({
    required this.baseInfo,
    required this.liveInfo,
    required this.relationInfo,
    required this.medalInfo,
  });

  BaseInfo baseInfo;
  LiveInfo liveInfo;
  RelationInfo relationInfo;
  MedalInfo medalInfo;

  factory AnchorInfo.fromJson(Map<String, dynamic> json) => AnchorInfo(
        baseInfo: BaseInfo.fromJson(json["base_info"]),
        liveInfo: LiveInfo.fromJson(json["live_info"]),
        relationInfo: RelationInfo.fromJson(json["relation_info"]),
        medalInfo: MedalInfo.fromJson(json["medal_info"]),
      );

  Map<String, dynamic> toJson() => {
        "base_info": baseInfo.toJson(),
        "live_info": liveInfo.toJson(),
        "relation_info": relationInfo.toJson(),
        "medal_info": medalInfo.toJson(),
      };
}

class BaseInfo {
  BaseInfo({
    required this.uname,
    required this.face,
    required this.gender,
    required this.officialInfo,
  });

  String uname;
  String face;
  String gender;
  OfficialInfo officialInfo;

  factory BaseInfo.fromJson(Map<String, dynamic> json) => BaseInfo(
        uname: json["uname"],
        face: json["face"],
        gender: json["gender"],
        officialInfo: OfficialInfo.fromJson(json["official_info"]),
      );

  Map<String, dynamic> toJson() => {
        "uname": uname,
        "face": face,
        "gender": gender,
        "official_info": officialInfo.toJson(),
      };
}

class OfficialInfo {
  OfficialInfo({
    required this.role,
    required this.title,
    required this.desc,
    required this.isNft,
    required this.nftDmark,
  });

  int role;
  String title;
  String desc;
  int isNft;
  String nftDmark;

  factory OfficialInfo.fromJson(Map<String, dynamic> json) => OfficialInfo(
        role: json["role"],
        title: json["title"],
        desc: json["desc"],
        isNft: json["is_nft"],
        nftDmark: json["nft_dmark"],
      );

  Map<String, dynamic> toJson() => {
        "role": role,
        "title": title,
        "desc": desc,
        "is_nft": isNft,
        "nft_dmark": nftDmark,
      };
}

class LiveInfo {
  LiveInfo({
    required this.level,
    required this.levelColor,
    required this.score,
    required this.upgradeScore,
    required this.current,
    // required this.next,
    required this.rank,
  });

  int level;
  int levelColor;
  int score;
  int upgradeScore;
  List<int> current;

  // List<int> next;
  String rank;

  factory LiveInfo.fromJson(Map<String, dynamic> json) => LiveInfo(
        level: json["level"],
        levelColor: json["level_color"],
        score: json["score"],
        upgradeScore: json["upgrade_score"],
        current: List<int>.from(json["current"].map((x) => x)),
    // next: List<int>.from(json["next"].map((x) => x)),
        rank: json["rank"],
      );

  Map<String, dynamic> toJson() => {
        "level": level,
        "level_color": levelColor,
        "score": score,
        "upgrade_score": upgradeScore,
        "current": List<dynamic>.from(current.map((x) => x)),
    // "next": List<dynamic>.from(next.map((x) => x)),
        "rank": rank,
      };
}

class MedalInfo {
  MedalInfo({
    required this.medalName,
    required this.medalId,
    required this.fansclub,
  });

  String medalName;
  int medalId;
  int fansclub;

  factory MedalInfo.fromJson(Map<String, dynamic> json) => MedalInfo(
        medalName: json["medal_name"],
        medalId: json["medal_id"],
        fansclub: json["fansclub"],
      );

  Map<String, dynamic> toJson() => {
        "medal_name": medalName,
        "medal_id": medalId,
        "fansclub": fansclub,
      };
}

class RelationInfo {
  RelationInfo({
    required this.attention,
  });

  int attention;

  factory RelationInfo.fromJson(Map<String, dynamic> json) => RelationInfo(
        attention: json["attention"],
      );

  Map<String, dynamic> toJson() => {
        "attention": attention,
      };
}

class AreaRankInfo {
  AreaRankInfo({
    required this.areaRank,
    required this.liveRank,
  });

  AreaRank areaRank;
  LiveRank liveRank;

  factory AreaRankInfo.fromJson(Map<String, dynamic> json) => AreaRankInfo(
        areaRank: AreaRank.fromJson(json["areaRank"]),
        liveRank: LiveRank.fromJson(json["liveRank"]),
      );

  Map<String, dynamic> toJson() => {
        "areaRank": areaRank.toJson(),
        "liveRank": liveRank.toJson(),
      };
}

class AreaRank {
  AreaRank({
    required this.index,
    required this.rank,
  });

  int index;
  String rank;

  factory AreaRank.fromJson(Map<String, dynamic> json) => AreaRank(
        index: json["index"],
        rank: json["rank"],
      );

  Map<String, dynamic> toJson() => {
        "index": index,
        "rank": rank,
      };
}

class LiveRank {
  LiveRank({
    required this.rank,
  });

  String rank;

  factory LiveRank.fromJson(Map<String, dynamic> json) => LiveRank(
        rank: json["rank"],
      );

  Map<String, dynamic> toJson() => {
        "rank": rank,
      };
}

class BattleRankEntryInfo {
  BattleRankEntryInfo({
    required this.firstRankImgUrl,
    required this.rankName,
    required this.showStatus,
  });

  String firstRankImgUrl;
  String rankName;
  int showStatus;

  factory BattleRankEntryInfo.fromJson(Map<String, dynamic> json) =>
      BattleRankEntryInfo(
        firstRankImgUrl: json["first_rank_img_url"],
        rankName: json["rank_name"],
        showStatus: json["show_status"],
      );

  Map<String, dynamic> toJson() => {
        "first_rank_img_url": firstRankImgUrl,
        "rank_name": rankName,
        "show_status": showStatus,
      };
}

class DmBrushInfo {
  DmBrushInfo({
    required this.minTime,
    required this.brushCount,
    required this.sliceCount,
    required this.storageTime,
  });

  int minTime;
  int brushCount;
  int sliceCount;
  int storageTime;

  factory DmBrushInfo.fromJson(Map<String, dynamic> json) => DmBrushInfo(
        minTime: json["min_time"],
        brushCount: json["brush_count"],
        sliceCount: json["slice_count"],
        storageTime: json["storage_time"],
      );

  Map<String, dynamic> toJson() => {
        "min_time": minTime,
        "brush_count": brushCount,
        "slice_count": sliceCount,
        "storage_time": storageTime,
      };
}

class DmEmoticonInfo {
  DmEmoticonInfo({
    required this.isOpenEmoticon,
    required this.isShieldEmoticon,
  });

  int isOpenEmoticon;
  int isShieldEmoticon;

  factory DmEmoticonInfo.fromJson(Map<String, dynamic> json) => DmEmoticonInfo(
        isOpenEmoticon: json["is_open_emoticon"],
        isShieldEmoticon: json["is_shield_emoticon"],
      );

  Map<String, dynamic> toJson() => {
        "is_open_emoticon": isOpenEmoticon,
        "is_shield_emoticon": isShieldEmoticon,
      };
}

class DmTagInfo {
  DmTagInfo({
    required this.dmTag,
    required this.platform,
    required this.extra,
    required this.dmChronosExtra,
    required this.dmMode,
    required this.dmSettingSwitch,
    required this.materialConf,
  });

  int dmTag;
  List<dynamic> platform;
  String extra;
  String dmChronosExtra;
  List<dynamic> dmMode;
  int dmSettingSwitch;
  dynamic materialConf;

  factory DmTagInfo.fromJson(Map<String, dynamic> json) => DmTagInfo(
        dmTag: json["dm_tag"],
        platform: List<dynamic>.from(json["platform"].map((x) => x)),
        extra: json["extra"],
        dmChronosExtra: json["dm_chronos_extra"],
        dmMode: List<dynamic>.from(json["dm_mode"].map((x) => x)),
        dmSettingSwitch: json["dm_setting_switch"],
        materialConf: json["material_conf"],
      );

  Map<String, dynamic> toJson() => {
        "dm_tag": dmTag,
        "platform": List<dynamic>.from(platform.map((x) => x)),
        "extra": extra,
        "dm_chronos_extra": dmChronosExtra,
        "dm_mode": List<dynamic>.from(dmMode.map((x) => x)),
        "dm_setting_switch": dmSettingSwitch,
        "material_conf": materialConf,
      };
}

class GameInfo {
  GameInfo({
    required this.gameStatus,
  });

  int gameStatus;

  factory GameInfo.fromJson(Map<String, dynamic> json) => GameInfo(
        gameStatus: json["game_status"],
      );

  Map<String, dynamic> toJson() => {
        "game_status": gameStatus,
      };
}

class GiftMemoryInfo {
  GiftMemoryInfo({
    required this.list,
  });

  List<ListElement>? list;

  factory GiftMemoryInfo.fromJson(Map<String, dynamic> json) => GiftMemoryInfo(
        list: json["list"] == null
            ? null
            : List<ListElement>.from(
                json["list"].map((x) => ListElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "list": list == null
            ? null
            : List<dynamic>.from(list!.map((x) => x.toJson())),
      };
}

class ListElement {
  ListElement({
    required this.type,
    required this.desc,
    required this.isFirst,
    required this.isEvent,
    required this.eventType,
    required this.listType,
    required this.apiPrefix,
    required this.rankName,
  });

  String? type;
  String? desc;
  int? isFirst;
  int? isEvent;
  String? eventType;
  String? listType;
  String? apiPrefix;
  String? rankName;

  factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
        type: json["type"],
        desc: json["desc"],
        isFirst: json["isFirst"],
        isEvent: json["isEvent"],
        eventType: json["eventType"],
        listType: json["listType"],
        apiPrefix: json["apiPrefix"],
        rankName: json["rank_name"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "desc": desc,
        "isFirst": isFirst,
        "isEvent": isEvent,
        "eventType": eventType,
        "listType": listType,
        "apiPrefix": apiPrefix,
        "rank_name": rankName,
      };
}

class GuardInfo {
  GuardInfo({
    required this.count,
    required this.anchorGuardAchieveLevel,
  });

  int count;
  int anchorGuardAchieveLevel;

  factory GuardInfo.fromJson(Map<String, dynamic> json) => GuardInfo(
        count: json["count"],
        anchorGuardAchieveLevel: json["anchor_guard_achieve_level"],
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "anchor_guard_achieve_level": anchorGuardAchieveLevel,
      };
}

class LolInfo {
  LolInfo({
    required this.lolActivity,
  });

  LolActivity lolActivity;

  factory LolInfo.fromJson(Map<String, dynamic> json) => LolInfo(
        lolActivity: LolActivity.fromJson(json["lol_activity"]),
      );

  Map<String, dynamic> toJson() => {
        "lol_activity": lolActivity.toJson(),
      };
}

class LolActivity {
  LolActivity({
    required this.status,
    required this.guessCover,
    required this.voteCover,
    required this.voteH5Url,
    required this.voteUseH5,
  });

  int status;
  String guessCover;
  String voteCover;
  String voteH5Url;
  bool voteUseH5;

  factory LolActivity.fromJson(Map<String, dynamic> json) => LolActivity(
        status: json["status"],
        guessCover: json["guess_cover"],
        voteCover: json["vote_cover"],
        voteH5Url: json["vote_h5_url"],
        voteUseH5: json["vote_use_h5"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "guess_cover": guessCover,
        "vote_cover": voteCover,
        "vote_h5_url": voteH5Url,
        "vote_use_h5": voteUseH5,
      };
}

class NewsInfo {
  NewsInfo({
    required this.uid,
    required this.ctime,
    required this.content,
  });

  int uid;
  DateTime ctime;
  String content;

  factory NewsInfo.fromJson(Map<String, dynamic> json) => NewsInfo(
        uid: json["uid"],
        ctime: DateTime.parse(json["ctime"]),
        content: json["content"],
      );

  Map<String, dynamic> toJson() => {
        "uid": uid,
        "ctime": ctime.toIso8601String(),
        "content": content,
      };
}

class PlayTogetherInfo {
  PlayTogetherInfo({
    required this.playTogetherInfoSwitch,
    required this.iconList,
  });

  int playTogetherInfoSwitch;
  List<IconList> iconList;

  factory PlayTogetherInfo.fromJson(Map<String, dynamic> json) =>
      PlayTogetherInfo(
        playTogetherInfoSwitch: json["switch"],
        iconList: List<IconList>.from(
            json["icon_list"].map((x) => IconList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "switch": playTogetherInfoSwitch,
        "icon_list": List<dynamic>.from(iconList.map((x) => x.toJson())),
      };
}

class IconList {
  IconList({
    required this.icon,
    required this.title,
    required this.jumpUrl,
    required this.status,
  });

  String icon;
  String title;
  String jumpUrl;
  int status;

  factory IconList.fromJson(Map<String, dynamic> json) => IconList(
        icon: json["icon"],
        title: json["title"],
        jumpUrl: json["jump_url"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "icon": icon,
        "title": title,
        "jump_url": jumpUrl,
        "status": status,
      };
}

class PlayerThrottleInfo {
  PlayerThrottleInfo({
    required this.status,
    required this.normalSleepTime,
    required this.fullscreenSleepTime,
    required this.tabSleepTime,
    required this.promptTime,
  });

  int status;
  int normalSleepTime;
  int fullscreenSleepTime;
  int tabSleepTime;
  int promptTime;

  factory PlayerThrottleInfo.fromJson(Map<String, dynamic> json) =>
      PlayerThrottleInfo(
        status: json["status"],
        normalSleepTime: json["normal_sleep_time"],
        fullscreenSleepTime: json["fullscreen_sleep_time"],
        tabSleepTime: json["tab_sleep_time"],
        promptTime: json["prompt_time"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "normal_sleep_time": normalSleepTime,
        "fullscreen_sleep_time": fullscreenSleepTime,
        "tab_sleep_time": tabSleepTime,
        "prompt_time": promptTime,
      };
}

class RankdbInfo {
  RankdbInfo({
    required this.roomid,
    required this.rankDesc,
    required this.color,
    required this.h5Url,
    required this.webUrl,
    required this.timestamp,
  });

  int roomid;
  String rankDesc;
  String color;
  String h5Url;
  String webUrl;
  int timestamp;

  factory RankdbInfo.fromJson(Map<String, dynamic> json) => RankdbInfo(
        roomid: json["roomid"],
        rankDesc: json["rank_desc"],
        color: json["color"],
        h5Url: json["h5_url"],
        webUrl: json["web_url"],
        timestamp: json["timestamp"],
      );

  Map<String, dynamic> toJson() => {
        "roomid": roomid,
        "rank_desc": rankDesc,
        "color": color,
        "h5_url": h5Url,
        "web_url": webUrl,
        "timestamp": timestamp,
      };
}

class RecordSwitchInfo {
  RecordSwitchInfo({
    required this.recordTab,
  });

  bool recordTab;

  factory RecordSwitchInfo.fromJson(Map<String, dynamic> json) =>
      RecordSwitchInfo(
        recordTab: json["record_tab"],
      );

  Map<String, dynamic> toJson() => {
        "record_tab": recordTab,
      };
}

class RoomConfigInfo {
  RoomConfigInfo({
    required this.dmText,
  });

  String dmText;

  factory RoomConfigInfo.fromJson(Map<String, dynamic> json) => RoomConfigInfo(
        dmText: json["dm_text"],
      );

  Map<String, dynamic> toJson() => {
        "dm_text": dmText,
      };
}

class RoomInfo {
  RoomInfo({
    required this.uid,
    required this.roomId,
    required this.shortId,
    required this.title,
    required this.cover,
    required this.tags,
    required this.background,
    required this.description,
    required this.liveStatus,
    required this.liveStartTime,
    required this.liveScreenType,
    required this.lockStatus,
    required this.lockTime,
    required this.hiddenStatus,
    required this.hiddenTime,
    required this.areaId,
    required this.areaName,
    required this.parentAreaId,
    required this.parentAreaName,
    required this.keyframe,
    required this.specialType,
    required this.upSession,
    required this.pkStatus,
    required this.isStudio,
    required this.pendants,
    required this.onVoiceJoin,
    required this.online,
    required this.roomType,
  });

  int uid;
  int roomId;
  int shortId;
  String title;
  String cover;
  String tags;
  String background;
  String description;
  int liveStatus;
  int liveStartTime;
  int liveScreenType;
  int lockStatus;
  int lockTime;
  int hiddenStatus;
  int hiddenTime;
  int areaId;
  String areaName;
  int parentAreaId;
  String parentAreaName;
  String keyframe;
  int specialType;
  String upSession;
  int pkStatus;
  bool isStudio;
  Pendants pendants;
  int onVoiceJoin;
  int online;
  Map<String, int> roomType;

  factory RoomInfo.fromJson(Map<String, dynamic> json) => RoomInfo(
        uid: json["uid"],
        roomId: json["room_id"],
        shortId: json["short_id"],
        title: json["title"],
        cover: json["cover"],
        tags: json["tags"],
        background: json["background"],
        description: json["description"],
        liveStatus: json["live_status"],
        liveStartTime: json["live_start_time"],
        liveScreenType: json["live_screen_type"],
        lockStatus: json["lock_status"],
        lockTime: json["lock_time"],
        hiddenStatus: json["hidden_status"],
        hiddenTime: json["hidden_time"],
        areaId: json["area_id"],
        areaName: json["area_name"],
        parentAreaId: json["parent_area_id"],
        parentAreaName: json["parent_area_name"],
        keyframe: json["keyframe"],
        specialType: json["special_type"],
        upSession: json["up_session"],
        pkStatus: json["pk_status"],
        isStudio: json["is_studio"],
        pendants: Pendants.fromJson(json["pendants"]),
        onVoiceJoin: json["on_voice_join"],
        online: json["online"],
        roomType: Map.from(json["room_type"])
            .map((k, v) => MapEntry<String, int>(k, v)),
      );

  Map<String, dynamic> toJson() => {
        "uid": uid,
        "room_id": roomId,
        "short_id": shortId,
        "title": title,
        "cover": cover,
        "tags": tags,
        "background": background,
        "description": description,
        "live_status": liveStatus,
        "live_start_time": liveStartTime,
        "live_screen_type": liveScreenType,
        "lock_status": lockStatus,
        "lock_time": lockTime,
        "hidden_status": hiddenStatus,
        "hidden_time": hiddenTime,
        "area_id": areaId,
        "area_name": areaName,
        "parent_area_id": parentAreaId,
        "parent_area_name": parentAreaName,
        "keyframe": keyframe,
        "special_type": specialType,
        "up_session": upSession,
        "pk_status": pkStatus,
        "is_studio": isStudio,
        "pendants": pendants.toJson(),
        "on_voice_join": onVoiceJoin,
        "online": online,
        "room_type":
            Map.from(roomType).map((k, v) => MapEntry<String, dynamic>(k, v)),
      };
}

class Pendants {
  Pendants({
    required this.frame,
  });

  Frame frame;

  factory Pendants.fromJson(Map<String, dynamic> json) => Pendants(
        frame: Frame.fromJson(json["frame"]),
      );

  Map<String, dynamic> toJson() => {
        "frame": frame.toJson(),
      };
}

class Frame {
  Frame({
    required this.name,
    required this.value,
    required this.desc,
  });

  String name;
  String value;
  String desc;

  factory Frame.fromJson(Map<String, dynamic> json) => Frame(
        name: json["name"],
        value: json["value"],
        desc: json["desc"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "value": value,
        "desc": desc,
      };
}

class SecondCreateInfo {
  SecondCreateInfo({
    required this.clickPermission,
  });

  int clickPermission;

  factory SecondCreateInfo.fromJson(Map<String, dynamic> json) =>
      SecondCreateInfo(
        clickPermission: json["click_permission"],
      );

  Map<String, dynamic> toJson() => {
        "click_permission": clickPermission,
      };
}

class SilentRoomInfo {
  SilentRoomInfo({
    required this.type,
    required this.level,
    required this.second,
    required this.expireTime,
  });

  String type;
  int level;
  int second;
  int expireTime;

  factory SilentRoomInfo.fromJson(Map<String, dynamic> json) => SilentRoomInfo(
        type: json["type"],
        level: json["level"],
        second: json["second"],
        expireTime: json["expire_time"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "level": level,
        "second": second,
        "expire_time": expireTime,
      };
}

class SkinInfo {
  SkinInfo({
    required this.id,
    required this.skinName,
    required this.skinConfig,
    required this.showText,
    required this.skinUrl,
    required this.startTime,
    required this.endTime,
    required this.currentTime,
  });

  int id;
  String skinName;
  String skinConfig;
  String showText;
  String skinUrl;
  int startTime;
  int endTime;
  int currentTime;

  factory SkinInfo.fromJson(Map<String, dynamic> json) => SkinInfo(
        id: json["id"],
        skinName: json["skin_name"],
        skinConfig: json["skin_config"],
        showText: json["show_text"],
        skinUrl: json["skin_url"],
        startTime: json["start_time"],
        endTime: json["end_time"],
        currentTime: json["current_time"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "skin_name": skinName,
        "skin_config": skinConfig,
        "show_text": showText,
        "skin_url": skinUrl,
        "start_time": startTime,
        "end_time": endTime,
        "current_time": currentTime,
      };
}

class SuperChatInfo {
  SuperChatInfo({
    required this.status,
    required this.jumpUrl,
    required this.icon,
    required this.rankedMark,
    required this.messageList,
  });

  int status;
  String jumpUrl;
  String icon;
  int rankedMark;
  List<dynamic> messageList;

  factory SuperChatInfo.fromJson(Map<String, dynamic> json) => SuperChatInfo(
        status: json["status"],
        jumpUrl: json["jump_url"],
        icon: json["icon"],
        rankedMark: json["ranked_mark"],
        messageList: List<dynamic>.from(json["message_list"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "jump_url": jumpUrl,
        "icon": icon,
        "ranked_mark": rankedMark,
        "message_list": List<dynamic>.from(messageList.map((x) => x)),
      };
}

class SwitchInfo {
  SwitchInfo({
    required this.closeGuard,
    required this.closeGift,
    required this.closeOnline,
    required this.closeDanmaku,
  });

  bool closeGuard;
  bool closeGift;
  bool closeOnline;
  bool closeDanmaku;

  factory SwitchInfo.fromJson(Map<String, dynamic> json) => SwitchInfo(
        closeGuard: json["close_guard"],
        closeGift: json["close_gift"],
        closeOnline: json["close_online"],
        closeDanmaku: json["close_danmaku"],
      );

  Map<String, dynamic> toJson() => {
        "close_guard": closeGuard,
        "close_gift": closeGift,
        "close_online": closeOnline,
        "close_danmaku": closeDanmaku,
      };
}

class TopicInfo {
  TopicInfo({
    required this.topicId,
    required this.topicName,
  });

  int topicId;
  String topicName;

  factory TopicInfo.fromJson(Map<String, dynamic> json) => TopicInfo(
        topicId: json["topic_id"],
        topicName: json["topic_name"],
      );

  Map<String, dynamic> toJson() => {
        "topic_id": topicId,
        "topic_name": topicName,
      };
}

class TopicRoomInfo {
  TopicRoomInfo({
    required this.interactiveH5Url,
    required this.watermark,
  });

  String interactiveH5Url;
  int watermark;

  factory TopicRoomInfo.fromJson(Map<String, dynamic> json) => TopicRoomInfo(
        interactiveH5Url: json["interactive_h5_url"],
        watermark: json["watermark"],
      );

  Map<String, dynamic> toJson() => {
        "interactive_h5_url": interactiveH5Url,
        "watermark": watermark,
      };
}

class VoiceJoinInfo {
  VoiceJoinInfo({
    required this.status,
    required this.icons,
    required this.webShareLink,
  });

  Status status;
  Icons icons;
  String webShareLink;

  factory VoiceJoinInfo.fromJson(Map<String, dynamic> json) => VoiceJoinInfo(
        status: Status.fromJson(json["status"]),
        icons: Icons.fromJson(json["icons"]),
        webShareLink: json["web_share_link"],
      );

  Map<String, dynamic> toJson() => {
        "status": status.toJson(),
        "icons": icons.toJson(),
        "web_share_link": webShareLink,
      };
}

class Icons {
  Icons({
    required this.iconClose,
    required this.iconOpen,
    required this.iconWait,
    required this.iconStarting,
  });

  String iconClose;
  String iconOpen;
  String iconWait;
  String iconStarting;

  factory Icons.fromJson(Map<String, dynamic> json) => Icons(
        iconClose: json["icon_close"],
        iconOpen: json["icon_open"],
        iconWait: json["icon_wait"],
        iconStarting: json["icon_starting"],
      );

  Map<String, dynamic> toJson() => {
        "icon_close": iconClose,
        "icon_open": iconOpen,
        "icon_wait": iconWait,
        "icon_starting": iconStarting,
      };
}

class Status {
  Status({
    required this.open,
    required this.anchorOpen,
    required this.status,
    required this.uid,
    required this.userName,
    required this.headPic,
    required this.guard,
    required this.startAt,
    required this.currentTime,
  });

  int open;
  int anchorOpen;
  int status;
  int uid;
  String userName;
  String headPic;
  int guard;
  int startAt;
  int currentTime;

  factory Status.fromJson(Map<String, dynamic> json) => Status(
        open: json["open"],
        anchorOpen: json["anchor_open"],
        status: json["status"],
        uid: json["uid"],
        userName: json["user_name"],
        headPic: json["head_pic"],
        guard: json["guard"],
        startAt: json["start_at"],
        currentTime: json["current_time"],
      );

  Map<String, dynamic> toJson() => {
        "open": open,
        "anchor_open": anchorOpen,
        "status": status,
        "uid": uid,
        "user_name": userName,
        "head_pic": headPic,
        "guard": guard,
        "start_at": startAt,
        "current_time": currentTime,
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

class WebBannerInfo {
  WebBannerInfo({
    required this.id,
    required this.title,
    required this.left,
    required this.right,
    required this.jumpUrl,
    required this.bgColor,
    required this.hoverColor,
    required this.textBgColor,
    required this.textHoverColor,
    required this.linkText,
    required this.linkColor,
    required this.inputColor,
    required this.inputTextColor,
    required this.inputHoverColor,
    required this.inputBorderColor,
    required this.inputSearchColor,
  });

  int id;
  String title;
  String left;
  String right;
  String jumpUrl;
  String bgColor;
  String hoverColor;
  String textBgColor;
  String textHoverColor;
  String linkText;
  String linkColor;
  String inputColor;
  String inputTextColor;
  String inputHoverColor;
  String inputBorderColor;
  String inputSearchColor;

  factory WebBannerInfo.fromJson(Map<String, dynamic> json) => WebBannerInfo(
        id: json["id"],
        title: json["title"],
        left: json["left"],
        right: json["right"],
        jumpUrl: json["jump_url"],
        bgColor: json["bg_color"],
        hoverColor: json["hover_color"],
        textBgColor: json["text_bg_color"],
        textHoverColor: json["text_hover_color"],
        linkText: json["link_text"],
        linkColor: json["link_color"],
        inputColor: json["input_color"],
        inputTextColor: json["input_text_color"],
        inputHoverColor: json["input_hover_color"],
        inputBorderColor: json["input_border_color"],
        inputSearchColor: json["input_search_color"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "left": left,
        "right": right,
        "jump_url": jumpUrl,
        "bg_color": bgColor,
        "hover_color": hoverColor,
        "text_bg_color": textBgColor,
        "text_hover_color": textHoverColor,
        "link_text": linkText,
        "link_color": linkColor,
        "input_color": inputColor,
        "input_text_color": inputTextColor,
        "input_hover_color": inputHoverColor,
        "input_border_color": inputBorderColor,
        "input_search_color": inputSearchColor,
      };
}
