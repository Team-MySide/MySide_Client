import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_side_client/controllers/setPersonalInfoController.dart';
import 'package:my_side_client/controllers/signUpUserController.dart';
import 'package:my_side_client/wigets/buttonwidget/recSubmitButton.dart';
import 'package:my_side_client/wigets/buttonwidget/selectBetweenTwo.dart';
import 'package:my_side_client/wigets/buttonwidget/skipButton.dart';
import 'package:my_side_client/wigets/etcwidgets/checkWidget.dart';
import 'package:my_side_client/wigets/etcwidgets/secondStagePageNumber.dart';
import 'package:my_side_client/wigets/textfieldwidget/halfWidthTextField.dart';
import 'package:my_side_client/wigets/textwidget/secondStageTextSytle.dart';
import 'package:my_side_client/wigets/textwidget/titleAndSubtitleWidget.dart';

class SetPersonalInfoPage extends StatelessWidget {
  final SetPersonalInfoController setPersonalInfoController =
      Get.put(SetPersonalInfoController());
  final SignUpUserController signUpUserController =
      Get.put(SignUpUserController());
  @override
  Widget build(BuildContext context) {
    double scrHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '환우 정보 2단계 입력',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Color(0xFF31B6F7),
        actions: [
          SkipButton(onTap: () async {
            await signUpUserController.signUpUser();
            Get.offAllNamed('/');
          }),
          SizedBox(width: 0.01 * scrHeight)
        ],
      ),
      body: GetBuilder<SetPersonalInfoController>(
        builder: (controller) {
          return SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SecondStagePageNumber(pageNum: 1, scrHeight: scrHeight),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 0.0211 * scrHeight,
                      vertical: 0.0632 * scrHeight,
                    ),
                    child: Column(
                      children: [
                        TitleAndSubtitleWidget(
                          title:
                              '${signUpUserController.nickname}님의\n정보를 입력해주세요.',
                          subTitle: '정보 입력에 맞는 음식을 추천해 드립니다.',
                          scrHeight: scrHeight,
                        ),
                        SizedBox(
                          height: 0.0527 * scrHeight,
                        ),
                        SecondStageTextStyle(title: '01. 성별을 선택해주세요.'),
                        SizedBox(
                          height: 0.0211 * scrHeight,
                        ),
                        SelectBetweenTwo(
                          scrHeight: scrHeight,
                          ind: controller.gender,
                          selectFunc: controller.setGender,
                          firstOption: '남',
                          secondOption: '여',
                        ),
                        SizedBox(
                          height: 0.0422 * scrHeight,
                        ),
                        SecondStageTextStyle(title: '02. 나이를 알려주세요.'),
                        SizedBox(
                          height: 0.0211 * scrHeight,
                        ),
                        HalfWidthTextField(
                          scrHeight: scrHeight,
                          textFieldModel: controller.ageTextField,
                          textInputType: TextInputType.number,
                          tailText: '세',
                        ),
                        SizedBox(
                          height: 0.0211 * scrHeight,
                        ),
                        SecondStageTextStyle(title: '03. 키와 몸무게를 알려주세요.'),
                        SizedBox(
                          height: 0.0211 * scrHeight,
                        ),
                        Row(
                          children: [
                            HalfWidthTextField(
                              scrHeight: scrHeight,
                              textFieldModel: controller.heightTextField,
                              textInputType: TextInputType.number,
                              tailText: 'cm',
                            ),
                            Spacer(),
                            HalfWidthTextField(
                              scrHeight: scrHeight,
                              textInputType: TextInputType.number,
                              textFieldModel: controller.weightTextField,
                              tailText: 'kg',
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 0.0105 * scrHeight,
                        ),
                        CheckWidget(
                          checked: controller.dontKnow,
                          checkText: '모르겠어요',
                          scrHeight: scrHeight,
                          checkClicked: controller.checkClicked,
                        ),
                      ],
                    ),
                  ),
                  RecSubmitButton(
                    buttonText: '다음 페이지',
                    buttonHeight: scrHeight,
                    activated: controller.isActive(),
                    validateFunc: () {
                      controller.setValidateNum();
                      if (controller.validateInfos()) {
                        if (controller.validateNm == 1) {
                          signUpUserController.setPhysicalInfo(
                              controller.gender == 1 ? '남' : '여',
                              controller.ageTextField.tec.text,
                              '',
                              '');
                        }
                        if (controller.validateNm == 2) {
                          signUpUserController.setPhysicalInfo(
                              controller.gender == 1 ? '남' : '여',
                              controller.ageTextField.tec.text,
                              controller.heightTextField.tec.text,
                              controller.weightTextField.tec.text);
                        }
                        Get.toNamed('/diseaseSelect');
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
