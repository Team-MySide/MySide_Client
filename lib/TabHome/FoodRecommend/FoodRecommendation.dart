// To parse this JSON data, do
//
//     final foodRecommend = foodRecommendFromJson(jsonString);

import 'dart:convert';

FoodRecommend foodRecommendFromJson(String str) =>
    FoodRecommend.fromJson(json.decode(str));

String foodRecommendToJson(FoodRecommend data) => json.encode(data.toJson());

class FoodRecommend {
  FoodRecommend({
    this.status,
    this.success,
    this.message,
    this.data,
  });

  int status;
  bool success;
  String message;
  List<FoodRecommendItem> data;

  factory FoodRecommend.fromJson(Map<String, dynamic> json) => FoodRecommend(
        status: json["status"],
        success: json["success"],
        message: json["message"],
        data: List<FoodRecommendItem>.from(
            json["data"].map((x) => FoodRecommendItem.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "success": success,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class FoodRecommendItem {
  FoodRecommendItem({
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

  factory FoodRecommendItem.fromJson(Map<String, dynamic> json) =>
      FoodRecommendItem(
        foodId: json["food_id"],
        name: json["name"],
        img: json["img"],
        category: json["category"],
        cancerNm: json["cancerNm"],
        backgroundColor: json["background_color"],
        wishes: json["wishes"],
        views: json["views"],
        likes: json["likes"],
        nutrition1: json["nutrition1"] == null ? null : json["nutrition1"],
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
        "nutrition1": nutrition1 == null ? null : nutrition1,
      };
}
