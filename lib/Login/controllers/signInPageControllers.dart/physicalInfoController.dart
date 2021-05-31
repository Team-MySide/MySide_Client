import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_side_client/Login/functions/isNumber.dart';

class PhysicalInfoController extends GetxController {
  int gender = 0;
  bool dontKnow = false;

  TextEditingController ageTEC = TextEditingController();
  TextEditingController heightTEC = TextEditingController();
  TextEditingController weightTEC = TextEditingController();

  FocusNode agefn = FocusNode();
  FocusNode heightfn = FocusNode();
  FocusNode weightfn = FocusNode();

  List<bool> errorOcur = [false, false, false];
  List<bool> canClear = [false, false, false];

  List<String> errorMsg = ['', '', ''];

  @override
  void onInit() {
    super.onInit();
    ageTEC.addListener(ageOnListen);
    heightTEC.addListener(heightOnListen);
    weightTEC.addListener(weightOnListen);
  }

  @override
  void onClose() {
    super.onClose();
    ageTEC.removeListener(ageOnListen);
    heightTEC.removeListener(heightOnListen);
    weightTEC.removeListener(weightOnListen);
  }

  void setGender(int index) {
    gender = index;
    update();
  }

  void donknowToggle() {
    dontKnow = !dontKnow;
    update();
  }

  void ageOnListen() {
    if (ageTEC.text == '') {
      errorOcur[0] = false;
      errorMsg[0] = '';
    }
    if (errorOcur[0] && !canClear[0]) {
      canClear[0] = true;
    }
    update();
  }

  void heightOnListen() {
    if (heightTEC.text == '') {
      errorOcur[1] = false;
      errorMsg[1] = '';
    }
    if (errorOcur[1] && !canClear[1]) {
      canClear[1] = true;
    }
    update();
  }

  void weightOnListen() {
    if (weightTEC.text == '') {
      errorOcur[2] = false;
      errorMsg[2] = '';
    }
    if (errorOcur[2] && !canClear[2]) {
      canClear[2] = true;
    }
    update();
  }

  void validateNumber(String input, int index) {
    if (isNumber(input)) {
      errorMsg[index] = '';
      errorOcur[index] = false;
      canClear[index] = true;
    } else {
      errorMsg[index] = '숫자를 입력하세요.';
      errorOcur[index] = true;
      canClear[index] = false;
    }
    update();
  }
}
