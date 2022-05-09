import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:my_side_client/common/UserProfile.dart';
import 'dart:convert';

import 'package:my_side_client/models/textFieldModel.dart';
import 'package:my_side_client/wigets/dialogwidget/singleButtonDialog.dart';

class LoginMainController extends GetxController {
  TextFieldModel emailTextField = new TextFieldModel(
    tec: TextEditingController(),
    fn: FocusNode(),
    hintText: '이메일',
    isPswd: false,
    errorMsg: '',
  );

  TextFieldModel pswdTextField = new TextFieldModel(
    tec: TextEditingController(),
    fn: FocusNode(),
    hintText: '비밀번호',
    isPswd: true,
    errorMsg: '8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.',
  );

  bool checked = false;
  //자동로그인
  var loginStorage = GetStorage();

  void fistTimeRunning() {
    loginStorage.write('isFirstRunApp', false);
    //supdate();
  }

  @override
  void onInit() {
    fistTimeRunning();
    emailTextField.tec.addListener(onListenEmail);
    pswdTextField.tec.addListener(onListenPassword);
    emailTextField.tec.text = "aaa1111@naver.com";
    pswdTextField.tec.text = "qwer1234!!";
    super.onInit();
  }

  @override
  void onClose() {
    emailTextField.tec.removeListener(onListenEmail);
    pswdTextField.tec.removeListener(onListenPassword);
    super.onClose();
  }

  void onListenEmail() {
    emailTextField.onListenTextFieldType1();
    update();
  }

  void onListenPassword() {
    pswdTextField.onListenTextFieldType2();
    update();
  }

  void logInClicked(
      double height, Function getUserInfo, Function getHealthData) async {
    emailTextField.validateEmail();
    pswdTextField.validatePswd();
    if (!emailTextField.errorOcur && !pswdTextField.errorOcur) {
      await logIn();
      await getUserInfo();
      await getHealthData();
      if (UserProfile.isLogin) {
        Get.offAllNamed('/MainTab');
      } else {
        Get.dialog(
          SingleButtonDialog(
            widgetBetween: Text(
              '아이디나 비밀번호가 올바르지 않습니다.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF111111),
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
            dialogHeight: height,
            routeFunc: () {
              Get.back();
            },
          ),
        );
      }
    }
    update();
  }

  void checkBoxClicked() {
    checked = !checked;
    update();
  }

  void logIn() async {
    String loginEmail;
    String loginPswd;
    bool autoLogin = false;
    if (loginStorage.read('autologin') != null &&
        loginStorage.read('autologin')) {
      loginEmail = loginStorage.read('email');
      loginPswd = loginStorage.read('password');
      autoLogin = true;
    } else {
      loginEmail = emailTextField.tec.text;
      loginPswd = pswdTextField.tec.text;
    }
    final response = await http
        .post(Uri.http('54.180.67.217:3000', '/auth/signin'), headers: {
      "Accept": "applications.json"
    }, body: {
      "email": loginEmail,
      "password": loginPswd,
    });
    if (response.statusCode == 200) {
      var jsondata = json.decode(response.body);
      UserProfile.isLogin = jsondata['success'];
      if (jsondata['success']) {
        UserProfile.token = jsondata['data']['tokens']['token'];
        if (checked || autoLogin) {
          loginStorage.write('email', loginEmail);
          loginStorage.write('password', loginPswd);
          loginStorage.write('autologin', true);
        } else {
          loginStorage.write('email', '');
          loginStorage.write('password', '');
          loginStorage.write('autologin', false);
        }
      }
    }

    update();
  }
}
