import 'package:get/get.dart';

class StageSelectController extends GetxController {
  int stageNm = 0;

  void setStageNum(int index) {
    stageNm = index;
    update();
  }
}
