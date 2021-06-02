import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:my_side_client/Login/functions/isNameValidate.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../functions/isPasswordValidate.dart';
import '../../functions/isPhoneNumberValidate.dart';

class SignInMainPageController extends GetxController {
  // index 0 : 이메일, index 1 : 이름, index 2 : 휴대폰, index 3: 휴대폰 재확인, index 4 : 비밀번호, index 5: 비밀번호 재확인
  List<TextEditingController> tec = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];
  List<FocusNode> fn = [
    FocusNode(),
    FocusNode(),
    FocusNode(),
    FocusNode(),
    FocusNode(),
    FocusNode(),
  ];

  List<bool> errorOcur = [
    false,
    false,
    false,
    false,
    false,
    false,
  ];
  List<bool> canClear = [
    true,
    true,
    true,
    true,
    true,
    true,
  ];

  List<String> errorMsg = [
    '',
    '',
    '',
    '',
    '8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.',
    ''
  ];

  bool firstSelected = false;
  bool secondSelected = false;
  bool thirdSelected = false;
  bool fourthSelected = false;

  int duplicated = 0;

  @override
  void onInit() {
    super.onInit();
    for (int j = 0; j < 6; j++) {
      tec[j].addListener(() {
        onListen(j);
      });
    }
  }

  @override
  void onClose() {
    super.onClose();
    for (int j = 0; j < 6; j++) {
      tec[j].removeListener(() {
        onListen(j);
      });
    }
  }

  void onListen(int i) {
    if (tec[i].text == '') {
      errorOcur[i] = false;
      if (i != 4) {
        errorMsg[i] = '';
      }
    }
    if (errorOcur[i] && !canClear[i]) {
      canClear[i] = true;
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

  void validateName() {
    if (isNameValidate(tec[1].text)) {
      errorMsg[1] = '';
      errorOcur[1] = false;
      canClear[1] = true;
    } else {
      errorMsg[1] = '2~6자 한글을 사용하세요.(특수기호, 공백 사용불가)';
      errorOcur[1] = true;
      canClear[1] = false;
    }
    update();
  }

  void validatePhone() {
    if (isPhoneNumberValidate(tec[2].text)) {
      errorMsg[2] = '';
      errorOcur[2] = false;
      canClear[2] = true;
    } else {
      errorMsg[2] = '형식에 맞지 않는 번호입니다.';
      errorOcur[2] = true;
      canClear[2] = false;
    }
    update();
  }

  void validatePhoneMatch() {
    if (tec[2].text == tec[3].text) {
      errorMsg[3] = '';
      errorOcur[3] = false;
      canClear[3] = true;
    } else {
      errorMsg[3] = '핸드폰 번호가 일치하지 않습니다.';
      errorOcur[3] = true;
      canClear[3] = false;
    }
    update();
  }

  void validatePassword() {
    if (isPasswordValidate(tec[4].text)) {
      errorOcur[4] = false;
      canClear[4] = true;
    } else {
      errorOcur[4] = true;
      canClear[4] = false;
    }
    update();
  }

  void validatePswdMatch() {
    if (tec[5].text == tec[4].text) {
      errorMsg[5] = '';
      errorOcur[5] = false;
      canClear[5] = true;
    } else {
      errorMsg[5] = '비밀번호가 일치하지 않습니다.';
      errorOcur[5] = true;
      canClear[5] = false;
    }
    update();
  }

  void firstClicked() {
    if (firstSelected) {
      firstSelected = false;
      secondSelected = false;
      thirdSelected = false;
      fourthSelected = false;
    } else {
      firstSelected = true;
      secondSelected = true;
      thirdSelected = true;
      fourthSelected = true;
    }
    update();
  }

  void secondClicked() {
    if (secondSelected) {
      if (firstSelected) {
        firstSelected = false;
      }
      secondSelected = false;
    } else {
      if (thirdSelected && fourthSelected) {
        firstSelected = true;
      }
      secondSelected = true;
    }
    update();
  }

  void thirdClicked() {
    if (thirdSelected) {
      if (firstSelected) {
        firstSelected = false;
      }
      thirdSelected = false;
    } else {
      if (secondSelected && fourthSelected) {
        firstSelected = true;
      }
      thirdSelected = true;
    }
    update();
  }

  void fourthClicked() {
    if (fourthSelected) {
      if (firstSelected) {
        firstSelected = false;
      }
      fourthSelected = false;
    } else {
      if (secondSelected && thirdSelected) {
        firstSelected = true;
      }
      fourthSelected = true;
    }
    update();
  }

  void isExistEmail() async {
    final response = await http.get(
      Uri.http('54.180.67.217:3000', '/auth/duplicated/email/${tec[0].text}'),
      headers: {"Accept": "applications.json"},
    );
    if (response.statusCode == 200) {
      var jsondata = json.decode(response.body);
      duplicated = jsondata["data"];
    } else {
      duplicated = 0;
    }
    update();
  }
}
