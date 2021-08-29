import 'package:get/get.dart';

class TermsOfServiceController extends GetxController {
  int curInd = 0;

  void onClicked(int index) {
    curInd = index;
    update();
  }
}
