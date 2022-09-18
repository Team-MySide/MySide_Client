import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:my_side_client/common/UserProfile.dart';
import 'package:my_side_client/constantsList.dart';
import 'dart:convert';

import 'package:my_side_client/models/textFieldModel.dart';
import 'package:my_side_client/services/mypageService/myPageService.dart';
import 'package:my_side_client/wigets/dialogwidget/singleButtonDialog.dart';

class AddHealthDataController extends GetxController {
  int usrType = 0;
  int gender = 0;
  int cancerNm = 0;
  List<dynamic> cancerList;
  int stageNm = 0;
  int progressNm = 0;
  int diseaseNm = 0;
  DateTime date = DateTime.now();
  bool success = false;
  int id = 0;
  String regiStr = '';

  int editOrNew = 0;

  TextFieldModel ageTextField = new TextFieldModel(
    tec: TextEditingController(),
    fn: FocusNode(),
    hintText: '00',
    isPswd: false,
    errorMsg: '',
  );
  TextFieldModel heightTextField = new TextFieldModel(
    tec: TextEditingController(),
    fn: FocusNode(),
    hintText: '00',
    isPswd: false,
    errorMsg: '',
  );
  TextFieldModel weightTextField = new TextFieldModel(
    tec: TextEditingController(),
    fn: FocusNode(),
    hintText: '00',
    isPswd: false,
    errorMsg: '',
  );
  TextFieldModel cancerTextField = new TextFieldModel(
    tec: TextEditingController(),
    fn: FocusNode(),
    hintText: '암 종류를 입력해주세요',
    isPswd: false,
    errorMsg: '',
  );
  TextFieldModel memoTextField = new TextFieldModel(
    tec: TextEditingController(),
    fn: FocusNode(),
    hintText: '내용을 입력해주세요',
    isPswd: false,
    errorMsg: '이전과 비교하여 어떤 변화가 있었는지 메모해보세요.',
  );

  @override
  void onInit() async {
    await getCancerData();
    cancerTextField.fn.addListener(isFocused);
    ageTextField.tec.addListener(onListenAge);
    heightTextField.tec.addListener(onListenHeight);
    weightTextField.tec.addListener(onListenWeight);
    cancerTextField.tec.addListener(onListenCancer);
    memoTextField.tec.addListener(() {
      update();
    });
    super.onInit();
  }

  @override
  void onClose() {
    cancerTextField.fn.removeListener(isFocused);
    ageTextField.tec.removeListener(onListenAge);
    heightTextField.tec.removeListener(onListenHeight);
    weightTextField.tec.removeListener(onListenWeight);
    cancerTextField.tec.removeListener(onListenCancer);
    memoTextField.tec.removeListener(() {
      update();
    });
    super.onClose();
  }

  void selectDate(BuildContext context) async {
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

  void setGender(int index) {
    gender = index;
    update();
  }

  void setUsrType(int index) {
    usrType = index;
    update();
  }

  void onListenAge() {
    ageTextField.onListenTextFieldType1();
    update();
  }

  void onListenHeight() {
    heightTextField.onListenTextFieldType1();
    update();
  }

  void onListenWeight() {
    weightTextField.onListenTextFieldType1();
    update();
  }

  void onListenCancer() {
    weightTextField.onListenTextFieldType1();
    update();
  }

  void isFocused() {
    if (cancerTextField.fn.hasFocus) {
      cancerNm = 7;
    }
    update();
  }

  bool isActive() {
    return usrType > 0 &&
        gender > 0 &&
        // ageTextField.tec.text.isNotEmpty &&
        // heightTextField.tec.text.isNotEmpty &&
        // weightTextField.tec.text.isNotEmpty &&
        ((cancerNm == 7 && cancerTextField.tec.text.isNotEmpty) ||
            (cancerNm > 0 && cancerNm < 7)) &&
        stageNm > 0 &&
        progressNm > 0;
    // &&memoTextField.tec.text.isNotEmpty;
  }

  void onSaveClicked(double scrHeight, VoidCallback updateNewInfo) async {
    if (cancerNm == 7) {
      cancerTextField.validateCancer();
    }
    ageTextField.validateNumber();
    heightTextField.validateNumber();
    weightTextField.validateNumber();
    if (!cancerTextField.errorOcur
        // &&
        // !ageTextField.errorOcur &&
        // !heightTextField.errorOcur &&
        // !weightTextField.errorOcur
        ) {
      if (editOrNew == 1) {
        await postHealthData();
      } else {
        await healthDataEdit();
      }
      if (success) {
        await updateNewInfo();
      } else {
        Get.dialog(
          SingleButtonDialog(
            widgetBetween: Text(
              '해당 날짜에 건강 정보가 존재합니다.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF111111),
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
            dialogHeight: scrHeight * 0.2635,
            routeFunc: () {
              Get.back();
            },
          ),
        );
      }
    }
  }

  void setCancerNum(int index) {
    cancerNm = index;
    update();
  }

  void setStageNum(int index) {
    stageNm = index;
    update();
  }

  void setProgressNum(int index) {
    progressNm = index;
    update();
  }

  void setDiseaseNum(int index) {
    diseaseNm = index;
    update();
  }

  void setOption(int index) {
    editOrNew = index;
    update();
  }

  void getCancerData() async {
    final response = await http.get(
      Uri.http('3.39.126.13:3000', '/common/auto/cancer'),
      headers: {"Accept": "applications.json"},
    );
    if (response.statusCode == 200) {
      var jsondata = json.decode(response.body);
      cancerList = jsondata['data'];
    }
  }

  List<String> getSuggestions(String query) {
    return cancerList
        .where((foodList) => foodList.contains(query))
        .toList()
        .cast<String>();
  }

  void postHealthData() async {
    success = await writeHealthData(
      UserProfile.token,
      '${DateFormat("yyyy-MM-dd").format(date)}',
      usrType == 1 ? '환우' : '보호자',
      gender == 1 ? '남' : '여',
      ageTextField.tec.text,
      heightTextField.tec.text,
      weightTextField.tec.text,
      cancerNm == 7 ? cancerTextField.tec.text : cancerType[cancerNm - 1],
      stageType[stageNm - 1],
      progressType[progressNm - 1],
      diseaseList[diseaseNm - 1],
      memoTextField.tec.text,
    );
    update();
  }

  void healthDataEdit() async {
    final response = await http
        .put(Uri.http('3.39.126.13:3000', '/mypage/health/update'), headers: {
      "Accept": "applications.json",
      "token": UserProfile.token
    }, body: {
      "health_id": "${id.toString()}",
      "relationNm": usrType == 1 ? "환우" : "보호자",
      "gender": gender == 1 ? "남" : "여",
      "age": ageTextField.tec.text,
      "height": heightTextField.tec.text,
      "weight": weightTextField.tec.text,
      "cancerNm":
          cancerNm == 7 ? cancerTextField.tec.text : cancerType[cancerNm - 1],
      "stageNm": stageType[stageNm - 1],
      "progressNm": progressType[progressNm - 1],
      "disease": diseaseList[diseaseNm - 1],
      "memo": memoTextField.tec.text
    });
    if (response.statusCode == 200) {
      var jsondata = json.decode(response.body);
      success = jsondata["success"];
    }
    update();
  }

  void callCurUserInfo() async {
    date = DateTime.now();
    List<dynamic> curInfo = [];
    curInfo = await findCurUserInfo(UserProfile.token);
    usrType = curInfo[0];
    gender = curInfo[1];
    ageTextField.tec.text = curInfo[2];
    heightTextField.tec.text = curInfo[3];
    weightTextField.tec.text = curInfo[4];
    cancerNm = curInfo[5];
    stageNm = curInfo[6];
    progressNm = curInfo[7];
    diseaseNm = curInfo[8];
    update();
  }

  void callEditUserInfo(int inId) async {
    List<dynamic> curInfo = [];
    curInfo = await findEditInfo(inId, UserProfile.token);
    usrType = curInfo[0];
    gender = curInfo[1];
    ageTextField.tec.text = curInfo[2];
    heightTextField.tec.text = curInfo[3];
    weightTextField.tec.text = curInfo[4];
    cancerNm = curInfo[5];
    stageNm = curInfo[6];
    progressNm = curInfo[7];
    diseaseNm = curInfo[8];
    memoTextField.tec.text = curInfo[9];
    regiStr = curInfo[10];
    id = inId;
    update();
  }
}
