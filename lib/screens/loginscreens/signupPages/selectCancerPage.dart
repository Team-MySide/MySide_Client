import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_side_client/Constants.dart';
import 'package:my_side_client/TabSearch/FoodInformation.dart';
import 'package:my_side_client/constantsList.dart';
import 'package:my_side_client/controllers/selectCancerController.dart';
import 'package:my_side_client/controllers/signUpUserController.dart';
import 'package:my_side_client/wigets/buttonwidget/recSubmitButton.dart';
import 'package:my_side_client/wigets/buttonwidget/selectableRoundButton.dart';
import 'package:my_side_client/wigets/etcwidgets/userInfoPageNumber.dart';
import 'package:my_side_client/wigets/textfieldwidget/cancerAutoCompleteWidget.dart';
import 'package:my_side_client/wigets/textwidget/titleAndSubtitleWidget.dart';

class SelectCancerPage extends StatelessWidget {
  final SelectCancerController selectCancerController =
      Get.put(SelectCancerController());
  final SignUpUserController signUpUserController =
      Get.put(SignUpUserController());
  @override
  Widget build(BuildContext context) {
    double scrHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: CustomAppBar(
        '환우 정보 입력',
        Constants.primarySubColorInt,
        isBack: false,
        textColor: Colors.white,
      ),
      body: GetBuilder<SelectCancerController>(
        builder: (controller) {
          return SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  UserInfoPageNumber(pageNum: 3, scrHeight: scrHeight),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 0.0211 * scrHeight,
                      vertical: 0.0632 * scrHeight,
                    ),
                    child: Column(
                      children: [
                        TitleAndSubtitleWidget(
                          title:
                              '${signUpUserController.nickname}님에게 해당되는\n암 종류를 알려주세요.',
                          subTitle: '정보 입력에 맞는 음식을 추천해 드립니다.',
                          scrHeight: scrHeight,
                        ),
                        SizedBox(
                          height: 0.0527 * scrHeight,
                        ),
                        GridView.builder(
                          shrinkWrap: true,
                          itemCount: 6,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 0.0198 * scrHeight,
                            mainAxisSpacing: 0.0198 * scrHeight,
                            childAspectRatio: 2.17,
                          ),
                          itemBuilder: (BuildContext context, int index) {
                            return SelectableRoundButton(
                              buttonText: cancerType[index],
                              isSelected: controller.cancerNum == index + 1,
                              onTap: () {
                                controller.cancerTextField.fn.unfocus();
                                controller.setCancerNum(index + 1);
                              },
                            );
                          },
                        ),
                        SizedBox(
                          height: 0.0198 * scrHeight,
                        ),
                        CancerAutoCompleteWidget(
                          scrHeight: scrHeight,
                          textFieldModel: controller.cancerTextField,
                          cancerNum: controller.cancerNum,
                          clicked: () {
                            controller.cancerTextField.fn.requestFocus();
                            controller.setCancerNum(7);
                          },
                          getSuggestion: controller.getSuggestions,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 0.146 * scrHeight,
                  ),
                  RecSubmitButton(
                    buttonText: '다음 페이지',
                    buttonHeight: scrHeight,
                    activated: controller.cancerNum > 0,
                    validateFunc: () {
                      controller
                          .onCancerSelected(signUpUserController.setCancerName);
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
