import 'package:get/get.dart';

class TermsOfServiceController extends GetxController {
  bool termofservice = false;

  void onClicked(int index) {
    if (index == 0) {
      termofservice = false;
    } else {
      termofservice = true;
    }
    update();
  }
}
