import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_side_client/Login/functions/isPasswordValidate.dart';

class PasswordController extends GetxController {
  TextEditingController tec = TextEditingController();
  FocusNode fn = FocusNode();

  bool errorText = false;
  bool canClear = true;

  String errorMsg = '8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.';
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

  void onListen() {
    if (tec.text == '') {
      errorText = false;
    }
    if (errorText && !canClear) {
      canClear = true;
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
