import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:my_side_client/Login/controllers/agreeContoller.dart';
import 'package:my_side_client/Login/controllers/checkPswdController.dart';
import 'package:my_side_client/Login/controllers/emailController.dart';
import 'package:my_side_client/Login/controllers/nameController.dart';
import 'package:my_side_client/Login/controllers/otpController.dart';
import 'package:my_side_client/Login/controllers/passwordController.dart';
import 'package:my_side_client/Login/controllers/phoneController.dart';
import 'package:my_side_client/Login/model/userInfo.dart';
import 'package:my_side_client/Login/page/signInPage/userTypeSelectPage.dart';
import 'package:my_side_client/Login/widget/recSubmitButton.dart';
import 'package:my_side_client/Login/widget/requiredTextWidget.dart';
import 'package:my_side_client/Login/widget/textFieldwithErrorMsg.dart';
import 'package:my_side_client/Login/widget/textfieldButtonError.dart';

class SignInPage extends StatelessWidget {
  final NameController nameController = Get.put(NameController());
  final EmailController emailController =
      Get.put(EmailController(), tag: 'SignIn');
  final PhoneController phoneController = Get.put(PhoneController());
  final OTPcontroller otpController = Get.put(OTPcontroller());
  final PasswordController pswdController =
      Get.put(PasswordController(), tag: 'SignIn');
  final CheckPswdController rePswdController = Get.put(CheckPswdController());
  final AgreeController agreeController = Get.put(AgreeController());

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
        child: GetBuilder<EmailController>(
            tag: 'SignIn',
            builder: (ectrl) {
              return GetBuilder<NameController>(builder: (nctrl) {
                return GetBuilder<PhoneController>(builder: (pctrl) {
                  // return GetBuilder<OTPcontroller>(builder: (octrl) {
                    return GetBuilder<PasswordController>(builder: (psctrl) {
                      return GetBuilder<CheckPswdController>(builder: (rectrl) {
                        return GetBuilder<AgreeController>(builder: (actrl) {
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
                                      errorText: ectrl.errorText,
                                      canClear: ectrl.canClear,
                                      fn: ectrl.fn,
                                      tec: ectrl.tec,
                                      hintText: '이메일 주소',
                                      buttonText: '중복확인',
                                      errorMsg: ectrl.errorMsg,
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
                                      errorOcur: nctrl.errorText,
                                      canClear: nctrl.canClear,
                                      fn: nctrl.fn,
                                      tec: nctrl.tec,
                                      hintText: '이름',
                                      errorMsg: nctrl.errorMsg,
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
                                    TextfieldButtonError(
                                      scrHeight: scrHeight,
                                      errorText: pctrl.errorText,
                                      canClear: pctrl.canClear,
                                      fn: pctrl.fn,
                                      tec: pctrl.tec,
                                      hintText: '휴대폰 번호',
                                      buttonText: '인증번호 받기',
                                      errorMsg: pctrl.errorMsg,
                                      getOPT: () {}, //중복확인하는 부분
                                    ),
                                    SizedBox(
                                      height: 0.0099 * scrHeight,
                                    ),
                                    TextFieldwithErrorMsg(
                                      scrHeight: scrHeight,
                                      // errorOcur: octrl.errorText,
                                      errorOcur: false,
                                      // canClear: octrl.canClear,
                                      canClear: true,
                                      // fn: octrl.fn,
                                      fn:FocusNode(),
                                      // tec: octrl.tec,
                                      tec: TextEditingController(),
                                      hintText: '인증번호',
                                      // errorMsg: octrl.errorMsg,
                                      errorMsg: '',
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
                                      errorOcur: psctrl.errorText,
                                      canClear: psctrl.canClear,
                                      fn: psctrl.fn,
                                      tec: psctrl.tec,
                                      hintText: '비밀번호',
                                      errorMsg: psctrl.errorMsg,
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
                                      errorOcur: rectrl.errorText,
                                      canClear: rectrl.canClear,
                                      fn: rectrl.fn,
                                      tec: rectrl.tec,
                                      hintText: '비밀번호 재확인',
                                      errorMsg: rectrl.errorMsg,
                                      isPswd: true,
                                    ),
                                    SizedBox(
                                      height: 0.0493 * scrHeight,
                                    ),
                                    buildAgreement(
                                      actrl.firstSelected,
                                      actrl.secondSelected,
                                      actrl.thirdSelected,
                                      actrl.fourthSelected,
                                      scrHeight,
                                      actrl.firstClicked,
                                      actrl.secondClicked,
                                      actrl.thirdClicked,
                                      actrl.fourthClicked,
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
                                activated: ectrl.tec.text.isNotEmpty &&
                                    nctrl.tec.text.isNotEmpty &&
                                    pctrl.tec.text.isNotEmpty &&
                                    //octrl.tec.text.isNotEmpty &&
                                    psctrl.tec.text.isNotEmpty &&
                                    rectrl.tec.text.isNotEmpty &&
                                    actrl.secondSelected &&
                                    actrl.thirdSelected,
                                validateFunc: () {
                                  ectrl.validateEmail();
                                  nctrl.validateName();
                                  pctrl.validatePhone();
                                  //octrl.validateOTP();
                                  psctrl.validatePassword();
                                  rectrl.validatePswdMatch(psctrl.tec.text);
                                  if (!ectrl.errorText &&
                                      !nctrl.errorText &&
                                      !pctrl.errorText &&
                                      //s!octrl.errorText &&
                                      !psctrl.errorText &&
                                      !rectrl.errorText) {
                                    newUser.email = ectrl.tec.text;
                                    newUser.name = nctrl.tec.text;
                                    newUser.phone = pctrl.tec.text;
                                    newUser.password = psctrl.tec.text;

                                    Get.to(() => UserTypeSelectPage(),
                                        arguments: newUser);
                                  }
                                },
                              ),
                            ],
                          );
                        });
                      });
                    });
                  // });
                });
              });
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
                child: SvgPicture.asset('asset/checkedoff.svg'),
              )
            else
              InkWell(
                onTap: firstClicked,
                child: SvgPicture.asset('asset/off.svg'),
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
                child: SvgPicture.asset('asset/checkedoff.svg'),
              )
            else
              InkWell(
                onTap: secondClicked,
                child: SvgPicture.asset('asset/off.svg'),
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
                'asset/arrowright.svg',
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
                child: SvgPicture.asset('asset/checkedoff.svg'),
              )
            else
              InkWell(
                onTap: thiredClicked,
                child: SvgPicture.asset('asset/off.svg'),
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
                'asset/arrowright.svg',
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
                child: SvgPicture.asset('asset/checkedoff.svg'),
              )
            else
              InkWell(
                onTap: fourthClicked,
                child: SvgPicture.asset('asset/off.svg'),
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
