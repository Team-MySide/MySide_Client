import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_side_client/Login/controllers/cancerAutoCompleteController.dart';
import 'package:my_side_client/Login/controllers/cancerSearchController.dart';
import 'package:my_side_client/Login/model/userInfo.dart';
import 'package:my_side_client/Login/page/signInPage/stageSelectPage.dart';
import 'package:my_side_client/Login/widget/cancerAutoCompleteWidget.dart';
import 'package:my_side_client/Login/widget/recSubmitButton.dart';
import 'package:my_side_client/Login/widget/titleAndSubtitleWidget.dart';
import 'package:my_side_client/Login/widget/userInfoPageNumber.dart';

class SelectCancerPage extends StatelessWidget {
  final CancerAutoCompleteController caController =
      Get.put(CancerAutoCompleteController());
  final CancerSearchController csController = Get.put(CancerSearchController());
  final List<String> cancerType = [
    '위암',
    '폐암',
    '간암',
    '대장암',
    '유방암',
    '갑상선암',
  ];
  @override
  Widget build(BuildContext context) {
    UserInfo previousInfo = UserInfo();
    previousInfo = Get.arguments;
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
      body: SingleChildScrollView(
        child: GetBuilder<CancerSearchController>(builder: (csCtrl) {
          return GetBuilder<CancerAutoCompleteController>(builder: (cactrl) {
            return Column(
              children: [
                UserInfoPageNumber(pageNum: 3, scrHeight: scrHeight),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 0.0197 * scrHeight,
                    vertical: 0.0591 * scrHeight,
                  ),
                  child: Column(
                    children: [
                      TitleAndSubtitleWidget(
                        title: '${previousInfo.nickname}님에게 해당되는\n암 종류를 알려주세요.',
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
                              color: csCtrl.cancerNum == index + 1
                                  ? Color(0xFF3BD7E2)
                                  : Color(0xFFF4F4F4),
                              borderRadius: BorderRadius.all(
                                Radius.circular(25),
                              ),
                            ),
                            child: InkWell(
                              onTap: () {
                                csCtrl.setCancerNum(index + 1);
                                csCtrl.fn.unfocus();
                              },
                              child: Center(
                                child: Text(
                                  cancerType[index],
                                  style: TextStyle(
                                    color: csCtrl.cancerNum == index + 1
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
                      SizedBox(
                        height: 0.018 * scrHeight,
                      ),
                      CancerAutoCompleteWidget(
                        scrHeight: scrHeight,
                        errorText: csCtrl.errorText,
                        fn: csCtrl.fn,
                        tec: csCtrl.tec,
                        cancerNum: csCtrl.cancerNum,
                        errorMsg: csCtrl.errorMsg,
                        clicked: () {
                          csCtrl.fn.requestFocus();
                          csCtrl.setCancerNum(7);
                        },
                        getSuggestion: cactrl.getSuggestions,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 0.157 * scrHeight,
                ),
                RecSubmitButton(
                  buttonText: '다음 페이지',
                  scrHeight: scrHeight,
                  activated: csCtrl.cancerNum > 0,
                  validateFunc: () {
                    csCtrl.validateCancer();
                    if (csCtrl.cancerNum > 0 && csCtrl.cancerNum < 7) {
                      previousInfo.cancerNm = cancerType[csCtrl.cancerNum - 1];
                      Get.to(() => StageSelectPage(), arguments: previousInfo);
                    }
                    if (csCtrl.cancerNum == 7) {
                      previousInfo.cancerNm = csCtrl.tec.text;
                      Get.to(() => StageSelectPage(), arguments: previousInfo);
                    }
                  },
                ),
              ],
            );
          });
        }),
      ),
    );
  }
}
