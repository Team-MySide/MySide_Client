// To parse this JSON data, do
//
//     final comment = commentFromJson(jsonString);
// To parse this JSON data, do
//
//     final comment = commentFromJson(jsonString);

import 'dart:convert';

SubCommentDataItem subCommentFromJson(String str) => SubCommentDataItem.fromJson(json.decode(str));

String subCommentToJson(SubCommentDataItem data) => json.encode(data.toJson());

class SubCommentDataItem {
  SubCommentDataItem({
    this.status,
    this.success,
    this.message,
    this.data,
  });

  int status;
  bool success;
  String message;
  List<SubComment> data;

  factory SubCommentDataItem.fromJson(Map<String, dynamic> json) => SubCommentDataItem(
    status: json["status"],
    success: json["success"],
    message: json["message"],
    data: List<SubComment>.from(json["data"].map((x) => SubComment.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "success": success,
    "message": message,
    "data": List<SubComment>.from(data.map((x) => x.toJson())),
  };
}



class SubComment {
  SubComment({
    this.subcomment_id,
    this.comment_id,
    this.receipe_id,
    this.content,
    this.likesum,
    this.create_time,
    this.nickname,
    this.cancerNm,
    this.stageNm,
    this.progressNm,
    this.relationNm,
    this.like_status,
  });

  int subcomment_id;
  int comment_id=0;
  int receipe_id=0;
  String content='';
  int likesum=0;
  String create_time='';
  String nickname='';
  String cancerNm='';
  String stageNm='';
  String progressNm='';
  String relationNm='';
  bool like_status=true;


  factory SubComment.fromJson(Map<String, dynamic> json) => SubComment(
    subcomment_id: json["subcomment_id"],
    comment_id: json["comment_id"],
    receipe_id: json["receipe_id"],
    content: json["content"],
    likesum: json["likesum"],
    create_time: json["create_time"],
    nickname: json["nickname"],
    cancerNm: json["cancerNm"],
    stageNm: json["stageNm"],
    progressNm: json["progressNm"],
    relationNm: json["relationNm"],
    like_status: json["like_status"],
  );

  Map<String, dynamic> toJson() => {
    "subcomment_id": subcomment_id,
    "comment_id": comment_id, //아직 없음
    "receipe_id": receipe_id,
    "content": content,
    "likesum": likesum,
    "create_time": create_time,
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

  "subcomment_id": 1,
  "comment_id": 1, //아직 없음
  "receipe_id": 1,
  "content": "시금치는 몸에 다 좋아요! 특히 겨울 시금치~너무 좋더라구요",
  "likesum": 0,
  "create_time": "2022-03-18 15:08:11",
  "nickname": "토끼가족",
  "cancerNm": "위암",
  "stageNm": "2기",
  "progressNm": "수술전",
  "relationNm": "본인",
  "like_status": false,


};