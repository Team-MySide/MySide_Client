import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:my_side_client/Login/widget/longRoundButton.dart';
import 'package:my_side_client/Login/widget/textFieldwithErrorMsg.dart';
import 'package:my_side_client/Login/widget/textfieldButtonError.dart';
import 'package:my_side_client/TabMyPage/controller/profileChangePageController.dart';
import 'package:my_side_client/TabMyPage/pages/appSettingPage.dart';
import 'package:my_side_client/TabMyPage/pages/changePasswordPage.dart';
import 'package:my_side_client/TabMyPage/pages/checkPasswordPage.dart';

class ProfileChangePage extends StatelessWidget {
  final ProfileChangePageController pcCtrler =
      Get.put(ProfileChangePageController());
  @override
  Widget build(BuildContext context) {
    double scrHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          '프로필 수정',
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
          padding: EdgeInsets.symmetric(vertical: 0.0308 * scrHeight),
          child: GetBuilder<ProfileChangePageController>(builder: (ctrl) {
            return Column(
              children: [
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                    horizontal: 0.0197 * scrHeight,
                  ),
                  child: Text(
                    '환우 닉네임',
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
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 0.0197 * scrHeight,
                  ),
                  child: TextFieldwithErrorMsg(
                    scrHeight: scrHeight,
                    errorOcur: ctrl.errorOcur[0],
                    canClear: ctrl.canClear[0],
                    fn: ctrl.fn[0],
                    tec: ctrl.tec[0],
                    hintText: '환우 닉네임',
                    errorMsg: ctrl.errorMsg[0],
                    isPswd: false,
                  ),
                ),
                SizedBox(
                  height: 0.0197 * scrHeight,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 0.0197 * scrHeight,
                  ),
                  child: TextfieldButtonError(
                    scrHeight: scrHeight,
                    errorText: ctrl.errorOcur[1],
                    canClear: ctrl.canClear[1],
                    fn: ctrl.fn[1],
                    tec: ctrl.tec[1],
                    hintText: '보호자 닉네임',
                    buttonText: '중복확인',
                    errorMsg: ctrl.errorMsg[1],
                    getOPT: () {}, //중복확인하는 부분
                  ),
                ),
                SizedBox(
                  height: 0.0296 * scrHeight,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 0.0197 * scrHeight),
                  child: LongRoundButton(
                    buttonText: '저장하기',
                    scrHeight: scrHeight,
                    activated: ctrl.tec[0].text.isNotEmpty &&
                        ctrl.tec[1].text.isNotEmpty,
                    validateFunc: () {
                      ctrl.validateGuardianNickname();
                      ctrl.validatePatientNickname();
                    },
                  ),
                ),
                SizedBox(
                  height: 0.0690 * scrHeight,
                ),
                Divider(
                  height: 1,
                  thickness: 1.5,
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 0.0197 * scrHeight,
                    vertical: 0.0296 * scrHeight,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '이메일',
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xFF111111),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        'myside@myside.com',
                        style: TextStyle(
                          fontSize: 15,
                          color: Color(0xFF3BD7E2),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(
                  height: 1,
                  thickness: 1.5,
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 0.0197 * scrHeight,
                    vertical: 0.0296 * scrHeight,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '휴대폰 번호',
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xFF111111),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            '+82 10-1234-5678',
                            style: TextStyle(
                              fontSize: 15,
                              color: Color(0xFF3BD7E2),
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(
                            width: 0.0197 * scrHeight,
                          ),
                          InkWell(
                            onTap: () {
                              Get.to(() => CheckPasswordPage());
                            },
                            child: SvgPicture.asset('assets/arrowright.svg'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Divider(
                  height: 1,
                  thickness: 1.5,
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 0.0197 * scrHeight,
                    vertical: 0.0296 * scrHeight,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '비밀번호 변경',
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xFF111111),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Get.to(() => ChangePswdpage());
                        },
                        child: SvgPicture.asset('assets/arrowright.svg'),
                      ),
                    ],
                  ),
                ),
                Divider(
                  height: 1,
                  thickness: 1.5,
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
