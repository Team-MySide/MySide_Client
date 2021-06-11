// To parse this JSON data, do
//
//     final searchNutritionResultBody = searchNutritionResultBodyFromJson(jsonString);

import 'dart:convert';

SearchNutritionResultBody searchNutritionResultBodyFromJson(String str) =>
    SearchNutritionResultBody.fromJson(json.decode(str));

String searchNutritionResultBodyToJson(SearchNutritionResultBody data) =>
    json.encode(data.toJson());

class SearchNutritionResultBody {
  SearchNutritionResultBody({
    this.status,
    this.success,
    this.message,
    this.data,
  });

  int status;
  bool success;
  String message;
  List<SearchNutritionResultItem> data;

  factory SearchNutritionResultBody.fromJson(Map<String, dynamic> json) =>
      SearchNutritionResultBody(
        status: json["status"],
        success: json["success"],
        message: json["message"],
        data: List<SearchNutritionResultItem>.from(
            json["data"].map((x) => SearchNutritionResultItem.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "success": success,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class SearchNutritionResultItem {
  SearchNutritionResultItem({
    this.foodId,
    this.name,
    this.img,
    this.category,
    this.backgroundColor,
    this.wishes,
    this.likes,
    this.cancerNm,
    this.nutrition,
  });

  int foodId;
  String name;
  String img;
  String category;
  String backgroundColor;
  int wishes;
  int likes;
  String cancerNm;
  String nutrition;

  factory SearchNutritionResultItem.fromJson(Map<String, dynamic> json) =>
      SearchNutritionResultItem(
        foodId: json["food_id"],
        name: json["name"],
        img: json["img"],
        category: json["category"],
        backgroundColor: json["background_color"],
        wishes: json["wishes"],
        likes: json["likes"],
        cancerNm: json["cancerNm"],
        nutrition: json["nutrition"],
      );

  Map<String, dynamic> toJson() => {
        "food_id": foodId,
        "name": name,
        "img": img,
        "category": category,
        "background_color": backgroundColor,
        "wishes": wishes,
        "likes": likes,
        "cancerNm": cancerNm,
        "nutrition": nutrition,
      };
}
