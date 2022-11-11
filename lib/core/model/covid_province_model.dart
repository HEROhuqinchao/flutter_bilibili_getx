// To parse this JSON data, do
//
//     final covidProvinceModel = covidProvinceModelFromJson(jsonString);

import 'dart:convert';

CovidProvinceModel covidProvinceModelFromJson(String str) =>
    CovidProvinceModel.fromJson(json.decode(str));

String covidProvinceModelToJson(CovidProvinceModel data) =>
    json.encode(data.toJson());

class CovidProvinceModel {
  CovidProvinceModel({
    required this.success,
    required this.data,
  });

  bool success;
  List<Datum>? data;

  factory CovidProvinceModel.fromJson(Map<String, dynamic> json) =>
      CovidProvinceModel(
        success: json["success"],
        data: json["data"] == null
            ? null
            : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": data == null
            ? null
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    required this.updatetime,
    required this.country,
    required this.province,
    required this.city,
    required this.now,
    required this.history,
    required this.danger,
  });

  DateTime? updatetime;
  String? country;
  String? province;
  String city;
  Now? now;
  History? history;
  Danger? danger;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        updatetime: json["updatetime"] == null
            ? null
            : DateTime.parse(json["updatetime"]),
        country: json["country"] ?? "",
        province: json["province"] ?? "",
        city: json["city"] ?? "",
        now: json["now"] == null ? null : Now.fromJson(json["now"]),
        history:
            json["history"] == null ? null : History.fromJson(json["history"]),
        danger: json["danger"] == null ? null : Danger.fromJson(json["danger"]),
      );

  Map<String, dynamic> toJson() => {
        "updatetime": updatetime == null ? null : updatetime!.toIso8601String(),
        "country": country,
        "province": province,
        "city": city,
        "now": now == null ? null : now!.toJson(),
        "history": history == null ? null : history!.toJson(),
        "danger": danger == null ? null : danger!.toJson(),
      };
}

class Danger {
  Danger({
    required this.highRisk,
    required this.mediumRisk,
  });

  int highRisk;
  int mediumRisk;

  factory Danger.fromJson(Map<String, dynamic> json) => Danger(
        highRisk: json["high_risk"],
        mediumRisk: json["medium_risk"],
      );

  Map<String, dynamic> toJson() => {
        "high_risk": highRisk,
        "medium_risk": mediumRisk,
      };
}

class History {
  History({
    required this.sureCnt,
    required this.cureCnt,
    required this.dieCnt,
  });

  dynamic sureCnt;
  dynamic cureCnt;
  dynamic dieCnt;

  factory History.fromJson(Map<String, dynamic> json) => History(
        sureCnt: json["sure_cnt"],
        cureCnt: json["cure_cnt"],
        dieCnt: json["die_cnt"],
      );

  Map<String, dynamic> toJson() => {
        "sure_cnt": sureCnt,
        "cure_cnt": cureCnt,
        "die_cnt": dieCnt,
      };
}

class Now {
  Now({
    required this.sureNewLoc,
    required this.sureNewHid,
    required this.surePresent,
  });

  dynamic sureNewLoc;
  dynamic sureNewHid;
  dynamic surePresent;

  factory Now.fromJson(Map<String, dynamic> json) => Now(
        sureNewLoc: json["sure_new_loc"],
        sureNewHid: json["sure_new_hid"],
        surePresent: json["sure_present"],
      );

  Map<String, dynamic> toJson() => {
        "sure_new_loc": sureNewLoc,
        "sure_new_hid": sureNewHid,
        "sure_present": surePresent,
      };
}
