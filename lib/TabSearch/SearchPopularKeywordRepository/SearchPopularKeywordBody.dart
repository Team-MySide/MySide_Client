// To parse this JSON data, do
//
//     final searchIngredient = searchIngredientFromJson(jsonString);

import 'dart:convert';

SearchPopularKeywordBody searchPopularKeywordFromJson(String str) =>
    SearchPopularKeywordBody.fromJson(json.decode(str));

String downloadFoodListToJson(SearchPopularKeywordBody data) =>
    json.encode(data.toJson());

class SearchPopularKeywordBody {
  SearchPopularKeywordBody({
    this.status,
    this.success,
    this.message,
    this.data,
  });

  int status;
  bool success;
  String message;
  List<String> data;

  factory SearchPopularKeywordBody.fromJson(Map<String, dynamic> json) =>
      SearchPopularKeywordBody(
        status: json["status"],
        success: json["success"],
        message: json["message"],
        data: List<String>.from(json["data"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "success": success,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x)),
      };
}
