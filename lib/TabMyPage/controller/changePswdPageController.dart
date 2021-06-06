import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_side_client/Login/functions/isPasswordValidate.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:my_side_client/common/UserProfile.dart';

class ChangePswdPageController extends GetxController {
  // 0: 현재 비밀번호, 1: 새 비밀번호, 2: 새 비밀번호 재확인
  List<TextEditingController> tec = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];
  List<FocusNode> fn = [FocusNode(), FocusNode(), FocusNode()];

  List<bool> errorOcur = [false, false, false];
  List<bool> canClear = [true, true, true];

  bool success;

  List<String> errorMsg = [
    '8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.',
    '8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.',
    ''
  ];

  @override
  void onInit() {
    super.onInit();
    for (int j = 0; j < 3; j++) {
      tec[j].addListener(() {
        onListen(j);
      });
    }
  }

  @override
  void onClose() {
    super.onClose();
    for (int j = 0; j < 3; j++) {
      tec[j].removeListener(() {
        onListen(j);
      });
    }
  }

  void onListen(int i) {
    if (tec[i].text == '') {
      errorOcur[i] = false;
      if (i == 2) {
        errorMsg[i] = '';
      }
    }
    if (errorOcur[i] && !canClear[i]) {
      canClear[i] = true;
    }
    update();
  }

  void validateCurPassword() {
    if (isPasswordValidate(tec[0].text)) {
      errorOcur[0] = false;
      canClear[0] = true;
    } else {
      errorOcur[0] = true;
      canClear[0] = false;
    }
    update();
  }

  void validateNewPassword() {
    if (isPasswordValidate(tec[1].text)) {
      errorOcur[1] = false;
      canClear[1] = true;
    } else {
      errorOcur[1] = true;
      canClear[1] = false;
    }
    update();
  }

  void validatePswdMatch() {
    if (tec[2].text == tec[1].text) {
      errorMsg[2] = '';
      errorOcur[2] = false;
      canClear[2] = true;
    } else {
      errorMsg[2] = '비밀번호가 일치하지 않습니다.';
      errorOcur[2] = true;
      canClear[2] = false;
    }
    update();
  }

  void changePswd() async {
    final response = await http.put(
      Uri.http('54.180.67.217:3000', '/mypage/profile/change/password'),
      headers: {"Accept": "applications.json", "token": UserProfile.token},
      body: {
        "password": tec[0].text,
        "newpassword": tec[1].text,
      },
    );
    if (response.statusCode == 200) {
      var jsondata = json.decode(response.body);
      success = jsondata['success'];
    }
    update();
  }
}
