import 'package:get/get.dart';

class GenderSelectController extends GetxController {
  int genderIndex = 0;
  List<String> genderType = ['남', '여'];
  String curGender;

  selectGender(int ind) {
    curGender = genderType[ind - 1];
    genderIndex = ind;
    update();
  }
}
