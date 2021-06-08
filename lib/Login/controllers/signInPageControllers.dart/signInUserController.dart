import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';

class SignInUserController extends GetxController {
  String email = '';
  String password = '';
  String name = '';
  String phone = '';
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
      String inEmail, String inName, String inPhone, String inPswd) {
    email = inEmail;
    name = inName;
    phone = inPhone;
    password = inPswd;
    update();
  }

  void setUserType(String inUserType) {
    relationNm = inUserType;
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

  void setStageName(String inStage) {
    stageNm = inStage;
    update();
  }

  void setProgressName(String inProgress) {
    progressNm = inProgress;
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

  void setDieaseName(String inDisease) {
    disease = inDisease;
    update();
  }

  void tempGetToken() async {
    final response = await http
        .post(Uri.http('54.180.67.217:3000', '/auth/signin'), headers: {
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
    final response = await http.post(
        Uri.http('54.180.67.217:3000', '/mypage/health/insert'),
        headers: {
          "Accept": "applications.json",
          "token": tempToken
        },
        body: {
          "RegiDate": '${DateFormat("yyyy-MM-dd").format(DateTime.now())}',
          "relationNm": relationNm,
          "gender": gender,
          "age": age,
          "height": height,
          "weight": weight,
          "cancerNm": cancerNm,
          "stageNm": stageNm,
          "progressNm": progressNm,
          "disease": disease,
          "memo": '',
        });
    if (response.statusCode == 200) {
      var jsondata = json.decode(response.body);
      print(jsondata['success']);
      print(jsondata['message']);
    }
    update();
  }

  void signUpUser() async {
    final response = await http
        .post(Uri.http('54.180.67.217:3000', '/auth/signup'), headers: {
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
