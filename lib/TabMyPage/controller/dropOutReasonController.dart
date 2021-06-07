import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:my_side_client/common/UserProfile.dart';

class DropOutReasonController extends GetxController {
  TextEditingController reasonTEC = TextEditingController();
  FocusNode reasonFN = FocusNode();
  bool success = false;

  @override
  void onInit() {
    super.onInit();
    reasonTEC = TextEditingController();
    reasonTEC.addListener(onListen);
  }

  @override
  void onClose() {
    super.onClose();
    reasonTEC.removeListener(onListen);
  }

  void onListen() {
    update();
  }

  void dropOut() async {
    final response = await http.get(
      Uri.http('54.180.67.217:3000', '/mypage/leave/${reasonTEC.text}'),
      headers: {"Accept": "applications.json", "token": UserProfile.token},
    );
    if (response.statusCode == 200) {
      var jsondata = json.decode(response.body);
      print(jsondata);
      success = jsondata['success'];
      UserProfile.isLogin = false;
      UserProfile.token = "";
    }

    update();
  }
}
