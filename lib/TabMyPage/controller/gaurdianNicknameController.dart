import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GuardianNicknameController extends GetxController {
  TextEditingController guardianNNTEC;
  bool wrongGNN = false;
  bool canClear = true;
  FocusNode focus = FocusNode();
  String errorMsg = '특수문자 제외';

  @override
  void onInit() {
    super.onInit();
    guardianNNTEC = TextEditingController();
    guardianNNTEC.addListener(onListen);
  }

  @override
  void onClose() {
    super.onClose();
    guardianNNTEC.dispose();
    guardianNNTEC.removeListener(onListen);
  }

  void onListen() {
    update();
  }

  void changeCanClear() {
    canClear = true;
    update();
  }

  void setErrorToFalse() {
    wrongGNN = false;
    update();
  }

  void validateNickName() {
    String pattern = r'^(?=.*?[!@ #\$&*~])';
    RegExp regExp = new RegExp(pattern);
    if (regExp.hasMatch(guardianNNTEC.text)) {
      wrongGNN = true;
      canClear = false;
      errorMsg = '특수기호, 공백 사용 불가';
    } else {
      if (guardianNNTEC.text.length < 2 || guardianNNTEC.text.length > 7) {
        wrongGNN = true;
        canClear = false;
        errorMsg = '2~7자를 사용하세요.';
      } else {
        wrongGNN = false;
        canClear = true;
        errorMsg = '';
      }
    }
    update();
  }
}
