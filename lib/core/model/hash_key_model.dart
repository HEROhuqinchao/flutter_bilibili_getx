// To parse this JSON data, do
//
//     final hySearchResultModel = hySearchResultModelFromJson(jsonString);
import 'dart:convert';

HYHashKeyModel hySearchResultModelFromJson(String str) =>
    HYHashKeyModel.fromJson(json.decode(str));

String hySearchResultModelToJson(HYHashKeyModel data) =>
    json.encode(data.toJson());

class HYHashKeyModel {
  HYHashKeyModel({
    required this.code,
    required this.message,
    required this.ttl,
    required this.hashKeyData,
  });

  int code;
  String message;
  int ttl;
  HashKeyData hashKeyData;

  factory HYHashKeyModel.fromJson(Map<String, dynamic> json) => HYHashKeyModel(
        code: json["code"],
        message: json["message"],
        ttl: json["ttl"],
        hashKeyData: HashKeyData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "ttl": ttl,
        "data": hashKeyData.toJson(),
      };
}

class HashKeyData {
  HashKeyData({
    required this.hash,
    required this.key,
  });

  String hash;
  String key;

  factory HashKeyData.fromJson(Map<String, dynamic> json) => HashKeyData(
        hash: json["hash"],
        key: json["key"],
      );

  Map<String, dynamic> toJson() => {
        "hash": hash,
        "key": key,
      };
}
