import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:my_side_client/TabBookmark/TabBookmark.dart';
import 'package:my_side_client/TabRecipe/CommentMain.dart';
import 'package:my_side_client/TabRecipe/RecipeDetailPage.dart';
import 'package:my_side_client/TabRecipe/RegisterRecipe02InsertVideo.dart';
import 'package:my_side_client/TabRecipe/RegisterRecipe04InsertRecipe.dart';
import 'package:my_side_client/TabRecipe/RegisterRecipe05InsertRecipe.dart';
import 'package:my_side_client/common/UserProfile.dart';
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
import 'TabRecipe/Recipe02List.dart';

import 'TabRecipe/RecipeMain.dart';
import 'TabRecipe/RegisterRecipe01InsertRecipe.dart';
import 'TabRecipe/RegisterRecipe03InsertRecipe.dart';
import 'TabSearch/FoodGridList.dart';
import 'TabSearch/FoodInformation.dart';
import 'TabSearch/FoodReferenceDesc.dart';
import 'TabSearch/IngredientGridList.dart';
import 'TabSearch/NutritionDetail.dart';
import 'TabSearch/SerachDiseaseResult.dart';
import 'screens/mypagescreens/addHealthDataPage.dart';
import 'screens/mypagescreens/myPageMain.dart';
import 'wigets/dialogwidget/singleButtonDialog.dart';

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
    if (UserProfile.isLogin) {
      await myPageMainController.getUserInfo();
      await myPageMainController.getHealthDataList();
      autoLoginFlag = true;
    } else {
      loginMainController.loginStorage.write('autologin', null);
      autoLoginFlag = false;
    }
  }
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(GetMaterialApp(
    title: "이웃집닥터 메인",
    theme: ThemeData(
        scrollbarTheme: ScrollbarThemeData(
          thumbColor: MaterialStateProperty.all(Color(0xFF3BD7E2)),
          trackColor: MaterialStateProperty.all(Color(0xFFF4F4F4)),
        ),
        primaryColor: Color(Constants.primaryColorInt),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        canvasColor: Colors.white),
    home: box.read(Constants.isFirstRunApp) ?? true
        ? OnBoardingPage()
        : autoLoginFlag
            ? MainTab()
            : LoginMainPage(),

    // initialRoute: loginMainController.loginStorage.read('isFirstRunApp') ?? true
    //     ? '/onboarding'
    //     // : autoLoginFlag
    //     // ? '/MainTab'
    //     // : '/',
    //     // ? 'LoginMainPage()'
    //     : '/LoginMainPage',

    // home: LoginMainPage()));
    // home: MainTab(),
    getPages: [
      // GetPage(name: '/', page: () => LoginMainPage()),
      GetPage(name: '/LoginMainPage', page: () => LoginMainPage()),
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
      GetPage(name: '/CommentMain', page: () => CommentMain()),
      GetPage(
          name: "/SearchIngredientCategoryResultList",
          page: () => SearchIngredientCategoryResultList()),
      GetPage(name: "/FoodInformation", page: () => FoodInformation()),
      GetPage(name: "/SearchDiseaseResult", page: () => SearchDiseaseResult()),
      GetPage(
          name: "/SearchFoodcategoryResultList",
          page: () => SearchFoodcategoryResultList()),
      GetPage(name: "/MainTab", page: () => MainTab()),
      GetPage(
          name: "/RegisterRecipe01",
          page: () => RegisterRecipe01InsertRecipe()),
      GetPage(
          name: "/RegisterRecipe02",
          page: () => RegisterRecipe02InsertRecipeVideo()),
      GetPage(
          name: "/RegisterRecipe03",
          page: () => RegisterRecipe03InsertRecipe()),
      GetPage(
          name: "/RegisterRecipe05",
          page: () => RegisterRecipe05InsertRecipe()),
      GetPage(
          name: "/RegisterRecipe04",
          page: () => RegisterRecipe04InsertRecipe()),
      GetPage(name: "/RecipeList", page: () => RecipeList()),
      GetPage(name: "/RecipeMain", page: () => RecipeMain()),
      GetPage(name: "/RecipeDetailPage", page: () => RecipeDetailPage()),
      GetPage(name: "/FoodReferenceDesc", page: () => FoodReferenceDesc()),
      GetPage(
          name: "/FoodInformationNutritionDetail",
          page: () => NutritionDetail()),
      GetPage(name: "/TabBookmark", page: () => TabBookmark()),
    ],
  ));
}
