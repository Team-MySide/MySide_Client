import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:my_side_client/Login/widget/longRoundButton.dart';
import 'package:my_side_client/Login/widget/textFieldwithErrorMsg.dart';
import 'package:my_side_client/TabMyPage/controller/ChangePhoneNumberPageController.dart';
import 'package:my_side_client/TabMyPage/controller/profileChangePageController.dart';
import 'package:my_side_client/TabMyPage/pages/profileChangePage.dart';

import 'appSettingPage.dart';

class ChangePhoneNumberPage extends StatelessWidget {
  final ChangePhoneNumberPageController changePhoneNumberPageController =
      Get.put(ChangePhoneNumberPageController());
  final ProfileChangePageController profileChangePageController =
      Get.put(ProfileChangePageController());
  @override
  Widget build(BuildContext context) {
    double scrHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          '휴대폰 번호 변경',
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
          child: GetBuilder<ChangePhoneNumberPageController>(builder: (ctrl) {
            return Column(
              children: [
                Container(
                  width: double.infinity,
                  child: Text(
                    '휴대폰',
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
                TextFieldwithErrorMsg(
                  scrHeight: scrHeight,
                  errorOcur: ctrl.errorOcur[0],
                  canClear: ctrl.canClear[0],
                  fn: ctrl.fn[0],
                  tec: ctrl.tec[0],
                  hintText: '휴대폰 번호',
                  errorMsg: ctrl.errorMsg[0],
                  isPswd: false,
                ),
                SizedBox(
                  height: 0.0197 * scrHeight,
                ),
                Container(
                  width: double.infinity,
                  child: Text(
                    '휴대폰 재확인',
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
                TextFieldwithErrorMsg(
                  scrHeight: scrHeight,
                  errorOcur: ctrl.errorOcur[1],
                  canClear: ctrl.canClear[1],
                  fn: ctrl.fn[1],
                  tec: ctrl.tec[1],
                  hintText: '휴대폰 번호 재확인',
                  errorMsg: ctrl.errorMsg[1],
                  isPswd: false,
                ),
                SizedBox(
                  height: 0.41 * scrHeight,
                ),
                LongRoundButton(
                  buttonText: '저장하기',
                  scrHeight: scrHeight,
                  activated: ctrl.tec[0].text.isNotEmpty &&
                      ctrl.tec[1].text.isNotEmpty,
                  validateFunc: () async {
                    ctrl.validatePhone();
                    ctrl.isPhonenumberMatch();
                    if (!ctrl.errorOcur[0] && !ctrl.errorOcur[1]) {
                      ctrl.changePhone();
                      await profileChangePageController.getUserProfile();
                      Get.offAll(() => ProfileChangePage());
                    }
                  },
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
