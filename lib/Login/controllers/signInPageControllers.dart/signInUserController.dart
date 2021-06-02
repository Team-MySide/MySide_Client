import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

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
      print(jsondata['message']);
    }
  }
}
