// To parse this JSON data, do
//
//     final recipeMainRecommendRecipeItem = recipeMainRecommendRecipeItemFromJson(jsonString);

import 'dart:convert';

RecipeMainRecommendRecipeItem recipeMainRecommendRecipeItemFromJson(
        String str) =>
    RecipeMainRecommendRecipeItem.fromJson(json.decode(str));

String recipeMainRecommendRecipeItemToJson(
        RecipeMainRecommendRecipeItem data) =>
    json.encode(data.toJson());

class RecipeMainRecommendRecipeItem {
  RecipeMainRecommendRecipeItem({
    this.status,
    this.success,
    this.message,
    this.data,
  });

  int status;
  bool success;
  String message;
  List<RecommendRecipeItem> data;

  factory RecipeMainRecommendRecipeItem.fromJson(Map<String, dynamic> json) =>
      RecipeMainRecommendRecipeItem(
        status: json["status"],
        success: json["success"],
        message: json["message"],
        data: List<RecommendRecipeItem>.from(
            json["data"].map((x) => RecommendRecipeItem.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "success": success,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class RecommendRecipeItem {
  RecommendRecipeItem({
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

  factory RecommendRecipeItem.fromJson(Map<String, dynamic> json) =>
      RecommendRecipeItem(
        receipeId: json["receipe_id"],
        receipeName: json["receipe_name"] == null ? null : json["receipe_name"],
        receipeImg: json["receipe_img"] == null ? null : json["receipe_img"],
        receipeDifficulty: json["receipe_difficulty"] == null
            ? null
            : json["receipe_difficulty"],
        receipeTime: json["receipe_time"] == null ? null : json["receipe_time"],
        userId: json["user_id"],
        name: json["name"],
        cancerNm: json["cancerNm"],
        stageNm: json["stageNm"],
        progressNm: json["progressNm"],
      );

  Map<String, dynamic> toJson() => {
        "receipe_id": receipeId,
        "receipe_name": receipeName == null ? null : receipeName,
        "receipe_img": receipeImg == null ? null : receipeImg,
        "receipe_difficulty":
            receipeDifficulty == null ? null : receipeDifficulty,
        "receipe_time": receipeTime == null ? null : receipeTime,
        "user_id": userId,
        "name": name,
        "cancerNm": cancerNm,
        "stageNm": stageNm,
        "progressNm": progressNm,
      };
}
