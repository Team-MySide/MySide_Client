// To parse this JSON data, do
//
//     final searchFoodItem = searchFoodItemFromJson(jsonString);

import 'dart:convert';

SearchFoodItem searchFoodItemFromJson(String str) =>
    SearchFoodItem.fromJson(json.decode(str));

String searchFoodItemToJson(SearchFoodItem data) => json.encode(data.toJson());

class SearchFoodItem {
  SearchFoodItem({
    this.status,
    this.success,
    this.message,
    this.data,
  });

  int status;
  bool success;
  String message;
  List<FoodItem> data;

  factory SearchFoodItem.fromJson(Map<String, dynamic> json) => SearchFoodItem(
        status: json["status"],
        success: json["success"],
        message: json["message"],
        data:
            List<FoodItem>.from(json["data"].map((x) => FoodItem.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "success": success,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class FoodItem {
  FoodItem({
    this.foodId,
    this.name,
    this.img,
    this.category,
    this.cancerNm,
    this.backgroundColor,
    this.wishes,
    this.views,
    this.likes,
    this.nutrition1,
  });

  int foodId;
  String name;
  String img;
  String category;
  String cancerNm;
  String backgroundColor;
  int wishes;
  int views;
  int likes;
  String nutrition1;

  factory FoodItem.fromJson(Map<String, dynamic> json) => FoodItem(
        foodId: json["food_id"],
        name: json["name"],
        img: json["img"],
        category: json["category"],
        cancerNm: json["cancerNm"],
        backgroundColor: json["background_color"],
        wishes: json["wishes"],
        views: json["views"],
        likes: json["likes"],
        nutrition1: json["nutrition1"],
      );

  Map<String, dynamic> toJson() => {
        "food_id": foodId,
        "name": name,
        "img": img,
        "category": category,
        "cancerNm": cancerNm,
        "background_color": backgroundColor,
        "wishes": wishes,
        "views": views,
        "likes": likes,
        "nutrition1": nutrition1,
      };
}
