import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_side_client/common/UserProfile.dart';
import 'package:my_side_client/models/textFieldModel.dart';
import 'package:my_side_client/services/mypageService/myPageService.dart';
import 'package:my_side_client/wigets/dialogwidget/singleButtonDialog.dart';

class CheckPswdController extends GetxController {
  TextFieldModel pswdTextField = new TextFieldModel(
    tec: TextEditingController(),
    fn: FocusNode(),
    hintText: '비밀번호',
    isPswd: true,
    errorMsg: '8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.',
  );

  @override
  void onInit() {
    pswdTextField.tec.addListener(onListenPswd);
    super.onInit();
  }

  void onListenPswd() {
    pswdTextField.onListenTextFieldType2();
    update();
  }

  void validatePswd() {
    pswdTextField.validatePswd();
    update();
  }

  void checkPswd(double scrHeight) async {
    bool success = false;
    pswdTextField.validatePswd();
    if (!pswdTextField.errorOcur) {
      success = await checkPassword(pswdTextField.tec.text, UserProfile.token);
      if (success) {
        Get.toNamed('/changePhone');
      } else {
        Get.dialog(
          SingleButtonDialog(
            widgetBetween: Text('비밀번호가 일치하지 않습니다.',
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
    }
    update();
  }
}
