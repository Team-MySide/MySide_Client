import 'package:get/get.dart';

class RegisterDetailController extends GetxController {
  int belowType = 1;
  bool ingredInfoExpanded = false;

  void setBelowType(int type) {
    belowType = type;
    update();
  }

  void expandIngredInfo() {
    ingredInfoExpanded = !ingredInfoExpanded;
    update();
  }
}
