import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:my_side_client/controllers/loginMainController.dart';
import 'package:my_side_client/controllers/myPageMainController.dart';
import 'package:my_side_client/screens/loginscreens/findEmailPage.dart';
import 'package:my_side_client/screens/loginscreens/finsPswdPage.dart';
import 'package:my_side_client/screens/loginscreens/loginMainPage.dart';
import 'package:my_side_client/screens/loginscreens/signupPages/nicknamePage.dart';
import 'package:my_side_client/screens/loginscreens/signupPages/progressSelectPage.dart';
import 'package:my_side_client/screens/loginscreens/signupPages/selectCancerPage.dart';
import 'package:my_side_client/screens/loginscreens/signupPages/setDiseasePage.dart';
import 'package:my_side_client/screens/loginscreens/signupPages/setPersonalInfoPage.dart';
import 'package:my_side_client/screens/loginscreens/signupPages/signUpMainPage.dart';
import 'package:my_side_client/screens/loginscreens/signupPages/stageSelectPage.dart';
import 'package:my_side_client/screens/loginscreens/signupPages/userTypeSelectPage.dart';
import 'package:my_side_client/screens/mypagescreens/appSettingPage.dart';
import 'package:my_side_client/screens/mypagescreens/checkPswdPage.dart';
import 'package:my_side_client/screens/mypagescreens/dropOutPage.dart';
import 'package:my_side_client/screens/mypagescreens/faqPage.dart';
import 'package:my_side_client/screens/mypagescreens/healthDataListPage.dart';
import 'package:my_side_client/screens/mypagescreens/phoneChangePage.dart';
import 'package:my_side_client/screens/mypagescreens/profileModifyPage.dart';
import 'package:my_side_client/screens/mypagescreens/pswdChangePage.dart';
import 'package:my_side_client/screens/mypagescreens/termOfServicePage.dart';
import 'package:my_side_client/screens/onboarding/onBoardingPage.dart';
import 'Constants.dart';
import 'MainTab.dart';
import 'TabRecipe/RecipeMain.dart';
import 'TabSearch/FoodGridList.dart';
import 'TabSearch/FoodInformation.dart';
import 'TabSearch/IngredientGridList.dart';
import 'TabSearch/SerachDiseaseResult.dart';
import 'screens/mypagescreens/addHealthDataPage.dart';
import 'screens/mypagescreens/myPageMain.dart';

void main() async {
  await GetStorage.init();
  final LoginMainController loginMainController =
  Get.put(LoginMainController());
  final MyPageMainController myPageMainController =
  Get.put(MyPageMainController());
  GetStorage box = GetStorage();
  bool autoLoginFlag = false;
  if (loginMainController.loginStorage.read('autologin') != null &&
      loginMainController.loginStorage.read('autologin')) {
    await loginMainController.logIn();
    await myPageMainController.getUserInfo();
    await myPageMainController.getHealthDataList();
    autoLoginFlag = true;
  }
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  // SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
  runApp(GetMaterialApp(
    title: "이웃집닥터 메인",
    theme: ThemeData(
        primaryColor: Color(Constants.primaryColorInt),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        canvasColor: Colors.white),
    // home: box.read(Constants.isFirstRunApp) ?? true
    //     ? OnBoardingPage()
    //     : autoLoginFlag
    //         ? MainTab()
    //         : LoginMainPage(),
    initialRoute: loginMainController.loginStorage.read('isFirstRunApp') ?? true
    // ? '/onboarding'
    // : autoLoginFlag
    // ? '/MainTab'
    // : '/',
        ? 'MainTab'
        : '/',
    // home: LoginMainPage()));
    // home: MainTab(),
    getPages: [
      GetPage(name: '/', page: () => LoginMainPage()),
      GetPage(name: '/onboarding', page: () => OnBoardingPage()),
      GetPage(name: '/findEmail', page: () => FindEmailPage()),
      GetPage(name: '/findPassword', page: () => FindPswdPage()),
      GetPage(name: '/signUpMain', page: () => SignUpMainPage()),
      GetPage(name: '/userType', page: () => UserTypeSelectPage()),
      GetPage(name: '/nickName', page: () => NicknamePage()),
      GetPage(name: '/cancerSelect', page: () => SelectCancerPage()),
      GetPage(name: '/stageSelect', page: () => StageSelectPage()),
      GetPage(name: '/progressSelect', page: () => ProgressSelectPage()),
      GetPage(name: '/personalInfo', page: () => SetPersonalInfoPage()),
      GetPage(name: '/diseaseSelect', page: () => SetDiseasePage()),
      GetPage(name: '/mypageMain', page: () => MyPageMain()),
      GetPage(name: '/healthDataList', page: () => HealthDataListPage()),
      GetPage(name: '/addHealthData', page: () => AddHealthDataPage()),
      GetPage(name: '/settings', page: () => AppSettingPage()),
      GetPage(name: '/FAQ', page: () => FaqPage()),
      GetPage(name: '/TermOfService', page: () => TermsOfServicePage()),
      GetPage(name: '/dropOut', page: () => DropOutPage()),
      GetPage(name: '/ProfileChange', page: () => ProfileModifyPage()),
      GetPage(name: '/checkPswd', page: () => CheckPswdPage()),
      GetPage(name: '/changePhone', page: () => PhoneChangePage()),
      GetPage(name: '/changePswd', page: () => PswdChangePage()),
      GetPage(
          name: "/SearchIngredientCategoryResultList",
          page: () => SearchIngredientCategoryResultList()),
      GetPage(name: "/FoodInformation", page: () => FoodInformation()),
      GetPage(name: "/SearchDiseaseResult", page: () => SearchDiseaseResult()),
      GetPage(
          name: "/SearchFoodcategoryResultList",
          page: () => SearchFoodcategoryResultList()),
      GetPage(name: "/MainTab", page: () => MainTab()),
      GetPage(name: "/RecipeMain", page: () => RecipeMain())
    ],
  ));
}