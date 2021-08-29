import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:my_side_client/models/textFieldModel.dart';
import 'package:my_side_client/services/loginService/loginServices.dart';
import 'package:my_side_client/wigets/dialogwidget/notFoundUserDialog.dart';
import 'package:my_side_client/wigets/dialogwidget/singleButtonDialog.dart';

class FindPswdController extends GetxController {
  TextFieldModel nameTextField = new TextFieldModel(
    tec: TextEditingController(),
    fn: FocusNode(),
    hintText: '이름',
    isPswd: false,
    errorMsg: '',
  );

  TextFieldModel emailTextField = new TextFieldModel(
    tec: TextEditingController(),
    fn: FocusNode(),
    hintText: '이메일 주소',
    isPswd: false,
    errorMsg: '',
  );

  bool success = false;

  @override
  void onInit() {
    nameTextField.tec.addListener(onListenName);
    emailTextField.tec.addListener(onListenEmail);
    super.onInit();
  }

  @override
  void onClose() {
    nameTextField.tec.removeListener(onListenName);
    emailTextField.tec.removeListener(onListenEmail);
    super.onClose();
  }

  void onListenName() {
    nameTextField.onListenTextFieldType1();
    update();
  }

  void onListenEmail() {
    emailTextField.onListenTextFieldType1();
    update();
  }

  void findPswdClicked(double scrHeight) async {
    nameTextField.validateName();
    emailTextField.validateEmail();
    if (!nameTextField.errorOcur && !emailTextField.errorOcur) {
      await httpFindPswd();
      print(success);
      if (success) {
        Get.dialog(
          buildSendedPswdDialog(
            emailTextField.tec.text,
            scrHeight,
            () {
              Get.offAllNamed('/');
            },
          ),
        );
      } else {
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
      }
    }
    update();
  }

  void httpFindPswd() async {
    success =
        await httpfindPswd(emailTextField.tec.text, nameTextField.tec.text);
    update();
  }
}

Widget buildSendedPswdDialog(
    String email, double scrHeight, VoidCallback routeFunc) {
  return SingleButtonDialog(
    widgetBetween: Column(
      children: [
        SvgPicture.asset('assets/send.svg'),
        SizedBox(
          height: 0.0316 * scrHeight,
        ),
        Text(
          email,
          style: TextStyle(
            color: Color(0xFF111111),
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          '변경된 비밀번호가 이메일로 전송되었습니다.',
          style: TextStyle(
            color: Color(0xFF111111),
            fontSize: 14,
            fontWeight: FontWeight.w300,
          ),
        ),
      ],
    ),
    dialogHeight: scrHeight * 0.427,
    routeFunc: routeFunc,
  );
}
