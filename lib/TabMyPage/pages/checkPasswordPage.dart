import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:my_side_client/Login/widget/textFieldwithErrorMsg.dart';
import 'package:my_side_client/TabMyPage/controller/passwordController.dart';
import 'package:my_side_client/TabMyPage/widget/longRoundButton.dart';

import 'appSettingPage.dart';
import 'changePhoneNumbePage.dart';

class CheckPasswordPage extends StatelessWidget {
  final PasswordController passwordController = Get.put(PasswordController());
  @override
  Widget build(BuildContext context) {
    double scrHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          '비밀번호 확인',
          style: TextStyle(
            color: Color(0xFF111111),
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        elevation: 0,
        actions: [
          IconButton(
            icon: SvgPicture.asset('assets/Setting.svg'),
            onPressed: () {
              Get.to(() => AppSettingPage());
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 0.0197 * scrHeight,
            vertical: 0.0308 * scrHeight,
          ),
          child: GetBuilder<PasswordController>(
            builder: (ctrl) {
              return Column(
                children: [
                  TextFieldwithErrorMsg(
                    scrHeight: scrHeight,
                    errorOcur: ctrl.errorOcur,
                    canClear: ctrl.canClear,
                    fn: ctrl.fn,
                    tec: ctrl.tec,
                    hintText: '비밀번호',
                    errorMsg: ctrl.errorMsg,
                    isPswd: true,
                  ),
                  SizedBox(
                    height: 0.5062 * scrHeight,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      child: Text(
                        '비밀번호 찾기',
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: Color(0xFF3BD7E2),
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 0.0197 * scrHeight,
                  ),
                  LongRoundButton(
                    buttonText: '다음',
                    scrHeight: scrHeight,
                    activated: ctrl.tec.text.isNotEmpty,
                    validateFunc: () {
                      ctrl.validatePassword();
                      ctrl.checkPswd();
                      //Get.to(() => ChangePhoneNumberPage());
                    },
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
