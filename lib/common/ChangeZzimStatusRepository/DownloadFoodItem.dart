// To parse this JSON data, do
//
//     final searchIngredient = searchIngredientFromJson(jsonString);

import 'dart:convert';

DownloadFoodList downloadFoodListFromJson(String str) =>
    DownloadFoodList.fromJson(json.decode(str));

String downloadFoodListToJson(DownloadFoodList data) =>
    json.encode(data.toJson());

class DownloadFoodList {
  DownloadFoodList({
    this.status,
    this.success,
    this.message,
    this.data,
  });

  int status;
  bool success;
  String message;
  List<String> data;

  factory DownloadFoodList.fromJson(Map<String, dynamic> json) =>
      DownloadFoodList(
        status: json["status"],
        success: json["success"],
        message: json["message"],
        data: List<String>.from(json["data"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "success": success,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x)),
      };
}
