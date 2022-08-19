// To parse this JSON data, do
//
//     final hyLiveRoomStreamModel = hyLiveRoomStreamModelFromJson(jsonString);

import 'dart:convert';

HYLiveRoomStreamModel hyLiveRoomStreamModelFromJson(String str) =>
    HYLiveRoomStreamModel.fromJson(json.decode(str));

String hyLiveRoomStreamModelToJson(HYLiveRoomStreamModel data) =>
    json.encode(data.toJson());

class HYLiveRoomStreamModel {
  HYLiveRoomStreamModel({
    required this.currentQuality,
    required this.acceptQuality,
    required this.currentQn,
    required this.qualityDescription,
    required this.durl,
  });

  int currentQuality;
  List<String> acceptQuality;
  int currentQn;
  List<QualityDescription> qualityDescription;
  List<Durl> durl;

  factory HYLiveRoomStreamModel.fromJson(Map<String, dynamic> json) =>
      HYLiveRoomStreamModel(
        currentQuality: json["current_quality"],
        acceptQuality: List<String>.from(json["accept_quality"].map((x) => x)),
        currentQn: json["current_qn"],
        qualityDescription: List<QualityDescription>.from(
            json["quality_description"]
                .map((x) => QualityDescription.fromJson(x))),
        durl: List<Durl>.from(json["durl"].map((x) => Durl.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "current_quality": currentQuality,
        "accept_quality": List<dynamic>.from(acceptQuality.map((x) => x)),
        "current_qn": currentQn,
        "quality_description":
            List<dynamic>.from(qualityDescription.map((x) => x.toJson())),
        "durl": List<dynamic>.from(durl.map((x) => x.toJson())),
      };
}

class Durl {
  Durl({
    required this.url,
    required this.length,
    required this.order,
    required this.streamType,
    required this.p2PType,
  });

  String url;
  int length;
  int order;
  int streamType;
  int p2PType;

  factory Durl.fromJson(Map<String, dynamic> json) => Durl(
        url: json["url"],
        length: json["length"],
        order: json["order"],
        streamType: json["stream_type"],
        p2PType: json["p2p_type"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "length": length,
        "order": order,
        "stream_type": streamType,
        "p2p_type": p2PType,
      };
}

class QualityDescription {
  QualityDescription({
    required this.qn,
    required this.desc,
  });

  int qn;
  String desc;

  factory QualityDescription.fromJson(Map<String, dynamic> json) =>
      QualityDescription(
        qn: json["qn"],
        desc: json["desc"],
      );

  Map<String, dynamic> toJson() => {
        "qn": qn,
        "desc": desc,
      };
}
