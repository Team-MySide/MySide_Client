import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:my_side_client/constantsList.dart';
import 'dart:convert';

import 'package:my_side_client/models/textFieldModel.dart';

class SelectCancerController extends GetxController {
  TextFieldModel cancerTextField = new TextFieldModel(
    tec: TextEditingController(),
    fn: FocusNode(),
    hintText: '암 종류를 입력해주세요',
    isPswd: false,
    errorMsg: '',
  );

  int cancerNum = 0;
  List<dynamic> cancerList;

  @override
  void onInit() {
    cancerTextField.fn.addListener(isFocused);
    cancerTextField.tec.addListener(onListenCancer);
    getData();
    super.onInit();
  }

  @override
  void onClose() {
    cancerTextField.fn.removeListener(isFocused);
    cancerTextField.tec.removeListener(onListenCancer);
    super.onClose();
  }

  void isFocused() {
    if (cancerTextField.fn.hasFocus) {
      cancerNum = 7;
    }
    update();
  }

  void onListenCancer() {
    cancerTextField.onListenTextFieldType1();
    update();
  }

  void onCancerSelected(Function setCancer) {
    if (cancerNum > 0) {
      if (cancerNum == 7) {
        if (cancerTextField.tec.text.isNotEmpty) {
          setCancer(cancerTextField.tec.text);
          Get.toNamed('/stageSelect');
        }
      } else {
        setCancer(cancerType[cancerNum - 1]);
        Get.toNamed('/stageSelect');
      }
    }
  }

  void setCancerNum(int index) {
    cancerNum = index;
    update();
  }

  void getData() async {
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
}
