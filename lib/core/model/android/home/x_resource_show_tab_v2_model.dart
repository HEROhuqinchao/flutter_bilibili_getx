// To parse this JSON data, do
//
//     final xResourceShowTabV2Model = xResourceShowTabV2ModelFromJson(jsonString);

import 'dart:convert';

XResourceShowTabV2Model? xResourceShowTabV2ModelFromJson(String str) => XResourceShowTabV2Model.fromJson(json.decode(str));

String xResourceShowTabV2ModelToJson(XResourceShowTabV2Model? data) => json.encode(data!.toJson());

class XResourceShowTabV2Model {
  XResourceShowTabV2Model({
    this.code,
    this.config,
    this.data,
    this.message,
  });

  int? code;
  Config? config;
  Data? data;
  String? message;

  factory XResourceShowTabV2Model.fromJson(Map<String, dynamic> json) => XResourceShowTabV2Model(
    code: json["code"],
    config: json["config"],
    data: json["data"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "config": config,
    "data": data,
    "message": message,
  };
}

class Config {
  Config({
    this.noLoginAvatar,
    this.noLoginAvatarType,
    this.popupStyle,
    this.searchEntrance,
    this.tabSimplify,
  });

  String? noLoginAvatar;
  int? noLoginAvatarType;
  int? popupStyle;
  int? searchEntrance;
  bool? tabSimplify;

  factory Config.fromJson(Map<String, dynamic> json) => Config(
    noLoginAvatar: json["no_login_avatar"],
    noLoginAvatarType: json["no_login_avatar_type"],
    popupStyle: json["popup_style"],
    searchEntrance: json["search_entrance"],
    tabSimplify: json["tab_simplify"],
  );

  Map<String, dynamic> toJson() => {
    "no_login_avatar": noLoginAvatar,
    "no_login_avatar_type": noLoginAvatarType,
    "popup_style": popupStyle,
    "search_entrance": searchEntrance,
    "tab_simplify": tabSimplify,
  };
}

class Data {
  Data({
    this.tab,
    this.top,
    this.bottom,
    this.topMore,
    this.topLeft,
  });

  List<Tab?>? tab;
  List<Top?>? top;
  List<Bottom?>? bottom;
  List<TopMore?>? topMore;
  TopLeft? topLeft;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    tab: json["tab"] == null ? [] : json["tab"] == null ? [] : List<Tab?>.from(json["tab"]!.map((x) => Tab.fromJson(x))),
    top: json["top"] == null ? [] : json["top"] == null ? [] : List<Top?>.from(json["top"]!.map((x) => Top.fromJson(x))),
    bottom: json["bottom"] == null ? [] : json["bottom"] == null ? [] : List<Bottom?>.from(json["bottom"]!.map((x) => Bottom.fromJson(x))),
    topMore: json["top_more"] == null ? [] : json["top_more"] == null ? [] : List<TopMore?>.from(json["top_more"]!.map((x) => TopMore.fromJson(x))),
    topLeft: json["top_left"],
  );

  Map<String, dynamic> toJson() => {
    "tab": tab == null ? [] : tab == null ? [] : List<dynamic>.from(tab!.map((x) => x!.toJson())),
    "top": top == null ? [] : top == null ? [] : List<dynamic>.from(top!.map((x) => x!.toJson())),
    "bottom": bottom == null ? [] : bottom == null ? [] : List<dynamic>.from(bottom!.map((x) => x!.toJson())),
    "top_more": topMore == null ? [] : topMore == null ? [] : List<dynamic>.from(topMore!.map((x) => x!.toJson())),
    "top_left": topLeft,
  };
}

class Bottom {
  Bottom({
    this.id,
    this.icon,
    this.iconSelected,
    this.name,
    this.uri,
    this.tabId,
    this.pos,
    this.dialogItems,
    this.type,
    this.publishBubble,
  });

  int? id;
  String? icon;
  String? iconSelected;
  String? name;
  String? uri;
  String? tabId;
  int? pos;
  List<TopMore?>? dialogItems;
  int? type;
  List<PublishBubble?>? publishBubble;

  factory Bottom.fromJson(Map<String, dynamic> json) => Bottom(
    id: json["id"],
    icon: json["icon"],
    iconSelected: json["icon_selected"],
    name: json["name"],
    uri: json["uri"],
    tabId: json["tab_id"],
    pos: json["pos"],
    dialogItems: json["dialog_items"] == null ? [] : json["dialog_items"] == null ? [] : List<TopMore?>.from(json["dialog_items"]!.map((x) => TopMore.fromJson(x))),
    type: json["type"],
    publishBubble: json["publish_bubble"] == null ? [] : json["publish_bubble"] == null ? [] : List<PublishBubble?>.from(json["publish_bubble"]!.map((x) => PublishBubble.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "icon": icon,
    "icon_selected": iconSelected,
    "name": name,
    "uri": uri,
    "tab_id": tabId,
    "pos": pos,
    "dialog_items": dialogItems == null ? [] : dialogItems == null ? [] : List<dynamic>.from(dialogItems!.map((x) => x!.toJson())),
    "type": type,
    "publish_bubble": publishBubble == null ? [] : publishBubble == null ? [] : List<dynamic>.from(publishBubble!.map((x) => x!.toJson())),
  };
}

class TopMore {
  TopMore({
    this.id,
    this.name,
    this.icon,
    this.uri,
    this.pos,
  });

  int? id;
  String? name;
  String? icon;
  String? uri;
  int? pos;

  factory TopMore.fromJson(Map<String, dynamic> json) => TopMore(
    id: json["id"],
    name: json["name"],
    icon: json["icon"],
    uri: json["uri"],
    pos: json["pos"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "icon": icon,
    "uri": uri,
    "pos": pos,
  };
}

class PublishBubble {
  PublishBubble({
    this.id,
    this.url,
    this.icon,
    this.stime,
    this.etime,
  });

  int? id;
  String? url;
  String? icon;
  int? stime;
  int? etime;

  factory PublishBubble.fromJson(Map<String, dynamic> json) => PublishBubble(
    id: json["id"],
    url: json["url"],
    icon: json["icon"],
    stime: json["stime"],
    etime: json["etime"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "url": url,
    "icon": icon,
    "stime": stime,
    "etime": etime,
  };
}

class Tab {
  Tab({
    this.id,
    this.name,
    this.uri,
    this.tabId,
    this.pos,
    this.defaultSelected,
    this.color,
  });

  int? id;
  String? name;
  String? uri;
  String? tabId;
  int? pos;
  int? defaultSelected;
  String? color;

  factory Tab.fromJson(Map<String, dynamic> json) => Tab(
    id: json["id"],
    name: json["name"],
    uri: json["uri"],
    tabId: json["tab_id"],
    pos: json["pos"],
    defaultSelected: json["default_selected"],
    color: json["color"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "uri": uri,
    "tab_id": tabId,
    "pos": pos,
    "default_selected": defaultSelected,
    "color": color,
  };
}

class Top {
  Top({
    this.id,
    this.icon,
    this.name,
    this.uri,
    this.tabId,
    this.pos,
  });

  int? id;
  String? icon;
  String? name;
  String? uri;
  String? tabId;
  int? pos;

  factory Top.fromJson(Map<String, dynamic> json) => Top(
    id: json["id"],
    icon: json["icon"],
    name: json["name"],
    uri: json["uri"],
    tabId: json["tab_id"],
    pos: json["pos"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "icon": icon,
    "name": name,
    "uri": uri,
    "tab_id": tabId,
    "pos": pos,
  };
}

class TopLeft {
  TopLeft({
    this.exp,
    this.headTag,
    this.url,
    this.goto,
    this.storyBackgroundImage,
    this.storyForegroundImage,
    this.listenBackgroundImage,
    this.listenForegroundImage,
  });

  int? exp;
  String? headTag;
  String? url;
  int? goto;
  String? storyBackgroundImage;
  String? storyForegroundImage;
  String? listenBackgroundImage;
  String? listenForegroundImage;

  factory TopLeft.fromJson(Map<String, dynamic> json) => TopLeft(
    exp: json["exp"],
    headTag: json["head_tag"],
    url: json["url"],
    goto: json["goto"],
    storyBackgroundImage: json["story_background_image"],
    storyForegroundImage: json["story_foreground_image"],
    listenBackgroundImage: json["listen_background_image"],
    listenForegroundImage: json["listen_foreground_image"],
  );

  Map<String, dynamic> toJson() => {
    "exp": exp,
    "head_tag": headTag,
    "url": url,
    "goto": goto,
    "story_background_image": storyBackgroundImage,
    "story_foreground_image": storyForegroundImage,
    "listen_background_image": listenBackgroundImage,
    "listen_foreground_image": listenForegroundImage,
  };
}