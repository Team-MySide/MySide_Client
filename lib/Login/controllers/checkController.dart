import 'package:get/get.dart';

class CheckController extends GetxController {
  bool checked = false;

  void checkBoxClicked() {
    checked = !checked;
    update();
  }
}
