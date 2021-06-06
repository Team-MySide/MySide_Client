import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:my_side_client/Login/page/onboardingPage/onboardingPage.dart';
import 'package:my_side_client/TabMyPage/pages/myPageMain.dart';

import 'Constants.dart';
import 'Login.dart';
import 'Login/page/loginPage/loginMainPage.dart';
import 'MainTab.dart';
import 'TabSearch/FoodInformation.dart';
import 'TabSearch/IngredientGridList.dart';
import 'TabSearch/SerachDiseaseResult.dart';

void main() async {
  await GetStorage.init();
  GetStorage box = GetStorage();

  runApp(GetMaterialApp(
    title: "이웃집닥터 메인",
    theme: ThemeData(
        primaryColor: Color(Constants.primaryColorInt),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        canvasColor: Colors.white),
    home: box.read(Constants.isFirstRunApp) ?? true
        ? FirstOnboardingPage()
        : LoginMainPage(),

    // home: LoginMainPage()));
    // home: MainTab(),
    initialRoute: "/",
    getPages: [
      GetPage(
          name: "/SearchIngredientCategoryResultList",
          page: () => SearchIngredientCategoryResultList()),
      GetPage(name: "/FoodInformation", page: () => FoodInformation()),
      GetPage(name: "/SearchDiseaseResult", page: () => SearchDiseaseResult())
    ],
  ));
}
