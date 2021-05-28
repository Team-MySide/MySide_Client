import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_side_client/Login/functions/isPhoneNumberValidate.dart';

class PhoneController extends GetxController {
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

  void validatePhone() {
    if (isPhoneNumberValidate(tec.text)) {
      errorMsg = '';
      errorText = false;
      canClear = true;
    } else {
      errorMsg = '형식에 맞지 않는 번호입니다.';
      errorText = true;
      canClear = false;
    }
    update();
  }
}
