import 'package:get/get.dart';

class ProgressSelectController extends GetxController {
  int progressNm = 0;

  void setProgressNum(int index) {
    progressNm = index;
    update();
  }
}
