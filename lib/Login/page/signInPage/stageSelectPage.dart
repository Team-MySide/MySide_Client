import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_side_client/Login/controllers/signInPageControllers.dart/signInUserController.dart';
import 'package:my_side_client/Login/controllers/signInPageControllers.dart/stageController.dart';
import 'package:my_side_client/Login/page/signInPage/progressSelectPage.dart';
import 'package:my_side_client/Login/widget/recSubmitButton.dart';
import 'package:my_side_client/Login/widget/titleAndSubtitleWidget.dart';
import 'package:my_side_client/Login/widget/userInfoPageNumber.dart';

class StageSelectPage extends StatelessWidget {
  final StageController stgController = Get.put(StageController());
  final SignInUserController signInUserController =
      Get.put(SignInUserController());

  final List<String> stageType = [
    '1기',
    '2기',
    '3기',
    '4기',
    '완치',
    '(구)',
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
      body: GetBuilder<StageController>(builder: (sctrl) {
        return Column(
          children: [
            UserInfoPageNumber(pageNum: 4, scrHeight: scrHeight),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 0.0197 * scrHeight,
                vertical: 0.0591 * scrHeight,
              ),
              child: Column(
                children: [
                  TitleAndSubtitleWidget(
                    title: '${signInUserController.nickname}님의\n현재 상태를 알려주세요.',
                    subTitle: '정보 입력에 맞는 음식을 추천해드립니다.',
                    scrHeight: scrHeight,
                  ),
                  SizedBox(
                    height: 0.0493 * scrHeight,
                  ),
                  GridView.builder(
                    shrinkWrap: true,
                    itemCount: 6,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 0.0185 * scrHeight,
                        mainAxisSpacing: 0.0185 * scrHeight,
                        childAspectRatio: 2.17),
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        decoration: BoxDecoration(
                          color: sctrl.stageNm == index + 1
                              ? Color(0xFF3BD7E2)
                              : Color(0xFFF4F4F4),
                          borderRadius: BorderRadius.all(
                            Radius.circular(25),
                          ),
                        ),
                        child: InkWell(
                          onTap: () {
                            sctrl.setStageNum(index + 1);
                          },
                          child: Center(
                            child: Text(
                              stageType[index],
                              style: TextStyle(
                                color: sctrl.stageNm == index + 1
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
              height: 0.27 * scrHeight,
            ),
            RecSubmitButton(
              buttonText: '다음 페이지',
              scrHeight: scrHeight,
              activated: sctrl.stageNm > 0,
              validateFunc: () {
                if (sctrl.stageNm > 0) {
                  String stageName = stageType[sctrl.stageNm - 1];
                  signInUserController.setStageName(stageName);
                  Get.to(() => ProgressSelectPage());
                }
              },
            ),
          ],
        );
      }),
    );
  }
}
