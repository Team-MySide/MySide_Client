import 'package:get/get.dart';

class CurStateController extends GetxController {
  int stateIndex = 0;
  List<String> stateType = ['1기', '2기', '3기', '4기', '완치', '(구)'];
  String curState;

  selectState(int ind) {
    curState = stateType[ind - 1];
    stateIndex = ind;
    update();
  }
}
