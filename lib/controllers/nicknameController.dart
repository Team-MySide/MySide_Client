import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_side_client/models/textFieldModel.dart';
import 'package:my_side_client/services/loginService/loginServices.dart';
import 'package:my_side_client/wigets/dialogwidget/singleButtonDialog.dart';

class NicknameController extends GetxController {
  TextFieldModel nicknameTextField = new TextFieldModel(
    tec: TextEditingController(),
    fn: FocusNode(),
    hintText: '닉네임',
    isPswd: false,
    errorMsg: '특수문자 제외',
  );

  int duplicated = 0;

  @override
  void onInit() {
    nicknameTextField.tec.addListener(onListenNickname);
    super.onInit();
  }

  @override
  void onClose() {
    nicknameTextField.tec.removeListener(onListenNickname);
    super.onClose();
  }

  void onListenNickname() {
    nicknameTextField.onListenTextFieldType2();
    update();
  }

  void nicknameDuplicateCheck(double scrHeight) async {
    nicknameTextField.validateNickname();
    if (!nicknameTextField.errorOcur) {
      await isExistNickname();
      Get.dialog(
        SingleButtonDialog(
          widgetBetween: Text(
            duplicated == 1 ? '사용하실 수 있는 닉네임입니다.' : '동일한 닉네임이 등록되어 있습니다.',
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

  void validateNickname() {
    nicknameTextField.validateNickname();
    update();
  }

  void isExistNickname() async {
    duplicated = await httpIsExistNickname(nicknameTextField.tec.text);
    update();
  }
}
