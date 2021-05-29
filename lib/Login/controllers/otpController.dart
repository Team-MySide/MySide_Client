
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_side_client/Login/functions/isOTPValidate.dart';

class OTPcontroller extends GetxController {
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

  void validateOTP() {
    if (isOTPValidate(tec.text) == 5) {
      errorMsg = '';
      errorText = false;
      canClear = true;
    } else {
      errorMsg = '숫자를 사용해주세요.';
      errorText = true;
      canClear = false;
    }
    update();
  }
}
