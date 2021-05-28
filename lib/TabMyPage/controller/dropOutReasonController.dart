import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class DropOutReasonController extends GetxController {
  TextEditingController reasonTEC = TextEditingController();
  FocusNode reasonFN = FocusNode();

  @override
  void onInit() {
    super.onInit();
    reasonTEC = TextEditingController();
    reasonTEC.addListener(onListen);
  }

  @override
  void onClose() {
    super.onClose();
    reasonTEC.dispose();
    reasonTEC.removeListener(onListen);
  }

  void onListen() {
    update();
  }
}
