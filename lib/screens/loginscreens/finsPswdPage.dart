import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:my_side_client/controllers/findPswdController.dart';
import 'package:my_side_client/wigets/buttonwidget/recSubmitButton.dart';
import 'package:my_side_client/wigets/dialogwidget/singleButtonDialog.dart';
import 'package:my_side_client/wigets/textfieldwidget/basicTextField.dart';

class FindPswdPage extends StatelessWidget {
  final FindPswdController findPswdController = Get.put(FindPswdController());
  @override
  Widget build(BuildContext context) {
    double scrHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '비밀번호 찾기',
        ),
      ),
      body: GetBuilder<FindPswdController>(
        builder: (controller) {
          return SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 0.0316 * scrHeight,
                  horizontal: 0.0211 * scrHeight,
                ),
                child: Container(
                  child: Column(
                    children: [
                      BasicTextField(
                        scrHeight: scrHeight,
                        textFieldModel: controller.nameTextField,
                      ),
                      SizedBox(
                        height: 0.0105 * scrHeight,
                      ),
                      BasicTextField(
                        scrHeight: scrHeight,
                        textFieldModel: controller.emailTextField,
                      ),
                      SizedBox(
                        height: 0.0105 * scrHeight,
                      ),
                      Text(
                        '이메일/비밀번호 찾기 시 제공되는 정보는 회원인증 이외의 용도로 이용 또는 저장하지 않습니다.',
                        style: TextStyle(
                          color: Color(0xFFAAAAAA),
                          fontSize: 12,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      SizedBox(
                        height: 0.5 * scrHeight,
                      ),
                      RecSubmitButton(
                        buttonText: '비밀번호 찾기',
                        buttonHeight: scrHeight,
                        activated:
                            controller.nameTextField.tec.text.isNotEmpty &&
                                controller.emailTextField.tec.text.isNotEmpty,
                        validateFunc: () async {
                          await controller.findPswdClicked(scrHeight);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget buildSendedPswdDialog(
      String email, double scrHeight, VoidCallback routeFunc) {
    return SingleButtonDialog(
      widgetBetween: Column(
        children: [
          SvgPicture.asset('assets/send.svg'),
          SizedBox(
            height: 0.0316 * scrHeight,
          ),
          Text(
            email,
            style: TextStyle(
              color: Color(0xFF111111),
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            '변경된 비밀번호가 이메일로 전송되었습니다.',
            style: TextStyle(
              color: Color(0xFF111111),
              fontSize: 14,
              fontWeight: FontWeight.w300,
            ),
          ),
        ],
      ),
      dialogHeight: scrHeight * 0.427,
      routeFunc: routeFunc,
    );
  }
}
