import 'package:get/get.dart';

class MonthSelectController extends GetxController {
  int month = DateTime.now().month - 1;

  selectMonth(int index) {
    month = index;
    update();
  }
}
