import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_side_client/common/UserProfile.dart';
import 'package:my_side_client/models/textFieldModel.dart';
import 'package:my_side_client/services/mypageService/myPageService.dart';

class PhoneChangeConroller extends GetxController {
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

  @override
  void onInit() {
    phoneTextField.tec.addListener(onListenPhone);
    rephoneTextField.tec.addListener(onListenRePhone);
    super.onInit();
  }

  @override
  void onClose() {
    phoneTextField.tec.removeListener(onListenPhone);
    rephoneTextField.tec.removeListener(onListenRePhone);
    super.onClose();
  }

  void onListenPhone() {
    phoneTextField.onListenTextFieldType1();
    update();
  }

  void onListenRePhone() {
    rephoneTextField.onListenTextFieldType1();
    update();
  }

  Future<bool> changePhone() async {
    bool changeSuccess = false;
    phoneTextField.validatePhone();
    rephoneTextField.validateRePhone(phoneTextField.tec.text);
    update();
    if (!phoneTextField.errorOcur && !rephoneTextField.errorOcur) {
      changeSuccess =
          await changePhoneNumber(UserProfile.token, phoneTextField.tec.text);
      return changeSuccess;
    }
    return changeSuccess;
  }
}
