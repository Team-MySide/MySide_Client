import 'package:get/get.dart';
import 'package:my_side_client/faqExample.dart';
import 'package:my_side_client/models/faqModel.dart';

class FaqController extends GetxController {
  List<bool> clicked = [];
  List<FAQItem> faqs = [];

  @override
  void onInit() {
    //dummy data 초기화
    faqs = faqExample;
    clicked = List<bool>.filled(faqs.length, false);
    super.onInit();
  }

  void showAnswer(int index) {
    clicked[index] = !clicked[index];
    update();
  }
}
