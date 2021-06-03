import 'package:get/get.dart';

import 'package:my_side_client/TabMyPage/model/FAQtitle.dart';
import 'package:http/http.dart' as http;
import 'package:my_side_client/TabMyPage/models/faqComponent.dart';
import 'dart:convert';

class FaqController extends GetxController {
  List<FaqComponent> faqList = [];
  List<FAQdata> faqTitle = [];
  List<bool> clicked;
  List<String> answers;

  @override
  void onInit() async {
    // 데이터 가져옴 지금은 dummy data로 초기화
    super.onInit();
    await getFAQTitle();
    clicked = List<bool>.filled(faqTitle.length, false);
    answers = List<String>.filled(faqTitle.length, '');
  }

  void showAnswer(int index) {
    clicked[index] = !clicked[index];
    update();
  }

  void getFAQTitle() async {
    final response = await http.get(
      Uri.http('54.180.67.217:3000', '/mypage/faq/title'),
    );
    if (response.statusCode == 200) {
      faqTitle = faQtitleFromJson(response.body).data;
    }
    update();
  }

  void getAnswer(int index) async {
    final response = await http.get(
      Uri.http('54.180.67.217:3000', '/mypage/faq/title/1'),
    );
    if (response.statusCode == 200) {
      var jsondata = json.decode(response.body);
      print(jsondata['data'][0]['content']);
      answers[index] = jsondata['data'][0]['content'];
    }
  }
}
