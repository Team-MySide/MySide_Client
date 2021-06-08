import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:my_side_client/Login/widget/cancerAutoCompleteWidget.dart';
import 'package:my_side_client/Login/widget/dialogWidget/textButtonDialog.dart';
import 'package:my_side_client/Login/widget/halfWidthTextField.dart';
import 'package:my_side_client/Login/widget/longRoundButton.dart';
import 'package:my_side_client/Login/widget/requiredTextWidget.dart';
import 'package:my_side_client/Login/widget/selectBetweenTwo.dart';
import 'package:my_side_client/Login/widget/titleAndSubtitleWidget.dart';
import 'package:my_side_client/TabMyPage/controller/editHealthDataController.dart';
import 'package:my_side_client/TabMyPage/controller/healthDateListController.dart';
import 'package:my_side_client/TabMyPage/controller/myPageMainController.dart';
import 'package:my_side_client/TabMyPage/pages/appSettingPage.dart';
import 'package:my_side_client/TabMyPage/pages/myPageMain.dart';

class EditHealthDataPage extends StatelessWidget {
  final EditHealthDataController editHealthDataController =
      Get.put(EditHealthDataController());
  final HealthDataListController healthDataListController =
      Get.put(HealthDataListController());
  final MyPageMainController myPageMainController =
      Get.put(MyPageMainController());

  final List<String> cancerType = [
    '위암',
    '폐암',
    '간암',
    '대장암',
    '유방암',
    '갑상선암',
  ];
  final List<String> stageType = [
    '1기',
    '2기',
    '3기',
    '4기',
    '완치',
    '(구)',
  ];
  final List<String> progressType = [
    '치료 예정',
    '수술전',
    '수술후',
    '항암중',
    '방사선',
    '완치',
    '(구)'
  ];
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
        backgroundColor: Colors.white,
        title: Text(
          '건강 데이터 편집',
          style: TextStyle(
            color: Color(0xFF111111),
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        elevation: 0,
        actions: [
          IconButton(
            icon: SvgPicture.asset('assets/Setting.svg'),
            onPressed: () {
              Get.to(() => AppSettingPage());
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(
            0.0197 * scrHeight,
            0.0496 * scrHeight,
            0.0197 * scrHeight,
            0,
          ),
          child: GetBuilder<EditHealthDataController>(builder: (ctrl) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TitleAndSubtitleWidget(
                  title: '환우의 정보를 입력해주세요',
                  subTitle: '환우 정보에 맞는 음식을 추천해 드립니다.',
                  scrHeight: scrHeight,
                ),
                SizedBox(
                  height: 0.0496 * scrHeight,
                ),
                Container(
                  width: double.infinity,
                  child: Text(
                    ctrl.regiStr,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF666666),
                    ),
                  ),
                ),
                SizedBox(
                  height: scrHeight * 0.0394,
                ),
                RequiredTextWidget(mainText: '사용자 분류'),
                SizedBox(
                  height: 0.0099 * scrHeight,
                ),
                SelectBetweenTwo(
                  scrHeight: scrHeight,
                  firstText: '환우',
                  secondText: '보호자',
                  firstSelected: ctrl.userType == 1,
                  secondSelected: ctrl.userType == 2,
                  firstClicked: () {
                    ctrl.setUserType(1);
                  },
                  secondClicked: () {
                    ctrl.setUserType(2);
                  },
                ),
                SizedBox(
                  height: 0.0394 * scrHeight,
                ),
                RequiredTextWidget(mainText: '성별'),
                SizedBox(
                  height: 0.0099 * scrHeight,
                ),
                SelectBetweenTwo(
                  scrHeight: scrHeight,
                  firstText: '남',
                  secondText: '여',
                  firstSelected: ctrl.gender == 1,
                  secondSelected: ctrl.gender == 2,
                  firstClicked: () {
                    ctrl.setGender(1);
                  },
                  secondClicked: () {
                    ctrl.setGender(2);
                  },
                ),
                SizedBox(
                  height: 0.0394 * scrHeight,
                ),
                Text(
                  '나이',
                  style: TextStyle(
                    color: Color(0xFF666666),
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(
                  height: 0.0099 * scrHeight,
                ),
                HalfWidthTextField(
                  scrHeight: scrHeight,
                  tailText: '세',
                  tec: ctrl.tec[0],
                  fn: ctrl.fn[0],
                  canClear: ctrl.canClear[0],
                  errorOcur: ctrl.errorOcur[0],
                  errorMsg: ctrl.errorMsg[0],
                ),
                Text(
                  '키',
                  style: TextStyle(
                    color: Color(0xFF666666),
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(
                  height: 0.0099 * scrHeight,
                ),
                HalfWidthTextField(
                  scrHeight: scrHeight,
                  tailText: 'cm',
                  tec: ctrl.tec[1],
                  fn: ctrl.fn[1],
                  canClear: ctrl.canClear[1],
                  errorOcur: ctrl.errorOcur[1],
                  errorMsg: ctrl.errorMsg[1],
                ),
                Text(
                  '몸무게',
                  style: TextStyle(
                    color: Color(0xFF666666),
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(
                  height: 0.0099 * scrHeight,
                ),
                HalfWidthTextField(
                  scrHeight: scrHeight,
                  tailText: 'kg',
                  tec: ctrl.tec[2],
                  fn: ctrl.fn[2],
                  canClear: ctrl.canClear[2],
                  errorOcur: ctrl.errorOcur[2],
                  errorMsg: ctrl.errorMsg[2],
                ),
                RequiredTextWidget(mainText: '암 종류'),
                SizedBox(
                  height: 0.0099 * scrHeight,
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
                        color: ctrl.cancerNm == index + 1
                            ? Color(0xFF3BD7E2)
                            : Color(0xFFF4F4F4),
                        borderRadius: BorderRadius.all(
                          Radius.circular(25),
                        ),
                      ),
                      child: InkWell(
                        onTap: () {
                          ctrl.setCancerNum(index + 1);
                          ctrl.fn[3].unfocus();
                        },
                        child: Center(
                          child: Text(
                            cancerType[index],
                            style: TextStyle(
                              color: ctrl.cancerNm == index + 1
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
                  errorText: ctrl.errorOcur[3],
                  fn: ctrl.fn[3],
                  tec: ctrl.tec[3],
                  cancerNum: ctrl.cancerNm,
                  errorMsg: ctrl.errorMsg[3],
                  clicked: () {
                    ctrl.fn[3].requestFocus();
                    ctrl.setCancerNum(7);
                  },
                  getSuggestion: ctrl.getSuggestions,
                ),
                SizedBox(
                  height: 0.0099 * scrHeight,
                ),
                RequiredTextWidget(mainText: '현재 상태'),
                SizedBox(
                  height: 0.0099 * scrHeight,
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
                        color: ctrl.stageNm == index + 1
                            ? Color(0xFF3BD7E2)
                            : Color(0xFFF4F4F4),
                        borderRadius: BorderRadius.all(
                          Radius.circular(25),
                        ),
                      ),
                      child: InkWell(
                        onTap: () {
                          ctrl.setStageNum(index + 1);
                        },
                        child: Center(
                          child: Text(
                            stageType[index],
                            style: TextStyle(
                              color: ctrl.stageNm == index + 1
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
                  height: 0.0394 * scrHeight,
                ),
                RequiredTextWidget(mainText: '진행 단계'),
                SizedBox(
                  height: 0.0099 * scrHeight,
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
                        color: ctrl.progressNum == index + 1
                            ? Color(0xFF3BD7E2)
                            : Color(0xFFF4F4F4),
                        borderRadius: BorderRadius.all(
                          Radius.circular(25),
                        ),
                      ),
                      child: InkWell(
                        onTap: () {
                          ctrl.setProgressNum(index + 1);
                        },
                        child: Center(
                          child: Text(
                            progressType[index],
                            style: TextStyle(
                              color: ctrl.progressNum == index + 1
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
                  height: 0.03941 * scrHeight,
                ),
                RequiredTextWidget(mainText: '보유 질환'),
                SizedBox(
                  height: 0.0099 * scrHeight,
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
                SizedBox(
                  height: 0.03941 * scrHeight,
                ),
                Container(
                  width: double.infinity,
                  child: Text(
                    '추가 내용',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF666666),
                    ),
                  ),
                ),
                SizedBox(
                  height: 0.0099 * scrHeight,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 0.0197 * scrHeight),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: ctrl.fn[4].hasFocus
                          ? Color(0xFF3BD7E2)
                          : Color(0xFFDDDDDD),
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                  ),
                  child: TextField(
                    maxLines: 3,
                    maxLength: 100,
                    controller: ctrl.tec[4],
                    focusNode: ctrl.fn[4],
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: '내용을 입력해주세요',
                      hintStyle: TextStyle(
                        color: Color(0xFFAAAAAA),
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 0.0099 * scrHeight,
                ),
                Container(
                  width: double.infinity,
                  child: Text(
                    '이전과 비교하여 어떤 변화가 있었는지 메모해보세요.',
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 12,
                      color: ctrl.fn[4].hasFocus
                          ? Color(0xFF3BD7E2)
                          : Color(0xFFAAAAAA),
                    ),
                  ),
                ),
                SizedBox(
                  height: 0.0493 * scrHeight,
                ),
                LongRoundButton(
                  buttonText: '저장하기',
                  scrHeight: scrHeight,
                  activated: ctrl.userType > 0 &&
                      ctrl.gender > 0 &&
                      ctrl.tec[0].text.isNotEmpty &&
                      ctrl.tec[1].text.isNotEmpty &&
                      ctrl.tec[2].text.isNotEmpty &&
                      ((ctrl.cancerNm == 7 && ctrl.tec[3].text.isNotEmpty) ||
                          (ctrl.cancerNm > 0 && ctrl.cancerNm < 7)) &&
                      ctrl.stageNm > 0 &&
                      ctrl.progressNum > 0 &&
                      ctrl.diseaseNum > 0 &&
                      ctrl.tec[4].text.isNotEmpty,
                  validateFunc: () async {
                    if (ctrl.cancerNm == 7) {
                      ctrl.validateCancer();
                    }
                    ctrl.validateNumber(0);
                    ctrl.validateNumber(1);
                    ctrl.validateNumber(2);
                    if (!ctrl.errorOcur[0] &&
                        !ctrl.errorOcur[1] &&
                        !ctrl.errorOcur[2] &&
                        !ctrl.errorOcur[3]) {
                      //print(ctrl.id);
                      await ctrl.healthDataEdit();
                      if (ctrl.success) {
                        Get.dialog(
                          Dialog(
                            child: TextButtonDialog(
                              scrHeight: scrHeight,
                              dialogText: '건강 데이터가 수정되었습니다.',
                              routeFunc: () async {
                                await myPageMainController.getHealthDataList();
                                await healthDataListController
                                    .getMonthYearDatList();
                                Get.offAll(() => MyPageMain());
                              },
                            ),
                          ),
                        );
                      }
                    }
                  },
                ),
                SizedBox(
                  height: 0.0493 * scrHeight,
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
