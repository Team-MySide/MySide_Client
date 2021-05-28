import 'package:finalproject/controllers/physicalInfoController.dart';
import 'package:finalproject/widget/halfWidthTextField.dart';
import 'package:finalproject/widget/myTextFieldWidget.dart';
import 'package:finalproject/widget/recSubmitButton.dart';
import 'package:finalproject/widget/secondStagePageNumber.dart';
import 'package:finalproject/widget/selectBetweenTwo.dart';
import 'package:finalproject/widget/titleAndSubtitleWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class PhysicalInfoPage extends StatelessWidget {
  final PhysicalInfoController piCtrl = Get.put(PhysicalInfoController());
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
      body: SingleChildScrollView(
        child: GetBuilder<PhysicalInfoController>(builder: (ctrl) {
          return Column(
            children: [
              SecondStagePageNumber(pageNum: 1, scrHeight: scrHeight),
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
                        '01. 성별을 선택해주세요.',
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
                    Container(
                      width: double.infinity,
                      child: Text(
                        '02. 나이를 알려주세요.',
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
                    HalfWidthTextField(
                      scrHeight: scrHeight,
                      tailText: '세',
                      tec: ctrl.ageTEC,
                      fn: ctrl.agefn,
                      canClear: ctrl.canClear[0],
                      errorOcur: ctrl.errorOcur[0],
                      errorMsg: ctrl.errorMsg[0],
                    ),
                    SizedBox(
                      height: 0.0099 * scrHeight,
                    ),
                    Container(
                      width: double.infinity,
                      child: Text(
                        '03. 키와 몸무게를 알려주세요.',
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
                    Row(
                      children: [
                        Expanded(
                          child: MyTextWidget(
                            scrHeight: scrHeight,
                            errorOcur: ctrl.errorOcur[1],
                            canClear: ctrl.canClear[1],
                            fn: ctrl.heightfn,
                            tec: ctrl.heightTEC,
                            hintText: '00',
                            isPswd: false,
                          ),
                        ),
                        SizedBox(
                          width: 0.0099 * scrHeight,
                        ),
                        Text(
                          'cm',
                          style: TextStyle(
                            color: Color(0xFF111111),
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(
                          width: 0.0099 * scrHeight,
                        ),
                        Expanded(
                          child: MyTextWidget(
                            scrHeight: scrHeight,
                            errorOcur: ctrl.errorOcur[2],
                            canClear: ctrl.errorOcur[2],
                            fn: ctrl.weightfn,
                            tec: ctrl.weightTEC,
                            hintText: '00',
                            isPswd: false,
                          ),
                        ),
                        SizedBox(
                          width: 0.0099 * scrHeight,
                        ),
                        Text(
                          'kg',
                          style: TextStyle(
                            color: Color(0xFF111111),
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 0.0099 * scrHeight,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            child: Text(
                              ctrl.errorMsg[1],
                              style: TextStyle(
                                color: ctrl.errorOcur[1]
                                    ? Color(0xFFEE1100)
                                    : Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            child: Text(
                              ctrl.errorMsg[2],
                              style: TextStyle(
                                color: ctrl.errorOcur[2]
                                    ? Color(0xFFEE1100)
                                    : Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 0.0099 * scrHeight,
                    ),
                    Row(
                      children: [
                        buildDontKnow(
                          ctrl.dontKnow,
                          scrHeight,
                          () {
                            ctrl.donknowToggle();
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              RecSubmitButton(
                buttonText: '다음 페이지',
                scrHeight: scrHeight,
                activated: ctrl.gender > 0 &&
                    ctrl.ageTEC.text.isNotEmpty &&
                    ((ctrl.weightTEC.text.isNotEmpty &&
                            ctrl.heightTEC.text.isNotEmpty) ||
                        ctrl.dontKnow),
                validateFunc: () {
                  ctrl.validateNumber(ctrl.ageTEC.text, 0);
                  ctrl.validateNumber(ctrl.heightTEC.text, 1);
                  ctrl.validateNumber(ctrl.weightTEC.text, 2);
                },
              ),
            ],
          );
        }),
      ),
    );
  }

  Widget buildDontKnow(
      bool checked, double scrHeight, VoidCallback checkClicked) {
    return Row(
      children: [
        if (checked)
          InkWell(
            onTap: checkClicked,
            child: SvgPicture.asset('asset/checkedoff.svg'),
          )
        else
          InkWell(
            onTap: checkClicked,
            child: SvgPicture.asset('asset/off.svg'),
          ),
        SizedBox(
          width: 0.0099 * scrHeight,
        ),
        Text(
          '모르겠어요',
          style: TextStyle(
            color: Color(0xFF666666),
            fontWeight: FontWeight.w300,
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}
