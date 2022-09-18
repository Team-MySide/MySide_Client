import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_side_client/Constants.dart';
import 'package:my_side_client/controllers/signUpMainController.dart';
import 'package:my_side_client/controllers/signUpUserController.dart';
import 'package:my_side_client/wigets/buttonwidget/recSubmitButton.dart';
import 'package:my_side_client/wigets/dialogwidget/singleButtonDialog.dart';
import 'package:my_side_client/wigets/etcwidgets/buildAgreement.dart';
import 'package:my_side_client/wigets/etcwidgets/buildInfoInputField.dart';
import 'package:my_side_client/wigets/textfieldwidget/basicTextField.dart';
import 'package:my_side_client/wigets/textfieldwidget/buttonTextField.dart';

class SignUpMainPage extends StatelessWidget {
  final SignUpMainController signUpMainController =
      Get.put(SignUpMainController());
  final SignUpUserController signUpUserController =
      Get.put(SignUpUserController());
  ScrollController scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    double scrHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(Constants.primaryColorInt),
        title: Text(
          '회원가입',
        ),
      ),
      body: GetBuilder<SignUpMainController>(
        builder: (controller) {
          bool isActive = controller.checkActive();
          return SafeArea(
            child: SingleChildScrollView(
              controller: scrollController,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 0.0316 * scrHeight,
                      horizontal: 0.0211 * scrHeight,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BuildInfoInputField(
                          scrHeight: scrHeight,
                          title: '이메일',
                          widgetForBuild: ButtonTextField(
                            scrHeight: scrHeight,
                            textFieldModel: controller.emailTextField,
                            buttonText: '중복확인',
                            valFunc: () async {
                              await controller.emailDuplicateCheck(scrHeight);
                            },
                          ),
                          isRequired: true,
                          isTextField: true,
                        ),
                        BuildInfoInputField(
                          scrHeight: scrHeight,
                          title: '이름',
                          widgetForBuild: BasicTextField(
                            scrHeight: scrHeight,
                            textFieldModel: controller.nameTextField,
                          ),
                          isRequired: true,
                          isTextField: true,
                        ),
                        BuildInfoInputField(
                          scrHeight: scrHeight,
                          title: '휴대폰',
                          widgetForBuild: BasicTextField(
                            scrHeight: scrHeight,
                            textFieldModel: controller.phoneTextField,
                          ),
                          isRequired: true,
                          isTextField: true,
                        ),
                        BuildInfoInputField(
                          scrHeight: scrHeight,
                          title: '휴대폰 재확인',
                          widgetForBuild: BasicTextField(
                            scrHeight: scrHeight,
                            textFieldModel: controller.rephoneTextField,
                          ),
                          isRequired: true,
                          isTextField: true,
                        ),
                        BuildInfoInputField(
                          scrHeight: scrHeight,
                          title: '비밀번호',
                          widgetForBuild: BasicTextField(
                            scrHeight: scrHeight,
                            textFieldModel: controller.pswdTextField,
                          ),
                          isRequired: true,
                          isTextField: true,
                        ),
                        BuildInfoInputField(
                          scrHeight: scrHeight,
                          title: '비밀번호 재확인',
                          widgetForBuild: BasicTextField(
                            scrHeight: scrHeight,
                            textFieldModel: controller.repswdTextField,
                          ),
                          isRequired: true,
                          isTextField: true,
                        ),
                        SizedBox(
                          height: 0.0422 * scrHeight,
                        ),
                        BuildAgreement(
                          first: controller.firstSelected,
                          second: controller.secondSelected,
                          third: controller.thirdSelected,
                          forth: controller.fourthSelected,
                          firstCliked: controller.firstClicked,
                          secondClicked: controller.secondClicked,
                          thirdClicked: controller.thirdClicked,
                          forthClicked: controller.fourthClicked,
                        ),
                        SizedBox(
                          height: 0.0527 * scrHeight,
                        ),
                      ],
                    ),
                  ),
                  RecSubmitButton(
                    buttonText: '회원가입',
                    buttonHeight: scrHeight,
                    activated: isActive,
                    validateFunc: () {
                      if (controller.validateSignUpdMain() &&
                          controller.duplicated == 1) {
                        signUpUserController.setMainInfo(
                          controller.emailTextField.tec.text,
                          controller.nameTextField.tec.text,
                          controller.phoneTextField.tec.text,
                          controller.pswdTextField.tec.text,
                        );
                        Get.toNamed('/userType');
                      } else {
                        Get.dialog(
                          SingleButtonDialog(
                            widgetBetween: Text(
                              '일치하지 않은 정보가 있어요! 입력하신 정보들을 다시 한번 확인해 주세요.',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xFF111111),
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            dialogHeight: scrHeight * 0.2635,
                            routeFunc: () {
                              Get.back();
                              scrollController.jumpTo(0);
                            },
                          ),
                        );
                      }
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
