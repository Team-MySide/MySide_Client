import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:my_side_client/Login/controllers/checkController.dart';
import 'package:my_side_client/Login/controllers/emailController.dart';
import 'package:my_side_client/Login/controllers/passwordController.dart';
import 'package:my_side_client/Login/page/loginPage/signInPage.dart';
import 'package:my_side_client/Login/widget/dialogWidget/textButtonDialog.dart';
import 'package:my_side_client/Login/widget/longRoundButton.dart';
import 'package:my_side_client/Login/widget/textFieldwithErrorMsg.dart';
import 'package:my_side_client/Login/widget/titleAndSubtitleWidget.dart';

import 'findEmailPage.dart';
import 'findPswdPage.dart';

class LoginMainPage extends StatelessWidget {
  final EmailController emailController =
      Get.put(EmailController(), tag: 'mainPageEmail');
  final PasswordController pswdController =
      Get.put(PasswordController(), tag: 'loginMain');
  final CheckController checkController = Get.put(CheckController());
  @override
  Widget build(BuildContext context) {
    double scrHeight = MediaQuery.of(context).size.height;
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
          child: GetBuilder<EmailController>(
            tag: 'mainPageEmail',
            builder: (ectrl) {
              return GetBuilder<PasswordController>(
                tag: 'loginMain',
                builder: (pctrl) {
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
                        errorOcur: ectrl.errorText,
                        canClear: ectrl.canClear,
                        fn: ectrl.fn,
                        tec: ectrl.tec,
                        hintText: '이메일',
                        errorMsg: ectrl.errorMsg,
                        isPswd: false,
                      ),
                      SizedBox(
                        height: 0.0099 * scrHeight,
                      ),
                      TextFieldwithErrorMsg(
                        scrHeight: scrHeight,
                        errorOcur: pctrl.errorText,
                        canClear: pctrl.canClear,
                        fn: pctrl.fn,
                        tec: pctrl.tec,
                        hintText: '비밀번호',
                        errorMsg: pctrl.errorMsg,
                        isPswd: true,
                      ),
                      SizedBox(
                        height: 0.0197 * scrHeight,
                      ),
                      GetBuilder<CheckController>(builder: (cctrl) {
                        return buildAutoLogin(
                          cctrl.checked,
                          scrHeight,
                          () {
                            cctrl.checkBoxClicked();
                          },
                        );
                      }),
                      SizedBox(
                        height: 0.0394 * scrHeight,
                      ),
                      LongRoundButton(
                        buttonText: '로그인',
                        scrHeight: scrHeight,
                        activated: ectrl.tec.text.isNotEmpty &&
                            pctrl.tec.text.isNotEmpty,
                        validateFunc: () {
                          ectrl.validateEmail();
                          pctrl.validatePassword();
                          if (ectrl.errorText || pctrl.errorText) {
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
                },
              );
            },
          ),
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
            child: SvgPicture.asset('asset/checkedoff.svg'),
          )
        else
          InkWell(
            onTap: checkClicked,
            child: SvgPicture.asset('asset/off.svg'),
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
