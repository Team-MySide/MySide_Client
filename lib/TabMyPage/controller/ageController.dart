import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:my_side_client/Login/functions/isNumber.dart';

class AgeController extends GetxController {
  TextEditingController ageTEC;
  FocusNode ageFN = FocusNode();

  bool ageError = false;
  bool ageClear = true;

  String errorMsg = '숫자를 입력해주세요.';

  @override
  void onInit() {
    super.onInit();
    ageTEC = TextEditingController();
    ageTEC.addListener(onListen);
  }

  @override
  void onClose() {
    super.onClose();
    ageTEC.dispose();
    ageTEC.removeListener(onListen);
  }

  void onListen() {
    update();
  }

  isInputNumber() {
    if (isNumber(ageTEC.text)) {
      ageClear = true;
      ageError = false;
    } else {
      ageClear = false;
      ageError = true;
    }

    update();
  }

  clearChange() {
    ageClear = true;
    update();
  }

  clearClicked() {
    ageError = false;
    update();
  }
}
