import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_side_client/functions/isNameValidate.dart';
import 'package:my_side_client/functions/isNickNameValidate.dart';
import 'package:my_side_client/functions/isNumber.dart';
import 'package:my_side_client/functions/isPasswordValidate.dart';
import 'package:my_side_client/functions/isPhoneNumberValidate.dart';

class TextFieldModel {
  final TextEditingController tec;
  final FocusNode fn;
  final String hintText;
  final bool isPswd;
  String errorMsg;
  bool errorOcur = false;
  bool canClear = true;

  TextFieldModel({
    TextEditingController tec,
    FocusNode fn,
    String errorMsg,
    String hintText,
    bool isPswd,
  })  : this.tec = tec,
        this.fn = fn,
        this.hintText = hintText,
        this.isPswd = isPswd,
        this.errorMsg = errorMsg;

  // onListen
  void onListenTextFieldType1() {
    if (this.tec.text == '') {
      this.errorOcur = false;
      this.errorMsg = '';
    }
    if (this.errorOcur && !this.canClear) {
      this.canClear = true;
    }
  }

  void onListenTextFieldType2() {
    if (this.tec.text == '') {
      this.errorOcur = false;
    }
    if (this.errorOcur && !this.canClear) {
      this.canClear = true;
    }
  }

  //validate
  void validateEmail() {
    if (GetUtils.isEmail(this.tec.text)) {
      this.errorMsg = '';
      this.errorOcur = false;
      this.canClear = true;
    } else {
      this.errorMsg = '유효한 이메일 주소가 아닙니다.';
      this.errorOcur = true;
      this.canClear = false;
    }
  }

  void validatePswd() {
    if (isPasswordValidate(this.tec.text)) {
      this.errorOcur = false;
      this.canClear = false;
    } else {
      this.errorOcur = true;
      this.canClear = false;
    }
  }

  void validateName() {
    if (isNameValidate(this.tec.text)) {
      this.errorMsg = '';
      this.errorOcur = false;
      this.canClear = true;
    } else {
      this.errorMsg = '2~6자 한글을 사용하세요.(특수기호, 공백 사용불가)';
      this.errorOcur = true;
      this.canClear = false;
    }
  }

  void validatePhone() {
    if (isPhoneNumberValidate(this.tec.text)) {
      this.errorMsg = '';
      this.errorOcur = false;
      this.canClear = true;
    } else {
      this.errorMsg = '형식에 맞지 않는 번호입니다.';
      this.errorOcur = true;
      this.canClear = false;
    }
  }

  void validateRePhone(String phone) {
    if (this.tec.text == phone) {
      this.errorMsg = '';
      this.errorOcur = false;
      this.canClear = true;
    } else {
      this.errorMsg = '휴대폰 번호가 일치하지 않습니다.';
      this.errorOcur = true;
      this.canClear = false;
    }
  }

  void validateRePswd(String pswd) {
    if (this.tec.text == pswd) {
      this.errorMsg = '';
      this.errorOcur = false;
      this.canClear = true;
    } else {
      this.errorMsg = '비밀번호가 일치하지 않습니다.';
      this.errorOcur = true;
      this.canClear = false;
    }
  }

  void validateNickname() {
    if (isNickNameValidate(this.tec.text)) {
      this.errorMsg = '특수문자 제외';
      this.errorOcur = false;
      this.canClear = true;
    } else {
      this.errorMsg = '2~7자 한글을 사용하세요. (특수기호, 공백 사용불가)';
      this.errorOcur = true;
      this.canClear = false;
    }
  }

  void validateCancer() {
    if (isKoreanWord(this.tec.text)) {
      this.errorMsg = '';
      this.errorOcur = false;
      this.canClear = true;
    } else {
      this.errorMsg = '한글로 입력해주세요.';
      this.errorOcur = true;
      this.canClear = false;
    }
  }

  void validateNumber() {
    if (isNumber(this.tec.text)) {
      this.errorMsg = '';
      this.errorOcur = false;
      this.canClear = true;
    } else {
      this.errorMsg = '숫자를 입력해주세요.';
      this.errorOcur = true;
      this.canClear = false;
    }
  }
}
