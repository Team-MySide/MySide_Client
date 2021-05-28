import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_side_client/Login/controllers/selectDiseaseController.dart';
import 'package:my_side_client/Login/widget/recSubmitButton.dart';
import 'package:my_side_client/Login/widget/secondStagePageNumber.dart';
import 'package:my_side_client/Login/widget/titleAndSubtitleWidget.dart';

class SelectDiseasePage extends StatelessWidget {
  final SelectDiseaseController sdctrl = Get.put(SelectDiseaseController());
  final List<String> diseaseList = [
    '고혈압',
    '당뇨',
    '이상지질혈증',
    '해당사항없음',
    '모름',
  ];
  @override
  Widget build(BuildContext context) {
    double scrHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '환우 정보 2단계 입력',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16.0,
            fontWeight: FontWeight.w500,
          ),
        ),
        backgroundColor: Color(0xFF31B6F7),
        actions: [
          InkWell(
            onTap: () {},
            child: Center(
              child: Text(
                '건너뛰기',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
          ),
          SizedBox(
            width: 0.01 * scrHeight,
          ),
        ],
      ),
      body: GetBuilder<SelectDiseaseController>(builder: (ctrl) {
        return Column(
          children: [
            SecondStagePageNumber(pageNum: 2, scrHeight: scrHeight),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 0.0197 * scrHeight,
                vertical: 0.0591 * scrHeight,
              ),
              child: Column(
                children: [
                  TitleAndSubtitleWidget(
                    title: '푸른숲님의\n정보를 입력해주세요.',
                    subTitle: '정보 입력에 맞는 음식을 추천해드립니다.',
                    scrHeight: scrHeight,
                  ),
                  SizedBox(
                    height: 0.0493 * scrHeight,
                  ),
                  Container(
                    width: double.infinity,
                    child: Text(
                      '02. 보유질환을 선택해주세요.',
                      style: TextStyle(
                        color: Color(0xFF111111),
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 0.0197 * scrHeight,
                  ),
                  GridView.builder(
                    shrinkWrap: true,
                    itemCount: 5,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 0.0185 * scrHeight,
                        mainAxisSpacing: 0.0185 * scrHeight,
                        childAspectRatio: 2.17),
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        decoration: BoxDecoration(
                          color: ctrl.diseaseNum == index + 1
                              ? Color(0xFF3BD7E2)
                              : Color(0xFFF4F4F4),
                          borderRadius: BorderRadius.all(
                            Radius.circular(25),
                          ),
                        ),
                        child: InkWell(
                          onTap: () {
                            ctrl.setDiseaseNum(index + 1);
                          },
                          child: Center(
                            child: Text(
                              diseaseList[index],
                              style: TextStyle(
                                color: ctrl.diseaseNum == index + 1
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
              height: 0.216 * scrHeight,
            ),
            RecSubmitButton(
              buttonText: '다음 페이지',
              scrHeight: scrHeight,
              activated: ctrl.diseaseNum > 0,
              validateFunc: () {},
            ),
          ],
        );
      }),
    );
  }
}
