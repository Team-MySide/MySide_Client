// To parse this JSON data, do
//
//     final comment = commentFromJson(jsonString);
// To parse this JSON data, do
//
//     final comment = commentFromJson(jsonString);

import 'dart:convert';

Comment commentFromJson(String str) => Comment.fromJson(json.decode(str));

String commentToJson(Comment data) => json.encode(data.toJson());

class Comment {
  Comment({
    this.profileImage,
    this.userNickName,
    this.userId,
    this.commentary,
    this.comment,
    this.likeCount,
    this.commentCount,
    this.createdTime,
    this.commendId,
  });

  String profileImage;
  String userNickName;
  String userId;
  List<String> commentary;
  String comment;
  int likeCount;
  int commentCount;
  String createdTime;
  int commendId;

  factory Comment.fromJson(Map<String, dynamic> json) => Comment(
        profileImage: json["profileImage"],
        userNickName: json["userNickName"],
        userId: json["userId"],
        commentary: List<String>.from(json["commentary"].map((x) => x)),
        comment: json["comment"],
        likeCount: json["likeCount"],
        commentCount: json["commentCount"],
        createdTime: json["createdTime"],
        commendId: json["commendId"],
      );

  Map<String, dynamic> toJson() => {
        "profileImage": profileImage,
        "userNickName": userNickName,
        "userId": userId,
        "commentary": List<dynamic>.from(commentary.map((x) => x)),
        "comment": comment,
        "likeCount": likeCount,
        "commentCount": commentCount,
        "createdTime": createdTime,
        "commendId": commendId,
      };

  static List<dynamic> sampleList = [
    sampleComment,
    sampleComment,
    sampleComment
  ];

  List<dynamic> sampleThread = [
    {"commendId": 454, "threadId": 444},
    {"commendId": 455, "threadId": 444},
    {"commendId": 456, "threadId": 444}
  ];
}

final dynamic sampleComment = {
  "profileImage": "images/profile_sample.png",
  "userNickname": "토끼가족",
  "userId": "testId",
  "commentary": ["위암 2기", "수술전", "보호자"],
  "comment": "시금치는 몸에 다 좋아요! 특히 겨울 시금치~너무 좋더라구요",
  "likeCount": 10,
  "commentCount": 222,
  "createdTime": "2021123 11:22:11",
  "commendId": 444,
};
