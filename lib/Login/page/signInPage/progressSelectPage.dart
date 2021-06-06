import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_side_client/Login/controllers/signInPageControllers.dart/progressController.dart';
import 'package:my_side_client/Login/controllers/signInPageControllers.dart/signInUserController.dart';
import 'package:my_side_client/Login/page/loginPage/loginMainPage.dart';
import 'package:my_side_client/Login/page/signInPage/secondStagePage/physicalInfoPage.dart';
import 'package:my_side_client/Login/widget/recSubmitButton.dart';
import 'package:my_side_client/Login/widget/titleAndSubtitleWidget.dart';
import 'package:my_side_client/Login/widget/userInfoPageNumber.dart';

class ProgressSelectPage extends StatelessWidget {
  final ProgressController prgressController = Get.put(ProgressController());
  final SignInUserController signInUserController =
      Get.put(SignInUserController());
  final List<String> stageType = [
    '치료 예정',
    '수술전',
    '수술후',
    '항암중',
    '방사선',
    '완치',
    '(구)'
  ];
  @override
  Widget build(BuildContext context) {
    double scrHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '환우 정보 입력',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16.0,
            fontWeight: FontWeight.w500,
          ),
        ),
        backgroundColor: Color(0xFF31B6F7),
      ),
      body: GetBuilder<ProgressController>(builder: (pctrl) {
        return Column(
          children: [
            UserInfoPageNumber(pageNum: 5, scrHeight: scrHeight),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 0.0197 * scrHeight,
                vertical: 0.0591 * scrHeight,
              ),
              child: Column(
                children: [
                  TitleAndSubtitleWidget(
                    title: signInUserController.relationNm == '환우'
                        ? '${signInUserController.nickname}님의\n진행 단계를 알려주세요.'
                        : '${signInUserController.nickname}님이 보호하시는 분의 \n진행 단계를 알려주세요.',
                    subTitle: '정보 입력에 맞는 음식을 추천해드립니다.',
                    scrHeight: scrHeight,
                  ),
                  SizedBox(
                    height: 0.0493 * scrHeight,
                  ),
                  GridView.builder(
                    shrinkWrap: true,
                    itemCount: 7,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 0.0185 * scrHeight,
                        mainAxisSpacing: 0.0185 * scrHeight,
                        childAspectRatio: 2.17),
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        decoration: BoxDecoration(
                          color: pctrl.progressNum == index + 1
                              ? Color(0xFF3BD7E2)
                              : Color(0xFFF4F4F4),
                          borderRadius: BorderRadius.all(
                            Radius.circular(25),
                          ),
                        ),
                        child: InkWell(
                          onTap: () {
                            pctrl.setProgressNum(index + 1);
                          },
                          child: Center(
                            child: Text(
                              stageType[index],
                              style: TextStyle(
                                color: pctrl.progressNum == index + 1
                                    ? Colors.white
                                    : Color(0xFF666666),
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 0.183 * scrHeight,
            ),
            Row(
              children: [
                Expanded(
                  child: RecSubmitButton(
                    buttonText: '완료 할래요',
                    scrHeight: scrHeight,
                    activated: pctrl.progressNum > 0,
                    validateFunc: () async {
                      signInUserController
                          .setProgressName(stageType[pctrl.progressNum - 1]);
                      await signInUserController.signUpUser();
                      Get.offAll(() => LoginMainPage());
                    },
                    rectButtonColor: Color(0xFF666666),
                  ),
                ),
                Expanded(
                  child: RecSubmitButton(
                    buttonText: '2단계 입력하러 갈래요',
                    scrHeight: scrHeight,
                    activated: pctrl.progressNum > 0,
                    validateFunc: () {
                      if (pctrl.progressNum > 0) {
                        signInUserController
                            .setProgressName(stageType[pctrl.progressNum - 1]);
                        Get.to(() => PhysicalInfoPage());
                      }
                    },
                  ),
                ),
              ],
            ),
          ],
        );
      }),
    );
  }
}
