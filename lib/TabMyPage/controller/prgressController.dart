import 'package:get/get.dart';

class ProgressController extends GetxController {
  int progressIndex = 0;
  List<String> progressType = [
    '치료 예정',
    '수술전',
    '수술후',
    '항암중',
    '방사선',
    '완치',
    '(구)'
  ];
  String curProgress;

  selectProgress(int ind) {
    curProgress = progressType[ind - 1];
    progressIndex = ind;
    update();
  }
}
