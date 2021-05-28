import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PatientNicknameController extends GetxController {
  TextEditingController patientNNTEC;
  bool wrongPNN = false;
  bool canClear = true;
  FocusNode focus = FocusNode();
  String errorMsg = '';

  @override
  void onInit() {
    super.onInit();
    patientNNTEC = TextEditingController();
    patientNNTEC.addListener(onListen);
  }

  @override
  void onClose() {
    super.onClose();
    patientNNTEC.dispose();
    patientNNTEC.removeListener(onListen);
  }

  void onListen() {
    update();
  }

  void changeCanClear() {
    canClear = true;
    update();
  }

  void setErrorToFalse() {
    wrongPNN = false;
    errorMsg = '';
    update();
  }

  void validateNickName() {
    String pattern = r'^(?=.*?[!@ #\$&*~])';
    RegExp regExp = new RegExp(pattern);
    if (regExp.hasMatch(patientNNTEC.text)) {
      wrongPNN = true;
      canClear = false;
      errorMsg = '특수기호, 공백 사용 불가';
    } else {
      if (patientNNTEC.text.length < 2 || patientNNTEC.text.length > 7) {
        wrongPNN = true;
        canClear = false;
        errorMsg = '2~7자를 사용하세요.';
      } else {
        wrongPNN = false;
        canClear = true;
        errorMsg = '';
      }
    }
    update();
  }
}
