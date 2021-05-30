import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:my_side_client/Login/functions/isPasswordValidate.dart';

class LoginMainPageController extends GetxController {
  // index 0 : email, index 1 : password
  List<TextEditingController> tec = [
    TextEditingController(),
    TextEditingController()
  ];
  List<FocusNode> fn = [FocusNode(), FocusNode()];

  List<bool> errorOcur = [false, false];
  List<bool> canClear = [false, false];

  List<String> errorMsg = ['', '8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.'];

  bool checked = false;

  @override
  void onInit() {
    super.onInit();
    tec[0].addListener(() {
      onListen(0);
    });
    tec[1].addListener(() {
      onListen(1);
    });
  }

  @override
  void onClose() {
    super.onClose();
    tec[1].removeListener(() {
      onListen(1);
    });
    tec[1].removeListener(() {
      onListen(1);
    });
  }

  void onListen(int i) {
    if (tec[i].text == '') {
      errorOcur[i] = false;
      if (i == 0) {
        errorMsg[i] = '';
      }
    }
    if (errorOcur[i] && !canClear[i]) {
      canClear[i] = true;
    }
    update();
  }

  void validatePassword() {
    if (isPasswordValidate(tec[1].text)) {
      errorOcur[1] = false;
      canClear[1] = true;
    } else {
      errorOcur[1] = true;
      canClear[1] = false;
    }
    update();
  }

  void validateEmail() {
    if (EmailValidator.validate(tec[0].text)) {
      errorMsg[0] = '';
      errorOcur[0] = false;
      canClear[0] = true;
    } else {
      errorMsg[0] = '유효한 이메일 주소가 아닙니다.';
      errorOcur[0] = true;
      canClear[0] = false;
    }
    update();
  }

  void checkBoxClicked() {
    checked = !checked;
    update();
  }
}
