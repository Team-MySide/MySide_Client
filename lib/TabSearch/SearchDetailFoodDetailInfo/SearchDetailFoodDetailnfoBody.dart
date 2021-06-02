// To parse this JSON data, do
//
//     final searchDetailFoodDetailBody = searchDetailFoodDetailBodyFromJson(jsonString);

import 'dart:convert';

SearchDetailFoodDetailBody searchDetailFoodDetailBodyFromJson(String str) =>
    SearchDetailFoodDetailBody.fromJson(json.decode(str));

String searchDetailFoodDetailBodyToJson(SearchDetailFoodDetailBody data) =>
    json.encode(data.toJson());

class SearchDetailFoodDetailBody {
  SearchDetailFoodDetailBody({
    this.status,
    this.success,
    this.message,
    this.data,
  });

  int status;
  bool success;
  String message;
  SearchDetailFoodDetailItem data;

  factory SearchDetailFoodDetailBody.fromJson(Map<String, dynamic> json) =>
      SearchDetailFoodDetailBody(
        status: json["status"],
        success: json["success"],
        message: json["message"],
        data: SearchDetailFoodDetailItem.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "success": success,
        "message": message,
        "data": data.toJson(),
      };
}

class SearchDetailFoodDetailItem {
  SearchDetailFoodDetailItem({
    this.efficacy,
    this.combination,
    this.selectTip,
    this.care,
  });

  String efficacy;
  String combination;
  String selectTip;
  String care;

  factory SearchDetailFoodDetailItem.fromJson(Map<String, dynamic> json) =>
      SearchDetailFoodDetailItem(
        efficacy: json["efficacy"],
        combination: json["combination"],
        selectTip: json["select_tip"],
        care: json["care"],
      );

  Map<String, dynamic> toJson() => {
        "efficacy": efficacy,
        "combination": combination,
        "select_tip": selectTip,
        "care": care,
      };
}
