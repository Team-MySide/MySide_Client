import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:my_side_client/Login/controllers/signInPageControllers.dart/signInMainPageController.dart';
import 'package:my_side_client/Login/model/userInfo.dart';
import 'package:my_side_client/Login/page/signInPage/userTypeSelectPage.dart';
import 'package:my_side_client/Login/widget/recSubmitButton.dart';
import 'package:my_side_client/Login/widget/requiredTextWidget.dart';
import 'package:my_side_client/Login/widget/textFieldwithErrorMsg.dart';
import 'package:my_side_client/Login/widget/textfieldButtonError.dart';

class SignInPage extends StatelessWidget {
  final SignInMainPageController simpController =
      Get.put(SignInMainPageController());

  @override
  Widget build(BuildContext context) {
    double scrHeight = MediaQuery.of(context).size.height;
    UserInfo newUser = UserInfo();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '회원가입',
        ),
      ),
      body: SingleChildScrollView(
        child: GetBuilder<SignInMainPageController>(builder: (ctrl) {
          return Column(
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(
                  0.0197 * scrHeight,
                  0.0296 * scrHeight,
                  0.0197 * scrHeight,
                  0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RequiredTextWidget(
                      mainText: '이메일',
                    ),
                    SizedBox(
                      height: 0.0099 * scrHeight,
                    ),
                    TextfieldButtonError(
                      scrHeight: scrHeight,
                      errorText: ctrl.errorOcur[0],
                      canClear: ctrl.canClear[0],
                      fn: ctrl.fn[0],
                      tec: ctrl.tec[0],
                      hintText: '이메일 주소',
                      buttonText: '중복확인',
                      errorMsg: ctrl.errorMsg[0],
                      getOPT: () {}, //중복확인하는 부분
                    ),
                    SizedBox(
                      height: 0.0099 * scrHeight,
                    ),
                    RequiredTextWidget(
                      mainText: '이름',
                    ),
                    SizedBox(
                      height: 0.0099 * scrHeight,
                    ),
                    TextFieldwithErrorMsg(
                      scrHeight: scrHeight,
                      errorOcur: ctrl.errorOcur[1],
                      canClear: ctrl.canClear[1],
                      fn: ctrl.fn[1],
                      tec: ctrl.tec[1],
                      hintText: '이름',
                      errorMsg: ctrl.errorMsg[1],
                      isPswd: false,
                    ),
                    SizedBox(
                      height: 0.0099 * scrHeight,
                    ),
                    RequiredTextWidget(
                      mainText: '휴대폰',
                    ),
                    SizedBox(
                      height: 0.0099 * scrHeight,
                    ),
                    TextFieldwithErrorMsg(
                      scrHeight: scrHeight,
                      errorOcur: ctrl.errorOcur[2],
                      canClear: ctrl.canClear[2],
                      fn: ctrl.fn[2],
                      tec: ctrl.tec[2],
                      hintText: '휴대폰 번호',
                      errorMsg: ctrl.errorMsg[2],
                      isPswd: false,
                    ),
                    SizedBox(
                      height: 0.0099 * scrHeight,
                    ),
                    RequiredTextWidget(
                      mainText: '휴대폰 재확인',
                    ),
                    SizedBox(
                      height: 0.0099 * scrHeight,
                    ),
                    TextFieldwithErrorMsg(
                      scrHeight: scrHeight,
                      errorOcur: ctrl.errorOcur[3],
                      canClear: ctrl.canClear[3],
                      fn: ctrl.fn[3],
                      tec: ctrl.tec[3],
                      hintText: '휴대폰 번호',
                      errorMsg: ctrl.errorMsg[3],
                      isPswd: false,
                    ),
                    SizedBox(
                      height: 0.0099 * scrHeight,
                    ),
                    RequiredTextWidget(
                      mainText: '비밀번호',
                    ),
                    SizedBox(
                      height: 0.0099 * scrHeight,
                    ),
                    TextFieldwithErrorMsg(
                      scrHeight: scrHeight,
                      errorOcur: ctrl.errorOcur[4],
                      canClear: ctrl.canClear[4],
                      fn: ctrl.fn[4],
                      tec: ctrl.tec[4],
                      hintText: '비밀번호',
                      errorMsg: ctrl.errorMsg[4],
                      isPswd: true,
                    ),
                    SizedBox(
                      height: 0.0099 * scrHeight,
                    ),
                    RequiredTextWidget(
                      mainText: '비밀번호 재확인',
                    ),
                    SizedBox(
                      height: 0.0099 * scrHeight,
                    ),
                    TextFieldwithErrorMsg(
                      scrHeight: scrHeight,
                      errorOcur: ctrl.errorOcur[5],
                      canClear: ctrl.canClear[5],
                      fn: ctrl.fn[5],
                      tec: ctrl.tec[5],
                      hintText: '비밀번호 재확인',
                      errorMsg: ctrl.errorMsg[5],
                      isPswd: true,
                    ),
                    SizedBox(
                      height: 0.0493 * scrHeight,
                    ),
                    buildAgreement(
                      ctrl.firstSelected,
                      ctrl.secondSelected,
                      ctrl.thirdSelected,
                      ctrl.fourthSelected,
                      scrHeight,
                      ctrl.firstClicked,
                      ctrl.secondClicked,
                      ctrl.thirdClicked,
                      ctrl.fourthClicked,
                    ),
                    SizedBox(
                      height: 0.0493 * scrHeight,
                    ),
                  ],
                ),
              ),
              RecSubmitButton(
                buttonText: '회원가입',
                scrHeight: scrHeight,
                activated: ctrl.tec[0].text.isNotEmpty &&
                    ctrl.tec[1].text.isNotEmpty &&
                    ctrl.tec[2].text.isNotEmpty &&
                    ctrl.tec[3].text.isNotEmpty &&
                    ctrl.tec[4].text.isNotEmpty &&
                    ctrl.tec[5].text.isNotEmpty &&
                    ctrl.secondSelected &&
                    ctrl.thirdSelected,
                validateFunc: () {
                  ctrl.validateEmail();
                  ctrl.validateName();
                  ctrl.validatePhone();
                  ctrl.validatePhoneMatch();
                  ctrl.validatePassword();
                  ctrl.validatePswdMatch();
                  if (!ctrl.errorOcur[0] &&
                      !ctrl.errorOcur[1] &&
                      !ctrl.errorOcur[2] &&
                      !ctrl.errorOcur[3] &&
                      !ctrl.errorOcur[4] &&
                      !ctrl.errorOcur[5]) {
                    newUser.email = ctrl.tec[0].text;
                    newUser.name = ctrl.tec[1].text;
                    newUser.phone = ctrl.tec[2].text;
                    newUser.password = ctrl.tec[4].text;

                    Get.to(() => UserTypeSelectPage(), arguments: newUser);
                  }
                },
              ),
            ],
          );
        }),
      ),
    );
  }

  Widget buildAgreement(
    bool first,
    bool second,
    bool third,
    bool fourth,
    double scrHeight,
    VoidCallback firstClicked,
    VoidCallback secondClicked,
    VoidCallback thiredClicked,
    VoidCallback fourthClicked,
  ) {
    return Column(
      children: [
        Row(
          children: [
            if (first)
              InkWell(
                onTap: firstClicked,
                child: SvgPicture.asset('assets/checkedoff.svg'),
              )
            else
              InkWell(
                onTap: firstClicked,
                child: SvgPicture.asset('assets/off.svg'),
              ),
            SizedBox(
              width: 0.0099 * scrHeight,
            ),
            RequiredTextWidget(mainText: '약관 전체 동의'),
          ],
        ),
        Divider(
          color: Color(
            0xFFDDDDDD,
          ),
          thickness: 1.5,
        ),
        SizedBox(
          height: 0.0197 * scrHeight,
        ),
        Row(
          children: [
            if (second)
              InkWell(
                onTap: secondClicked,
                child: SvgPicture.asset('assets/checkedoff.svg'),
              )
            else
              InkWell(
                onTap: secondClicked,
                child: SvgPicture.asset('assets/off.svg'),
              ),
            SizedBox(
              width: 0.0099 * scrHeight,
            ),
            RichText(
              text: TextSpan(
                text: '이용약관 동의',
                style: TextStyle(
                  color: Color(0xFF666666),
                  fontSize: 14.0,
                  fontWeight: FontWeight.w300,
                ),
                children: [
                  TextSpan(
                    text: ' (필수)',
                    style: TextStyle(
                      color: Color(0xFF3BD7E2),
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
            InkWell(
              onTap: () {},
              child: SvgPicture.asset(
                'assets/arrowright.svg',
              ),
            ),
          ],
        ),
        SizedBox(
          height: 0.0246 * scrHeight,
        ),
        Row(
          children: [
            if (third)
              InkWell(
                onTap: thiredClicked,
                child: SvgPicture.asset('assets/checkedoff.svg'),
              )
            else
              InkWell(
                onTap: thiredClicked,
                child: SvgPicture.asset('assets/off.svg'),
              ),
            SizedBox(
              width: 0.0099 * scrHeight,
            ),
            RichText(
              text: TextSpan(
                text: '개인정보 수집 및 이용 동의',
                style: TextStyle(
                  color: Color(0xFF666666),
                  fontSize: 14.0,
                  fontWeight: FontWeight.w300,
                ),
                children: [
                  TextSpan(
                    text: ' (필수)',
                    style: TextStyle(
                      color: Color(0xFF3BD7E2),
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
            InkWell(
              onTap: () {},
              child: SvgPicture.asset(
                'assets/arrowright.svg',
              ),
            ),
          ],
        ),
        SizedBox(
          height: 0.0246 * scrHeight,
        ),
        Row(
          children: [
            if (fourth)
              InkWell(
                onTap: fourthClicked,
                child: SvgPicture.asset('assets/checkedoff.svg'),
              )
            else
              InkWell(
                onTap: fourthClicked,
                child: SvgPicture.asset('assets/off.svg'),
              ),
            SizedBox(
              width: 0.0099 * scrHeight,
            ),
            RichText(
              text: TextSpan(
                text: 'E-mail 및 SMS 광고성 정보 수신 동의',
                style: TextStyle(
                  color: Color(0xFF666666),
                  fontSize: 14.0,
                  fontWeight: FontWeight.w300,
                ),
                children: [
                  TextSpan(
                    text: ' (선택)',
                    style: TextStyle(
                      color: Color(0xFF3BD7E2),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
