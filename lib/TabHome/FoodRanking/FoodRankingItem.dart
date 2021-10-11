import 'dart:convert';

import 'package:my_side_client/TabBookmark/SearchBookmarkRepository/SearchFoodItem.dart';

FoodRanking foodRankingFromJson(String str) =>
    FoodRanking.fromJson(json.decode(str));

String foodRankingToJson(FoodRanking data) => json.encode(data.toJson());

class FoodRanking {
  FoodRanking({
    this.status,
    this.success,
    this.message,
    this.data,
  });

  int status;
  bool success;
  String message;
  List<FoodItem> data;

  factory FoodRanking.fromJson(Map<String, dynamic> json) => FoodRanking(
        status: json["status"],
        success: json["success"],
        message: json["message"],
        data: List<FoodItem>.from(json["data"].map(
            // (x) => FoodRankingItem.fromJson((x as FoodRankingItem).toJson()))),
            (x) => FoodItem.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "success": success,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}
