import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:my_side_client/Login/functions/isNameValidate.dart';
import 'package:my_side_client/Login/functions/isNumber.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:my_side_client/common/UserProfile.dart';

class AddHealthDataPageController extends GetxController {
  DateTime date = DateTime.now();
  int userType = 0;
  int gender = 0;
  int stageNm = 0;
  int progressNum = 0;
  int diseaseNum = 0;
  // 0: 나이 , 1: 키, 2: 몸무게, 3: 암, 4: 추가내용,
  List<TextEditingController> tec = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];
  List<FocusNode> fn = [
    FocusNode(),
    FocusNode(),
    FocusNode(),
    FocusNode(),
    FocusNode(),
  ];
  List<bool> errorOcur = [
    false,
    false,
    false,
    false,
  ];
  List<bool> canClear = [
    true,
    true,
    true,
    true,
  ];
  List<String> errorMsg = [
    '',
    '',
    '',
    '',
  ];
  int cancerNm = 0;
  List<dynamic> cancerList;

  @override
  void onInit() {
    super.onInit();
    getCancerData();
    fn[3].addListener(isFocused);
    tec[4].addListener(onListenMemo);
    for (int j = 0; j < 4; j++) {
      tec[j].addListener(() {
        onListen(j);
      });
    }
  }

  @override
  void onClose() {
    super.onClose();
    fn[3].removeListener(isFocused);
    tec[4].removeListener(onListenMemo);
    for (int j = 0; j < 4; j++) {
      tec[j].removeListener(() {
        onListen(j);
      });
    }
  }

  void onListenMemo() {
    update();
  }

  void onListen(int i) {
    if (tec[i].text == '') {
      errorOcur[i] = false;
      errorMsg[i] = '';
    }
    if (errorOcur[i] && !canClear[i]) {
      canClear[i] = true;
    }
    update();
  }

  //날짜관련
  selecteDate(BuildContext context) async {
    final newDate = await showDatePicker(
      context: context,
      initialDate: date,
      firstDate: DateTime(DateTime.now().year - 5),
      lastDate: DateTime(DateTime.now().year + 5),
    );
    if (newDate != null) {
      date = newDate;
    }

    update();
  }

  //사용자 타입관련
  void setUserType(int type) {
    userType = type;
    update();
  }

  // 성별 관련
  void setGender(int type) {
    gender = type;
    update();
  }

  //나이,키, 몸무게 관련
  void validateNumber(int index) {
    if (isNumber(tec[index].text)) {
      errorMsg[index] = '';
      errorOcur[index] = false;
      canClear[index] = true;
    } else {
      errorMsg[index] = '숫자를 입력하세요.';
      errorOcur[index] = true;
      canClear[index] = false;
    }
    update();
  }

  // 암관련
  void validateCancer() {
    if (isKoreanWord(tec[3].text)) {
      errorMsg[3] = '';
      errorOcur[3] = false;
      canClear[3] = true;
    } else {
      errorMsg[3] = '한글로 입력해주세요.';
      errorOcur[3] = true;
      canClear[3] = false;
    }
    update();
  }

  void setCancerNum(int index) {
    cancerNm = index;
    update();
  }

  void isFocused() {
    if (fn[3].hasFocus) {
      cancerNm = 7;
    }
    update();
  }

  void getCancerData() async {
    final response = await http.get(
      Uri.http('54.180.67.217:3000', '/common/auto/cancer'),
      headers: {"Accept": "applications.json"},
    );
    if (response.statusCode == 200) {
      var jsondata = json.decode(response.body);
      cancerList = jsondata['data'];
    }
    update();
  }

  List<String> getSuggestions(String query) {
    return cancerList
        .where((cancerList) => cancerList.contains(query))
        .toList()
        .cast<String>();
  }

  //현재 상태
  void setStageNum(int index) {
    stageNm = index;
    update();
  }

  //진행단계
  void setProgressNum(int index) {
    progressNum = index;
    update();
  }

  //보유질환
  void setDiseaseNum(int index) {
    diseaseNum = index;
    update();
  }

  void postHealthData(String cancerNm, String stageNm, String progressNm,
      String disease) async {
    final response = await http.post(
        Uri.http('54.180.67.217:3000', '/mypage/health/insert'),
        headers: {
          "Accept": "applications.json",
          "token": UserProfile.token
        },
        body: {
          "RegiDate": '${DateFormat("yyyy-MM-dd").format(date)}',
          "relationNm": userType == 1 ? '환우' : '보호자',
          "gender": gender == 1 ? '남' : '여',
          "age": tec[0].text,
          "height": tec[1].text,
          "weight": tec[2].text,
          "cancerNm": cancerNm,
          "stageNm": stageNm,
          "progressNm": progressNm,
          "disease": disease,
          "memo": tec[4].text,
        });
    if (response.statusCode == 200) {
      var jsondata = json.decode(response.body);
      print(jsondata['success']);
      print(jsondata['message']);
    }
    update();
  }
}
