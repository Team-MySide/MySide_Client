import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_side_client/common/UserProfile.dart';
import 'package:my_side_client/models/textFieldModel.dart';
import 'package:my_side_client/services/mypageService/myPageService.dart';
import 'package:my_side_client/wigets/dialogwidget/singleButtonDialog.dart';

class PswdChangeController extends GetxController {
  TextFieldModel curPswdTextField = new TextFieldModel(
    tec: TextEditingController(),
    fn: FocusNode(),
    hintText: '현재 비밀번호',
    isPswd: true,
    errorMsg: '8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.',
  );
  TextFieldModel newPswdTextField = new TextFieldModel(
    tec: TextEditingController(),
    fn: FocusNode(),
    hintText: '새 비밀번호',
    isPswd: true,
    errorMsg: '8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.',
  );
  TextFieldModel reNewPswdTextField = new TextFieldModel(
    tec: TextEditingController(),
    fn: FocusNode(),
    hintText: '새 비밀번호 재확인',
    isPswd: true,
    errorMsg: '',
  );

  @override
  void onInit() {
    curPswdTextField.tec.addListener(onListenCurPswd);
    newPswdTextField.tec.addListener(onListenNewPhone);
    reNewPswdTextField.tec.addListener(onListenReNewPhone);
    super.onInit();
  }

  @override
  void onClose() {
    curPswdTextField.tec.removeListener(onListenCurPswd);
    newPswdTextField.tec.removeListener(onListenNewPhone);
    reNewPswdTextField.tec.removeListener(onListenReNewPhone);
    super.onClose();
  }

  void onListenCurPswd() {
    curPswdTextField.onListenTextFieldType2();
    update();
  }

  void onListenNewPhone() {
    newPswdTextField.onListenTextFieldType2();
    update();
  }

  void onListenReNewPhone() {
    reNewPswdTextField.onListenTextFieldType1();
    update();
  }

  void changePswd(double height) async {
    bool success = false;
    curPswdTextField.validatePswd();
    newPswdTextField.validatePswd();
    reNewPswdTextField.validateRePswd(newPswdTextField.tec.text);
    if (!curPswdTextField.errorOcur &&
        !newPswdTextField.errorOcur &&
        !reNewPswdTextField.errorOcur) {
      success = await changePassword(UserProfile.token,
          curPswdTextField.tec.text, newPswdTextField.tec.text);
      Get.dialog(
        SingleButtonDialog(
          widgetBetween: Text(
            success ? '비밀번호가 변경되었습니다.' : '현재 비밀번호가 올바르지 않습니다.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFF111111),
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
          dialogHeight: height,
          routeFunc: () {
            success
                ? Get.until((route) => Get.currentRoute == '/ProfileChange')
                : Get.back();
          },
        ),
      );
    }
    update();
  }

  bool checkActive() {
    return curPswdTextField.tec.text.isNotEmpty &&
        newPswdTextField.tec.text.isNotEmpty &&
        reNewPswdTextField.tec.text.isNotEmpty;
  }
}
