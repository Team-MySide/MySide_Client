import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_side_client/Login/functions/isPhoneNumberValidate.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:my_side_client/common/UserProfile.dart';

class ChangePhoneNumberPageController extends GetxController {
  // index 0 : 휴대폰번호, index 1 : 휴대폰재확인
  List<TextEditingController> tec = [
    TextEditingController(),
    TextEditingController()
  ];
  List<FocusNode> fn = [FocusNode(), FocusNode()];

  List<bool> errorOcur = [false, false];
  List<bool> canClear = [true, true];

  List<String> errorMsg = ['', ''];

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

  void validatePhone() {
    if (isPhoneNumberValidate(tec[1].text)) {
      errorMsg[0] = '';
      errorOcur[0] = false;
      canClear[0] = true;
    } else {
      errorMsg[0] = '형식에 맞지 않는 번호입니다.';
      errorOcur[0] = true;
      canClear[0] = false;
    }
    update();
  }

  void isPhonenumberMatch() {
    if (tec[0].text == tec[1].text) {
      errorMsg[1] = '';
      errorOcur[1] = false;
      canClear[1] = true;
    } else {
      errorMsg[1] = '번호가 일치하지 않습니다.';
      errorOcur[1] = true;
      canClear[1] = false;
    }
    update();
  }

  void changePhone() async {
    final response = await http.put(
      Uri.http('54.180.67.217:3000', '/mypage/profile/changepb'),
      headers: {"Accept": "applications.json", "token": UserProfile.token},
      body: {
        "phone": tec[0].text,
      },
    );
    if (response.statusCode == 200) {
      var jsondata = json.decode(response.body);
      print(jsondata);
    }

    update();
  }
}
