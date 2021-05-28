import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_side_client/Login/functions/isNameValidate.dart';

class NameController extends GetxController {
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

  void validateName() {
    if (isNameValidate(tec.text)) {
      errorMsg = '';
      errorText = false;
      canClear = true;
    } else {
      errorMsg = '2~6자 한글을 사용하세요.(특수기호, 공백 사용불가)';
      errorText = true;
      canClear = false;
    }
    update();
  }
}
