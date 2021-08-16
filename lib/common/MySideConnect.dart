import 'dart:developer';

import 'package:get/get_connect/connect.dart';

import 'UserProfile.dart';

class MySideConnect extends GetConnect {
  @override
  void onInit() {
    log("MySideConnect.onInit");
    print("mysideconnect.oninit");
    httpClient.baseUrl = "http://54.180.67.217:3000";

    //모든 헤더에 붙인다.
    httpClient.addRequestModifier((request) {
      request.headers['Content-Type'] = 'application/json';
      request.headers['token'] = UserProfile.TEMP_TOKEN;
      return request;
    });
    // httpClient.timeout ; default 8초
    // httpClient.maxAuthRetries = 3;
    super.onInit();
  }
}
