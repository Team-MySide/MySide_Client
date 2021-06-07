// To parse this JSON data, do
//
//     final healthDataDetail = healthDataDetailFromJson(jsonString);

import 'dart:convert';

HealthDataDetail healthDataDetailFromJson(String str) =>
    HealthDataDetail.fromJson(json.decode(str));

String healthDataDetailToJson(HealthDataDetail data) =>
    json.encode(data.toJson());

class HealthDataDetail {
  HealthDataDetail({
    this.status,
    this.success,
    this.message,
    this.data,
  });

  int status;
  bool success;
  String message;
  Data data;

  factory HealthDataDetail.fromJson(Map<String, dynamic> json) =>
      HealthDataDetail(
        status: json["status"],
        success: json["success"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "success": success,
        "message": message,
        "data": data.toJson(),
      };
}

class Data {
  Data({
    this.relationNm,
    this.gender,
    this.age,
    this.height,
    this.weight,
    this.stageNm,
    this.progressNm,
    this.cancerNm,
    this.disease,
    this.disableFood,
    this.memo,
  });

  String relationNm;
  String gender;
  int age;
  int height;
  int weight;
  String stageNm;
  String progressNm;
  String cancerNm;
  String disease;
  String disableFood;
  String memo;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        relationNm: json["relationNm"],
        gender: json["gender"],
        age: json["age"],
        height: json["height"],
        weight: json["weight"],
        stageNm: json["stageNm"],
        progressNm: json["progressNm"],
        cancerNm: json["cancerNm"],
        disease: json["disease"],
        disableFood: json["disable_food"],
        memo: json["memo"],
      );

  Map<String, dynamic> toJson() => {
        "relationNm": relationNm,
        "gender": gender,
        "age": age,
        "height": height,
        "weight": weight,
        "stageNm": stageNm,
        "progressNm": progressNm,
        "cancerNm": cancerNm,
        "disease": disease,
        "disable_food": disableFood,
        "memo": memo,
      };
}
