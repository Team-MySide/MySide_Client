import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_side_client/Login/functions/isNicknameValidate.dart';

class ProfileChangePageController extends GetxController {
  // index 0 : 환우 닉네임, index 1 : 보호자 닉네임
  List<TextEditingController> tec = [
    TextEditingController(),
    TextEditingController()
  ];
  List<FocusNode> fn = [FocusNode(), FocusNode()];

  List<bool> errorOcur = [false, false];
  List<bool> canClear = [true, true];

  List<String> errorMsg = ['', '특수문자 제외.'];

  bool checked = false;

  @override
  void onInit() {
    super.onInit();
    tec[0].addListener(() {
      onListen(0);
    });
    tec[1].addListener(() {
      onListen(1);
    });
  }

  @override
  void onClose() {
    super.onClose();
    tec[1].removeListener(() {
      onListen(1);
    });
    tec[1].removeListener(() {
      onListen(1);
    });
  }

  void onListen(int i) {
    if (tec[i].text == '') {
      errorOcur[i] = false;
      if (i == 0) {
        errorMsg[i] = '';
      }
    }
    if (errorOcur[i] && !canClear[i]) {
      canClear[i] = true;
    }
    update();
  }

  void validatePatientNickname() {
    if (isNickNameValidate(tec[0].text)) {
      errorMsg[0] = '';
      errorOcur[0] = false;
      canClear[0] = true;
    } else {
      errorMsg[0] = '2~7자를 사용하세요.(특수기호, 공백 사용 불가)';
      errorOcur[0] = true;
      canClear[0] = false;
    }
    update();
  }

  void validateGuardianNickname() {
    if (isNickNameValidate(tec[1].text)) {
      errorOcur[1] = false;
      canClear[1] = true;
    } else {
      errorOcur[1] = true;
      canClear[1] = false;
    }
    update();
  }
}
