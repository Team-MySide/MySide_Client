import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_side_client/controllers/loginMainController.dart';
import 'package:my_side_client/controllers/myPageMainController.dart';
import 'package:my_side_client/wigets/buttonwidget/longRoundButton.dart';
import 'package:my_side_client/wigets/etcwidgets/checkWidget.dart';
import 'package:my_side_client/wigets/textfieldwidget/basicTextField.dart';
import 'package:my_side_client/wigets/textwidget/titleAndSubtitleWidget.dart';

class LoginMainPage extends StatelessWidget {
  final LoginMainController loginMainController =
      Get.put(LoginMainController());
  final MyPageMainController myPageMainController =
      Get.put(MyPageMainController());
  @override
  Widget build(BuildContext context) {
    double scrHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: GetBuilder<LoginMainController>(
        builder: (controller) {
          return SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 0.0867 * scrHeight,
                  horizontal: 0.0211 * scrHeight,
                ),
                child: Container(
                  child: Column(
                    children: [
                      TitleAndSubtitleWidget(
                        title: '이웃집닥터가\n처음이신가요?',
                        subTitle: '로그인하고 이웃집닥터 서비스를 이용해보세요.',
                        scrHeight: scrHeight,
                      ),
                      SizedBox(
                        height: 0.0422 * scrHeight,
                      ),
                      BasicTextField(
                        scrHeight: scrHeight,
                        textFieldModel: controller.emailTextField,
                      ),
                      SizedBox(
                        height: 0.0105 * scrHeight,
                      ),
                      BasicTextField(
                        scrHeight: scrHeight,
                        textFieldModel: controller.pswdTextField,
                      ),
                      SizedBox(
                        height: 0.0211 * scrHeight,
                      ),
                      CheckWidget(
                        checkText: '자동로그인',
                        checked: controller.checked,
                        scrHeight: scrHeight,
                        checkClicked: controller.checkBoxClicked,
                      ),
                      SizedBox(
                        height: 0.0422 * scrHeight,
                      ),
                      LongRoundButton(
                        buttonText: '로그인',
                        scrHeight: scrHeight,
                        activated:
                            controller.emailTextField.tec.text.isNotEmpty &&
                                controller.pswdTextField.tec.text.isNotEmpty,
                        validateFunc: () async {
                          await controller.logInClicked(
                            scrHeight * 0.2635,
                            myPageMainController.getUserInfo,
                            myPageMainController.getHealthDataList,
                          );
                        },
                      ),
                      SizedBox(
                        height: 0.0211 * scrHeight,
                      ),
                      buildTextButtons(
                        scrHeight,
                        () {
                          Get.toNamed('/findEmail');
                        },
                        () {
                          Get.toNamed('/findPassword');
                        },
                        () {
                          Get.toNamed('/signUpMain');
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

  Widget buildTextButtons(double scrHeight, VoidCallback goToFindEmail,
      VoidCallback goToFindPswd, VoidCallback goToSignUp) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        textButton(goToFindEmail, '이메일 찾기'),
        Text(
          ' | ',
          style: TextStyle(
            color: Color(0xFF666666),
            fontWeight: FontWeight.w300,
            fontSize: 14,
          ),
        ),
        textButton(goToFindPswd, '비밀번호 찾기'),
        Text(
          ' | ',
          style: TextStyle(
            color: Color(0xFF666666),
            fontWeight: FontWeight.w300,
            fontSize: 14,
          ),
        ),
        textButton(goToSignUp, '이메일로 회원가입'),
      ],
    );
  }

  Widget textButton(VoidCallback routeFunc, String buttonText) {
    return InkWell(
      onTap: routeFunc,
      child: Text(
        buttonText,
        style: TextStyle(
          color: Color(0xFF666666),
          fontSize: 14,
          fontWeight: FontWeight.w300,
        ),
      ),
    );
  }
}
