// To parse this JSON data, do
//
//     final recipeListItem = recipeListItemFromJson(jsonString);

import 'dart:convert';

RecipeItemList recipeListItemFromJson(String str) =>
    RecipeItemList.fromJson(json.decode(str));

String recipeListItemToJson(RecipeItemList data) => json.encode(data.toJson());

class RecipeItemList {
  RecipeItemList({
    this.status,
    this.success,
    this.message,
    this.data,
  });

  int status;
  bool success;
  String message;
  List<RecipeItem> data;

  factory RecipeItemList.fromJson(Map<String, dynamic> json) => RecipeItemList(
        status: json["status"],
        success: json["success"],
        message: json["message"],
        data: List<RecipeItem>.from(
            json["data"].map((x) => RecipeItem.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "success": success,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class RecipeItem {
  RecipeItem({
    this.receipeFoodtype,
    this.receipeId,
    this.receipeName,
    this.receipeImg,
    this.receipeDifficulty,
    this.receipeTime,
    this.userId,
    this.name,
    this.cancerNm,
    this.stageNm,
    this.progressNm,
  });

  String receipeFoodtype;
  int receipeId;
  String receipeName;
  String receipeImg;
  int receipeDifficulty;
  int receipeTime;
  int userId;
  String name;
  String cancerNm;
  String stageNm;
  String progressNm;

  factory RecipeItem.fromJson(Map<String, dynamic> json) => RecipeItem(
        receipeFoodtype: json["receipe_foodtype"],
        receipeId: json["receipe_id"],
        receipeName: json["receipe_name"],
        receipeImg: json["receipe_img"],
        receipeDifficulty: json["receipe_difficulty"],
        receipeTime: json["receipe_time"],
        userId: json["user_id"],
        name: json["name"],
        cancerNm: json["cancerNm"],
        stageNm: json["stageNm"],
        progressNm: json["progressNm"],
      );

  Map<String, dynamic> toJson() => {
        "receipe_foodtype": receipeFoodtype,
        "receipe_id": receipeId,
        "receipe_name": receipeName,
        "receipe_img": receipeImg,
        "receipe_difficulty": receipeDifficulty,
        "receipe_time": receipeTime,
        "user_id": userId,
        "name": name,
        "cancerNm": cancerNm,
        "stageNm": stageNm,
        "progressNm": progressNm,
      };
}
