// To parse this JSON data, do
//
//     final comment = commentFromJson(jsonString);
// To parse this JSON data, do
//
//     final comment = commentFromJson(jsonString);

import 'dart:convert';

CommentDataItem commentDataItemFromJson(String str) => CommentDataItem.fromJson(json.decode(str));

String commentDataItemToJson(CommentDataItem data) => json.encode(data.toJson());

class CommentDataItem {
  CommentDataItem({
    this.status,
    this.success,
    this.message,
    this.data,
  });

  int status;
  bool success;
  String message;
  List<Comment> data;

  factory CommentDataItem.fromJson(Map<String, dynamic> json) => CommentDataItem(
    status: json["status"],
    success: json["success"],
    message: json["message"],
    data: List<Comment>.from(json["data"].map((x) => Comment.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "success": success,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}



class Comment {
  Comment({
    this.comment_id,
    this.receipe_id,
    this.comment_content,
    this.likesum,
    this.subcomment_sum,
    this.comment_time,
    this.nickname,
    this.cancerNm,
    this.stageNm,
    this.progressNm,
    this.relationNm,
    this.like_status,
  });

  int comment_id=0;
  int receipe_id=0;
  String comment_content='';
  int likesum=0;
  int subcomment_sum=0;
  String comment_time='';
  String nickname='';
  String cancerNm='';
  String stageNm='';
  String progressNm='';
  String relationNm='';
  bool like_status=true;


  factory Comment.fromJson(Map<String, dynamic> json) => Comment(
    comment_id: json["comment_id"],
    receipe_id: json["receipe_id"],
    comment_content: json["comment_content"],
    likesum: json["likesum"],
    subcomment_sum: json["subcomment_sum"],
    comment_time: json["comment_time"],
    nickname: json["nickname"],
    cancerNm: json["cancerNm"],
    stageNm: json["stageNm"],
    progressNm: json["progressNm"],
    relationNm: json["relationNm"],
    like_status: json["like_status"],
  );

  Map<String, dynamic> toJson() => {
    "comment_id": comment_id, //아직 없음
    "receipe_id": receipe_id,
    "comment_content": comment_content,
    "likesum": likesum,
    "subcomment_sum": subcomment_sum,
    "comment_time": comment_time,
    "nickname": nickname,
    "cancerNm": cancerNm,
    "stageNm": stageNm,
    "progressNm": progressNm,
    "relationNm": relationNm,
    "like_status": like_status,
  };

  List<dynamic> sampleThread = [
    {"commendId": 454, "threadId": 444},
    {"commendId": 455, "threadId": 444},
    {"commendId": 456, "threadId": 444}
  ];
}

CommentPost commentPostFromJson(String str) => CommentPost.fromJson(json.decode(str));

String commentPostToJson(CommentPost data) => json.encode(data.toJson());

class CommentPost {
  CommentPost({
    this.status,
    this.success,
    this.message,
  });

  int status;
  bool success;
  String message;

  factory CommentPost.fromJson(Map<String, dynamic> json) => CommentPost(
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
