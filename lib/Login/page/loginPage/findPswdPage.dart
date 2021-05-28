import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_side_client/Login/controllers/emailController.dart';
import 'package:my_side_client/Login/controllers/nameController.dart';
import 'package:my_side_client/Login/widget/dialogWidget/textButtonDialog.dart';
import 'package:my_side_client/Login/widget/recSubmitButton.dart';
import 'package:my_side_client/Login/widget/textFieldwithErrorMsg.dart';

import 'loginMainPage.dart';

class FindPswdPage extends StatelessWidget {
  final NameController nameController = Get.put(NameController());
  final EmailController emailController =
      Get.put(EmailController(), tag: 'findPswdEmail');
  @override
  Widget build(BuildContext context) {
    double scrHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '비밀번호 찾기',
        ),
      ),
      body: SingleChildScrollView(
        child: GetBuilder<NameController>(builder: (nctrl) {
          return GetBuilder<EmailController>(
              tag: 'findPswdEmail',
              builder: (ectrl) {
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
                          TextFieldwithErrorMsg(
                            scrHeight: scrHeight,
                            errorOcur: ectrl.errorText,
                            canClear: ectrl.canClear,
                            fn: ectrl.fn,
                            tec: ectrl.tec,
                            hintText: '이메일',
                            errorMsg: ectrl.errorMsg,
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
                      height: 0.5135 * scrHeight,
                    ),
                    RecSubmitButton(
                      buttonText: '변경된 비밀번호 이메일로 받기',
                      scrHeight: scrHeight,
                      activated: nctrl.tec.text.isNotEmpty &&
                          ectrl.tec.text.isNotEmpty,
                      validateFunc: () {
                        nctrl.validateName();
                        ectrl.validateEmail();
                        if (!nctrl.errorText && !ectrl.errorText) {
                          Get.dialog(
                            Dialog(
                              child: TextButtonDialog(
                                scrHeight: scrHeight,
                                dialogText:
                                    'myside@myside.com\n변경된 비밀번호가 이메일로 발송되었습니다.',
                                routeFunc: () {
                                  Get.offAll(() => LoginMainPage());
                                },
                              ),
                            ),
                          );
                        }
                      },
                    ),
                  ],
                );
              });
        }),
      ),
    );
  }
}
