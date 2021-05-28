import 'package:get/get.dart';

import 'package:flutter/services.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:async' show Future;
import 'dart:convert';

import 'package:my_side_client/TabMyPage/models/faqComponent.dart';

class FaqController extends GetxController {
  List<FaqComponent> faqList = [];
  List<bool> clicked;

  @override
  void onInit() async {
    // 데이터 가져옴 지금은 dummy data로 초기화
    faqList = await loadJsonData();
    clicked = List<bool>.filled(faqList.length, false);
    print(clicked);
    super.onInit();
  }

  void showAnswer(int index) {
    clicked[index] = !clicked[index];
    update();
  }

  Future<List<FaqComponent>> loadJsonData() async {
    List<FaqComponent> faqs = [];
    var jsonText = await rootBundle.loadString('assets/faqdatas.json');
    var jsondata = json.decode(jsonText);
    for (var faq in jsondata) {
      faqs.add(FaqComponent.fromJson(faq));
    }

    update();
    return faqs;
  }
}
