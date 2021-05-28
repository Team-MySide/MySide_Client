import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:my_side_client/Login/functions/isNumber.dart';

class WeightController extends GetxController {
  TextEditingController weightTEC;
  FocusNode weightFN = FocusNode();

  bool weightError = false;
  bool weightClear = true;

  String errorMsg = '숫자를 입력해주세요.';

  @override
  void onInit() {
    super.onInit();
    weightTEC = TextEditingController();
    weightTEC.addListener(onListen);
  }

  @override
  void onClose() {
    super.onClose();
    weightTEC.dispose();
    weightTEC.removeListener(onListen);
  }

  void onListen() {
    update();
  }

  isInputNumber() {
    if (isNumber(weightTEC.text)) {
      weightClear = true;
      weightError = false;
    } else {
      weightClear = false;
      weightError = true;
    }

    update();
  }

  clearChange() {
    weightClear = true;
    update();
  }

  clearClicked() {
    weightError = false;
    update();
  }
}
