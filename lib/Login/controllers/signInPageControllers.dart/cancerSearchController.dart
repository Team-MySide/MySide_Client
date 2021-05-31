import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_side_client/Login/functions/isNameValidate.dart';

class CancerSearchController extends GetxController {
  TextEditingController tec = TextEditingController();
  FocusNode fn = FocusNode();
  int cancerNum = 0;

  bool errorText = false;
  bool canClear = true;

  String errorMsg = '';

  @override
  void onInit() {
    super.onInit();
    fn.addListener(isFocused);
    tec.addListener(onListen);
  }

  @override
  void onClose() {
    super.onClose();
    tec.removeListener(onListen);
    fn.removeListener(isFocused);
  }

  void isFocused() {
    if (fn.hasFocus) {
      cancerNum = 7;
    }
    update();
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

  void validateCancer() {
    if (isKoreanWord(tec.text)) {
      errorMsg = '';
      errorText = false;
      canClear = true;
    } else {
      errorMsg = '한글로 입력해주세요.';
      errorText = true;
      canClear = false;
    }
    update();
  }

  void setCancerNum(int index) {
    cancerNum = index;
    update();
  }
}
