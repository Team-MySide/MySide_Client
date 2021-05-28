import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:my_side_client/Login/functions/isNumber.dart';

class HeigthController extends GetxController {
  TextEditingController heightTEC;
  FocusNode heightFN = FocusNode();

  bool heightError = false;
  bool heightClear = true;

  String errorMsg = '숫자를 입력해주세요.';

  @override
  void onInit() {
    super.onInit();
    heightTEC = TextEditingController();
    heightTEC.addListener(onListen);
  }

  @override
  void onClose() {
    super.onClose();
    heightTEC.dispose();
    heightTEC.removeListener(onListen);
  }

  void onListen() {
    update();
  }

  isInputNumber() {
    if (isNumber(heightTEC.text)) {
      heightClear = true;
      heightError = false;
    } else {
      heightClear = false;
      heightError = true;
    }

    update();
  }

  clearChange() {
    heightClear = true;
    update();
  }

  clearClicked() {
    heightError = false;
    update();
  }
}
