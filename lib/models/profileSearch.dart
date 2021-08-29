// To parse this JSON data, do
//
//     final profileSearch = profileSearchFromJson(jsonString);

import 'dart:convert';

ProfileSearch profileSearchFromJson(String str) =>
    ProfileSearch.fromJson(json.decode(str));

String profileSearchToJson(ProfileSearch data) => json.encode(data.toJson());

class ProfileSearch {
  ProfileSearch({
    this.status,
    this.success,
    this.message,
    this.data,
  });

  int status;
  bool success;
  String message;
  Profile data;

  factory ProfileSearch.fromJson(Map<String, dynamic> json) => ProfileSearch(
        status: json["status"],
        success: json["success"],
        message: json["message"],
        data: Profile.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "success": success,
        "message": message,
        "data": data.toJson(),
      };
}

class Profile {
  Profile({
    this.email,
    this.nickname,
    this.name,
    this.phone,
  });

  String email;
  String nickname;
  String name;
  String phone;

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
        email: json["email"],
        nickname: json["nickname"],
        name: json["name"],
        phone: json["phone"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "nickname": nickname,
        "name": name,
        "phone": phone,
      };
}
