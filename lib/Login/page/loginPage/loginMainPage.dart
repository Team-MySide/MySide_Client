import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:my_side_client/Login/controllers/loginPageControllers.dart/loginMainPageController.dart';
import 'package:my_side_client/Login/page/loginPage/findEmailPage.dart';
import 'package:my_side_client/Login/page/loginPage/findPswdPage.dart';
import 'package:my_side_client/Login/page/loginPage/signInPage.dart';
import 'package:my_side_client/Login/widget/dialogWidget/textButtonDialog.dart';
import 'package:my_side_client/Login/widget/longRoundButton.dart';
import 'package:my_side_client/Login/widget/textFieldwithErrorMsg.dart';
import 'package:my_side_client/Login/widget/titleAndSubtitleWidget.dart';
import 'package:my_side_client/MainTab.dart';
import 'package:my_side_client/TabMyPage/controller/myPageMainController.dart';
import 'package:my_side_client/TabMyPage/pages/myPageMain.dart';
import 'package:my_side_client/common/UserProfile.dart';

import '../../../Constants.dart';

class LoginMainPage extends StatelessWidget {
  //final loginStorage = GetStorage();
  final LoginMainPageController loginMainController =
      Get.put(LoginMainPageController());
  final MyPageMainController myPageMainController =
      Get.put(MyPageMainController());
  @override
  Widget build(BuildContext context) {
    double scrHeight = MediaQuery.of(context).size.height;
    GetStorage box = GetStorage();
    box.write(Constants.isFirstRunApp, false);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 0.0197 * scrHeight,
            vertical: 0.0296 * scrHeight,
          ),
          child: GetBuilder<LoginMainPageController>(builder: (ctrl) {
            return Column(
              children: [
                TitleAndSubtitleWidget(
                  title: '이웃집닥터가\n처음이신가요?',
                  subTitle: '로그인하고 이웃집닥터 서비스를 이용해보세요.',
                  scrHeight: scrHeight,
                ),
                SizedBox(
                  height: 0.0394 * scrHeight,
                ),
                TextFieldwithErrorMsg(
                  scrHeight: scrHeight,
                  errorOcur: ctrl.errorOcur[0],
                  canClear: ctrl.canClear[0],
                  fn: ctrl.fn[0],
                  tec: ctrl.tec[0],
                  hintText: '이메일',
                  errorMsg: ctrl.errorMsg[0],
                  isPswd: false,
                ),
                SizedBox(
                  height: 0.0099 * scrHeight,
                ),
                TextFieldwithErrorMsg(
                  scrHeight: scrHeight,
                  errorOcur: ctrl.errorOcur[1],
                  canClear: ctrl.canClear[1],
                  fn: ctrl.fn[1],
                  tec: ctrl.tec[1],
                  hintText: '비밀번호',
                  errorMsg: ctrl.errorMsg[1],
                  isPswd: true,
                ),
                SizedBox(
                  height: 0.0197 * scrHeight,
                ),
                buildAutoLogin(
                  ctrl.checked,
                  scrHeight,
                  () {
                    ctrl.checkBoxClicked();
                  },
                ),
                SizedBox(
                  height: 0.0394 * scrHeight,
                ),
                LongRoundButton(
                  buttonText: '로그인',
                  scrHeight: scrHeight,
                  activated: ctrl.tec[0].text.isNotEmpty &&
                      ctrl.tec[1].text.isNotEmpty,
                  validateFunc: () async {
                    //ctrl.logIn();
                    ctrl.validateEmail();
                    ctrl.validatePassword();
                    if (!ctrl.errorOcur[0] && !ctrl.errorOcur[1]) {
                      await ctrl.logIn(ctrl.tec[0].text, ctrl.tec[1].text);
                      if (UserProfile.isLogin) {
                        // Get.to(() => MainTab());
                        await myPageMainController.getHealthDataList();
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(builder: (context) => MainTab()),
                            (Route<dynamic> route) => false);
                      } else {
                        Get.dialog(
                          Dialog(
                            child: TextButtonDialog(
                              scrHeight: scrHeight,
                              dialogText: '아이디나 비밀번호가 올바르지 않습니다.',
                              routeFunc: () {
                                Get.back();
                              },
                            ),
                          ),
                        );
                      }
                    }
                  },
                ),
                SizedBox(
                  height: 0.0197 * scrHeight,
                ),
                buildTextButtons(
                  () {
                    Get.to(() => FindEmailPage());
                  },
                  () {
                    Get.to(() => FindPswdPage());
                  },
                  () {
                    Get.to(() => SignInPage());
                  },
                  scrHeight,
                ),
              ],
            );
          }),
        ),
      ),
    );
  }

  Widget buildAutoLogin(
      bool checked, double scrHeight, VoidCallback checkClicked) {
    return Row(
      children: [
        if (checked)
          InkWell(
            onTap: checkClicked,
            child: SvgPicture.asset('assets/checkedoff.svg'),
          )
        else
          InkWell(
            onTap: checkClicked,
            child: SvgPicture.asset('assets/off.svg'),
          ),
        SizedBox(
          width: 0.0099 * scrHeight,
        ),
        Text(
          '자동로그인',
          style: TextStyle(
            color: Color(0xFF666666),
            fontWeight: FontWeight.w300,
            fontSize: 14,
          ),
        ),
      ],
    );
  }

  Widget buildTextButtons(VoidCallback toFindEmail, VoidCallback toFindPswd,
      VoidCallback toSignIn, double scrHeight) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: toFindEmail,
          child: Text(
            '이메일 찾기',
            style: TextStyle(
              color: Color(0xFF666666),
              fontWeight: FontWeight.w300,
              fontSize: 14,
            ),
          ),
        ),
        SizedBox(
          width: 0.0099 * scrHeight,
        ),
        Text(
          '|',
          style: TextStyle(
            color: Color(0xFF666666),
            fontWeight: FontWeight.w300,
            fontSize: 14,
          ),
        ),
        SizedBox(
          width: 0.0099 * scrHeight,
        ),
        InkWell(
          onTap: toFindPswd,
          child: Text(
            '비밀번호 찾기',
            style: TextStyle(
              color: Color(0xFF666666),
              fontWeight: FontWeight.w300,
              fontSize: 14,
            ),
          ),
        ),
        SizedBox(
          width: 0.0099 * scrHeight,
        ),
        Text(
          '|',
          style: TextStyle(
            color: Color(0xFF666666),
            fontWeight: FontWeight.w300,
            fontSize: 14,
          ),
        ),
        SizedBox(
          width: 0.0099 * scrHeight,
        ),
        InkWell(
          onTap: toSignIn,
          child: Text(
            '이메일로 회원가입',
            style: TextStyle(
              color: Color(0xFF666666),
              fontWeight: FontWeight.w300,
              fontSize: 14,
            ),
          ),
        ),
      ],
    );
  }
}
