import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:my_side_client/Login/functions/isNameValidate.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class FindPswdPageController extends GetxController {
  // index 0 : name, index 1 : 이메일
  List<TextEditingController> tec = [
    TextEditingController(),
    TextEditingController()
  ];
  List<FocusNode> fn = [FocusNode(), FocusNode()];

  List<bool> errorOcur = [false, false];
  List<bool> canClear = [true, true];

  List<String> errorMsg = ['', ''];
  bool success = false;

  @override
  void onInit() {
    super.onInit();
    tec[0].addListener(() {
      onListen(0);
    });
    tec[1].addListener(() {
      onListen(1);
    });
  }

  @override
  void onClose() {
    super.onClose();
    tec[1].removeListener(() {
      onListen(1);
    });
    tec[1].removeListener(() {
      onListen(1);
    });
  }

  void onListen(int i) {
    if (tec[i].text == '') {
      errorOcur[i] = false;
      errorMsg[i] = '';
    }
    if (errorOcur[i] && !canClear[i]) {
      canClear[i] = true;
    }
    update();
  }

  void validateName() {
    if (isNameValidate(tec[0].text)) {
      errorMsg[0] = '';
      errorOcur[0] = false;
      canClear[0] = true;
    } else {
      errorMsg[0] = '2~6자 한글을 사용하세요.(특수기호, 공백 사용불가)';
      errorOcur[0] = true;
      canClear[0] = false;
    }
    update();
  }

  void validateEmail() {
    if (EmailValidator.validate(tec[1].text)) {
      errorMsg[1] = '';
      errorOcur[1] = false;
      canClear[1] = true;
    } else {
      errorMsg[1] = '유효한 이메일 주소가 아닙니다.';
      errorOcur[1] = true;
      canClear[1] = false;
    }
    update();
  }

  void findPswd() async {
    final response = await http.get(
      Uri.http(
          '54.180.67.217:3000', '/auth/password/${tec[1].text}/${tec[0].text}'),
      headers: {"Accept": "applications.json"},
    );
    print(response.statusCode);
    if (response.statusCode == 200) {
      var jsondata = json.decode(response.body);
      print(jsondata);
      success = jsondata['success'];
    }

    update();
  }
}
