// To parse this JSON data, do
//
//     final hySpaceNavnumModel = hySpaceNavnumModelFromJson(jsonString);

import 'dart:convert';

HYSpaceNavNumModel hySpaceNavnumModelFromJson(String str) => HYSpaceNavNumModel.fromJson(json.decode(str));

String hySpaceNavnumModelToJson(HYSpaceNavNumModel data) => json.encode(data.toJson());

class HYSpaceNavNumModel {
  HYSpaceNavNumModel({
    required this.code,
    required this.message,
    required this.ttl,
    required this.data,
  });

  int code;
  String message;
  int ttl;
  Data data;

  factory HYSpaceNavNumModel.fromJson(Map<String, dynamic> json) => HYSpaceNavNumModel(
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
    required this.video,
    required this.bangumi,
    required this.cinema,
    required this.channel,
    required this.favourite,
    required this.tag,
    required this.article,
    required this.playlist,
    required this.album,
    required this.audio,
    required this.pugv,
    required this.seasonNum,
  });

  int video;
  int bangumi;
  int cinema;
  Channel channel;
  Channel favourite;
  int tag;
  int article;
  int playlist;
  int album;
  int audio;
  int pugv;
  int seasonNum;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    video: json["video"],
    bangumi: json["bangumi"],
    cinema: json["cinema"],
    channel: Channel.fromJson(json["channel"]),
    favourite: Channel.fromJson(json["favourite"]),
    tag: json["tag"],
    article: json["article"],
    playlist: json["playlist"],
    album: json["album"],
    audio: json["audio"],
    pugv: json["pugv"],
    seasonNum: json["season_num"],
  );

  Map<String, dynamic> toJson() => {
    "video": video,
    "bangumi": bangumi,
    "cinema": cinema,
    "channel": channel.toJson(),
    "favourite": favourite.toJson(),
    "tag": tag,
    "article": article,
    "playlist": playlist,
    "album": album,
    "audio": audio,
    "pugv": pugv,
    "season_num": seasonNum,
  };
}

class Channel {
  Channel({
    required this.master,
    required this.guest,
  });

  int master;
  int guest;

  factory Channel.fromJson(Map<String, dynamic> json) => Channel(
    master: json["master"],
    guest: json["guest"],
  );

  Map<String, dynamic> toJson() => {
    "master": master,
    "guest": guest,
  };
}
