import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:intl/intl.dart';
import 'package:my_side_client/services/mypageService/myPageService.dart';

class SignUpUserController extends GetxController {
  String email = '';
  String name = '';
  String phone = '';
  String password = '';
  String relationNm = '';
  String nickname = '';
  String cancerNm = '';
  String stageNm = '';
  String progressNm = '';
  String gender = '';
  String age = '';
  String height = '';
  String weight = '';
  String disableFood = '';
  String disease = '';
  String tempToken = '';

  void setMainInfo(
      String inEmail, String inName, String inPhone, String inPassword) {
    email = inEmail;
    name = inName;
    phone = inPhone;
    password = inPassword;
    update();
  }

  void setUserType(String inUsrType) {
    relationNm = inUsrType;
    update();
  }

  void setNickName(String inNickname) {
    nickname = inNickname;
    update();
  }

  void setCancerName(String inCancer) {
    cancerNm = inCancer;
    update();
  }

  void setStageNm(String inStageNm) {
    stageNm = inStageNm;
    update();
  }

  void setProgressNm(String inProgressNm) {
    progressNm = inProgressNm;
    update();
  }

  void setPhysicalInfo(
      String inGender, String inAge, String inHeight, String inWeight) {
    gender = inGender;
    age = inAge;
    height = inHeight;
    weight = inWeight;
    update();
  }

  void setDisease(String inDisease) {
    disease = inDisease;
    update();
  }

  void tempGetToken() async {
    final response =
        await http.post(Uri.http('3.39.126.13:3000', '/auth/signin'), headers: {
      "Accept": "applications.json"
    }, body: {
      "email": email,
      "password": password,
    });
    if (response.statusCode == 200) {
      var jsondata = json.decode(response.body);
      if (jsondata['success']) {
        tempToken = jsondata['data']['tokens']['token'];
      }
    }
    update();
  }

  void initialHealthData() async {
    await writeHealthData(
      tempToken,
      '${DateFormat("yyyy-MM-dd").format(DateTime.now())}',
      relationNm,
      gender,
      age,
      height,
      weight,
      cancerNm,
      stageNm,
      progressNm,
      disease,
      '',
    );
    update();
  }

  void signUpUser() async {
    final response =
        await http.post(Uri.http('3.39.126.13:3000', '/auth/signup'), headers: {
      "Accept": "applications.json"
    }, body: {
      "email": email,
      "password": password,
      "name": name,
      "phone": phone,
      "relationNm": relationNm,
      "nickname": nickname,
      "cancerNm": cancerNm,
      "stageNm": stageNm,
      "progressNm": progressNm,
      "gender": gender,
      "age": age,
      "height": height,
      "weight": weight,
      "disableFood": disableFood,
      "disease": disease,
    });
    if (response.statusCode == 200) {
      var jsondata = json.decode(response.body);
      if (jsondata['success']) {
        await tempGetToken();
        await initialHealthData();
      }
    }

    update();
  }
}
