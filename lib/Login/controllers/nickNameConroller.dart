import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_side_client/Login/functions/isNicknameValidate.dart';

class NicknameController extends GetxController {
  TextEditingController tec = TextEditingController();
  FocusNode fn = FocusNode();

  bool errorText = false;
  bool canClear = true;

  String errorMsg = '특수문자 제외';

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

  void validateNickname() {
    if (isNickNameValidate(tec.text)) {
      errorMsg = '특수문자 제외';
      errorText = false;
      canClear = true;
    } else {
      errorMsg = '2~7자 한글을 사용하세요.(특수기호, 공백 사용불가)';
      errorText = true;
      canClear = false;
    }
    update();
  }
}
