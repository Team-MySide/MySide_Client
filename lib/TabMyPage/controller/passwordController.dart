import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PasswordController extends GetxController {
  TextEditingController pswdController;
  bool wrongPswd = false;
  bool canClear = true;
  FocusNode focus = FocusNode();
  String errorMsg = '8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요';

  @override
  void onInit() {
    super.onInit();
    pswdController = TextEditingController();
    pswdController.addListener(onListen);
  }

  @override
  void onClose() {
    super.onClose();
    pswdController.dispose();
    pswdController.removeListener(onListen);
  }

  void onListen() {
    update();
  }

  void changeCanClear() {
    canClear = true;
    update();
  }

  void setErrorToFalse() {
    wrongPswd = false;
    update();
  }

  void validatePswd(String inPswd) {
    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,16}$';
    RegExp regExp = new RegExp(pattern);
    if (inPswd == '') {
      errorMsg = '비밀번호를 입력해주세요.';
      wrongPswd = true;
      canClear = false;
    } else {
      if (regExp.hasMatch(inPswd)) {
        //서버에서 맞는 비밀번호 있는지 확인
        errorMsg = '8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요';
        wrongPswd = false;
        canClear = true;
      } else {
        errorMsg = '8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요';
        wrongPswd = true;
        canClear = false;
      }
    }
    update();
  }

  void pswdMatchCheck(String inPswd) {
    if (inPswd != this.pswdController.text) {
      errorMsg = '비밀번호가 일치하지 않습니다.';
      wrongPswd = true;
      canClear = false;
    } else {
      errorMsg = '';
      wrongPswd = false;
      canClear = true;
    }
    update();
  }
}
