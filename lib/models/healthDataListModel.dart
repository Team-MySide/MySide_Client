// To parse this JSON data, do
//
//     final healthDataList = healthDataListFromJson(jsonString);

import 'dart:convert';

HealthDataList healthDataListFromJson(String str) =>
    HealthDataList.fromJson(json.decode(str));

String healthDataListToJson(HealthDataList data) => json.encode(data.toJson());

class HealthDataList {
  HealthDataList({
    this.status,
    this.success,
    this.message,
    this.data,
  });

  int status;
  bool success;
  String message;
  List<HealthData> data;

  factory HealthDataList.fromJson(Map<String, dynamic> json) => HealthDataList(
        status: json["status"],
        success: json["success"],
        message: json["message"],
        data: List<HealthData>.from(
            json["data"].map((x) => HealthData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "success": success,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class HealthData {
  HealthData({
    this.healthId,
    this.cancerNm,
    this.stageNm,
    this.progressNm,
    this.disease,
    this.weight,
    this.height,
    this.memo,
    this.regiDate,
  });

  int healthId;
  String cancerNm;
  String stageNm;
  String progressNm;
  String disease;
  int weight;
  int height;
  String memo;
  String regiDate;

  factory HealthData.fromJson(Map<String, dynamic> json) => HealthData(
        healthId: json["health_id"],
        cancerNm: json["cancerNm"],
        stageNm: json["stageNm"],
        progressNm: json["progressNm"],
        disease: json["disease"],
        weight: json["weight"],
        height: json["height"],
        memo: json["memo"],
        regiDate: json["RegiDate"],
      );

  Map<String, dynamic> toJson() => {
        "health_id": healthId,
        "cancerNm": cancerNm,
        "stageNm": stageNm,
        "progressNm": progressNm,
        "disease": disease,
        "weight": weight,
        "height": height,
        "memo": memo,
        "RegiDate": regiDate,
      };
}
