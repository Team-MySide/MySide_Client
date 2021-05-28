// To parse this JSON data, do
//
//     final searchNutritionFactsBody = searchNutritionFactsBodyFromJson(jsonString);

import 'dart:convert';

SearchNutritionFactsBody searchNutritionFactsBodyFromJson(String str) =>
    SearchNutritionFactsBody.fromJson(json.decode(str));

String searchNutritionFactsBodyToJson(SearchNutritionFactsBody data) =>
    json.encode(data.toJson());

class SearchNutritionFactsBody {
  SearchNutritionFactsBody({
    this.status,
    this.success,
    this.message,
    this.data,
  });

  int status;
  bool success;
  String message;
  SearchNutritionFactsItem data;

  factory SearchNutritionFactsBody.fromJson(Map<String, dynamic> json) =>
      SearchNutritionFactsBody(
        status: json["status"],
        success: json["success"],
        message: json["message"],
        data: SearchNutritionFactsItem.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "success": success,
        "message": message,
        "data": data.toJson(),
      };
}

class SearchNutritionFactsItem {
  SearchNutritionFactsItem({
    this.good,
    this.goodMax,
    this.bad,
    this.badMax,
    this.function,
    this.functionMax,
    this.etc,
    this.etcMax,
  });

  int good;
  int goodMax;
  int bad;
  int badMax;
  int function;
  int functionMax;
  int etc;
  int etcMax;

  factory SearchNutritionFactsItem.fromJson(Map<String, dynamic> json) =>
      SearchNutritionFactsItem(
        good: json["good"],
        goodMax: json["goodMax"],
        bad: json["bad"],
        badMax: json["badMax"],
        function: json["function"],
        functionMax: json["functionMax"],
        etc: json["etc"],
        etcMax: json["etcMax"],
      );

  Map<String, dynamic> toJson() => {
        "good": good,
        "goodMax": goodMax,
        "bad": bad,
        "badMax": badMax,
        "function": function,
        "functionMax": functionMax,
        "etc": etc,
        "etcMax": etcMax,
      };
}
