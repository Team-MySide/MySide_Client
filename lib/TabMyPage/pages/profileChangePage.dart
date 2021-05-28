import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:my_side_client/Login/widget/longRoundButton.dart';
import 'package:my_side_client/TabMyPage/controller/gaurdianNicknameController.dart';
import 'package:my_side_client/TabMyPage/controller/patientNicknameController.dart';
import 'package:my_side_client/TabMyPage/widget/overlapCheck.dart';
import 'package:my_side_client/TabMyPage/widget/textFieldwithErrorMessage.dart';

class ProfileChangePage extends StatelessWidget {
  final PatientNicknameController pnnCtrler =
      Get.put(PatientNicknameController());
  final GuardianNicknameController gnnCtrler =
      Get.put(GuardianNicknameController());
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
            onPressed: () {},
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 0.0308 * scrHeight),
          child: GetBuilder<GuardianNicknameController>(builder: (gctrler) {
            return GetBuilder<PatientNicknameController>(builder: (ctrler) {
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
                    child: TextWidgetWithErrorMessage(
                      scrHeight: scrHeight,
                      errorOccur: ctrler.wrongPNN,
                      canClear: ctrler.canClear,
                      focusNode: ctrler.focus,
                      textEC: ctrler.patientNNTEC,
                      changeErrorFunc: ctrler.setErrorToFalse,
                      changeClearFunc: ctrler.changeCanClear,
                      isPswd: false,
                      hintText: '닉네임',
                      errorMsg: ctrler.errorMsg,
                      deactiveColor: Colors.white,
                      activeColor: Color(0xFF3BD7E2),
                      errorColor: Color(0xFFEE1100),
                    ),
                  ),
                  SizedBox(
                    height: 0.0197 * scrHeight,
                  ),
                  GetBuilder<GuardianNicknameController>(
                    builder: (gctrler) {
                      return OverlapCheck(
                        headText: '보호자 닉네임',
                        hintText: '보호자 닉네임',
                        errorMsg: gctrler.errorMsg,
                        errorColor: Color(0xFFEE1100),
                        focusedColor: Color(0xFF3BD7E2),
                        defocusedColor: Color(0xFFDDDDDD),
                        errorOccur: gctrler.wrongGNN,
                        canClear: gctrler.canClear,
                        focusNode: gctrler.focus,
                        textEC: gctrler.guardianNNTEC,
                        changeErrorFunc: gctrler.setErrorToFalse,
                        changeClearFunc: gctrler.changeCanClear,
                        checkOverlapFunc: gctrler.validateNickName,
                      );
                    },
                  ),
                  SizedBox(
                    height: 0.0296 * scrHeight,
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 0.0197 * scrHeight),
                    child: LongRoundButton(
                      buttonText: '저장하기',
                      scrHeight: scrHeight,
                      activated: ctrler.patientNNTEC.text.isNotEmpty &&
                          gctrler.guardianNNTEC.text.isNotEmpty,
                      validateFunc: () {
                        pnnCtrler.validateNickName();
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
                              onTap: () {},
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
                          onTap: () {},
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
            });
          }),
        ),
      ),
    );
  }
}
