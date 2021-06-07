import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:my_side_client/Login/functions/isPasswordValidate.dart';
import 'package:http/http.dart' as http;
import 'package:my_side_client/MainTab.dart';
import 'package:my_side_client/TabMyPage/pages/myPageMain.dart';
import 'dart:convert';

import 'package:my_side_client/common/UserProfile.dart';

class LoginMainPageController extends GetxController {
  // index 0 : email, index 1 : password
  List<TextEditingController> tec = [
    TextEditingController(),
    TextEditingController()
  ];
  List<FocusNode> fn = [FocusNode(), FocusNode()];

  List<bool> errorOcur = [false, false];
  List<bool> canClear = [true, true];

  List<String> errorMsg = ['', '8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.'];

  bool checked = false;
  bool success = false;
  String loginMessage = '';
  final loginStorage = GetStorage();

  @override
  void onInit() async {
    super.onInit();
    tec[0].addListener(() {
      onListen(0);
    });
    tec[1].addListener(() {
      onListen(1);
    });
    if (loginStorage.read('autologin')) {
      tec[0].text = loginStorage.read('email');
      tec[1].text = loginStorage.read('password');
      checked = true;
      await logIn();
      Get.to(() => MyPageMain());
    }
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
      if (i == 0) {
        errorMsg[i] = '';
      }
    }
    if (errorOcur[i] && !canClear[i]) {
      canClear[i] = true;
    }
    update();
  }

  void validatePassword() {
    if (isPasswordValidate(tec[1].text)) {
      errorOcur[1] = false;
      canClear[1] = true;
    } else {
      errorOcur[1] = true;
      canClear[1] = false;
    }
    update();
  }

  void validateEmail() {
    if (EmailValidator.validate(tec[0].text)) {
      errorMsg[0] = '';
      errorOcur[0] = false;
      canClear[0] = true;
    } else {
      errorMsg[0] = '유효한 이메일 주소가 아닙니다.';
      errorOcur[0] = true;
      canClear[0] = false;
    }
    update();
  }

  void checkBoxClicked() {
    checked = !checked;
    update();
  }

  void logIn() async {
    final response = await http
        .post(Uri.http('54.180.67.217:3000', '/auth/signin'), headers: {
      "Accept": "applications.json"
    }, body: {
      "email": tec[0].text,
      "password": tec[1].text,
    });
    if (response.statusCode == 200) {
      var jsondata = json.decode(response.body);
      loginMessage = jsondata['message'];
      UserProfile.isLogin = jsondata['success'];
      if (jsondata['success']) {
        UserProfile.token = jsondata['data']['tokens']['token'];
      }
      if (checked) {
        loginStorage.write('email', tec[0].text);
        loginStorage.write('password', tec[1].text);
        loginStorage.write('autologin', checked);
      } else {
        loginStorage.write('email', '');
        loginStorage.write('password', '');
        loginStorage.write('autologin', checked);
      }
    }

    update();
  }
}
