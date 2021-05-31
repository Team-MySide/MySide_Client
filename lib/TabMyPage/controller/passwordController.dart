import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_side_client/Login/functions/isPasswordValidate.dart';

class PasswordController extends GetxController {
  TextEditingController tec = TextEditingController();
  bool errorOcur = false;
  bool canClear = true;
  FocusNode fn = FocusNode();
  String errorMsg = '8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요';

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
      errorOcur = false;
    }
    if (errorOcur && !canClear) {
      canClear = true;
    }
    update();
  }

  void validatePassword() {
    if (isPasswordValidate(tec.text)) {
      errorOcur = false;
      canClear = true;
    } else {
      errorOcur = true;
      canClear = false;
    }
    update();
  }
}
