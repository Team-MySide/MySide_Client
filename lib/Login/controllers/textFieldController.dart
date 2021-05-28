import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_side_client/Login/functions/isPasswordValidate.dart';

class TextFieldController extends GetxController {
  TextEditingController tec = TextEditingController();
  FocusNode fn = FocusNode();

  bool errorText = false;
  bool canClear = true;

  String errorMsg;

  @override
  void onInit() {
    super.onInit();
    tec.addListener(onListen);
  }

  @override
  void onClose() {
    super.onClose();
    tec.removeListener(onListen);
  }

  void initErrorMsg(int type) {
    if (type == 0) {
      errorMsg = '';
    } else if (type == 1) {
      // 비밀번호
      errorMsg = '8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.';
    } else if (type == 2) {
      // 닉네임
      errorMsg = '특수문자 제외';
    }
    update();
  }

  void onListen() {
    if (tec.text == '') {
      errorText = false;
    }
    if (errorText && !canClear) {
      canClear = true;
    }
    update();
  }

  void validateEmail() {
    if (EmailValidator.validate(tec.text)) {
      errorMsg = '';
      errorText = false;
      canClear = true;
    } else {
      errorMsg = '유효한 이메일 주소가 아닙니다.';
      errorText = true;
      canClear = false;
    }
    update();
  }

  void validatePassword() {
    if (isPasswordValidate(tec.text)) {
      errorText = false;
      canClear = true;
    } else {
      errorText = true;
      canClear = false;
    }
    update();
  }
}
