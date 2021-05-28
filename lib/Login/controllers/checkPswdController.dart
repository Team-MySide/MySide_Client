import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckPswdController extends GetxController {
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

  void validatePswdMatch(String inPswd) {
    if (inPswd == tec.text) {
      errorMsg = '';
      errorText = false;
      canClear = true;
    } else {
      errorMsg = '비밀번호가 일치하지 않습니다.';
      errorText = true;
      canClear = false;
    }
    update();
  }
}
