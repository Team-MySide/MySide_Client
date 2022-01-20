import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:my_side_client/constantsList.dart';
import 'package:my_side_client/controllers/setDiseaseController.dart';
import 'package:my_side_client/controllers/signUpUserController.dart';
import 'package:my_side_client/wigets/buttonwidget/recSubmitButton.dart';
import 'package:my_side_client/wigets/buttonwidget/selectableRoundButton.dart';
import 'package:my_side_client/wigets/buttonwidget/skipButton.dart';
import 'package:my_side_client/wigets/etcwidgets/secondStagePageNumber.dart';
import 'package:my_side_client/wigets/textwidget/secondStageTextSytle.dart';
import 'package:my_side_client/wigets/textwidget/titleAndSubtitleWidget.dart';

class SetDiseasePage extends StatelessWidget {
  final SetDiseaseController setDiseaseController =
      Get.put(SetDiseaseController());
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
      body: GetBuilder<SetDiseaseController>(
        builder: (controller) {
          return SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SecondStagePageNumber(pageNum: 2, scrHeight: scrHeight),
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
                        SecondStageTextStyle(title: '04. 보유질환을 선택해주세요.'),
                        SizedBox(
                          height: 0.0211 * scrHeight,
                        ),
                        GridView.builder(
                          shrinkWrap: true,
                          itemCount: 5,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 0.0198 * scrHeight,
                            mainAxisSpacing: 0.0198 * scrHeight,
                            childAspectRatio: 2.17,
                          ),
                          itemBuilder: (BuildContext context, int index) {
                            return SelectableRoundButton(
                              buttonText: diseaseList[index],
                              isSelected: controller.diseaseNum == index + 1,
                              onTap: () {
                                controller.setDiseaseNum(index + 1);
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 0.2 * scrHeight,
                  ),
                  RecSubmitButton(
                    buttonText: '다음 페이지',
                    buttonHeight: scrHeight,
                    activated: controller.diseaseNum > 0,
                    validateFunc: () async {
                      if (controller.diseaseNum > 0) {
                        signUpUserController
                            .setDisease(diseaseList[controller.diseaseNum - 1]);
                        await signUpUserController.signUpUser();
                        Get.offAllNamed('/');
                      }
                    },
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
