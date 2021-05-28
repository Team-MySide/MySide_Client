import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_side_client/Login/functions/isOTPValidate.dart';
import 'package:my_side_client/Login/functions/isPhoneNumberValidate.dart';

class PhoneOTPController extends GetxController {
  TextEditingController phoneController = TextEditingController();
  TextEditingController otpController = TextEditingController();
  FocusNode phoneFocus = FocusNode();
  FocusNode otpFocus = FocusNode();

  bool phoneError = false;
  bool otpError = false;

  bool phoneClear = true;
  bool otpClear = true;

  String errorMsg = '';
  Color errorMsgColor = Color(0xFFEE1100);
  int otpErrorCode = 0;

  @override
  void onInit() {
    phoneController.addListener(onListen);
    otpController.addListener(onListen);
    super.onInit();
  }

  @override
  void onClose() {
    phoneController.dispose();
    phoneController.removeListener(onListen);
    otpController.removeListener(onListen);
    super.onClose();
  }

  void onListen() {
    update();
  }

  void checkPhoneNumber() {
    if (!isPhoneNumberValidate(this.phoneController.text)) {
      phoneClear = false;
      phoneError = true;
      if (phoneController.text.isEmpty) {
        errorMsg = '휴대폰 번호를 입력해주세요.';
        errorMsgColor = Color(0xFFEE1100);
      } else {
        errorMsg = '형식에 맞지 않는 번호입니다.';
        errorMsgColor = Color(0xFFEE1100);
      }
    } else {
      errorMsg = '문자가 전송되었습니다. 3분 내에 입력해주세요.';
      errorMsgColor = Color(0xFF3BD7E2);
      phoneClear = true;
      phoneError = false;
    }
    update();
  }

  void checkOTPNumber() {
    otpErrorCode = isOTPValidate(otpController.text);
    if (otpErrorCode == 5) {
      errorMsg = '';
      otpError = false;
      otpClear = true;
    } else {
      if (otpErrorCode == 0) {
        errorMsg = '인증번호를 입력해주세요.';
        errorMsgColor = Color(0xFFEE1100);
      } else if (otpErrorCode == 1) {
        errorMsg = '숫자만 사용해주세요.';
        errorMsgColor = Color(0xFFEE1100);
      } else if (otpErrorCode == 2) {
        errorMsg = '6개의 숫자를 입력해주세요.';
        errorMsgColor = Color(0xFFEE1100);
      }
      otpError = true;
      otpClear = false;
    }
    update();
  }

  void phoneClearClicked() {
    phoneError = false;
    errorMsg = '';
    update();
  }

  void phoneCanCelar() {
    phoneClear = true;
    update();
  }

  void otpClearClicked() {
    otpError = false;
    errorMsg = '';
    update();
  }

  void otpCanCelar() {
    otpClear = true;
    update();
  }

  //인증번호 가져오는 함수
  //void fetchOTP() async{}

}
