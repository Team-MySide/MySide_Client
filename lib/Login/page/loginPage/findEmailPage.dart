import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_side_client/Login/controllers/loginPageControllers.dart/findEmailPageController.dart';
import 'package:my_side_client/Login/widget/dialogWidget/textButtonDialog.dart';
import 'package:my_side_client/Login/widget/recSubmitButton.dart';
import 'package:my_side_client/Login/widget/textFieldwithErrorMsg.dart';

import 'loginMainPage.dart';

class FindEmailPage extends StatelessWidget {
  final FindEmailPageController fepController =
      Get.put(FindEmailPageController());
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
        child: GetBuilder<FindEmailPageController>(builder: (ctrl) {
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
                      errorOcur: ctrl.errorOcur[0],
                      canClear: ctrl.canClear[0],
                      fn: ctrl.fn[0],
                      tec: ctrl.tec[0],
                      hintText: '이름',
                      errorMsg: ctrl.errorMsg[0],
                      isPswd: false,
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
                      hintText: '휴대폰 번호',
                      errorMsg: ctrl.errorMsg[1],
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
                height: 0.513 * scrHeight,
              ),
              RecSubmitButton(
                buttonText: '이메일찾기',
                scrHeight: scrHeight,
                activated:
                    ctrl.tec[0].text.isNotEmpty && ctrl.tec[1].text.isNotEmpty,
                validateFunc: () {
                  ctrl.validateName();
                  ctrl.validatePhone();
                  if (!ctrl.errorOcur[0] && !ctrl.errorOcur[1]) {
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
        }),
      ),
    );
  }
}
