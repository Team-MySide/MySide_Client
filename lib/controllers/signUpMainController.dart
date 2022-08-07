import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:my_side_client/Constants.dart';
import 'dart:convert';

import 'package:my_side_client/models/textFieldModel.dart';
import 'package:my_side_client/services/loginService/loginServices.dart';
import 'package:my_side_client/wigets/dialogwidget/singleButtonDialog.dart';

class SignUpMainController extends GetxController {
  TextFieldModel emailTextField = new TextFieldModel(
    tec: TextEditingController(),
    fn: FocusNode(),
    hintText: '이메일',
    isPswd: false,
    errorMsg: '',
  );
  TextFieldModel nameTextField = new TextFieldModel(
    tec: TextEditingController(),
    fn: FocusNode(),
    hintText: '이름',
    isPswd: false,
    errorMsg: '',
  );
  TextFieldModel phoneTextField = new TextFieldModel(
    tec: TextEditingController(),
    fn: FocusNode(),
    hintText: '휴대폰 번호',
    isPswd: false,
    errorMsg: '',
  );
  TextFieldModel rephoneTextField = new TextFieldModel(
    tec: TextEditingController(),
    fn: FocusNode(),
    hintText: '휴대폰 번호',
    isPswd: false,
    errorMsg: '',
  );
  TextFieldModel pswdTextField = new TextFieldModel(
    tec: TextEditingController(),
    fn: FocusNode(),
    hintText: '비밀번호',
    isPswd: true,
    errorMsg: '8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.',
  );
  TextFieldModel repswdTextField = new TextFieldModel(
    tec: TextEditingController(),
    fn: FocusNode(),
    hintText: '비밀번호 재확인',
    isPswd: true,
    errorMsg: '',
  );

  bool firstSelected = false;
  bool secondSelected = false;
  bool thirdSelected = false;
  bool fourthSelected = false;
  int duplicated = 0;

  @override
  void onInit() {
    emailTextField.tec.addListener(onListenEmail);
    nameTextField.tec.addListener(onListenName);
    phoneTextField.tec.addListener(onListenPhone);
    rephoneTextField.tec.addListener(onListenRePhone);
    pswdTextField.tec.addListener(onListenPswd);
    repswdTextField.tec.addListener(onListenRePswd);
    super.onInit();
  }

  @override
  void onClose() {
    emailTextField.tec.removeListener(onListenEmail);
    nameTextField.tec.removeListener(onListenName);
    phoneTextField.tec.removeListener(onListenPhone);
    rephoneTextField.tec.removeListener(onListenRePhone);
    pswdTextField.tec.removeListener(onListenPswd);
    repswdTextField.tec.removeListener(onListenRePswd);
    super.onClose();
  }

  void onListenEmail() {
    emailTextField.onListenTextFieldType1();
    update();
  }

  void onListenName() {
    nameTextField.onListenTextFieldType1();
    update();
  }

  void onListenPhone() {
    phoneTextField.onListenTextFieldType1();
    update();
  }

  void onListenRePhone() {
    rephoneTextField.onListenTextFieldType1();
    update();
  }

  void onListenPswd() {
    pswdTextField.onListenTextFieldType1();
    update();
  }

  void onListenRePswd() {
    repswdTextField.onListenTextFieldType1();
    update();
  }

  void emailDuplicateCheck(double scrHeight) async {
    emailTextField.validateEmail();
    if (!emailTextField.errorOcur) {
      await isExistEmail();
      Get.dialog(
        SingleButtonDialog(
          widgetBetween: Text(
            duplicated == 1 ? '사용하실 수 있는 이메일입니다.' : '동일한 이메일이 등록되어 있습니다.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFF111111),
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
          dialogHeight: scrHeight * 0.2635,
          routeFunc: () {
            Get.back();
          },
        ),
      );
    }
    update();
  }

  bool validateSignUpdMain() {
    nameTextField.validateName();
    phoneTextField.validatePhone();
    rephoneTextField.validateRePhone(phoneTextField.tec.text);
    pswdTextField.validatePswd();
    repswdTextField.validateRePswd(pswdTextField.tec.text);
    update();
    if (!nameTextField.errorOcur &&
        !phoneTextField.errorOcur &&
        !rephoneTextField.errorOcur &&
        !pswdTextField.errorOcur &&
        !repswdTextField.errorOcur) {
      var loginStorage = GetStorage();

      loginStorage.write(Constants.isFirstRunApp, false);
      return true;
    } else {
      return false;
    }
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
    duplicated = await httpIsExistEmail(emailTextField.tec.text);
    update();
  }

  bool checkActive() {
    return emailTextField.tec.text.isNotEmpty &&
        nameTextField.tec.text.isNotEmpty &&
        phoneTextField.tec.text.isNotEmpty &&
        rephoneTextField.tec.text.isNotEmpty &&
        pswdTextField.tec.text.isNotEmpty &&
        repswdTextField.tec.text.isNotEmpty &&
        secondSelected &&
        thirdSelected;
  }
}
