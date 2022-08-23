// To parse this JSON data, do
//
//     final hySearchResultModel = hySearchResultModelFromJson(jsonString);

import 'dart:convert';

HYSearchResultModel hySearchResultModelFromJson(String str) =>
    HYSearchResultModel.fromJson(json.decode(str));

// String hySearchResultModelToJson(HYSearchResultModel data) => json.encode(data.toJson());

class HYSearchResultModel {
  HYSearchResultModel({
    required this.code,
    required this.message,
    required this.ttl,
    required this.data,
  });

  int code;
  String message;
  int ttl;
  SearchResultData data;

  factory HYSearchResultModel.fromJson(Map<String, dynamic> json) =>
      HYSearchResultModel(
        code: json["code"],
        message: json["message"],
        ttl: json["ttl"],
        data: SearchResultData.fromJson(json["data"]),
      );

// Map<String, dynamic> toJson() => {
//   "code": code,
//   "message": message,
//   "ttl": ttl,
//   "data": data.toJson(),
// };
}

class SearchResultData {
  SearchResultData({
    required this.trackid,
    required this.page,
    required this.nav,
    required this.items,
    required this.item,
    required this.array,
    required this.attribute,
    required this.expStr,
    required this.keyword,
    required this.selectBarType,
    required this.appDisplayOption,
  });

  String trackid;
  int page;
  List<Nav> nav;
  AppDisplayOption items;
  List<SearchResultDataItem>? item;
  int array;
  int attribute;
  String expStr;
  String keyword;
  int selectBarType;
  AppDisplayOption appDisplayOption;

  factory SearchResultData.fromJson(Map<String, dynamic> json) =>
      SearchResultData(
        trackid: json["trackid"],
        page: json["page"],
        nav: List<Nav>.from(json["nav"].map((x) => Nav.fromJson(x))),
        items: AppDisplayOption.fromJson(json["items"]),
        item: List<SearchResultDataItem>.from(
            json["item"].map((x) => SearchResultDataItem.fromJson(x))),
        array: json["array"],
        attribute: json["attribute"],
        expStr: json["exp_str"],
        keyword: json["keyword"],
        selectBarType: json["select_bar_type"],
        appDisplayOption: AppDisplayOption.fromJson(json["app_display_option"]),
      );

// Map<String, dynamic> toJson() => {
//   "trackid": trackid,
//   "page": page,
//   "nav": List<dynamic>.from(nav.map((x) => x.toJson())),
//   "items": items.toJson(),
//   "item": List<dynamic>.from(item.map((x) => x.toJson())),
//   "array": array,
//   "attribute": attribute,
//   "exp_str": expStr,
//   "keyword": keyword,
//   "select_bar_type": selectBarType,
//   "app_display_option": appDisplayOption.toJson(),
// };
}

class AppDisplayOption {
  AppDisplayOption();

  factory AppDisplayOption.fromJson(Map<String, dynamic> json) =>
      AppDisplayOption();

  Map<String, dynamic> toJson() => {};
}

class SearchResultDataItem {
  SearchResultDataItem({
    required this.trackid,
    required this.linktype,
    required this.position,
    required this.title,
    required this.cover,
    required this.param,
    required this.goto,
    required this.id,
    required this.items,
    required this.matchTop,
    required this.matchBottom,
    required this.uri,
    required this.sharePlane,
    required this.sign,
    required this.fans,
    required this.level,
    required this.officialVerify,
    required this.vip,
    required this.isSeniorMember,
    required this.avItems,
    required this.isUp,
    required this.liveUri,
    required this.archives,
    required this.roomid,
    required this.mid,
    required this.liveLink,
    required this.relation,
    required this.liveStatus,
    required this.play,
    required this.danmaku,
    required this.author,
    required this.ptime,
    required this.showCardDesc2,
    required this.duration,
    required this.face,
    required this.threePoint,
    required this.share,
    required this.typeIcon,
    required this.channelLabel1,
    required this.channelLabel2,
    required this.channelButton,
    required this.designType,
    required this.name,
    required this.type,
    required this.attentions,
    required this.region,
    required this.online,
    required this.badge,
    required this.cardLeftIcon,
    required this.cardLeftText,
    required this.seasonId,
    required this.seasonType,
    required this.seasonTypeName,
    required this.mediaType,
    required this.style,
    required this.styles,
    required this.cv,
    required this.rating,
    required this.vote,
    required this.area,
    required this.staff,
    required this.isSelection,
    required this.episodes,
    required this.label,
    required this.watchButton,
    required this.followButton,
    required this.selectionStyle,
    required this.episodesNew,
    required this.score,
    required this.tags,
  });

  String trackid;
  String linktype;
  int position;
  String title;
  String cover;
  String param;
  String goto;
  int? id;
  List<ItemItem>? items;
  ChannelButton? matchTop;
  ChannelButton? matchBottom;
  String? uri;
  SharePlane? sharePlane;
  String? sign;
  int? fans;
  int? level;
  OfficialVerify? officialVerify;
  Vip? vip;
  int? isSeniorMember;
  List<AvItem>? avItems;
  bool? isUp;
  String? liveUri;
  int? archives;
  int? roomid;
  int? mid;
  String? liveLink;
  Relation? relation;
  int? liveStatus;
  int? play;
  int? danmaku;
  String? author;
  int? ptime;
  String? showCardDesc2;
  String? duration;
  String? face;
  List<ThreePoint>? threePoint;
  Share? share;
  String? typeIcon;
  ChannelButton? channelLabel1;
  ChannelButton? channelLabel2;
  ChannelButton? channelButton;
  String? designType;
  String? name;
  String? type;
  int? attentions;
  int? region;
  int? online;
  String? badge;
  int? cardLeftIcon;
  String? cardLeftText;
  int? seasonId;
  int? seasonType;
  String? seasonTypeName;
  int? mediaType;
  String? style;
  String? styles;
  String? cv;
  double? rating;
  int? vote;
  String? area;
  String? staff;
  int? isSelection;
  List<Episode>? episodes;
  String? label;
  WatchButton? watchButton;
  FollowButton? followButton;
  String? selectionStyle;
  List<EpisodesNew>? episodesNew;
  String? score;
  String? tags;

  factory SearchResultDataItem.fromJson(Map<String, dynamic> json) =>
      SearchResultDataItem(
        trackid: json["trackid"],
        linktype: json["linktype"],
        position: json["position"],
        title: json["title"],
        cover: json["cover"],
        param: json["param"],
        goto: json["goto"],
        id: json["id"] == null ? null : json["id"],
        items: json["items"] == null
            ? null
            : List<ItemItem>.from(
                json["items"].map((x) => ItemItem.fromJson(x))),
        matchTop: json["match_top"] == null
            ? null
            : ChannelButton.fromJson(json["match_top"]),
        matchBottom: json["match_bottom"] == null
            ? null
            : ChannelButton.fromJson(json["match_bottom"]),
        uri: json["uri"] == null ? null : json["uri"],
        sharePlane: json["share_plane"] == null
            ? null
            : SharePlane.fromJson(json["share_plane"]),
        sign: json["sign"] == null ? null : json["sign"],
        fans: json["fans"] == null ? null : json["fans"],
        level: json["level"] == null ? null : json["level"],
        officialVerify: json["official_verify"] == null
            ? null
            : OfficialVerify.fromJson(json["official_verify"]),
        vip: json["vip"] == null ? null : Vip.fromJson(json["vip"]),
        isSeniorMember:
            json["is_senior_member"] == null ? null : json["is_senior_member"],
        avItems: json["av_items"] == null
            ? null
            : List<AvItem>.from(
                json["av_items"].map((x) => AvItem.fromJson(x))),
        isUp: json["is_up"] == null ? null : json["is_up"],
        liveUri: json["live_uri"] == null ? null : json["live_uri"],
        archives: json["archives"] == null ? null : json["archives"],
        roomid: json["roomid"] == null ? null : json["roomid"],
        mid: json["mid"] == null ? null : json["mid"],
        liveLink: json["live_link"] == null ? null : json["live_link"],
        relation: json["relation"] == null
            ? null
            : Relation.fromJson(json["relation"]),
        liveStatus: json["live_status"] == null ? null : json["live_status"],
        play: json["play"] == null ? 0 : json["play"],
        danmaku: json["danmaku"] == null ? null : json["danmaku"],
        author: json["author"] == null ? null : json["author"],
        ptime: json["ptime"] == null ? null : json["ptime"],
        showCardDesc2:
            json["show_card_desc_2"] == null ? null : json["show_card_desc_2"],
        duration: json["duration"] == null ? null : json["duration"],
        face: json["face"] == null ? null : json["face"],
        threePoint: json["three_point"] == null
            ? null
            : List<ThreePoint>.from(
                json["three_point"].map((x) => ThreePoint.fromJson(x))),
        share: json["share"] == null ? null : Share.fromJson(json["share"]),
        typeIcon: json["type_icon"] == null ? null : json["type_icon"],
        channelLabel1: json["channel_label1"] == null
            ? null
            : ChannelButton.fromJson(json["channel_label1"]),
        channelLabel2: json["channel_label2"] == null
            ? null
            : ChannelButton.fromJson(json["channel_label2"]),
        channelButton: json["channel_button"] == null
            ? null
            : ChannelButton.fromJson(json["channel_button"]),
        designType: json["design_type"] == null ? null : json["design_type"],
        name: json["name"] == null ? null : json["name"],
        type: json["type"] == null ? null : json["type"],
        attentions: json["attentions"] == null ? null : json["attentions"],
        region: json["region"] == null ? null : json["region"],
        online: json["online"] == null ? null : json["online"],
        badge: json["badge"] == null ? null : json["badge"],
        cardLeftIcon:
            json["card_left_icon"] == null ? null : json["card_left_icon"],
        cardLeftText:
            json["card_left_text"] == null ? null : json["card_left_text"],
        seasonId: json["season_id"] == null ? null : json["season_id"],
        seasonType: json["season_type"] == null ? null : json["season_type"],
        seasonTypeName:
            json["season_type_name"] == null ? null : json["season_type_name"],
        mediaType: json["media_type"] == null ? null : json["media_type"],
        style: json["style"] == null ? null : json["style"],
        styles: json["styles"] == null ? null : json["styles"],
        cv: json["cv"] == null ? null : json["cv"],
        rating: json["rating"] == null ? null : json["rating"].toDouble(),
        vote: json["vote"] == null ? null : json["vote"],
        area: json["area"] == null ? null : json["area"],
        staff: json["staff"] == null ? null : json["staff"],
        isSelection: json["is_selection"] == null ? null : json["is_selection"],
        episodes: json["episodes"] == null
            ? null
            : List<Episode>.from(
                json["episodes"].map((x) => Episode.fromJson(x))),
        label: json["label"] == null ? null : json["label"],
        watchButton: json["watch_button"] == null
            ? null
            : WatchButton.fromJson(json["watch_button"]),
        followButton: json["follow_button"] == null
            ? null
            : FollowButton.fromJson(json["follow_button"]),
        selectionStyle:
            json["selection_style"] == null ? null : json["selection_style"],
        episodesNew: json["episodes_new"] == null
            ? null
            : List<EpisodesNew>.from(
                json["episodes_new"].map((x) => EpisodesNew.fromJson(x))),
        score: json["score"] == null ? null : json["score"],
        tags: json["tags"] == null ? null : json["tags"],
      );

// Map<String, dynamic> toJson() => {
//   "trackid": trackid,
//   "linktype": linktype,
//   "position": position,
//   "title": title,
//   "cover": cover,
//   "param": param,
//   "goto": goto,
//   "id": id == null ? null : id,
//   "items": items == null ? null : List<dynamic>.from(items!.map((x) => x.toJson())),
//   "match_top": matchTop == null ? null : matchTop!.toJson(),
//   "match_bottom": matchBottom == null ? null : matchBottom!.toJson(),
//   "uri": uri == null ? null : uri,
//   "share_plane": sharePlane == null ? null : sharePlane!.toJson(),
//   "sign": sign == null ? null : sign,
//   "fans": fans == null ? null : fans,
//   "level": level == null ? null : level,
//   "official_verify": officialVerify == null ? null : officialVerify!.toJson(),
//   "vip": vip == null ? null : vip!.toJson(),
//   "is_senior_member": isSeniorMember == null ? null : isSeniorMember,
//   "av_items": avItems == null ? null : List<dynamic>.from(avItems!.map((x) => x.toJson())),
//   "is_up": isUp == null ? null : isUp,
//   "live_uri": liveUri == null ? null : liveUri,
//   "archives": archives == null ? null : archives,
//   "roomid": roomid == null ? null : roomid,
//   "mid": mid == null ? null : mid,
//   "live_link": liveLink == null ? null : liveLink,
//   "relation": relation == null ? null : relation!.toJson(),
//   "live_status": liveStatus == null ? null : liveStatus,
//   "play": play == null ? null : play,
//   "danmaku": danmaku == null ? null : danmaku,
//   "author": author == null ? null : author,
//   "ptime": ptime == null ? null : ptime,
//   "show_card_desc_2": showCardDesc2 == null ? null : showCardDesc2,
//   "duration": duration == null ? null : duration,
//   "face": face == null ? null : face,
//   "three_point": threePoint == null ? null : List<dynamic>.from(threePoint!.map((x) => x.toJson())),
//   "share": share == null ? null : share!.toJson(),
//   "type_icon": typeIcon == null ? null : typeIcon,
//   "channel_label1": channelLabel1 == null ? null : channelLabel1!.toJson(),
//   "channel_label2": channelLabel2 == null ? null : channelLabel2!.toJson(),
//   "channel_button": channelButton == null ? null : channelButton!.toJson(),
//   "design_type": designType == null ? null : designType,
//   "name": name == null ? null : name,
//   "type": type == null ? null : type,
//   "attentions": attentions == null ? null : attentions,
//   "region": region == null ? null : region,
//   "online": online == null ? null : online,
//   "badge": badge == null ? null : badge,
//   "card_left_icon": cardLeftIcon == null ? null : cardLeftIcon,
//   "card_left_text": cardLeftText == null ? null : cardLeftText,
//   "season_id": seasonId == null ? null : seasonId,
//   "season_type": seasonType == null ? null : seasonType,
//   "season_type_name": seasonTypeName == null ? null : seasonTypeName,
//   "media_type": mediaType == null ? null : mediaType,
//   "style": style == null ? null : style,
//   "styles": styles == null ? null : styles,
//   "cv": cv == null ? null : cv,
//   "rating": rating == null ? null : rating,
//   "vote": vote == null ? null : vote,
//   "area": area == null ? null : area,
//   "staff": staff == null ? null : staff,
//   "is_selection": isSelection == null ? null : isSelection,
//   "episodes": episodes == null ? null : List<dynamic>.from(episodes!.map((x) => x.toJson())),
//   "label": label == null ? null : label,
//   "watch_button": watchButton == null ? null : watchButton!.toJson(),
//   "follow_button": followButton == null ? null : followButton!.toJson(),
//   "selection_style": selectionStyle == null ? null : selectionStyle,
//   "episodes_new": episodesNew == null ? null : List<dynamic>.from(episodesNew!.map((x) => x.toJson())),
//   "score": score == null ? null : score,
//   "tags": tags == null ? null : tags,
// };
}

class AvItem {
  AvItem({
    required this.position,
    required this.title,
    required this.cover,
    required this.uri,
    required this.param,
    required this.goto,
    required this.play,
    required this.danmaku,
    required this.ctime,
    required this.ctimeLabel,
    required this.duration,
    required this.badges,
  });

  int position;
  String title;
  String cover;
  String uri;
  String param;
  String goto;
  int play;
  int? danmaku;
  int ctime;
  String ctimeLabel;
  String duration;
  List<Badge>? badges;

  factory AvItem.fromJson(Map<String, dynamic> json) => AvItem(
        position: json["position"],
        title: json["title"],
        cover: json["cover"],
        uri: json["uri"],
        param: json["param"],
        goto: json["goto"],
        play: json["play"],
        danmaku: json["danmaku"],
        ctime: json["ctime"],
        ctimeLabel: json["ctime_label"],
        duration: json["duration"],
        badges: json["badges"] == null
            ? null
            : List<Badge>.from(json["badges"].map((x) => Badge.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "position": position,
        "title": title,
        "cover": cover,
        "uri": uri,
        "param": param,
        "goto": goto,
        "play": play,
        "danmaku": danmaku,
        "ctime": ctime,
        "ctime_label": ctimeLabel,
        "duration": duration,
        "badges": badges == null
            ? null
            : List<dynamic>.from(badges!.map((x) => x.toJson())),
      };
}

class Badge {
  Badge({
    required this.text,
    required this.textColor,
    required this.textColorNight,
    required this.bgColor,
    required this.bgColorNight,
    required this.borderColor,
    required this.borderColorNight,
    required this.bgStyle,
  });

  String text;
  String textColor;
  String textColorNight;
  String bgColor;
  String bgColorNight;
  String borderColor;
  String borderColorNight;
  int bgStyle;

  factory Badge.fromJson(Map<String, dynamic> json) => Badge(
        text: json["text"],
        textColor: json["text_color"],
        textColorNight: json["text_color_night"],
        bgColor: json["bg_color"],
        bgColorNight: json["bg_color_night"],
        borderColor: json["border_color"],
        borderColorNight: json["border_color_night"],
        bgStyle: json["bg_style"],
      );

  Map<String, dynamic> toJson() => {
        "text": text,
        "text_color": textColor,
        "text_color_night": textColorNight,
        "bg_color": bgColor,
        "bg_color_night": bgColorNight,
        "border_color": borderColor,
        "border_color_night": borderColorNight,
        "bg_style": bgStyle,
      };
}

class ChannelButton {
  ChannelButton({
    required this.text,
    required this.uri,
  });

  String text;
  String uri;

  factory ChannelButton.fromJson(Map<String, dynamic> json) => ChannelButton(
        text: json["text"],
        uri: json["uri"],
      );

  Map<String, dynamic> toJson() => {
        "text": text,
        "uri": uri,
      };
}

class Episode {
  Episode({
    required this.position,
    required this.uri,
    required this.param,
    required this.index,
  });

  int position;
  String uri;
  String param;
  String index;

  factory Episode.fromJson(Map<String, dynamic> json) => Episode(
        position: json["position"],
        uri: json["uri"],
        param: json["param"],
        index: json["index"],
      );

  Map<String, dynamic> toJson() => {
        "position": position,
        "uri": uri,
        "param": param,
        "index": index,
      };
}

class EpisodesNew {
  EpisodesNew({
    required this.title,
    required this.uri,
    required this.param,
    required this.isNew,
    required this.position,
  });

  String title;
  String uri;
  String param;
  int isNew;
  int position;

  factory EpisodesNew.fromJson(Map<String, dynamic> json) => EpisodesNew(
        title: json["title"],
        uri: json["uri"],
        param: json["param"],
        isNew: json["is_new"],
        position: json["position"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "uri": uri,
        "param": param,
        "is_new": isNew,
        "position": position,
      };
}

class FollowButton {
  FollowButton({
    required this.icon,
    required this.texts,
    required this.statusReport,
  });

  String icon;
  Map<String, String> texts;
  String statusReport;

  factory FollowButton.fromJson(Map<String, dynamic> json) => FollowButton(
        icon: json["icon"],
        texts: Map.from(json["texts"])
            .map((k, v) => MapEntry<String, String>(k, v)),
        statusReport: json["status_report"],
      );

  Map<String, dynamic> toJson() => {
        "icon": icon,
        "texts": Map.from(texts).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "status_report": statusReport,
      };
}

class ItemItem {
  ItemItem({
    required this.param,
    required this.status,
    required this.id,
    required this.team1,
    required this.team2,
    required this.matchTime,
    required this.matchStage,
    required this.matchButton,
    required this.matchLabel,
    required this.title,
    required this.cover,
    required this.uri,
    required this.goto,
    required this.coverLeftText1,
  });

  String param;
  int? status;
  int id;
  Team? team1;
  Team? team2;
  MatchTime? matchTime;
  String? matchStage;
  MatchButton? matchButton;
  MatchLabel? matchLabel;
  String? title;
  String? cover;
  String? uri;
  String? goto;
  String? coverLeftText1;

  factory ItemItem.fromJson(Map<String, dynamic> json) => ItemItem(
        param: json["param"],
        status: json["status"] == null ? null : json["status"],
        id: json["id"],
        team1: json["team_1"] == null ? null : Team.fromJson(json["team_1"]),
        team2: json["team_2"] == null ? null : Team.fromJson(json["team_2"]),
        matchTime: json["match_time"] == null
            ? null
            : MatchTime.fromJson(json["match_time"]),
        matchStage: json["match_stage"] == null ? null : json["match_stage"],
        matchButton: json["match_button"] == null
            ? null
            : MatchButton.fromJson(json["match_button"]),
        matchLabel: json["match_label"] == null
            ? null
            : MatchLabel.fromJson(json["match_label"]),
        title: json["title"] == null ? null : json["title"],
        cover: json["cover"] == null ? null : json["cover"],
        uri: json["uri"] == null ? null : json["uri"],
        goto: json["goto"],
        coverLeftText1: json["cover_left_text_1"],
      );

// Map<String, dynamic> toJson() => {
//   "param": param,
//   "status": status == null ? null : status,
//   "id": id,
//   "team_1": team1 == null ? null : team1!.toJson(),
//   "team_2": team2 == null ? null : team2!.toJson(),
//   "match_time": matchTime == null ? null : matchTime!.toJson(),
//   "match_stage": matchStage == null ? null : matchStage,
//   "match_button": matchButton == null ? null : matchButton!.toJson(),
//   "match_label": matchLabel == null ? null : matchLabel!.toJson(),
//   "title": title == null ? null : title,
//   "cover": cover == null ? null : cover,
//   "uri": uri == null ? null : uri,
//   "goto": goto == null ? null : gotoValues.reverse[goto],
// };
}

class MatchButton {
  MatchButton({
    required this.state,
    required this.text,
    required this.uri,
    required this.texts,
  });

  int state;
  String text;
  String uri;
  Texts? texts;

  factory MatchButton.fromJson(Map<String, dynamic> json) => MatchButton(
        state: json["state"],
        text: json["text"],
        uri: json["uri"],
        texts: json["texts"] == null ? null : Texts.fromJson(json["texts"]),
      );

  Map<String, dynamic> toJson() => {
        "state": state,
        "text": text,
        "uri": uri,
        "texts": texts == null ? null : texts!.toJson(),
      };
}

class Texts {
  Texts({
    required this.bookingText,
    required this.unbookingText,
  });

  String bookingText;
  String unbookingText;

  factory Texts.fromJson(Map<String, dynamic> json) => Texts(
        bookingText: json["booking_text"],
        unbookingText: json["unbooking_text"],
      );

  Map<String, dynamic> toJson() => {
        "booking_text": bookingText,
        "unbooking_text": unbookingText,
      };
}

class MatchLabel {
  MatchLabel({
    required this.text,
    required this.textColor,
    required this.textColorNight,
  });

  String text;
  String textColor;
  String textColorNight;

  factory MatchLabel.fromJson(Map<String, dynamic> json) => MatchLabel(
        text: json["text"],
        textColor: json["text_color"],
        textColorNight: json["text_color_night"],
      );

  Map<String, dynamic> toJson() => {
        "text": text,
        "text_color": textColor,
        "text_color_night": textColorNight,
      };
}

class MatchTime {
  MatchTime({
    required this.text,
  });

  String text;

  factory MatchTime.fromJson(Map<String, dynamic> json) => MatchTime(
        text: json["text"],
      );

  Map<String, dynamic> toJson() => {
        "text": text,
      };
}

class Team {
  Team({
    required this.id,
    required this.title,
    required this.cover,
    required this.score,
  });

  int id;
  String title;
  String cover;
  int? score;

  factory Team.fromJson(Map<String, dynamic> json) => Team(
        id: json["id"],
        title: json["title"],
        cover: json["cover"],
        score: json["score"] == null ? null : json["score"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "cover": cover,
        "score": score == null ? null : score,
      };
}

class OfficialVerify {
  OfficialVerify({
    required this.type,
    required this.desc,
  });

  int type;
  String? desc;

  factory OfficialVerify.fromJson(Map<String, dynamic> json) => OfficialVerify(
        type: json["type"],
        desc: json["desc"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "desc": desc,
      };
}

class Relation {
  Relation({
    required this.status,
  });

  int status;

  factory Relation.fromJson(Map<String, dynamic> json) => Relation(
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
      };
}

class Share {
  Share({
    required this.type,
    required this.video,
  });

  String? type;
  Video video;

  factory Share.fromJson(Map<String, dynamic> json) => Share(
        type: json["type"],
        video: Video.fromJson(json["video"]),
      );

// Map<String, dynamic> toJson() => {
//   "type": shareTypeValues.reverse[type],
//   "video": video.toJson(),
// };
}

class Video {
  Video({
    required this.bvid,
    required this.cid,
    required this.shareSubtitle,
    required this.isHotLabel,
    required this.page,
    required this.pageCount,
    required this.shortLink,
  });

  String bvid;
  int cid;
  String? shareSubtitle;
  bool isHotLabel;
  int page;
  int pageCount;
  String shortLink;

  factory Video.fromJson(Map<String, dynamic> json) => Video(
        bvid: json["bvid"],
        cid: json["cid"],
        shareSubtitle: json["share_subtitle"],
        isHotLabel: json["is_hot_label"],
        page: json["page"],
        pageCount: json["page_count"],
        shortLink: json["short_link"],
      );

// Map<String, dynamic> toJson() => {
//   "bvid": bvid,
//   "cid": cid,
//   "share_subtitle": shareSubtitleValues.reverse[shareSubtitle],
//   "is_hot_label": isHotLabel,
//   "page": page,
//   "page_count": pageCount,
//   "short_link": shortLink,
// };
}

class SharePlane {
  SharePlane({
    required this.title,
    required this.shareSubtitle,
    required this.shortLink,
    required this.authorFace,
  });

  String title;
  String shareSubtitle;
  String shortLink;
  String authorFace;

  factory SharePlane.fromJson(Map<String, dynamic> json) => SharePlane(
        title: json["title"],
        shareSubtitle: json["share_subtitle"],
        shortLink: json["short_link"],
        authorFace: json["author_face"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "share_subtitle": shareSubtitle,
        "short_link": shortLink,
        "author_face": authorFace,
      };
}

class ThreePoint {
  ThreePoint({
    required this.type,
    required this.icon,
    required this.title,
  });

  String? type;
  String icon;
  String? title;

  factory ThreePoint.fromJson(Map<String, dynamic> json) => ThreePoint(
        type: json["type"],
        icon: json["icon"],
        title: json["title"],
      );

// Map<String, dynamic> toJson() => {
//   "type": threePointTypeValues.reverse[type],
//   "icon": icon,
//   "title": titleValues.reverse[title],
// };
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
    required this.tvVipStatus,
    required this.tvVipPayType,
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
  int tvVipStatus;
  int tvVipPayType;

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
        tvVipStatus: json["tv_vip_status"],
        tvVipPayType: json["tv_vip_pay_type"],
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
        "tv_vip_status": tvVipStatus,
        "tv_vip_pay_type": tvVipPayType,
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
    required this.useImgLabel,
    required this.imgLabelUriHans,
    required this.imgLabelUriHant,
    required this.imgLabelUriHansStatic,
    required this.imgLabelUriHantStatic,
  });

  String path;
  String text;
  String labelTheme;
  String textColor;
  int bgStyle;
  String bgColor;
  String borderColor;
  bool useImgLabel;
  String imgLabelUriHans;
  String imgLabelUriHant;
  String imgLabelUriHansStatic;
  String imgLabelUriHantStatic;

  factory Label.fromJson(Map<String, dynamic> json) => Label(
        path: json["path"],
        text: json["text"],
        labelTheme: json["label_theme"],
        textColor: json["text_color"],
        bgStyle: json["bg_style"],
        bgColor: json["bg_color"],
        borderColor: json["border_color"],
        useImgLabel: json["use_img_label"],
        imgLabelUriHans: json["img_label_uri_hans"],
        imgLabelUriHant: json["img_label_uri_hant"],
        imgLabelUriHansStatic: json["img_label_uri_hans_static"],
        imgLabelUriHantStatic: json["img_label_uri_hant_static"],
      );

  Map<String, dynamic> toJson() => {
        "path": path,
        "text": text,
        "label_theme": labelTheme,
        "text_color": textColor,
        "bg_style": bgStyle,
        "bg_color": bgColor,
        "border_color": borderColor,
        "use_img_label": useImgLabel,
        "img_label_uri_hans": imgLabelUriHans,
        "img_label_uri_hant": imgLabelUriHant,
        "img_label_uri_hans_static": imgLabelUriHansStatic,
        "img_label_uri_hant_static": imgLabelUriHantStatic,
      };
}

class WatchButton {
  WatchButton({
    required this.title,
    required this.link,
  });

  String title;
  String link;

  factory WatchButton.fromJson(Map<String, dynamic> json) => WatchButton(
        title: json["title"],
        link: json["link"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "link": link,
      };
}

class Nav {
  Nav({
    required this.name,
    required this.total,
    required this.pages,
    required this.type,
  });

  String name;
  int total;
  int pages;
  int type;

  factory Nav.fromJson(Map<String, dynamic> json) => Nav(
        name: json["name"],
        total: json["total"],
        pages: json["pages"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "total": total,
        "pages": pages,
        "type": type,
      };
}
