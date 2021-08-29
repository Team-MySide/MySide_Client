import 'package:get/get.dart';

class SetDiseaseController extends GetxController {
  int diseaseNum = 0;

  void setDiseaseNum(int index) {
    diseaseNum = index;
    update();
  }
}
