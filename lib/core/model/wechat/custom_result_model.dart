// To parse this JSON data, do
//
//     final customResultModel = customResultModelFromJson(jsonString);

import 'dart:convert';

CustomResultModel customResultModelFromJson(String str) =>
    CustomResultModel.fromJson(json.decode(str));

String customResultModelToJson(CustomResultModel data) =>
    json.encode(data.toJson());

class CustomResultModel {
  int? code;
  String? message;

  CustomResultModel({
    this.code,
    this.message,
  });

  factory CustomResultModel.fromJson(Map<String, dynamic> json) =>
      CustomResultModel(
        code: json["code"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
      };
}
