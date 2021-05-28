// To parse this JSON data, do
//
//     final searchDetailFoodStateBody = searchDetailFoodStateBodyFromJson(jsonString);

import 'dart:convert';

SearchDetailFoodStateBody searchDetailFoodStateBodyFromJson(String str) =>
    SearchDetailFoodStateBody.fromJson(json.decode(str));

String searchDetailFoodStateBodyToJson(SearchDetailFoodStateBody data) =>
    json.encode(data.toJson());

class SearchDetailFoodStateBody {
  SearchDetailFoodStateBody({
    this.status,
    this.success,
    this.message,
    this.data,
  });

  int status;
  bool success;
  String message;
  List<String> data;

  factory SearchDetailFoodStateBody.fromJson(Map<String, dynamic> json) =>
      SearchDetailFoodStateBody(
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
