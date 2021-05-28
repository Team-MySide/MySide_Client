// To parse this JSON data, do
//
//     final searchDetailMainInfoBody = searchDetailMainInfoBodyFromJson(jsonString);

import 'dart:convert';

SearchDetailMainInfoBody searchDetailMainInfoBodyFromJson(String str) =>
    SearchDetailMainInfoBody.fromJson(json.decode(str));

String searchDetailMainInfoBodyToJson(SearchDetailMainInfoBody data) =>
    json.encode(data.toJson());

class SearchDetailMainInfoBody {
  SearchDetailMainInfoBody({
    this.status,
    this.success,
    this.message,
    this.data,
  });

  int status;
  bool success;
  String message;
  SearchDetailMainInfoItem data;

  factory SearchDetailMainInfoBody.fromJson(Map<String, dynamic> json) =>
      SearchDetailMainInfoBody(
        status: json["status"],
        success: json["success"],
        message: json["message"],
        data: SearchDetailMainInfoItem.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "success": success,
        "message": message,
        "data": data.toJson(),
      };
}

class SearchDetailMainInfoItem {
  SearchDetailMainInfoItem({
    this.name,
    this.img,
    this.title,
    this.cancer,
    this.nutrition,
    this.etc,
    this.likes,
    this.wishes,
    this.views,
    this.likeStatus,
    this.wishStatus,
  });

  String name;
  String img;
  String title;
  List<String> cancer;
  List<String> nutrition;
  List<String> etc;
  int likes;
  int wishes;
  int views;
  int likeStatus;
  int wishStatus;

  factory SearchDetailMainInfoItem.fromJson(Map<String, dynamic> json) =>
      SearchDetailMainInfoItem(
        name: json["name"],
        img: json["img"],
        title: json["title"],
        cancer: List<String>.from(json["cancer"].map((x) => x)),
        nutrition: List<String>.from(json["nutrition"].map((x) => x)),
        etc: List<String>.from(json["etc"].map((x) => x)),
        likes: json["likes"],
        wishes: json["wishes"],
        views: json["views"],
        likeStatus: json["likeStatus"],
        wishStatus: json["wishStatus"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "img": img,
        "title": title,
        "cancer": List<dynamic>.from(cancer.map((x) => x)),
        "nutrition": List<dynamic>.from(nutrition.map((x) => x)),
        "etc": List<dynamic>.from(etc.map((x) => x)),
        "likes": likes,
        "wishes": wishes,
        "views": views,
        "likeStatus": likeStatus,
        "wishStatus": wishStatus,
      };
}
