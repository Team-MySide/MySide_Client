import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_side_client/models/textFieldModel.dart';
import 'package:my_side_client/services/loginService/loginServices.dart';
import 'package:my_side_client/wigets/dialogwidget/notFoundUserDialog.dart';
import 'package:my_side_client/wigets/dialogwidget/singleButtonDialog.dart';

class FindEmailController extends GetxController {
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

  String foundEmail = '';

  @override
  void onInit() {
    nameTextField.tec.addListener(onListenName);
    phoneTextField.tec.addListener(onListenPhone);
    super.onInit();
  }

  @override
  void onClose() {
    nameTextField.tec.removeListener(onListenName);
    phoneTextField.tec.removeListener(onListenPhone);
    super.onClose();
  }

  void onListenName() {
    nameTextField.onListenTextFieldType1();
    update();
  }

  void onListenPhone() {
    phoneTextField.onListenTextFieldType1();
    update();
  }

  void findEmailClicked(double scrHeight) async {
    nameTextField.validateName();
    phoneTextField.validatePhone();
    if (!nameTextField.errorOcur && !phoneTextField.errorOcur) {
      await httpFindEmail();
      if (foundEmail == '') {
        Get.dialog(
          NotFountUserDialog(
            whichInfo: '이메일 주소',
            routeFunc: () {
              Get.back();
            },
            gotoSignUp: () {
              Get.offNamed('/signUpMain');
            },
          ),
        );
      } else {
        Get.dialog(
          buildFindEmailDialog(
            scrHeight,
            '$foundEmail',
            () {
              Get.offAllNamed('/');
            },
          ),
        );
      }
    }
    update();
  }

  void httpFindEmail() async {
    foundEmail =
        await httpfindEmail(nameTextField.tec.text, phoneTextField.tec.text);
    update();
  }
}

Widget buildFindEmailDialog(
    double scrHeight, String emailText, VoidCallback rountFunc) {
  return SingleButtonDialog(
    widgetBetween: Column(
      children: [
        Text(
          '고객님의 이메일은',
          style: TextStyle(
            color: Color(0xFF111111),
            fontSize: 16,
          ),
        ),
        Text(
          emailText,
          style: TextStyle(
            color: Color(0xFF111111),
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          '입니다.',
          style: TextStyle(
            color: Color(0xFF111111),
            fontSize: 16,
          ),
        ),
      ],
    ),
    dialogHeight: scrHeight * 0.3,
    routeFunc: rountFunc,
  );
}
