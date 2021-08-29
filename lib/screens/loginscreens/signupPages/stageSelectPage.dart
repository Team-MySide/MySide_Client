import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_side_client/constantsList.dart';
import 'package:my_side_client/controllers/signUpUserController.dart';
import 'package:my_side_client/controllers/stageSelectController.dart';
import 'package:my_side_client/wigets/buttonwidget/recSubmitButton.dart';
import 'package:my_side_client/wigets/buttonwidget/selectableRoundButton.dart';
import 'package:my_side_client/wigets/etcwidgets/userInfoPageNumber.dart';
import 'package:my_side_client/wigets/textwidget/titleAndSubtitleWidget.dart';

class StageSelectPage extends StatelessWidget {
  final StageSelectController stageSelectController =
      Get.put(StageSelectController());
  final SignUpUserController signUpUserController =
      Get.put(SignUpUserController());
  @override
  Widget build(BuildContext context) {
    double scrHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '환우 정보 입력',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Color(0xFF31B6F7),
      ),
      body: GetBuilder<StageSelectController>(
        builder: (controller) {
          return SafeArea(
              child: SingleChildScrollView(
            child: Column(
              children: [
                UserInfoPageNumber(pageNum: 4, scrHeight: scrHeight),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 0.0211 * scrHeight,
                    vertical: 0.0632 * scrHeight,
                  ),
                  child: Column(
                    children: [
                      TitleAndSubtitleWidget(
                        title:
                            '${signUpUserController.nickname}님의\n현재 상태를 알려주세요.',
                        subTitle: '정보 입력에 맞는 음식을 추천해 드립니다.',
                        scrHeight: scrHeight,
                      ),
                      SizedBox(
                        height: 0.0527 * scrHeight,
                      ),
                      GridView.builder(
                        shrinkWrap: true,
                        itemCount: 6,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 0.0198 * scrHeight,
                          mainAxisSpacing: 0.0198 * scrHeight,
                          childAspectRatio: 2.17,
                        ),
                        itemBuilder: (BuildContext context, int index) {
                          return SelectableRoundButton(
                            buttonText: stageType[index],
                            isSelected: controller.stageNm == index + 1,
                            onTap: () {
                              controller.setStageNum(index + 1);
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 0.258 * scrHeight,
                ),
                RecSubmitButton(
                  buttonText: '다음 페이지',
                  scrHeight: scrHeight,
                  activated: controller.stageNm > 0,
                  validateFunc: () {
                    if (controller.stageNm > 0) {
                      signUpUserController
                          .setStageNm(stageType[controller.stageNm - 1]);
                      Get.toNamed('/progressSelect');
                    }
                  },
                ),
              ],
            ),
          ));
        },
      ),
    );
  }
}
