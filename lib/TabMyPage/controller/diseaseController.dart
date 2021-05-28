import 'package:get/get.dart';

class DiseaseController extends GetxController {
  int diseaseIndex = 0;
  List<String> diseaseType = [
    '치료 예정',
    '수술전',
    '이상지질 혈증',
    '해당사항 없음',
    '모름',
  ];
  String curDisease;

  selectDisease(int ind) {
    curDisease = diseaseType[ind - 1];
    diseaseIndex = ind;
    update();
  }
}
