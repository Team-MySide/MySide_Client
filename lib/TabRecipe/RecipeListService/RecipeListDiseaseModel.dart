// To parse this JSON data, do
//
//     final recipeListFoodType = recipeListFoodTypeFromJson(jsonString);

import 'dart:convert';

RecipeListDiseaseModel recipeListDiseaseTypeFromJson(String str) =>
    RecipeListDiseaseModel.fromJson(json.decode(str));

String recipeListFoodTypeToJson(RecipeListDiseaseModel data) =>
    json.encode(data.toJson());

class RecipeListDiseaseModel {
  RecipeListDiseaseModel({
    this.status,
    this.success,
    this.message,
    this.data,
  });

  int status;
  bool success;
  String message;
  List<RecipeListDiseaseItem> data;

  factory RecipeListDiseaseModel.fromJson(Map<String, dynamic> json) =>
      RecipeListDiseaseModel(
        status: json["status"],
        success: json["success"],
        message: json["message"],
        data: List<RecipeListDiseaseItem>.from(
            json["data"].map((x) => RecipeListDiseaseItem.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "success": success,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class RecipeListDiseaseItem {
  RecipeListDiseaseItem({
    this.receipeId,
    this.receipeName,
    this.receipeImg,
    this.receipeDifficulty,
    this.receipeTime,
    this.receipeUserId,
    this.userName,
    this.userCancerNm,
    this.userStageNm,
    this.userProgressNm,
  });

  String receipeId;
  String receipeName;
  String receipeImg;
  String receipeDifficulty;
  String receipeTime;
  String receipeUserId;
  String userName;
  String userCancerNm;
  String userStageNm;
  String userProgressNm;

  factory RecipeListDiseaseItem.fromJson(Map<String, dynamic> json) =>
      RecipeListDiseaseItem(
        receipeId: json["receipe_id"],
        receipeName: json["receipe_name"],
        receipeImg: json["receipe_img"],
        receipeDifficulty: json["receipe_difficulty"],
        receipeTime: json["receipe_time"],
        receipeUserId: json["receipe_user_id"],
        userName: json["user_name"],
        userCancerNm: json["user_cancerNm"],
        userStageNm: json["user_stageNm"],
        userProgressNm: json["user_progressNm"],
      );

  Map<String, dynamic> toJson() => {
        "receipe_id": receipeId,
        "receipe_name": receipeName,
        "receipe_img": receipeImg,
        "receipe_difficulty": receipeDifficulty,
        "receipe_time": receipeTime,
        "receipe_user_id": receipeUserId,
        "user_name": userName,
        "user_cancerNm": userCancerNm,
        "user_stageNm": userStageNm,
        "user_progressNm": userProgressNm,
      };
}
