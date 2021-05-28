import 'package:get/get.dart';

class ProgressController extends GetxController {
  int progressNum = 0;

  void setProgressNum(int index) {
    progressNum = index;
    update();
  }
}
