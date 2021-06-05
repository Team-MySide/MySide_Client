import 'package:get/get.dart';

import 'package:my_side_client/TabMyPage/model/faqModel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class FaqController extends GetxController {
  List<FAQItem> faqs = [];
  List<bool> clicked = [];

  @override
  void onInit() async {
    // 데이터 가져옴 지금은 dummy data로 초기화
    super.onInit();
    await getFAQTitle();
    clicked = List<bool>.filled(faqs.length, false);
  }

  void showAnswer(int index) {
    clicked[index] = !clicked[index];
    update();
  }

  void getFAQTitle() async {
    final response = await http.get(
      Uri.http('54.180.67.217:3000', '/mypage/faq'),
    );
    if (response.statusCode == 200) {
      faqs = faQmodelFromJson(response.body).data;
    }
    update();
  }
}
