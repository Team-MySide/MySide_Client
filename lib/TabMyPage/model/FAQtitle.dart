// To parse this JSON data, do
//
//     final faQtitle = faQtitleFromJson(jsonString);

import 'dart:convert';

FaQtitle faQtitleFromJson(String str) => FaQtitle.fromJson(json.decode(str));

String faQtitleToJson(FaQtitle data) => json.encode(data.toJson());

class FaQtitle {
  FaQtitle({
    this.status,
    this.success,
    this.message,
    this.data,
  });

  int status;
  bool success;
  String message;
  List<FAQdata> data;

  factory FaQtitle.fromJson(Map<String, dynamic> json) => FaQtitle(
        status: json["status"],
        success: json["success"],
        message: json["message"],
        data: List<FAQdata>.from(json["data"].map((x) => FAQdata.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "success": success,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class FAQdata {
  FAQdata({
    this.faqId,
    this.category,
    this.title,
  });

  int faqId;
  String category;
  String title;

  factory FAQdata.fromJson(Map<String, dynamic> json) => FAQdata(
        faqId: json["faq_id"],
        category: json["category"],
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "faq_id": faqId,
        "category": category,
        "title": title,
      };
}
