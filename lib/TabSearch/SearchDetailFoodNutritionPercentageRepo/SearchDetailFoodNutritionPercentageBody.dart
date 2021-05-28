// To parse this JSON data, do
//
//     final searchDetailFoodNutritionPercentageBody = searchDetailFoodNutritionPercentageBodyFromJson(jsonString);

import 'dart:convert';

SearchDetailFoodNutritionPercentageBody
    searchDetailFoodNutritionPercentageBodyFromJson(String str) =>
        SearchDetailFoodNutritionPercentageBody.fromJson(json.decode(str));

String searchDetailFoodNutritionPercentageBodyToJson(
        SearchDetailFoodNutritionPercentageBody data) =>
    json.encode(data.toJson());

class SearchDetailFoodNutritionPercentageBody {
  SearchDetailFoodNutritionPercentageBody({
    this.status,
    this.success,
    this.message,
    this.data,
  });

  int status;
  bool success;
  String message;
  List<FoodNutritionPercentageItem> data;

  factory SearchDetailFoodNutritionPercentageBody.fromJson(
          Map<String, dynamic> json) =>
      SearchDetailFoodNutritionPercentageBody(
        status: json["status"],
        success: json["success"],
        message: json["message"],
        data: List<FoodNutritionPercentageItem>.from(
            json["data"].map((x) => FoodNutritionPercentageItem.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "success": success,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class FoodNutritionPercentageItem {
  FoodNutritionPercentageItem({
    this.g,
    this.nutname,
    this.nutnamekr,
    this.category,
  });

  double g;
  String nutname;
  String nutnamekr;
  String category;

  factory FoodNutritionPercentageItem.fromJson(Map<String, dynamic> json) =>
      FoodNutritionPercentageItem(
        g: json["g"].toDouble(),
        nutname: json["nutname"],
        nutnamekr: json["nutnamekr"],
        category: json["category"],
      );

  Map<String, dynamic> toJson() => {
        "g": g,
        "nutname": nutname,
        "nutnamekr": nutnamekr,
        "category": category,
      };
}
