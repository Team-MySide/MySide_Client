// To parse this JSON data, do
//
//     final nutritionDetail = nutritionDetailFromJson(jsonString);

import 'dart:convert';

NutritionDetail nutritionDetailFromJson(String str) =>
    NutritionDetail.fromJson(json.decode(str));

String nutritionDetailToJson(NutritionDetail data) =>
    json.encode(data.toJson());

class NutritionDetail {
  NutritionDetail({
    this.status,
    this.success,
    this.message,
    this.data,
  });

  int status;
  bool success;
  String message;
  Map<String, double> data;

  factory NutritionDetail.fromJson(Map<String, dynamic> json) =>
      NutritionDetail(
        status: json["status"],
        success: json["success"],
        message: json["message"],
        data: Map.from(json["data"])
            .map((k, v) => MapEntry<String, double>(k, v.toDouble())),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "success": success,
        "message": message,
        "data": Map.from(data).map((k, v) => MapEntry<String, dynamic>(k, v)),
      };
}
