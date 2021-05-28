import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:my_side_client/Login/controllers/passwordController.dart';
import 'package:my_side_client/Login/widget/longRoundButton.dart';
import 'package:my_side_client/TabMyPage/widget/textFieldwithErrorMessage.dart';

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
            onPressed: () {},
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
            builder: (ctrler) {
              return Column(
                children: [
                  TextWidgetWithErrorMessage(
                    scrHeight: scrHeight,
                    errorOccur: ctrler.wrongPswd,
                    canClear: ctrler.canClear,
                    focusNode: ctrler.focus,
                    textEC: ctrler.pswdController,
                    changeErrorFunc: ctrler.setErrorToFalse,
                    changeClearFunc: ctrler.changeCanClear,
                    isPswd: true,
                    hintText: '비밀번호',
                    errorMsg: ctrler.errorMsg,
                    errorColor: Color(0xFFEE1100),
                    deactiveColor: Color(0XFFAAAAAA),
                    activeColor: Color(0xFF3BD7E2),
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
                    activated: ctrler.pswdController.text.isNotEmpty,
                    validateFunc: () {
                      ctrler.validatePswd(ctrler.pswdController.text);
                      Get.to(() => ChangePhoneNumberPage());
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
