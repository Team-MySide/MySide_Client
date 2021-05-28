import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmailController extends GetxController {
  TextEditingController tec = TextEditingController();
  FocusNode fn = FocusNode();

  bool errorText = false;
  bool canClear = true;

  String errorMsg = '';

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
      errorMsg = '';
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
}
