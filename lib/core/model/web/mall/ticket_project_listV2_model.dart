// To parse this JSON data, do
//
//     final ticketProjectListV2Model = ticketProjectListV2ModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

TicketProjectListV2Model ticketProjectListV2ModelFromJson(String str) => TicketProjectListV2Model.fromJson(json.decode(str));

String ticketProjectListV2ModelToJson(TicketProjectListV2Model data) => json.encode(data.toJson());

class TicketProjectListV2Model {
  TicketProjectListV2Model({
    required this.errno,
    required this.errtag,
    required this.msg,
    required this.data,
  });

  int errno;
  int errtag;
  String msg;
  Data data;

  factory TicketProjectListV2Model.fromJson(Map<String, dynamic> json) => TicketProjectListV2Model(
    errno: json["errno"],
    errtag: json["errtag"],
    msg: json["msg"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "errno": errno,
    "errtag": errtag,
    "msg": msg,
    "data": data.toJson(),
  };
}

class Data {
  Data({
    required this.total,
    required this.numResults,
    required this.numPages,
    required this.page,
    required this.pagesize,
    required this.seid,
    required this.result,
  });

  int total;
  int numResults;
  int numPages;
  int page;
  int pagesize;
  String seid;
  List<Result> result;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    total: json["total"],
    numResults: json["numResults"],
    numPages: json["numPages"],
    page: json["page"],
    pagesize: json["pagesize"],
    seid: json["seid"],
    result: List<Result>.from(json["result"].map((x) => Result.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "total": total,
    "numResults": numResults,
    "numPages": numPages,
    "page": page,
    "pagesize": pagesize,
    "seid": seid,
    "result": List<dynamic>.from(result.map((x) => x.toJson())),
  };
}

class Result {
  Result({
    required this.projectId,
    required this.type,
    required this.score,
    required this.extraInfo,
    required this.status,
    required this.city,
    required this.venueId,
    required this.venueName,
    required this.cover,
    required this.saleStart,
    required this.country,
    required this.saleEnd,
    required this.endTime,
    required this.id,
    required this.tags,
    required this.staff,
    required this.cityName,
    required this.areas,
    required this.cityIdStr,
    required this.url,
    required this.userCount,
    required this.province,
    required this.saleFlagNumber,
    required this.group,
    required this.span,
    required this.priceLow,
    required this.priceHigh,
    required this.ord,
    required this.strategyOrd,
    required this.order,
    required this.maxOrder,
    required this.gmv,
    required this.maxGmv,
    required this.uv,
    required this.maxUv,
    required this.wtg,
    required this.maxWtg,
    required this.comment,
    required this.maxComment,
    required this.isExclusive,
    required this.pubTime,
    required this.startTime,
    required this.hasAct,
    required this.commend,
    required this.projectName,
    required this.isPrice,
    required this.isRebate,
    required this.isSeckill,
    required this.cityId,
    required this.pickSeat,
    required this.wish,
    required this.label,
    required this.saleFlag,
    required this.salePoint,
    required this.guests,
    required this.isFree,
    required this.startUnix,
    required this.tlabel,
    required this.mask,
    required this.distance,
    required this.districtName,
    required this.saleStartTime,
    required this.saleEndTime,
    required this.remindStatus,
    required this.showRemindBtn,
    required this.countdownSec,
    required this.countdown,
    required this.projectQuality,
    required this.projectQualityDesc,
  });

  int projectId;
  int type;
  int score;
  String extraInfo;
  int status;
  City city;
  String venueId;
  String venueName;
  String cover;
  int saleStart;
  int country;
  int saleEnd;
  String endTime;
  int id;
  List<dynamic> tags;
  String staff;
  City cityName;
  Areas areas;
  CityIdStr cityIdStr;
  String url;
  int userCount;
  String province;
  int saleFlagNumber;
  String group;
  String span;
  int priceLow;
  int priceHigh;
  double ord;
  double strategyOrd;
  int order;
  int maxOrder;
  int gmv;
  int maxGmv;
  int uv;
  int maxUv;
  int wtg;
  int maxWtg;
  int comment;
  int maxComment;
  bool isExclusive;
  int pubTime;
  String startTime;
  int hasAct;
  int commend;
  String projectName;
  bool isPrice;
  bool isRebate;
  bool isSeckill;
  int cityId;
  bool pickSeat;
  String wish;
  String label;
  SaleFlag saleFlag;
  SalePoint salePoint;
  List<Guest> guests;
  bool isFree;
  int startUnix;
  String tlabel;
  dynamic mask;
  int distance;
  DistrictName districtName;
  int saleStartTime;
  int saleEndTime;
  bool remindStatus;
  bool showRemindBtn;
  int countdownSec;
  Countdown countdown;
  int projectQuality;
  ProjectQualityDesc projectQualityDesc;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    projectId: json["project_id"],
    type: json["type"],
    score: json["score"],
    extraInfo: json["extra_info"],
    status: json["status"],
    city: cityValues.map[json["city"]],
    venueId: json["venue_id"],
    venueName: json["venue_name"],
    cover: json["cover"],
    saleStart: json["sale_start"],
    country: json["country"],
    saleEnd: json["sale_end"],
    endTime: json["end_time"],
    id: json["id"],
    tags: List<dynamic>.from(json["tags"].map((x) => x)),
    staff: json["staff"],
    cityName: cityValues.map[json["city_name"]],
    areas: areasValues.map[json["areas"]],
    cityIdStr: cityIdStrValues.map[json["city_id_str"]],
    url: json["url"],
    userCount: json["user_count"],
    province: json["province"],
    saleFlagNumber: json["sale_flag_number"],
    group: json["group"],
    span: json["span"],
    priceLow: json["price_low"],
    priceHigh: json["price_high"],
    ord: json["ord"].toDouble(),
    strategyOrd: json["strategy_ord"].toDouble(),
    order: json["order"],
    maxOrder: json["max_order"],
    gmv: json["gmv"],
    maxGmv: json["max_gmv"],
    uv: json["uv"],
    maxUv: json["max_uv"],
    wtg: json["wtg"],
    maxWtg: json["max_wtg"],
    comment: json["comment"],
    maxComment: json["max_comment"],
    isExclusive: json["is_exclusive"],
    pubTime: json["pub_time"],
    startTime: json["start_time"],
    hasAct: json["has_act"],
    commend: json["commend"],
    projectName: json["project_name"],
    isPrice: json["is_price"],
    isRebate: json["is_rebate"],
    isSeckill: json["is_seckill"],
    cityId: json["city_id"],
    pickSeat: json["pick_seat"],
    wish: json["wish"],
    label: json["label"] == null ? null : json["label"],
    saleFlag: saleFlagValues.map[json["sale_flag"]],
    salePoint: salePointValues.map[json["sale_point"]],
    guests: json["guests"] == null ? null : List<Guest>.from(json["guests"].map((x) => Guest.fromJson(x))),
    isFree: json["is_free"],
    startUnix: json["start_unix"],
    tlabel: json["tlabel"],
    mask: json["mask"],
    distance: json["distance"],
    districtName: districtNameValues.map[json["district_name"]],
    saleStartTime: json["sale_start_time"],
    saleEndTime: json["sale_end_time"],
    remindStatus: json["remind_status"],
    showRemindBtn: json["show_remind_btn"],
    countdownSec: json["countdown_sec"],
    countdown: countdownValues.map[json["countdown"]],
    projectQuality: json["project_quality"],
    projectQualityDesc: projectQualityDescValues.map[json["project_quality_desc"]],
  );

  Map<String, dynamic> toJson() => {
    "project_id": projectId,
    "type": type,
    "score": score,
    "extra_info": extraInfo,
    "status": status,
    "city": cityValues.reverse[city],
    "venue_id": venueId,
    "venue_name": venueName,
    "cover": cover,
    "sale_start": saleStart,
    "country": country,
    "sale_end": saleEnd,
    "end_time": endTime,
    "id": id,
    "tags": List<dynamic>.from(tags.map((x) => x)),
    "staff": staff,
    "city_name": cityValues.reverse[cityName],
    "areas": areasValues.reverse[areas],
    "city_id_str": cityIdStrValues.reverse[cityIdStr],
    "url": url,
    "user_count": userCount,
    "province": province,
    "sale_flag_number": saleFlagNumber,
    "group": group,
    "span": span,
    "price_low": priceLow,
    "price_high": priceHigh,
    "ord": ord,
    "strategy_ord": strategyOrd,
    "order": order,
    "max_order": maxOrder,
    "gmv": gmv,
    "max_gmv": maxGmv,
    "uv": uv,
    "max_uv": maxUv,
    "wtg": wtg,
    "max_wtg": maxWtg,
    "comment": comment,
    "max_comment": maxComment,
    "is_exclusive": isExclusive,
    "pub_time": pubTime,
    "start_time": startTime,
    "has_act": hasAct,
    "commend": commend,
    "project_name": projectName,
    "is_price": isPrice,
    "is_rebate": isRebate,
    "is_seckill": isSeckill,
    "city_id": cityId,
    "pick_seat": pickSeat,
    "wish": wish,
    "label": label == null ? null : label,
    "sale_flag": saleFlagValues.reverse[saleFlag],
    "sale_point": salePointValues.reverse[salePoint],
    "guests": guests == null ? null : List<dynamic>.from(guests.map((x) => x.toJson())),
    "is_free": isFree,
    "start_unix": startUnix,
    "tlabel": tlabel,
    "mask": mask,
    "distance": distance,
    "district_name": districtNameValues.reverse[districtName],
    "sale_start_time": saleStartTime,
    "sale_end_time": saleEndTime,
    "remind_status": remindStatus,
    "show_remind_btn": showRemindBtn,
    "countdown_sec": countdownSec,
    "countdown": countdownValues.reverse[countdown],
    "project_quality": projectQuality,
    "project_quality_desc": projectQualityDescValues.reverse[projectQualityDesc],
  };
}

enum Areas { EMPTY, AREAS, PURPLE }

final areasValues = EnumValues({
  "浙江省,宁波市,鄞州区,浙江,宁波,鄞州": Areas.AREAS,
  "浙江省,宁波市,江北区,浙江,宁波,江北": Areas.EMPTY,
  "浙江省,宁波市,海曙区,浙江,宁波,海曙": Areas.PURPLE
});

enum City { EMPTY }

final cityValues = EnumValues({
  "宁波市": City.EMPTY
});

enum CityIdStr { THE_330200330000 }

final cityIdStrValues = EnumValues({
  "330200,330000": CityIdStr.THE_330200330000
});

enum Countdown { EMPTY }

final countdownValues = EnumValues({
  "热卖中": Countdown.EMPTY
});

enum DistrictName { EMPTY, DISTRICT_NAME, PURPLE }

final districtNameValues = EnumValues({
  "鄞州区": DistrictName.DISTRICT_NAME,
  "江北区": DistrictName.EMPTY,
  "海曙区": DistrictName.PURPLE
});

class Guest {
  Guest({
    required this.id,
    required this.name,
  });

  String id;
  String name;

  factory Guest.fromJson(Map<String, dynamic> json) => Guest(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}

enum ProjectQualityDesc { EMPTY }

final projectQualityDescValues = EnumValues({
  "普通": ProjectQualityDesc.EMPTY
});

enum SaleFlag { EMPTY, SALE_FLAG }

final saleFlagValues = EnumValues({
  "预售中": SaleFlag.EMPTY,
  "不可售": SaleFlag.SALE_FLAG
});

enum SalePoint { EMPTY, PROJECT }

final salePointValues = EnumValues({
  "": SalePoint.EMPTY,
  "宁波第二届东方project展会相约中秋": SalePoint.PROJECT
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
