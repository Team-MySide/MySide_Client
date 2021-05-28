import 'package:get/get.dart';

class AgreeController extends GetxController {
  bool firstSelected = false;
  bool secondSelected = false;
  bool thirdSelected = false;
  bool fourthSelected = false;

  void firstClicked() {
    if (firstSelected) {
      firstSelected = false;
      secondSelected = false;
      thirdSelected = false;
      fourthSelected = false;
    } else {
      firstSelected = true;
      secondSelected = true;
      thirdSelected = true;
      fourthSelected = true;
    }
    update();
  }

  void secondClicked() {
    if (secondSelected) {
      if (firstSelected) {
        firstSelected = false;
      }
      secondSelected = false;
    } else {
      if (thirdSelected && fourthSelected) {
        firstSelected = true;
      }
      secondSelected = true;
    }
    update();
  }

  void thirdClicked() {
    if (thirdSelected) {
      if (firstSelected) {
        firstSelected = false;
      }
      thirdSelected = false;
    } else {
      if (secondSelected && fourthSelected) {
        firstSelected = true;
      }
      thirdSelected = true;
    }
    update();
  }

  void fourthClicked() {
    if (fourthSelected) {
      if (firstSelected) {
        firstSelected = false;
      }
      fourthSelected = false;
    } else {
      if (secondSelected && thirdSelected) {
        firstSelected = true;
      }
      fourthSelected = true;
    }
    update();
  }
}
