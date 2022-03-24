// To parse this JSON data, do
//
//     final comment = commentFromJson(jsonString);
// To parse this JSON data, do
//
//     final comment = commentFromJson(jsonString);

import 'dart:convert';

CommentDataItem commentFromJson(String str) => CommentDataItem.fromJson(json.decode(str));

String commentToJson(CommentDataItem data) => json.encode(data.toJson());

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
    "data": List<Comment>.from(data.map((x) => x.toJson())),
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

  "comment_id": 1, //아직 없음
  "receipe_id": 1,
  "comment_content": "시금치는 몸에 다 좋아요! 특히 겨울 시금치~너무 좋더라구요",
  "likesum": 0,
  "subcomment_sum": 0,
  "comment_time": "2022-03-18 15:08:11",
  "nickname": "토끼가족",
  "cancerNm": "위암",
  "stageNm": "2기",
  "progressNm": "수술전",
  "relationNm": "본인",
  "like_status": false,


};
