import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_side_client/common/UserProfile.dart';
import 'package:my_side_client/models/textFieldModel.dart';
import 'package:my_side_client/services/mypageService/myPageService.dart';

class DropOutController extends GetxController {
  TextFieldModel reasonTextField = new TextFieldModel(
    tec: TextEditingController(),
    fn: FocusNode(),
    hintText: '내용을 입력해주세요',
    isPswd: false,
    errorMsg: '탈퇴하는 이유를 알려주시면 많은 도움이 됩니다.',
  );

  @override
  void onInit() {
    reasonTextField.tec.addListener(onListenReason);
    super.onInit();
  }

  void onListenReason() {
    reasonTextField.onListenTextFieldType2();
    update();
  }

  void dropOut() async {
    bool success =
        await dropOutUser(UserProfile.token, reasonTextField.tec.text);
    if (success) {
      UserProfile.token = "";
      UserProfile.isLogin = false;
      Get.offAllNamed('/');
    }
    update();
  }
}
