import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:my_side_client/Login/widget/dialogWidget/textButtonDialog.dart';
import 'package:my_side_client/Login/widget/longRoundButton.dart';
import 'package:my_side_client/Login/widget/textFieldwithErrorMsg.dart';
import 'package:my_side_client/Login/widget/textfieldButtonError.dart';
import 'package:my_side_client/TabMyPage/controller/myPageMainController.dart';
import 'package:my_side_client/TabMyPage/controller/profileChangePageController.dart';
import 'package:my_side_client/TabMyPage/pages/appSettingPage.dart';
import 'package:my_side_client/TabMyPage/pages/changePasswordPage.dart';
import 'package:my_side_client/TabMyPage/pages/checkPasswordPage.dart';

class ProfileChangePage extends StatelessWidget {
  final ProfileChangePageController pcCtrler =
      Get.put(ProfileChangePageController());
  final MyPageMainController myPageMainController =
      Get.put(MyPageMainController());
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
                    '닉네임',
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
                  child: ctrl.hasData[0]
                      ? TextFieldwithErrorMsg(
                          scrHeight: scrHeight,
                          errorOcur: ctrl.errorOcur[0],
                          canClear: ctrl.canClear[0],
                          fn: ctrl.fn[0],
                          tec: ctrl.tec[0],
                          hintText: '닉네임',
                          errorMsg: '',
                          isPswd: false,
                        )
                      : TextfieldButtonError(
                          scrHeight: scrHeight,
                          errorText: ctrl.errorOcur[0],
                          canClear: ctrl.canClear[0],
                          fn: ctrl.fn[0],
                          tec: ctrl.tec[0],
                          hintText: '닉네임',
                          buttonText: '중복확인',
                          errorMsg: ctrl.errorMsg[0],
                          getOPT: () async {
                            ctrl.validateNickname(0);
                            if (!ctrl.errorOcur[0]) {
                              await ctrl.isExistNickname();
                              Get.dialog(Dialog(
                                child: TextButtonDialog(
                                  scrHeight: scrHeight,
                                  dialogText: ctrl.duplicateChecked == true
                                      ? '사용할 수 있는 닉네임입니다.'
                                      : '동일한 닉네임이 이미 등록되어 있습니다.',
                                  routeFunc: () {
                                    Get.back();
                                  },
                                ),
                              ));
                            }
                          }, //중복확인하는 부분
                        ),
                ),
                SizedBox(
                  height: 0.0197 * scrHeight,
                ),
                SizedBox(
                  height: 0.0296 * scrHeight,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 0.0197 * scrHeight),
                  child: LongRoundButton(
                    buttonText: '저장하기',
                    scrHeight: scrHeight,
                    activated:
                        ctrl.tec[0].text.isNotEmpty && ctrl.duplicateChecked,
                    validateFunc: () async {
                      if (ctrl.duplicateChecked) {
                        await ctrl.nickNameChange();
                        await myPageMainController.getUserInfo();
                        Get.dialog(
                          Dialog(
                            child: TextButtonDialog(
                              scrHeight: scrHeight,
                              dialogText: '닉네임이 변경되었습니다.',
                              routeFunc: () {
                                Get.back();
                              },
                            ),
                          ),
                        );
                      }
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
                        '${ctrl.profile.email}',
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
                            '${ctrl.profile.phone}',
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
