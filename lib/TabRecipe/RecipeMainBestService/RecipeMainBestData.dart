// To parse this JSON data, do
//
//     final recipeMainBestData = recipeMainBestDataFromJson(jsonString);

import 'dart:convert';

RecipeMainBestData recipeMainBestDataFromJson(String str) =>
    RecipeMainBestData.fromJson(json.decode(str));

String recipeMainBestDataToJson(RecipeMainBestData data) =>
    json.encode(data.toJson());

class RecipeMainBestData {
  RecipeMainBestData({
    this.status,
    this.success,
    this.message,
    this.data,
  });

  int status;
  bool success;
  String message;
  List<RecipeMainBestItem> data;

  factory RecipeMainBestData.fromJson(Map<String, dynamic> json) =>
      RecipeMainBestData(
        status: json["status"],
        success: json["success"],
        message: json["message"],
        data: List<RecipeMainBestItem>.from(
            json["data"].map((x) => RecipeMainBestItem.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "success": success,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class RecipeMainBestItem {
  RecipeMainBestItem({
    this.receipeId,
    this.likesum,
    this.receipeName,
    this.receipeImg,
    this.receipeDifficulty,
    this.receipeTime,
    this.userId,
  });

  int receipeId;
  int likesum;
  String receipeName;
  String receipeImg;
  dynamic receipeDifficulty;
  dynamic receipeTime;
  dynamic userId;

  factory RecipeMainBestItem.fromJson(Map<String, dynamic> json) =>
      RecipeMainBestItem(
        receipeId: json["receipe_id"],
        likesum: json["likesum"],
        receipeName: json["receipe_name"] == null ? null : json["receipe_name"],
        receipeImg: json["receipe_img"] == null ? null : json["receipe_img"],
        receipeDifficulty: json["receipe_difficulty"],
        receipeTime: json["receipe_time"],
        userId: json["user_id"],
      );

  Map<String, dynamic> toJson() => {
        "receipe_id": receipeId,
        "likesum": likesum,
        "receipe_name": receipeName == null ? null : receipeName,
        "receipe_img": receipeImg == null ? null : receipeImg,
        "receipe_difficulty": receipeDifficulty,
        "receipe_time": receipeTime,
        "user_id": userId,
      };
}
