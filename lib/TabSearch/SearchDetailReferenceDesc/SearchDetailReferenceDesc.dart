// To parse this JSON data, do
//
//     final searchDetailReferenceDesc = searchDetailReferenceDescFromJson(jsonString);

import 'dart:convert';

SearchDetailReferenceDesc searchDetailReferenceDescFromJson(String str) =>
    SearchDetailReferenceDesc.fromJson(json.decode(str));

String searchDetailReferenceDescToJson(SearchDetailReferenceDesc data) =>
    json.encode(data.toJson());

class SearchDetailReferenceDesc {
  SearchDetailReferenceDesc({
    this.status,
    this.success,
    this.message,
    this.data,
  });

  int status;
  bool success;
  String message;
  List<SearchDetailReferenceDescItem> data;

  factory SearchDetailReferenceDesc.fromJson(Map<String, dynamic> json) =>
      SearchDetailReferenceDesc(
        status: json["status"],
        success: json["success"],
        message: json["message"],
        data: List<SearchDetailReferenceDescItem>.from(
            json["data"].map((x) => SearchDetailReferenceDescItem.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "success": success,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class SearchDetailReferenceDescItem {
  SearchDetailReferenceDescItem({
    this.headline,
    this.comment,
    this.source,
    this.sourceLink,
    this.sourceDate,
  });

  String headline;
  String comment;
  String source;
  String sourceLink;
  String sourceDate;

  factory SearchDetailReferenceDescItem.fromJson(Map<String, dynamic> json) =>
      SearchDetailReferenceDescItem(
        headline: json["headline"],
        comment: json["comment"],
        source: json["source"],
        sourceLink: json["source_link"],
        sourceDate: json["source_date"],
      );

  Map<String, dynamic> toJson() => {
        "headline": headline,
        "comment": comment,
        "source": source,
        "source_link": sourceLink,
        "source_date": sourceDate,
      };
}
