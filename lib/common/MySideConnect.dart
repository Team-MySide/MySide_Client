import 'dart:developer';

import 'package:get/get_connect/connect.dart';

class MySideConnect extends GetConnect {
  @override
  void onInit() {
    
    log("MySideConnect.onInit");
    print("mysideconnect.oninit");
    httpClient.baseUrl = "http://54.180.67.217:3000";

    //모든 헤더에 붙인다.
    httpClient.addRequestModifier((request) {
      request.headers['Content-Type'] = 'application/json';
      request.headers['token'] =
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwiaWF0IjoxNjIxMDgzMjY1LCJleHAiOjE2MjIyOTI4NjUsImlzcyI6ImlnIn0.F9xl2Ii-5bymNK5LQ8kLhLQ5vlIcSIBz5ZFVG5vhVcI';
      return request;
    });
    // httpClient.timeout ; default 8초
    // httpClient.maxAuthRetries = 3;
    super.onInit();
  }
}
