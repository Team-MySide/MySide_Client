// To parse this JSON data, do
//
//     final totalSearchBody = totalSearchBodyFromJson(jsonString);

import 'dart:convert';

TotalSearchBody totalSearchBodyFromJson(String str) =>
    TotalSearchBody.fromJson(json.decode(str));

String totalSearchBodyToJson(TotalSearchBody data) =>
    json.encode(data.toJson());

class TotalSearchBody {
  TotalSearchBody({
    this.status,
    this.success,
    this.message,
    this.data,
  });

  int status;
  bool success;
  String message;
  Data data;

  factory TotalSearchBody.fromJson(Map<String, dynamic> json) =>
      TotalSearchBody(
        status: json["status"],
        success: json["success"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "success": success,
        "message": message,
        "data": data.toJson(),
      };
}

class Data {
  Data({
    this.nutrition,
    this.food,
    this.cancer,
  });

  List<String> nutrition;
  List<String> food;
  List<String> cancer;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        nutrition: List<String>.from(json["nutrition"].map((x) => x)),
        food: List<String>.from(json["food"].map((x) => x)),
        cancer: List<String>.from(json["cancer"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "nutrition": List<dynamic>.from(nutrition.map((x) => x)),
        "food": List<dynamic>.from(food.map((x) => x)),
        "cancer": List<dynamic>.from(cancer.map((x) => x)),
      };
}
