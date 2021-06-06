import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:my_side_client/Login/widget/dialogWidget/textButtonDialog.dart';
import 'package:my_side_client/Login/widget/textFieldwithErrorMsg.dart';
import 'package:my_side_client/TabMyPage/controller/changePswdPageController.dart';
import 'package:my_side_client/TabMyPage/pages/appSettingPage.dart';
import 'package:my_side_client/TabMyPage/widget/longRoundButton.dart';

class ChangePswdpage extends StatelessWidget {
  final ChangePswdPageController cpctrl = Get.put(ChangePswdPageController());
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
          child: GetBuilder<ChangePswdPageController>(builder: (ctrl) {
            return Column(
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
                TextFieldwithErrorMsg(
                  scrHeight: scrHeight,
                  errorOcur: ctrl.errorOcur[0],
                  canClear: ctrl.canClear[0],
                  fn: ctrl.fn[0],
                  tec: ctrl.tec[0],
                  hintText: '현재 비밀번호',
                  errorMsg: ctrl.errorMsg[0],
                  isPswd: true,
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
                TextFieldwithErrorMsg(
                  scrHeight: scrHeight,
                  errorOcur: ctrl.errorOcur[1],
                  canClear: ctrl.canClear[1],
                  fn: ctrl.fn[1],
                  tec: ctrl.tec[1],
                  hintText: '새 비밀번호',
                  errorMsg: ctrl.errorMsg[1],
                  isPswd: true,
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
                TextFieldwithErrorMsg(
                  scrHeight: scrHeight,
                  errorOcur: ctrl.errorOcur[2],
                  canClear: ctrl.canClear[2],
                  fn: ctrl.fn[2],
                  tec: ctrl.tec[2],
                  hintText: '새 비밀번호 재확인',
                  errorMsg: ctrl.errorMsg[2],
                  isPswd: true,
                ),
                SizedBox(
                  height: 0.2426 * scrHeight,
                ),
                LongRoundButton(
                  buttonText: '저장하기',
                  scrHeight: scrHeight,
                  activated: ctrl.tec[0].text.isNotEmpty &&
                      ctrl.tec[1].text.isNotEmpty &&
                      ctrl.tec[2].text.isNotEmpty,
                  validateFunc: () async {
                    ctrl.validateCurPassword();
                    ctrl.validateNewPassword();
                    ctrl.validatePswdMatch();
                    if (!ctrl.errorOcur[0] &&
                        !ctrl.errorOcur[1] &&
                        !ctrl.errorOcur[2]) {
                      await ctrl.changePswd();
                      if (ctrl.success) {
                        Get.dialog(
                          Dialog(
                            child: TextButtonDialog(
                              scrHeight: scrHeight,
                              dialogText: '비밀번호가 변경되었습니다.',
                              routeFunc: () {
                                Get.back();
                              },
                            ),
                          ),
                        );
                      } else {
                        Get.dialog(
                          Dialog(
                            child: TextButtonDialog(
                              scrHeight: scrHeight,
                              dialogText: '현재 비밀번호가 올바르지 않습니다.',
                              routeFunc: () {
                                Get.back();
                              },
                            ),
                          ),
                        );
                      }
                    }
                    //Get.back();
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
