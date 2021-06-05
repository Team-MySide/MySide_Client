import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_side_client/Login/page/onboardingPage/onboardingPage.dart';
import 'package:my_side_client/TabMyPage/pages/myPageMain.dart';

import 'Constants.dart';
import 'Login.dart';
import 'Login/page/loginPage/loginMainPage.dart';
import 'MainTab.dart';

void main() {
  runApp(GetMaterialApp(
      title: "이웃집닥터 메인",
      theme: ThemeData(
          primaryColor: Color(Constants.primaryColorInt),
          visualDensity: VisualDensity.adaptivePlatformDensity),
      home: FirstOnboardingPage()));
  //home: MainTab()));
  // runApp(Main());
}
