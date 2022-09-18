// To parse this JSON data, do
//
//     final foodRecommendForDisease = foodRecommendForDiseaseFromJson(jsonString);

import 'dart:convert';

FoodRecommendForDisease foodRecommendForDiseaseFromJson(String str) =>
    FoodRecommendForDisease.fromJson(json.decode(str));

String foodRecommendForDiseaseToJson(FoodRecommendForDisease data) =>
    json.encode(data.toJson());

class FoodRecommendForDisease {
  FoodRecommendForDisease({
    this.status,
    this.success,
    this.message,
    this.data,
  });

  int status;
  bool success;
  String message;
  List<Datum> data;

  factory FoodRecommendForDisease.fromJson(Map<String, dynamic> json) =>
      FoodRecommendForDisease(
        status: json["status"],
        success: json["success"],
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "success": success,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    this.cancer1,
    this.cancer2,
    this.cancer3,
    this.cancer4,
    this.cancer5,
    this.cancer6,
  });

  List<Cancer> cancer1;
  List<Cancer> cancer2;
  List<Cancer> cancer3;
  List<Cancer> cancer4;
  List<Cancer> cancer5;
  List<Cancer> cancer6;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        cancer1: json["cancer1"] == null
            ? null
            : List<Cancer>.from(json["cancer1"].map((x) => Cancer.fromJson(x))),
        cancer2: json["cancer2"] == null
            ? null
            : List<Cancer>.from(json["cancer2"].map((x) => Cancer.fromJson(x))),
        cancer3: json["cancer3"] == null
            ? null
            : List<Cancer>.from(json["cancer3"].map((x) => Cancer.fromJson(x))),
        cancer4: json["cancer4"] == null
            ? null
            : List<Cancer>.from(json["cancer4"].map((x) => Cancer.fromJson(x))),
        cancer5: json["cancer5"] == null
            ? null
            : List<Cancer>.from(json["cancer5"].map((x) => Cancer.fromJson(x))),
        cancer6: json["cancer6"] == null
            ? null
            : List<Cancer>.from(json["cancer6"].map((x) => Cancer.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "cancer1": cancer1 == null
            ? null
            : List<dynamic>.from(cancer1.map((x) => x.toJson())),
        "cancer2": cancer2 == null
            ? null
            : List<dynamic>.from(cancer2.map((x) => x.toJson())),
        "cancer3": cancer3 == null
            ? null
            : List<dynamic>.from(cancer3.map((x) => x.toJson())),
        "cancer4": cancer4 == null
            ? null
            : List<dynamic>.from(cancer4.map((x) => x.toJson())),
        "cancer5": cancer5 == null
            ? null
            : List<dynamic>.from(cancer5.map((x) => x.toJson())),
        "cancer6": cancer6 == null
            ? null
            : List<dynamic>.from(cancer6.map((x) => x.toJson())),
      };
}

class Cancer {
  Cancer({
    this.foodId,
    this.name,
    this.img,
    this.category,
    this.cancerNm,
    this.backgroundColor,
    this.foregroundColor,
    this.wishes,
    this.views,
    this.likes,
    this.nutrition1,
  });

  int foodId;
  String name;
  String img;
  Category category;
  String cancerNm;
  String backgroundColor;
  String foregroundColor;
  int wishes;
  int views;
  int likes;
  String nutrition1;

  factory Cancer.fromJson(Map<String, dynamic> json) => Cancer(
        foodId: json["food_id"],
        name: json["name"],
        img: json["img"],
        category: categoryValues.map[json["category"]],
        cancerNm: json["cancerNm"],
        backgroundColor: json["background_color"],
        foregroundColor:
            json["foreground_color"] == null ? null : json["foreground_color"],
        wishes: json["wishes"],
        views: json["views"],
        likes: json["likes"],
        nutrition1: json["nutrition1"],
      );

  Map<String, dynamic> toJson() => {
        "food_id": foodId,
        "name": name,
        "img": img,
        "category": categoryValues.reverse[category],
        "cancerNm": cancerNm,
        "background_color": backgroundColor,
        "foreground_color": foregroundColor == null ? null : foregroundColor,
        "wishes": wishes,
        "views": views,
        "likes": likes,
        "nutrition1": nutrition1,
      };
}

enum Category { EMPTY, CATEGORY, PURPLE }

final categoryValues = EnumValues(
    {"육류": Category.CATEGORY, "채소류": Category.EMPTY, "기타": Category.PURPLE});

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
