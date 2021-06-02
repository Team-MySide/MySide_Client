// To parse this JSON data, do
//
//     final searchIngredient = searchIngredientFromJson(jsonString);

import 'dart:convert';

TotalSearch totalSearchFromJson(String str) =>
    TotalSearch.fromJson(json.decode(str));

String totalSearchToJson(TotalSearch data) => json.encode(data.toJson());

class TotalSearch {
  TotalSearch({
    this.status,
    this.success,
    this.message,
    this.data,
  });

  int status;
  bool success;
  String message;
  List<String> data;

  factory TotalSearch.fromJson(Map<String, dynamic> json) => TotalSearch(
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
