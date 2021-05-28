import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:my_side_client/Login/controllers/progressController.dart';
import 'package:my_side_client/Login/controllers/userTypeController.dart';
import 'package:my_side_client/Login/widget/longRoundButton.dart';
import 'package:my_side_client/TabMyPage/controller/ageController.dart';
import 'package:my_side_client/TabMyPage/controller/cancerController.dart';
import 'package:my_side_client/TabMyPage/controller/curStateController.dart';
import 'package:my_side_client/TabMyPage/controller/dateController.dart';
import 'package:my_side_client/TabMyPage/controller/diseaseController.dart';
import 'package:my_side_client/TabMyPage/controller/genderSelectController.dart';
import 'package:my_side_client/TabMyPage/controller/heightController.dart';
import 'package:my_side_client/TabMyPage/controller/weightController.dart';
import 'package:my_side_client/TabMyPage/widget/cancerInput.dart';
import 'package:my_side_client/TabMyPage/widget/decorationForInput.dart';
import 'package:my_side_client/TabMyPage/widget/selectableButton.dart';
import 'package:my_side_client/TabMyPage/widget/threeSelectableButton.dart';
import 'package:my_side_client/TabMyPage/widget/twoSelectableButton.dart';

class AddHealthDataPage extends StatelessWidget {
  final dateController = Get.put(DateController());
  final genderSelectCtrl = Get.put(GenderSelectController());
  final userTypeController = Get.put(UserTypeController());
  final ageController = Get.put(AgeController());
  final heightController = Get.put(HeigthController());
  final weightController = Get.put(WeightController());
  final cancerController = Get.put(CancerController());
  final curStateController = Get.put(CurStateController());
  final progressController = Get.put(ProgressController());
  final diseaseController = Get.put(DiseaseController());

  @override
  Widget build(BuildContext context) {
    double scrHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          '건강 데이터 추가입력',
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
            onPressed: () {},
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
          child: Column(
            children: [
              Container(
                width: double.infinity,
                child: Text(
                  '환우의 정보를 입력해주세요',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF111111),
                  ),
                ),
              ),
              SizedBox(
                height: 0.0099 * scrHeight,
              ),
              Container(
                width: double.infinity,
                child: Text(
                  '환우 정보에 맞는 음식을 추천해드립니다.',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    color: Color(0xFF666666),
                  ),
                ),
              ),
              SizedBox(
                height: 0.0496 * scrHeight,
              ),
              Container(
                width: double.infinity,
                child: Text(
                  '날짜 선택',
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
              GetBuilder<DateController>(builder: (dateCtrl) {
                return DecorationForInput(
                  childWidget: Row(
                    children: [
                      Expanded(
                        child: Text(
                          '${DateFormat.y().format(dateCtrl.date)}.${DateFormat.M().format(dateCtrl.date)}.${DateFormat.d().format(dateCtrl.date)}',
                          style: TextStyle(
                            color: Color(0xFFAAAAAA),
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          dateCtrl.selecteDate(context);
                        },
                        child: SvgPicture.asset('assets/calendar.svg'),
                      ),
                    ],
                  ),
                  scrHeight: scrHeight,
                  vertPadding: 0.016,
                  borderColor: Color(0xFFDDDDDD),
                );
              }),
              SizedBox(
                height: scrHeight * 0.0394,
              ),
              GetBuilder<UserTypeController>(builder: (userCtrl) {
                return TwoSelectableButton(
                  mainText: '사용자 분류',
                  firstButtonText: userCtrl.userType[0],
                  secondButtonText: userCtrl.userType[1],
                  scrHeight: scrHeight,
                  firstButtonClicked: () {
                    userCtrl.selectUserType(1);
                  },
                  secondButtonClicked: () {
                    userCtrl.selectUserType(2);
                  },
                  isFirstSelected: userCtrl.userIndex == 1,
                  isSecondSelected: userCtrl.userIndex == 2,
                );
              }),
              SizedBox(
                height: 0.0394 * scrHeight,
              ),
              GetBuilder<GenderSelectController>(builder: (genderCtrl) {
                return TwoSelectableButton(
                  mainText: '성별',
                  firstButtonText: genderCtrl.genderType[0],
                  secondButtonText: genderCtrl.genderType[1],
                  scrHeight: scrHeight,
                  firstButtonClicked: () {
                    genderCtrl.selectGender(1);
                  },
                  secondButtonClicked: () {
                    genderCtrl.selectGender(2);
                  },
                  isFirstSelected: genderCtrl.genderIndex == 1,
                  isSecondSelected: genderCtrl.genderIndex == 2,
                );
              }),
              SizedBox(
                height: 0.0394 * scrHeight,
              ),
              Column(
                children: [
                  GetBuilder<AgeController>(builder: (ageCtrl) {
                    return buildAgeHeightWeight(
                      scrHeight,
                      '나이',
                      '세',
                      ageCtrl.ageTEC,
                      ageCtrl.ageFN,
                      ageCtrl.ageError,
                      ageCtrl.ageClear,
                      '숫자를 입력해주세요.',
                      ageCtrl.clearClicked,
                      ageCtrl.clearChange,
                    );
                  }),
                  GetBuilder<HeigthController>(builder: (heightCtrl) {
                    return buildAgeHeightWeight(
                      scrHeight,
                      '키',
                      'cm',
                      heightCtrl.heightTEC,
                      heightCtrl.heightFN,
                      heightCtrl.heightError,
                      heightCtrl.heightClear,
                      '숫자를 입력해주세요.',
                      heightCtrl.clearClicked,
                      heightCtrl.clearChange,
                    );
                  }),
                  GetBuilder<WeightController>(builder: (weightCtrl) {
                    return buildAgeHeightWeight(
                      scrHeight,
                      '키',
                      'cm',
                      weightCtrl.weightTEC,
                      weightCtrl.weightFN,
                      weightCtrl.weightError,
                      weightCtrl.weightClear,
                      '숫자를 입력해주세요.',
                      weightCtrl.clearClicked,
                      weightCtrl.clearChange,
                    );
                  }),
                ],
              ),
              requiredRichText('암 종류'),
              SizedBox(
                height: 0.0099 * scrHeight,
              ),
              GetBuilder<CancerController>(
                builder: (cancerCtrl) {
                  return Column(
                    children: [
                      ThreeSelectableButton(
                        firstButtonText: cancerCtrl.cancerType[0],
                        secondButtonText: cancerCtrl.cancerType[1],
                        thirdButtonText: cancerCtrl.cancerType[2],
                        scrHeight: scrHeight,
                        firstButtonClicked: () {
                          cancerCtrl.selectCancerType(1);
                          cancerCtrl.cancerFN.unfocus();
                        },
                        secondButtonClicked: () {
                          cancerCtrl.selectCancerType(2);
                          cancerCtrl.cancerFN.unfocus();
                        },
                        thirdButtonClicked: () {
                          cancerCtrl.selectCancerType(3);
                          cancerCtrl.cancerFN.unfocus();
                        },
                        isFirstSelected: cancerCtrl.canderIndex == 1,
                        isSecondSelected: cancerCtrl.canderIndex == 2,
                        isThirdSelected: cancerCtrl.canderIndex == 3,
                      ),
                      SizedBox(
                        height: 0.0185 * scrHeight,
                      ),
                      ThreeSelectableButton(
                        firstButtonText: cancerCtrl.cancerType[3],
                        secondButtonText: cancerCtrl.cancerType[4],
                        thirdButtonText: cancerCtrl.cancerType[5],
                        scrHeight: scrHeight,
                        firstButtonClicked: () {
                          cancerCtrl.selectCancerType(4);
                          cancerCtrl.cancerFN.unfocus();
                        },
                        secondButtonClicked: () {
                          cancerCtrl.selectCancerType(5);
                          cancerCtrl.cancerFN.unfocus();
                        },
                        thirdButtonClicked: () {
                          cancerCtrl.selectCancerType(6);
                          cancerCtrl.cancerFN.unfocus();
                        },
                        isFirstSelected: cancerCtrl.canderIndex == 4,
                        isSecondSelected: cancerCtrl.canderIndex == 5,
                        isThirdSelected: cancerCtrl.canderIndex == 6,
                      ),
                      SizedBox(
                        height: 0.0185 * scrHeight,
                      ),
                      CancerInput(
                        scrHeight: scrHeight,
                        buttonText: cancerCtrl.cancerType[6],
                        tec: cancerCtrl.cancerTEC,
                        focus: cancerCtrl.cancerFN,
                        buttonClicked: () {
                          cancerCtrl.selectCancerType(7);
                          cancerCtrl.cancerFN.requestFocus();
                        },
                        errorOccur: cancerCtrl.cancerError,
                        canClear: cancerCtrl.cancerClear,
                        clearClicked: cancerCtrl.clearClicked,
                        clearChange: cancerCtrl.clearChange,
                      ),
                      SizedBox(
                        height: 0.0099 * scrHeight,
                      ),
                      Container(
                        width: double.infinity,
                        child: Text(
                          cancerCtrl.errorMsg,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: cancerCtrl.cancerError
                                ? Color(0xFFEE1100)
                                : Colors.white,
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
              SizedBox(
                height: 0.0099 * scrHeight,
              ),
              requiredRichText('현재 상태'),
              SizedBox(
                height: 0.0099 * scrHeight,
              ),
              GetBuilder<CurStateController>(builder: (curStateCtrl) {
                return Column(
                  children: [
                    ThreeSelectableButton(
                      firstButtonText: curStateCtrl.stateType[0],
                      secondButtonText: curStateCtrl.stateType[1],
                      thirdButtonText: curStateCtrl.stateType[2],
                      scrHeight: scrHeight,
                      firstButtonClicked: () {
                        curStateCtrl.selectState(1);
                      },
                      secondButtonClicked: () {
                        curStateCtrl.selectState(2);
                      },
                      thirdButtonClicked: () {
                        curStateCtrl.selectState(3);
                      },
                      isFirstSelected: curStateCtrl.stateIndex == 1,
                      isSecondSelected: curStateCtrl.stateIndex == 2,
                      isThirdSelected: curStateCtrl.stateIndex == 3,
                    ),
                    SizedBox(
                      height: 0.0185 * scrHeight,
                    ),
                    ThreeSelectableButton(
                      firstButtonText: curStateCtrl.stateType[3],
                      secondButtonText: curStateCtrl.stateType[4],
                      thirdButtonText: curStateCtrl.stateType[5],
                      scrHeight: scrHeight,
                      firstButtonClicked: () {
                        curStateCtrl.selectState(4);
                      },
                      secondButtonClicked: () {
                        curStateCtrl.selectState(5);
                      },
                      thirdButtonClicked: () {
                        curStateCtrl.selectState(6);
                      },
                      isFirstSelected: curStateCtrl.stateIndex == 4,
                      isSecondSelected: curStateCtrl.stateIndex == 5,
                      isThirdSelected: curStateCtrl.stateIndex == 6,
                    ),
                  ],
                );
              }),
              SizedBox(
                height: 0.03941 * scrHeight,
              ),
              requiredRichText('진행 단계'),
              SizedBox(
                height: 0.0099 * scrHeight,
              ),
              GetBuilder<ProgressController>(
                builder: (progressCtrl) {
                  return Column(
                    children: [
                      ThreeSelectableButton(
                        firstButtonText: progressCtrl.progressType[0],
                        secondButtonText: progressCtrl.progressType[1],
                        thirdButtonText: progressCtrl.progressType[2],
                        scrHeight: scrHeight,
                        firstButtonClicked: () {
                          progressCtrl.selectProgress(1);
                        },
                        secondButtonClicked: () {
                          progressCtrl.selectProgress(2);
                        },
                        thirdButtonClicked: () {
                          progressCtrl.selectProgress(3);
                        },
                        isFirstSelected: progressCtrl.progressIndex == 1,
                        isSecondSelected: progressCtrl.progressIndex == 2,
                        isThirdSelected: progressCtrl.progressIndex == 3,
                      ),
                      SizedBox(
                        height: 0.0185 * scrHeight,
                      ),
                      ThreeSelectableButton(
                        firstButtonText: progressCtrl.progressType[3],
                        secondButtonText: progressCtrl.progressType[4],
                        thirdButtonText: progressCtrl.progressType[5],
                        scrHeight: scrHeight,
                        firstButtonClicked: () {
                          progressCtrl.selectProgress(4);
                        },
                        secondButtonClicked: () {
                          progressCtrl.selectProgress(5);
                        },
                        thirdButtonClicked: () {
                          progressCtrl.selectProgress(6);
                        },
                        isFirstSelected: progressCtrl.progressIndex == 4,
                        isSecondSelected: progressCtrl.progressIndex == 5,
                        isThirdSelected: progressCtrl.progressIndex == 6,
                      ),
                      SizedBox(
                        height: 0.0185 * scrHeight,
                      ),
                      Row(
                        children: [
                          Container(
                            width: 0.146 * scrHeight,
                            child: SelectableButton(
                              buttonText: progressCtrl.progressType[6],
                              isSelected: progressCtrl.progressIndex == 7,
                              scrHeight: scrHeight,
                              clickedFunc: () {
                                progressCtrl.selectProgress(7);
                              },
                            ),
                          ),
                          Expanded(
                            child: Container(),
                          ),
                        ],
                      ),
                    ],
                  );
                },
              ),
              SizedBox(
                height: 0.03941 * scrHeight,
              ),
              requiredRichText('보유 질환'),
              SizedBox(
                height: 0.0099 * scrHeight,
              ),
              GetBuilder<DiseaseController>(builder: (diseaseCtrl) {
                return Column(
                  children: [
                    ThreeSelectableButton(
                      firstButtonText: diseaseCtrl.diseaseType[0],
                      secondButtonText: diseaseCtrl.diseaseType[1],
                      thirdButtonText: diseaseCtrl.diseaseType[2],
                      scrHeight: scrHeight,
                      firstButtonClicked: () {
                        diseaseCtrl.selectDisease(1);
                      },
                      secondButtonClicked: () {
                        diseaseCtrl.selectDisease(2);
                      },
                      thirdButtonClicked: () {
                        diseaseCtrl.selectDisease(3);
                      },
                      isFirstSelected: diseaseCtrl.diseaseIndex == 1,
                      isSecondSelected: diseaseCtrl.diseaseIndex == 2,
                      isThirdSelected: diseaseCtrl.diseaseIndex == 3,
                    ),
                    SizedBox(
                      height: 0.0185 * scrHeight,
                    ),
                    Row(
                      children: [
                        Container(
                          width: 0.146 * scrHeight,
                          child: SelectableButton(
                            buttonText: diseaseCtrl.diseaseType[3],
                            isSelected: diseaseCtrl.diseaseIndex == 4,
                            scrHeight: scrHeight,
                            clickedFunc: () {
                              diseaseCtrl.selectDisease(4);
                            },
                          ),
                        ),
                        SizedBox(
                          width: 0.0185 * scrHeight,
                        ),
                        Container(
                          width: 0.146 * scrHeight,
                          child: SelectableButton(
                            buttonText: diseaseCtrl.diseaseType[4],
                            isSelected: diseaseCtrl.diseaseIndex == 5,
                            scrHeight: scrHeight,
                            clickedFunc: () {
                              diseaseCtrl.selectDisease(5);
                            },
                          ),
                        ),
                        Expanded(
                          child: Container(),
                        ),
                      ],
                    ),
                  ],
                );
              }),
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
                    color: Color(0xFFDDDDDD),
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                ),
                child: TextField(
                  maxLines: 2,
                  maxLength: 100,
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
                    color: Color(0xFFAAAAAA),
                  ),
                ),
              ),
              SizedBox(
                height: 0.0493 * scrHeight,
              ),
              LongRoundButton(
                buttonText: '저장하기',
                scrHeight: scrHeight,
                activated: false,
                validateFunc: () {
                  ageController.isInputNumber();
                  heightController.isInputNumber();
                  weightController.isInputNumber();
                  cancerController.isItKorean();
                },
              ),
              SizedBox(
                height: 0.0493 * scrHeight,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget requiredRichText(String titleText) {
    return Container(
      width: double.infinity,
      child: Text.rich(
        TextSpan(
          children: <TextSpan>[
            TextSpan(
              text: titleText,
              style: TextStyle(
                color: Color(0xFF666666),
                fontWeight: FontWeight.w400,
                fontSize: 14,
              ),
            ),
            TextSpan(
              text: '*',
              style: TextStyle(
                color: Color(0xFFEE1100),
                fontWeight: FontWeight.w400,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildAgeHeightWeight(
    double scrHeight,
    String titleText,
    String unit,
    TextEditingController tec,
    FocusNode fn,
    bool errorOccur,
    bool canClear,
    String errorMsg,
    VoidCallback clearClicked,
    VoidCallback clearChange,
  ) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          child: Text(
            titleText,
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
        Row(
          children: [
            Expanded(
              child: DecorationForInput(
                childWidget: TextField(
                  controller: tec,
                  focusNode: fn,
                  onChanged: (text) {
                    if (text == '') {
                      clearChange();
                    }
                    if (errorOccur && !canClear) {
                      clearChange();
                    }
                  },
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: '00',
                    hintStyle: TextStyle(
                      color: Color(0xFF666666),
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                    ),
                    suffixIcon: tec.text.isEmpty
                        ? Container(
                            width: 0,
                          )
                        : errorOccur && !canClear
                            ? Icon(Icons.error)
                            : IconButton(
                                icon: SvgPicture.asset('assets/x.svg'),
                                onPressed: () {
                                  tec.text = '';
                                  clearClicked();
                                },
                              ),
                  ),
                ),
                scrHeight: scrHeight,
                vertPadding: 0,
                borderColor: errorOccur
                    ? Color(0xFFEE1100)
                    : fn.hasFocus
                        ? Color(0xFF3BD7E2)
                        : Color(0xFFDDDDDD),
              ),
            ),
            SizedBox(
              width: 0.0099 * scrHeight,
            ),
            Expanded(
              child: Text(
                unit,
                style: TextStyle(
                  color: Color(0xFF111111),
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 0.0099 * scrHeight),
        Container(
          width: double.infinity,
          child: Text(
            errorMsg,
            style: TextStyle(
              color: errorOccur ? Color(0xFFEE1100) : Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        SizedBox(height: 0.0099 * scrHeight),
      ],
    );
  }
}
