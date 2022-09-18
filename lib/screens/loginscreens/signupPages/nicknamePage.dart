import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_side_client/Constants.dart';
import 'package:my_side_client/TabSearch/FoodInformation.dart';
import 'package:my_side_client/controllers/nicknameController.dart';
import 'package:my_side_client/controllers/signUpUserController.dart';
import 'package:my_side_client/wigets/buttonwidget/recSubmitButton.dart';
import 'package:my_side_client/wigets/etcwidgets/userInfoPageNumber.dart';
import 'package:my_side_client/wigets/textfieldwidget/buttonTextField.dart';
import 'package:my_side_client/wigets/textwidget/titleAndSubtitleWidget.dart';

class NicknamePage extends StatelessWidget {
  final NicknameController nicknameController = Get.put(NicknameController());
  final SignUpUserController signUpUserController =
      Get.put(SignUpUserController());

  @override
  Widget build(BuildContext context) {
    double scrHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: CustomAppBar(
        '환우 정보 입력',
        Constants.primarySubColorInt,
        textColor: Colors.white,
        isBack: false,
      ),
      body: GetBuilder<NicknameController>(
        builder: (controller) {
          return SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  UserInfoPageNumber(pageNum: 2, scrHeight: scrHeight),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 0.0211 * scrHeight,
                      vertical: 0.0632 * scrHeight,
                    ),
                    child: Column(
                      children: [
                        TitleAndSubtitleWidget(
                          title: '닉네임을 입력해주세요.',
                          subTitle: '이웃집닥터를 활동할 때 쓰여지는 이름입니다.',
                          scrHeight: scrHeight,
                        ),
                        SizedBox(
                          height: 0.0527 * scrHeight,
                        ),
                        ButtonTextField(
                          scrHeight: scrHeight,
                          textFieldModel: controller.nicknameTextField,
                          buttonText: '중복확인',
                          valFunc: () async {
                            await controller.nicknameDuplicateCheck(scrHeight);
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 0.36 * scrHeight,
                  ),
                  RecSubmitButton(
                    buttonText: '다음 페이지',
                    buttonHeight: scrHeight,
                    activated: controller.duplicated == 1,
                    validateFunc: () {
                      if (controller.duplicated == 1) {
                        signUpUserController
                            .setNickName(controller.nicknameTextField.tec.text);
                        Get.toNamed('/cancerSelect');
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
