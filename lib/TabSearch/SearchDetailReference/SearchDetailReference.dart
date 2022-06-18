// To parse this JSON data, do
//
//     final searchDetailReference = searchDetailReferenceFromJson(jsonString);

import 'dart:convert';

SearchDetailReference searchDetailReferenceFromJson(String str) =>
    SearchDetailReference.fromJson(json.decode(str));

String searchDetailReferenceToJson(SearchDetailReference data) =>
    json.encode(data.toJson());

class SearchDetailReference {
  SearchDetailReference({
    this.status,
    this.success,
    this.message,
    this.data,
  });

  int status;
  bool success;
  String message;
  List<SearchDetailReferenceItem> data;

  factory SearchDetailReference.fromJson(Map<String, dynamic> json) =>
      SearchDetailReference(
        status: json["status"],
        success: json["success"],
        message: json["message"],
        data: List<SearchDetailReferenceItem>.from(
            json["data"].map((x) => SearchDetailReferenceItem.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "success": success,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class SearchDetailReferenceItem {
  SearchDetailReferenceItem({
    this.cancerNm,
    this.flagList,
  });

  String cancerNm;
  List<FlagList> flagList;

  factory SearchDetailReferenceItem.fromJson(Map<String, dynamic> json) =>
      SearchDetailReferenceItem(
        cancerNm: json["cancerNm"],
        flagList: List<FlagList>.from(
            json["flagList"].map((x) => FlagList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "cancerNm": cancerNm,
        "flagList": List<dynamic>.from(flagList.map((x) => x.toJson())),
      };
}

class FlagList {
  FlagList({
    this.code,
    this.count,
  });

  int code;
  int count;

  factory FlagList.fromJson(Map<String, dynamic> json) => FlagList(
        code: json["code"],
        count: json["count"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "count": count,
      };
}
