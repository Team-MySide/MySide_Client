import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_side_client/Login/controllers/nameController.dart';
import 'package:my_side_client/Login/controllers/otpController.dart';
import 'package:my_side_client/Login/controllers/phoneController.dart';
import 'package:my_side_client/Login/widget/dialogWidget/textButtonDialog.dart';
import 'package:my_side_client/Login/widget/recSubmitButton.dart';
import 'package:my_side_client/Login/widget/textFieldwithErrorMsg.dart';
import 'package:my_side_client/Login/widget/textfieldButtonError.dart';

import 'loginMainPage.dart';

class FindEmailPage extends StatelessWidget {
  final NameController nameController = Get.put(NameController());
  final PhoneController phoneController = Get.put(PhoneController());
  final OTPcontroller otpController = Get.put(OTPcontroller());
  @override
  Widget build(BuildContext context) {
    double scrHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '이메일 찾기',
        ),
      ),
      body: SingleChildScrollView(
        child: GetBuilder<NameController>(builder: (nctrl) {
          return GetBuilder<PhoneController>(builder: (pctrl) {
            return GetBuilder<OTPcontroller>(builder: (octrl) {
              return Column(
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(
                      0.0197 * scrHeight,
                      0.0296 * scrHeight,
                      0.0197 * scrHeight,
                      0,
                    ),
                    child: Column(
                      children: [
                        TextFieldwithErrorMsg(
                          scrHeight: scrHeight,
                          errorOcur: nctrl.errorText,
                          canClear: nctrl.canClear,
                          fn: nctrl.fn,
                          tec: nctrl.tec,
                          hintText: '이름',
                          errorMsg: nctrl.errorMsg,
                          isPswd: false,
                        ),
                        SizedBox(
                          height: 0.0099 * scrHeight,
                        ),
                        TextfieldButtonError(
                          scrHeight: scrHeight,
                          errorText: pctrl.errorText,
                          canClear: pctrl.canClear,
                          fn: pctrl.fn,
                          tec: pctrl.tec,
                          hintText: '휴대폰 번호',
                          buttonText: '인증번호 받기',
                          errorMsg: pctrl.errorMsg,
                          getOPT: () {
                            nctrl.validateName();
                            pctrl.validatePhone();
                            if (!nctrl.errorText && !pctrl.errorText) {
                              Get.dialog(
                                Dialog(
                                  child: TextButtonDialog(
                                    scrHeight: scrHeight,
                                    dialogText: '인증번호가 발송되었습니다.',
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
                          height: 0.0099 * scrHeight,
                        ),
                        TextFieldwithErrorMsg(
                          scrHeight: scrHeight,
                          errorOcur: octrl.errorText,
                          canClear: octrl.canClear,
                          fn: octrl.fn,
                          tec: octrl.tec,
                          hintText: '인증번호',
                          errorMsg: octrl.errorMsg,
                          isPswd: false,
                        ),
                        SizedBox(
                          height: 0.0197 * scrHeight,
                        ),
                        Text(
                          '이메일/비밀번호 찾기 시 제공되는 정보는 회원인증 이외의 용도로 이용 또는 저장하지 않습니다.',
                          style: TextStyle(
                            color: Color(0xFFAAAAAA),
                            fontSize: 12,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 0.41 * scrHeight,
                  ),
                  RecSubmitButton(
                    buttonText: '이메일찾기',
                    scrHeight: scrHeight,
                    activated: nctrl.tec.text.isNotEmpty &&
                        pctrl.tec.text.isNotEmpty &&
                        octrl.tec.text.isNotEmpty,
                    validateFunc: () {
                      octrl.validateOTP();
                      if (!octrl.errorText) {
                        Get.dialog(
                          Dialog(
                            child: TextButtonDialog(
                              scrHeight: scrHeight,
                              dialogText: '고객님의 이메일은\naaaa@bbbb.com\n입니다.',
                              routeFunc: () {
                                Get.offAll(() => LoginMainPage());
                              },
                            ),
                          ),
                        );
                      }
                    },
                  )
                ],
              );
            });
          });
        }),
      ),
    );
  }
}
