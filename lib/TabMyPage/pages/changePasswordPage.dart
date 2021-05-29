import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:my_side_client/TabMyPage/controller/passwordController.dart';
import 'package:my_side_client/TabMyPage/widget/longRoundButton.dart';

import 'package:my_side_client/TabMyPage/widget/textFieldwithErrorMessage.dart';

class ChangePswdpage extends StatelessWidget {
  final PasswordController pswdCtrl1 =
      Get.put(PasswordController(), tag: 'first');
  final PasswordController pswdCtrl2 =
      Get.put(PasswordController(), tag: 'second');
  final PasswordController pswdCtrl3 =
      Get.put(PasswordController(), tag: 'third');
  @override
  Widget build(BuildContext context) {
    double scrHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          '비밀번호 변경',
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
          child: Column(
            children: [
              Container(
                width: double.infinity,
                child: Text(
                  '현재 비밀번호',
                  style: TextStyle(
                    color: Color(0xFF666666),
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              SizedBox(
                height: 0.0099 * scrHeight,
              ),
              GetBuilder<PasswordController>(
                tag: 'first',
                builder: (pswdCtrl1) {
                  return TextWidgetWithErrorMessage(
                    scrHeight: scrHeight,
                    errorOccur: pswdCtrl1.wrongPswd,
                    canClear: pswdCtrl1.canClear,
                    focusNode: pswdCtrl1.focus,
                    textEC: pswdCtrl1.pswdController,
                    changeErrorFunc: pswdCtrl1.setErrorToFalse,
                    changeClearFunc: pswdCtrl1.changeCanClear,
                    isPswd: true,
                    hintText: '비밀번호',
                    errorMsg: pswdCtrl1.errorMsg,
                    errorColor: Color(0xFFEE1100),
                    deactiveColor: Color(0XFFAAAAAA),
                    activeColor: Color(0xFF3BD7E2),
                  );
                },
              ),
              SizedBox(
                height: 0.0197 * scrHeight,
              ),
              Container(
                width: double.infinity,
                child: Text(
                  '새 비밀번호',
                  style: TextStyle(
                    color: Color(0xFF666666),
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              SizedBox(
                height: 0.0099 * scrHeight,
              ),
              GetBuilder<PasswordController>(
                tag: 'second',
                builder: (pswdCtrl2) {
                  return TextWidgetWithErrorMessage(
                    scrHeight: scrHeight,
                    errorOccur: pswdCtrl2.wrongPswd,
                    canClear: pswdCtrl2.canClear,
                    focusNode: pswdCtrl2.focus,
                    textEC: pswdCtrl2.pswdController,
                    changeErrorFunc: pswdCtrl2.setErrorToFalse,
                    changeClearFunc: pswdCtrl2.changeCanClear,
                    isPswd: true,
                    hintText: '새 비밀번호',
                    errorMsg: pswdCtrl2.errorMsg,
                    errorColor: Color(0xFFEE1100),
                    deactiveColor: Color(0XFFAAAAAA),
                    activeColor: Color(0xFF3BD7E2),
                  );
                },
              ),
              SizedBox(
                height: 0.0197 * scrHeight,
              ),
              Container(
                width: double.infinity,
                child: Text(
                  '새 비밀번호 재확인',
                  style: TextStyle(
                    color: Color(0xFF666666),
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              SizedBox(
                height: 0.0197 * scrHeight,
              ),
              GetBuilder<PasswordController>(
                tag: 'third',
                builder: (pswdCtrl2) {
                  return TextWidgetWithErrorMessage(
                    scrHeight: scrHeight,
                    errorOccur: pswdCtrl2.wrongPswd,
                    canClear: pswdCtrl2.canClear,
                    focusNode: pswdCtrl2.focus,
                    textEC: pswdCtrl2.pswdController,
                    changeErrorFunc: pswdCtrl2.setErrorToFalse,
                    changeClearFunc: pswdCtrl2.changeCanClear,
                    isPswd: true,
                    hintText: '새 비밀번호 재확인',
                    errorMsg: pswdCtrl3.errorMsg,
                    errorColor: Color(0xFFEE1100),
                    deactiveColor: Colors.white,
                    activeColor: Colors.white,
                  );
                },
              ),
              SizedBox(
                height: 0.2426 * scrHeight,
              ),
              LongRoundButton(
                buttonText: '저장하기',
                scrHeight: scrHeight,
                activated: pswdCtrl1.pswdController.text.isNotEmpty &&
                    pswdCtrl2.pswdController.text.isNotEmpty &&
                    pswdCtrl3.pswdController.text.isNotEmpty,
                validateFunc: () {
                  pswdCtrl1.validatePswd(pswdCtrl1.pswdController.text);
                  pswdCtrl2.validatePswd(pswdCtrl2.pswdController.text);
                  pswdCtrl3.pswdMatchCheck(pswdCtrl2.pswdController.text);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
