// To parse this JSON data, do
//
//     final changeBookmarkBody = changeBookmarkBodyFromJson(jsonString);

import 'dart:convert';

ChangeBookmarkBody changeBookmarkBodyFromJson(String str) =>
    ChangeBookmarkBody.fromJson(json.decode(str));

String changeBookmarkBodyToJson(ChangeBookmarkBody data) =>
    json.encode(data.toJson());

class ChangeBookmarkBody {
  ChangeBookmarkBody({
    this.status,
    this.success,
    this.message,
  });

  int status;
  bool success;
  String message;

  factory ChangeBookmarkBody.fromJson(Map<String, dynamic> json) =>
      ChangeBookmarkBody(
        status: json["status"],
        success: json["success"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "success": success,
        "message": message,
      };
}
