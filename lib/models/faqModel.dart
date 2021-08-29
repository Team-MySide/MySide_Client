// To parse this JSON data, do
//
//     final faQmodel = faQmodelFromJson(jsonString);

import 'dart:convert';

FaQmodel faQmodelFromJson(String str) => FaQmodel.fromJson(json.decode(str));

String faQmodelToJson(FaQmodel data) => json.encode(data.toJson());

class FaQmodel {
  FaQmodel({
    this.status,
    this.success,
    this.message,
    this.data,
  });

  int status;
  bool success;
  String message;
  List<FAQItem> data;

  factory FaQmodel.fromJson(Map<String, dynamic> json) => FaQmodel(
        status: json["status"],
        success: json["success"],
        message: json["message"],
        data: List<FAQItem>.from(json["data"].map((x) => FAQItem.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "success": success,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class FAQItem {
  FAQItem({
    this.faqId,
    this.category,
    this.title,
    this.content,
    this.regiDate,
  });

  int faqId;
  String category;
  String title;
  String content;
  DateTime regiDate;

  factory FAQItem.fromJson(Map<String, dynamic> json) => FAQItem(
        faqId: json["faq_id"],
        category: json["category"],
        title: json["title"],
        content: json["content"],
        regiDate: DateTime.parse(json["regiDate"]),
      );

  Map<String, dynamic> toJson() => {
        "faq_id": faqId,
        "category": category,
        "title": title,
        "content": content,
        "regiDate": regiDate.toIso8601String(),
      };
}
