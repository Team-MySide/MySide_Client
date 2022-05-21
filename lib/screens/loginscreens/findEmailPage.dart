import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_side_client/controllers/findEmailController.dart';
import 'package:my_side_client/wigets/buttonwidget/recSubmitButton.dart';
import 'package:my_side_client/wigets/textfieldwidget/basicTextField.dart';

class FindEmailPage extends StatelessWidget {
  final FindEmailController findEmailController =
      Get.put(FindEmailController());
  @override
  Widget build(BuildContext context) {
    double scrHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '이메일 찾기',
        ),
      ),
      body: GetBuilder<FindEmailController>(
        builder: (controller) {
          return SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
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
                            textFieldModel: controller.phoneTextField,
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
                            height: 0.485 * scrHeight,
                          ),
                        ],
                      ),
                    ),
                  ),
                  RecSubmitButton(
                    buttonText: '이메일 찾기',
                    buttonHeight: 60,
                    activated: controller.nameTextField.tec.text.isNotEmpty &&
                        controller.phoneTextField.tec.text.isNotEmpty,
                    validateFunc: () async {
                      await controller.findEmailClicked(scrHeight);
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
