// To parse this JSON data, do
//
//     final hyLiveRoomModel = hyLiveRoomModelFromJson(jsonString);

import 'dart:convert';

HYLiveRoomsModel hyLiveRoomModelFromJson(String str) =>
    HYLiveRoomsModel.fromJson(json.decode(str));

String hyLiveRoomModelToJson(HYLiveRoomsModel data) =>
    json.encode(data.toJson());

class HYLiveRoomsModel {
  HYLiveRoomsModel({
    required this.areaEntranceV2,
    required this.roomList,
    // required this.activityCardV2,
    required this.recommendRoomList,
    required this.banner,
  });

  AreaEntranceV2 areaEntranceV2;
  List<RoomList> roomList;

  // List<ActivityCardV2> activityCardV2;
  List<RecommendRoomList> recommendRoomList;
  List<Banner> banner;

  factory HYLiveRoomsModel.fromJson(Map<String, dynamic> json) =>
      HYLiveRoomsModel(
        areaEntranceV2: AreaEntranceV2.fromJson(json["area_entrance_v2"]),
        roomList: List<RoomList>.from(
            json["room_list"].map((x) => RoomList.fromJson(x))),
        // activityCardV2: List<ActivityCardV2>.from(json["activity_card_v2"].map((x) => ActivityCardV2.fromJson(x))),
        recommendRoomList: List<RecommendRoomList>.from(
            json["recommend_room_list"]
                .map((x) => RecommendRoomList.fromJson(x))),
        banner:
            List<Banner>.from(json["banner"].map((x) => Banner.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "area_entrance_v2": areaEntranceV2.toJson(),
        "room_list": List<dynamic>.from(roomList.map((x) => x.toJson())),
        // "activity_card_v2": List<dynamic>.from(activityCardV2.map((x) => x.toJson())),
        "recommend_room_list":
            List<dynamic>.from(recommendRoomList.map((x) => x.toJson())),
        "banner": List<dynamic>.from(banner.map((x) => x.toJson())),
      };
}

class ActivityCardV2 {
  ActivityCardV2({
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
    required this.roomId,
    required this.upId,
    required this.areaId,
    required this.parentAreaId,
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
  int roomId;
  int upId;
  int areaId;
  int parentAreaId;

  factory ActivityCardV2.fromJson(Map<String, dynamic> json) => ActivityCardV2(
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
        roomId: json["room_id"],
        upId: json["up_id"],
        areaId: json["area_id"],
        parentAreaId: json["parent_area_id"],
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
        "room_id": roomId,
        "up_id": upId,
        "area_id": areaId,
        "parent_area_id": parentAreaId,
      };
}

class AreaEntranceV2 {
  AreaEntranceV2({
    required this.list,
  });

  List<AreaEntranceV2List> list;

  factory AreaEntranceV2.fromJson(Map<String, dynamic> json) => AreaEntranceV2(
        list: List<AreaEntranceV2List>.from(
            json["list"].map((x) => AreaEntranceV2List.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "list": List<dynamic>.from(list.map((x) => x.toJson())),
      };
}

class AreaEntranceV2List {
  AreaEntranceV2List({
    required this.id,
    required this.link,
    required this.pic,
    required this.title,
    required this.areaV2Id,
    required this.areaV2ParentId,
    required this.tagType,
    required this.isHot,
  });

  int id;
  String link;
  String pic;
  String title;
  int areaV2Id;
  int areaV2ParentId;
  int tagType;
  int isHot;

  factory AreaEntranceV2List.fromJson(Map<String, dynamic> json) =>
      AreaEntranceV2List(
        id: json["id"],
        link: json["link"],
        pic: json["pic"],
        title: json["title"],
        areaV2Id: json["area_v2_id"],
        areaV2ParentId: json["area_v2_parent_id"],
        tagType: json["tag_type"],
        isHot: json["is_hot"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "link": link,
        "pic": pic,
        "title": title,
        "area_v2_id": areaV2Id,
        "area_v2_parent_id": areaV2ParentId,
        "tag_type": tagType,
        "is_hot": isHot,
      };
}

class Banner {
  Banner({
    required this.id,
    required this.title,
    required this.location,
    required this.position,
    required this.pic,
    required this.link,
    required this.weight,
    required this.roomId,
    required this.upId,
    required this.parentAreaId,
    required this.areaId,
    required this.liveStatus,
    required this.avId,
    required this.isAd,
    required this.adTransparentContent,
    required this.showAdIcon,
  });

  int id;
  String title;
  String location;
  int position;
  String pic;
  String link;
  int weight;
  int roomId;
  int upId;
  int parentAreaId;
  int areaId;
  int liveStatus;
  int avId;
  bool isAd;
  AdTransparentContent? adTransparentContent;
  bool showAdIcon;

  factory Banner.fromJson(Map<String, dynamic> json) => Banner(
        id: json["id"],
        title: json["title"],
        location: json["location"],
        position: json["position"],
        pic: json["pic"],
        link: json["link"],
        weight: json["weight"],
        roomId: json["room_id"],
        upId: json["up_id"],
        parentAreaId: json["parent_area_id"],
        areaId: json["area_id"],
        liveStatus: json["live_status"],
        avId: json["av_id"],
        isAd: json["is_ad"],
        adTransparentContent: json["ad_transparent_content"] == null
            ? null
            : AdTransparentContent.fromJson(json["ad_transparent_content"]),
        showAdIcon: json["show_ad_icon"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "location": location,
        "position": position,
        "pic": pic,
        "link": link,
        "weight": weight,
        "room_id": roomId,
        "up_id": upId,
        "parent_area_id": parentAreaId,
        "area_id": areaId,
        "live_status": liveStatus,
        "av_id": avId,
        "is_ad": isAd,
        "ad_transparent_content": adTransparentContent == null
            ? null
            : adTransparentContent?.toJson(),
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

class RecommendRoomList {
  RecommendRoomList({
    required this.areaV2Id,
    required this.areaV2ParentId,
    required this.areaV2Name,
    required this.areaV2ParentName,
    required this.cover,
    required this.link,
    required this.online,
    required this.roomid,
    required this.title,
    required this.uname,
    required this.face,
    required this.recStatus,
    required this.showCallback,
    required this.clickCallback,
    required this.sessionId,
    required this.groupId,
    required this.specialId,
    required this.pkId,
    required this.upId,
    required this.newSwitchInfo,
    required this.watchedShow,
    required this.isAd,
    required this.adTransparentContent,
    required this.showAdIcon,
  });

  int areaV2Id;
  int areaV2ParentId;
  String areaV2Name;
  AreaV2ParentName? areaV2ParentName;
  String cover;
  String link;
  int online;
  int roomid;
  String title;
  String uname;
  String face;
  int recStatus;
  String showCallback;
  String clickCallback;
  String sessionId;
  int groupId;
  int specialId;
  int pkId;
  int upId;
  NewSwitchInfo newSwitchInfo;
  WatchedShow watchedShow;
  bool isAd;
  dynamic adTransparentContent;
  bool showAdIcon;

  factory RecommendRoomList.fromJson(Map<String, dynamic> json) =>
      RecommendRoomList(
        areaV2Id: json["area_v2_id"],
        areaV2ParentId: json["area_v2_parent_id"],
        areaV2Name: json["area_v2_name"],
        areaV2ParentName:
            areaV2ParentNameValues.map[json["area_v2_parent_name"]],
        cover: json["cover"],
        link: json["link"],
        online: json["online"],
        roomid: json["roomid"],
        title: json["title"],
        uname: json["uname"],
        face: json["face"],
        recStatus: json["rec_status"],
        showCallback: json["show_callback"],
        clickCallback: json["click_callback"],
        sessionId: json["session_id"],
        groupId: json["group_id"],
        specialId: json["special_id"],
        pkId: json["pk_id"],
        upId: json["up_id"],
        newSwitchInfo: NewSwitchInfo.fromJson(json["new_switch_info"]),
        watchedShow: WatchedShow.fromJson(json["watched_show"]),
        isAd: json["is_ad"],
        adTransparentContent: json["ad_transparent_content"],
        showAdIcon: json["show_ad_icon"],
      );

  Map<String, dynamic> toJson() => {
        "area_v2_id": areaV2Id,
        "area_v2_parent_id": areaV2ParentId,
        "area_v2_name": areaV2Name,
        "area_v2_parent_name": areaV2ParentNameValues.reverse[areaV2ParentName],
        "cover": cover,
        "link": link,
        "online": online,
        "roomid": roomid,
        "title": title,
        "uname": uname,
        "face": face,
        "rec_status": recStatus,
        "show_callback": showCallback,
        "click_callback": clickCallback,
        "session_id": sessionId,
        "group_id": groupId,
        "special_id": specialId,
        "pk_id": pkId,
        "up_id": upId,
        "new_switch_info": newSwitchInfo.toJson(),
        "watched_show": watchedShow.toJson(),
        "is_ad": isAd,
        "ad_transparent_content": adTransparentContent,
        "show_ad_icon": showAdIcon,
      };
}

enum AreaV2ParentName {
  EMPTY,
  AREA_V2_PARENT_NAME,
  PURPLE,
  FLUFFY,
  TENTACLED,
  STICKY,
  INDIGO,
  INDECENT
}

final areaV2ParentNameValues = EnumValues({
  "虚拟主播": AreaV2ParentName.AREA_V2_PARENT_NAME,
  "电台": AreaV2ParentName.EMPTY,
  "单机游戏": AreaV2ParentName.FLUFFY,
  "赛事": AreaV2ParentName.INDECENT,
  "网游": AreaV2ParentName.INDIGO,
  "娱乐": AreaV2ParentName.PURPLE,
  "手游": AreaV2ParentName.STICKY,
  "学习": AreaV2ParentName.TENTACLED
});

class NewSwitchInfo {
  NewSwitchInfo({
    required this.roomRecommendLiveOff,
    required this.roomPlayerWatermark,
  });

  int roomRecommendLiveOff;
  int roomPlayerWatermark;

  factory NewSwitchInfo.fromJson(Map<String, dynamic> json) => NewSwitchInfo(
        roomRecommendLiveOff: json["room-recommend-live_off"],
        roomPlayerWatermark: json["room-player-watermark"],
      );

  Map<String, dynamic> toJson() => {
        "room-recommend-live_off": roomRecommendLiveOff,
        "room-player-watermark": roomPlayerWatermark,
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

class RoomList {
  RoomList({
    required this.moduleInfo,
    required this.list,
  });

  ModuleInfo moduleInfo;
  List<RoomListList> list;

  factory RoomList.fromJson(Map<String, dynamic> json) => RoomList(
        moduleInfo: ModuleInfo.fromJson(json["module_info"]),
        list: List<RoomListList>.from(
            json["list"].map((x) => RoomListList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "module_info": moduleInfo.toJson(),
        "list": List<dynamic>.from(list.map((x) => x.toJson())),
      };
}

class RoomListList {
  RoomListList({
    required this.headBox,
    required this.areaV2Id,
    required this.areaV2ParentId,
    required this.areaV2Name,
    required this.areaV2ParentName,
    required this.broadcastType,
    required this.cover,
    required this.link,
    required this.online,
    required this.pendantInfo,
    required this.roomid,
    required this.title,
    required this.uname,
    required this.face,
    required this.verify,
    required this.uid,
    required this.keyframe,
    required this.isAutoPlay,
    required this.headBoxType,
    required this.flag,
    required this.sessionId,
    required this.groupId,
    required this.showCallback,
    required this.clickCallback,
    required this.specialId,
    required this.watchedShow,
    required this.isNft,
    required this.nftDmark,
    required this.isAd,
    required this.adTransparentContent,
    required this.showAdIcon,
  });

  HeadBox? headBox;
  int areaV2Id;
  int areaV2ParentId;
  String areaV2Name;
  AreaV2ParentName? areaV2ParentName;
  int broadcastType;
  String cover;
  String link;
  int online;
  Map<String, PendantInfo> pendantInfo;
  int roomid;
  String title;
  String uname;
  String face;
  Verify verify;
  int uid;
  String keyframe;
  int isAutoPlay;
  int headBoxType;
  int flag;
  String sessionId;
  int groupId;
  String showCallback;
  String clickCallback;
  int specialId;
  WatchedShow watchedShow;
  int isNft;
  String nftDmark;
  bool isAd;
  dynamic adTransparentContent;
  bool showAdIcon;

  factory RoomListList.fromJson(Map<String, dynamic> json) => RoomListList(
        headBox: json["head_box"] == null
            ? null
            : HeadBox.fromJson(json["head_box"]),
        areaV2Id: json["area_v2_id"],
        areaV2ParentId: json["area_v2_parent_id"],
        areaV2Name: json["area_v2_name"],
        areaV2ParentName:
            areaV2ParentNameValues.map[json["area_v2_parent_name"]],
        broadcastType: json["broadcast_type"],
        cover: json["cover"],
        link: json["link"],
        online: json["online"],
        pendantInfo: Map.from(json["pendant_Info"]).map((k, v) =>
            MapEntry<String, PendantInfo>(k, PendantInfo.fromJson(v))),
        roomid: json["roomid"],
        title: json["title"],
        uname: json["uname"],
        face: json["face"],
        verify: Verify.fromJson(json["verify"]),
        uid: json["uid"],
        keyframe: json["keyframe"],
        isAutoPlay: json["is_auto_play"],
        headBoxType: json["head_box_type"],
        flag: json["flag"],
        sessionId: json["session_id"],
        groupId: json["group_id"],
        showCallback: json["show_callback"],
        clickCallback: json["click_callback"],
        specialId: json["special_id"],
        watchedShow: WatchedShow.fromJson(json["watched_show"]),
        isNft: json["is_nft"],
        nftDmark: json["nft_dmark"],
        isAd: json["is_ad"],
        adTransparentContent: json["ad_transparent_content"],
        showAdIcon: json["show_ad_icon"],
      );

  Map<String, dynamic> toJson() => {
        "head_box": headBox == null ? null : headBox?.toJson(),
        "area_v2_id": areaV2Id,
        "area_v2_parent_id": areaV2ParentId,
        "area_v2_name": areaV2Name,
        "area_v2_parent_name": areaV2ParentNameValues.reverse[areaV2ParentName],
        "broadcast_type": broadcastType,
        "cover": cover,
        "link": link,
        "online": online,
        "pendant_Info": Map.from(pendantInfo)
            .map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
        "roomid": roomid,
        "title": title,
        "uname": uname,
        "face": face,
        "verify": verify.toJson(),
        "uid": uid,
        "keyframe": keyframe,
        "is_auto_play": isAutoPlay,
        "head_box_type": headBoxType,
        "flag": flag,
        "session_id": sessionId,
        "group_id": groupId,
        "show_callback": showCallback,
        "click_callback": clickCallback,
        "special_id": specialId,
        "watched_show": watchedShow.toJson(),
        "is_nft": isNft,
        "nft_dmark": nftDmark,
        "is_ad": isAd,
        "ad_transparent_content": adTransparentContent,
        "show_ad_icon": showAdIcon,
      };
}

class HeadBox {
  HeadBox({
    required this.name,
    required this.value,
    required this.desc,
  });

  String name;
  String value;
  String desc;

  factory HeadBox.fromJson(Map<String, dynamic> json) => HeadBox(
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

class PendantInfo {
  PendantInfo({
    required this.type,
    required this.name,
    required this.position,
    required this.text,
    required this.bgColor,
    required this.bgPic,
    required this.pendantId,
    required this.priority,
    required this.createdAt,
  });

  Type? type;
  String name;
  int position;
  String text;
  BgColor? bgColor;
  String bgPic;
  int pendantId;
  int priority;
  int createdAt;

  factory PendantInfo.fromJson(Map<String, dynamic> json) => PendantInfo(
        type: typeValues.map[json["type"]],
        name: json["name"],
        position: json["position"],
        text: json["text"],
        bgColor: bgColorValues.map[json["bg_color"]],
        bgPic: json["bg_pic"],
        pendantId: json["pendant_id"],
        priority: json["priority"],
        createdAt: json["created_at"],
      );

  Map<String, dynamic> toJson() => {
        "type": typeValues.reverse[type],
        "name": name,
        "position": position,
        "text": text,
        "bg_color": bgColorValues.reverse[bgColor],
        "bg_pic": bgPic,
        "pendant_id": pendantId,
        "priority": priority,
        "created_at": createdAt,
      };
}

enum BgColor { FB9_E60, FFA726 }

final bgColorValues =
    EnumValues({"#FB9E60": BgColor.FB9_E60, "#FFA726": BgColor.FFA726});

enum Type { MOBILE_INDEX_BADGE }

final typeValues = EnumValues({"mobile_index_badge": Type.MOBILE_INDEX_BADGE});

class Verify {
  Verify({
    required this.role,
    required this.desc,
    required this.type,
  });

  int role;
  String desc;
  int type;

  factory Verify.fromJson(Map<String, dynamic> json) => Verify(
        role: json["role"],
        desc: json["desc"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "role": role,
        "desc": desc,
        "type": type,
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
