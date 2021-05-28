import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:my_side_client/Login/functions/isNameValidate.dart';

class CancerController extends GetxController {
  TextEditingController cancerTEC;
  FocusNode cancerFN = FocusNode();
  int canderIndex = 0;
  bool cancerError = false;
  bool cancerClear = true;

  String errorMsg = '한글을 입력하세요.';

  List<String> cancerType = ['위암', '폐암', '간암', '대장암', '유방암', '갑상선암', '기타'];
  String curCancer;

  @override
  void onInit() {
    super.onInit();
    cancerTEC = TextEditingController();
    cancerTEC.addListener(onListen);
    cancerFN.addListener(nowFocused);
  }

  @override
  void onClose() {
    super.onClose();
    cancerTEC.dispose();
    cancerTEC.removeListener(onListen);
  }

  void nowFocused() {
    if (cancerFN.hasFocus) {
      selectCancerType(7);
    }
  }

  void onListen() {
    update();
  }

  selectCancerType(int ind) {
    curCancer = cancerType[ind - 1];
    canderIndex = ind;
    update();
  }

  isItKorean() {
    if (isKoreanWord(cancerTEC.text)) {
      cancerError = false;
      cancerClear = true;
    } else {
      cancerError = true;
      cancerClear = false;
    }

    update();
  }

  clearChange() {
    cancerClear = true;
    update();
  }

  clearClicked() {
    cancerError = false;
    update();
  }
}
