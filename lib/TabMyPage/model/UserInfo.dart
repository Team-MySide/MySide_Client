// To parse this JSON data, do
//
//     final userInfo = userInfoFromJson(jsonString);

import 'dart:convert';

UserInfo userInfoFromJson(String str) => UserInfo.fromJson(json.decode(str));

String userInfoToJson(UserInfo data) => json.encode(data.toJson());

class UserInfo {
  UserInfo({
    this.status,
    this.success,
    this.message,
    this.data,
  });

  int status;
  bool success;
  String message;
  UserData data;

  factory UserInfo.fromJson(Map<String, dynamic> json) => UserInfo(
        status: json["status"],
        success: json["success"],
        message: json["message"],
        data: UserData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "success": success,
        "message": message,
        "data": data.toJson(),
      };
}

class UserData {
  UserData({
    this.nickname,
    this.name,
    this.stageNm,
    this.progressNm,
    this.cancerNm,
    this.disease,
  });

  String nickname;
  String name;
  String stageNm;
  String progressNm;
  String cancerNm;
  String disease;

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
        nickname: json["nickname"],
        name: json["name"],
        stageNm: json["stageNm"],
        progressNm: json["progressNm"],
        cancerNm: json["cancerNm"],
        disease: json["disease"],
      );

  Map<String, dynamic> toJson() => {
        "nickname": nickname,
        "name": name,
        "stageNm": stageNm,
        "progressNm": progressNm,
        "cancerNm": cancerNm,
        "disease": disease,
      };
}
