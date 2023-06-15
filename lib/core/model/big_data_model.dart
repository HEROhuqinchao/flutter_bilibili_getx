// To parse this JSON data, do
//
//     final hYBigDataModel = hYBigDataModelFromJson(jsonString);

import 'dart:convert';

HyBigDataModel hYBigDataModelFromJson(String str) =>
    HyBigDataModel.fromJson(json.decode(str));

String hYBigDataModelToJson(HyBigDataModel data) => json.encode(data.toJson());

class HyBigDataModel {
  HyBigDataModel({
    required this.addFollower,
    required this.fansRange,
    required this.justToMillionFollower,
    required this.lastMonthFollower,
    required this.lastMonthOpus,
    required this.reduceFollower,
    required this.topElectric,
    required this.topPopular,
    required this.upIndexPercent,
    required this.updateTime,
  });

  Follower addFollower;
  FansRange fansRange;
  JustToMillionFollower justToMillionFollower;
  LastMonthFollower lastMonthFollower;
  LastMonthOpus lastMonthOpus;
  Follower reduceFollower;
  List<TopElectric> topElectric;
  List<TopPopular> topPopular;
  UpIndexPercent upIndexPercent;
  DateTime updateTime;

  factory HyBigDataModel.fromJson(Map<String, dynamic> json) => HyBigDataModel(
        addFollower: Follower.fromJson(json["addFollower"]),
        fansRange: FansRange.fromJson(json["fansRange"]),
        justToMillionFollower:
            JustToMillionFollower.fromJson(json["justToMillionFollower"]),
        lastMonthFollower:
            LastMonthFollower.fromJson(json["lastMonthFollower"]),
        lastMonthOpus: LastMonthOpus.fromJson(json["lastMonthOpus"]),
        reduceFollower: Follower.fromJson(json["reduceFollower"]),
        topElectric: List<TopElectric>.from(
            json["topElectric"].map((x) => TopElectric.fromJson(x))),
        topPopular: List<TopPopular>.from(
            json["topPopular"].map((x) => TopPopular.fromJson(x))),
        upIndexPercent: UpIndexPercent.fromJson(json["upIndexPercent"]),
        updateTime: DateTime.parse(json["updateTime"]),
      );

  Map<String, dynamic> toJson() => {
        "addFollower": addFollower.toJson(),
        "fansRange": fansRange.toJson(),
        "justToMillionFollower": justToMillionFollower.toJson(),
        "lastMonthFollower": lastMonthFollower.toJson(),
        "lastMonthOpus": lastMonthOpus.toJson(),
        "reduceFollower": reduceFollower.toJson(),
        "topElectric": List<dynamic>.from(topElectric.map((x) => x.toJson())),
        "topPopular": List<dynamic>.from(topPopular.map((x) => x.toJson())),
        "upIndexPercent": upIndexPercent.toJson(),
        "updateTime": updateTime.toIso8601String(),
      };
}

class Follower {
  Follower({
    required this.reduceType,
    required this.reduceUp,
  });

  List<ReduceType> reduceType;
  List<ReduceUp> reduceUp;

  factory Follower.fromJson(Map<String, dynamic> json) => Follower(
        reduceType: List<ReduceType>.from(
            json["reduceType"].map((x) => ReduceType.fromJson(x))),
        reduceUp: List<ReduceUp>.from(
            json["reduceUp"].map((x) => ReduceUp.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "reduceType": List<dynamic>.from(reduceType.map((x) => x.toJson())),
        "reduceUp": List<dynamic>.from(reduceUp.map((x) => x.toJson())),
      };
}

class ReduceType {
  ReduceType({
    required this.docCount,
    required this.key,
    required this.percent,
  });

  String docCount;
  String key;
  String percent;

  factory ReduceType.fromJson(Map<String, dynamic> json) {
    return ReduceType(
      docCount: json["docCount"],
      key: json["key"],
      percent: json["percent"],
    );
  }

  Map<String, dynamic> toJson() => {
        "docCount": docCount,
        "key": key,
        "percent": percent,
      };
}

class ReduceUp {
  ReduceUp({
    required this.addFollowerCount,
    required this.addFollowerPercent,
    required this.face,
    required this.mid,
    required this.name,
  });

  String addFollowerCount;
  String addFollowerPercent;
  String face;
  String mid;
  String name;

  factory ReduceUp.fromJson(Map<String, dynamic> json) => ReduceUp(
        addFollowerCount: json["addFollowerCount"],
        addFollowerPercent: json["addFollowerPercent"],
        face: json["face"],
        mid: json["mid"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "addFollowerCount": addFollowerCount,
        "addFollowerPercent": addFollowerPercent,
        "face": face,
        "mid": mid,
        "name": name,
      };
}

class FansRange {
  FansRange({
    required this.avgAddFollowerCount,
    required this.avgAddFollowerPercent,
    required this.followerAreaRange,
    required this.followerRange,
    required this.mediumAddFollowerPercent,
  });

  String avgAddFollowerCount;
  String avgAddFollowerPercent;
  List<Range> followerAreaRange;
  List<Range> followerRange;
  String mediumAddFollowerPercent;

  factory FansRange.fromJson(Map<String, dynamic> json) => FansRange(
        avgAddFollowerCount: json["avgAddFollowerCount"],
        avgAddFollowerPercent: json["avgAddFollowerPercent"],
        followerAreaRange: List<Range>.from(
            json["followerAreaRange"].map((x) => Range.fromJson(x))),
        followerRange: List<Range>.from(
            json["followerRange"].map((x) => Range.fromJson(x))),
        mediumAddFollowerPercent: json["mediumAddFollowerPercent"],
      );

  Map<String, dynamic> toJson() => {
        "avgAddFollowerCount": avgAddFollowerCount,
        "avgAddFollowerPercent": avgAddFollowerPercent,
        "followerAreaRange":
            List<dynamic>.from(followerAreaRange.map((x) => x.toJson())),
        "followerRange":
            List<dynamic>.from(followerRange.map((x) => x.toJson())),
        "mediumAddFollowerPercent": mediumAddFollowerPercent,
      };
}

class Range {
  Range({
    required this.avgPlay,
    required this.date,
    required this.key,
    required this.percent,

    ///转为double
    required this.percent2Double,
  });

  dynamic avgPlay;
  DateTime? date;
  String key;
  String percent;
  double percent2Double;

  factory Range.fromJson(Map<String, dynamic> json) {
    String tempPercent = json["percent"];

    return Range(
      avgPlay: json["avgPlay"],
      date: json["date"] == null ? null : DateTime.parse(json["date"]),
      key: json["key"],
      percent: json["percent"],
      percent2Double: double.parse(tempPercent.substring(0, 4)),
    );
  }

  Map<String, dynamic> toJson() => {
        "avgPlay": avgPlay,
        "date": date == null ? "null" : date?.toIso8601String(),
        "key": key,
        "percent": percent,
      };
}

class JustToMillionFollower {
  JustToMillionFollower({
    required this.emergingFollower,
    required this.tenfoldMergingFollower,
  });

  MergingFollower emergingFollower;
  MergingFollower tenfoldMergingFollower;

  factory JustToMillionFollower.fromJson(Map<String, dynamic> json) =>
      JustToMillionFollower(
        emergingFollower: MergingFollower.fromJson(json["emergingFollower"]),
        tenfoldMergingFollower:
            MergingFollower.fromJson(json["tenfoldMergingFollower"]),
      );

  Map<String, dynamic> toJson() => {
        "emergingFollower": emergingFollower.toJson(),
        "tenfoldMergingFollower": tenfoldMergingFollower.toJson(),
      };
}

class MergingFollower {
  MergingFollower({
    required this.docCount,
    required this.followerVos,
    required this.key,
  });

  String docCount;
  List<FollowerVo> followerVos;
  String key;

  factory MergingFollower.fromJson(Map<String, dynamic> json) =>
      MergingFollower(
        docCount: json["docCount"],
        followerVos: List<FollowerVo>.from(
            json["followerVos"].map((x) => FollowerVo.fromJson(x))),
        key: json["key"],
      );

  Map<String, dynamic> toJson() => {
        "docCount": docCount,
        "followerVos": List<dynamic>.from(followerVos.map((x) => x.toJson())),
        "key": key,
      };
}

class FollowerVo {
  FollowerVo({
    required this.face,
    required this.follower,
    required this.mid,
    required this.name,
    required this.ownedAt,
  });

  String face;
  String follower;
  String mid;
  String name;
  DateTime ownedAt;

  factory FollowerVo.fromJson(Map<String, dynamic> json) => FollowerVo(
        face: json["face"],
        follower: json["follower"],
        mid: json["mid"],
        name: json["name"],
        ownedAt: DateTime.parse(json["ownedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "face": face,
        "follower": follower,
        "mid": mid,
        "name": name,
        "ownedAt": ownedAt.toIso8601String(),
      };
}

class LastMonthFollower {
  LastMonthFollower({
    required this.followerRange,
  });

  List<Range> followerRange;

  factory LastMonthFollower.fromJson(Map<String, dynamic> json) =>
      LastMonthFollower(
        followerRange: List<Range>.from(
            json["followerRange"].map((x) => Range.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "followerRange":
            List<dynamic>.from(followerRange.map((x) => x.toJson())),
      };
}

class LastMonthOpus {
  LastMonthOpus({
    required this.opusCountRange,
  });

  List<Range> opusCountRange;

  factory LastMonthOpus.fromJson(Map<String, dynamic> json) => LastMonthOpus(
        opusCountRange: List<Range>.from(
            json["opusCountRange"].map((x) => Range.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "opusCountRange":
            List<dynamic>.from(opusCountRange.map((x) => x.toJson())),
      };
}

class TopElectric {
  TopElectric({
    required this.addElectricCount,
    required this.face,
    required this.mid,
    required this.name,
  });

  String addElectricCount;
  String face;
  String mid;
  String name;

  factory TopElectric.fromJson(Map<String, dynamic> json) => TopElectric(
        addElectricCount: json["addElectricCount"],
        face: json["face"],
        mid: json["mid"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "addElectricCount": addElectricCount,
        "face": face,
        "mid": mid,
        "name": name,
      };
}

class TopPopular {
  TopPopular({
    required this.addVideoCount,
    required this.addVideoPlayCount,
    required this.face,
    required this.mid,
    required this.name,
  });

  String addVideoCount;
  String addVideoPlayCount;
  String face;
  String mid;
  String name;

  factory TopPopular.fromJson(Map<String, dynamic> json) => TopPopular(
        addVideoCount: json["addVideoCount"],
        addVideoPlayCount: json["addVideoPlayCount"],
        face: json["face"],
        mid: json["mid"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "addVideoCount": addVideoCount,
        "addVideoPlayCount": addVideoPlayCount,
        "face": face,
        "mid": mid,
        "name": name,
      };
}

class UpIndexPercent {
  UpIndexPercent({
    required this.addElectricPercent,
    required this.addFollowerPercent,
    required this.addOpusPercent,
    required this.followerPercentWithLast,
    required this.opusElectricWithLast,
    required this.opusPercentWithLast,
    required this.productPercent,
    required this.productPercentWithLast,
    required this.qiafanPercent,
    required this.qiafanPercentWithLast,
    required this.total,
    required this.updateTime,
  });

  String addElectricPercent;
  String addFollowerPercent;
  String addOpusPercent;
  String followerPercentWithLast;
  String opusElectricWithLast;
  String opusPercentWithLast;
  String productPercent;
  String productPercentWithLast;
  String qiafanPercent;
  String qiafanPercentWithLast;
  String total;
  DateTime updateTime;

  factory UpIndexPercent.fromJson(Map<String, dynamic> json) => UpIndexPercent(
        addElectricPercent: json["addElectricPercent"],
        addFollowerPercent: json["addFollowerPercent"],
        addOpusPercent: json["addOpusPercent"],
        followerPercentWithLast: json["followerPercentWithLast"],
        opusElectricWithLast: json["opusElectricWithLast"],
        opusPercentWithLast: json["opusPercentWithLast"],
        productPercent: json["productPercent"],
        productPercentWithLast: json["productPercentWithLast"],
        qiafanPercent: json["qiafanPercent"],
        qiafanPercentWithLast: json["qiafanPercentWithLast"],
        total: json["total"],
        updateTime: DateTime.parse(json["updateTime"]),
      );

  Map<String, dynamic> toJson() => {
        "addElectricPercent": addElectricPercent,
        "addFollowerPercent": addFollowerPercent,
        "addOpusPercent": addOpusPercent,
        "followerPercentWithLast": followerPercentWithLast,
        "opusElectricWithLast": opusElectricWithLast,
        "opusPercentWithLast": opusPercentWithLast,
        "productPercent": productPercent,
        "productPercentWithLast": productPercentWithLast,
        "qiafanPercent": qiafanPercent,
        "qiafanPercentWithLast": qiafanPercentWithLast,
        "total": total,
        "updateTime": updateTime.toIso8601String(),
      };
}
