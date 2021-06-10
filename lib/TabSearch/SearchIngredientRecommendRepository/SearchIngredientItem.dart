// To parse this JSON data, do
//
//     final searchIngredient = searchIngredientFromJson(jsonString);

import 'dart:convert';

SearchIngredient searchIngredientRecommendFromJson(String str) =>
    SearchIngredient.fromJson(json.decode(str));

String searchIngredientToJson(SearchIngredient data) =>
    json.encode(data.toJson());

class SearchIngredient {
  SearchIngredient({
    this.status,
    this.success,
    this.message,
    this.data,
  });

  int status;
  bool success;
  String message;
  List<String> data;

  factory SearchIngredient.fromJson(Map<String, dynamic> json) =>
      SearchIngredient(
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
