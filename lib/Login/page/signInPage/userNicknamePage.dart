import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_side_client/Login/controllers/signInPageControllers.dart/nickNameConroller.dart';
import 'package:my_side_client/Login/controllers/signInPageControllers.dart/signInUserController.dart';
import 'package:my_side_client/Login/page/signInPage/selectCancerPage.dart';
import 'package:my_side_client/Login/widget/dialogWidget/textButtonDialog.dart';
import 'package:my_side_client/Login/widget/recSubmitButton.dart';
import 'package:my_side_client/Login/widget/textfieldButtonError.dart';
import 'package:my_side_client/Login/widget/titleAndSubtitleWidget.dart';
import 'package:my_side_client/Login/widget/userInfoPageNumber.dart';

class UserNicknamePage extends StatelessWidget {
  final NicknameController nnController = Get.put(NicknameController());
  final SignInUserController signInUserController =
      Get.put(SignInUserController());
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
      body: SingleChildScrollView(
        child: GetBuilder<NicknameController>(builder: (nnctrl) {
          return Column(
            children: [
              UserInfoPageNumber(pageNum: 2, scrHeight: scrHeight),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 0.0197 * scrHeight,
                  vertical: 0.0591 * scrHeight,
                ),
                child: Column(
                  children: [
                    TitleAndSubtitleWidget(
                      title: '닉네임을 입력해주세요.',
                      subTitle: '이웃집닥터를 활동할 때 쓰여지는 이름입니다.',
                      scrHeight: scrHeight,
                    ),
                    SizedBox(
                      height: 0.0493 * scrHeight,
                    ),
                    TextfieldButtonError(
                      scrHeight: scrHeight,
                      errorText: nnctrl.errorText,
                      canClear: nnctrl.canClear,
                      fn: nnctrl.fn,
                      tec: nnctrl.tec,
                      hintText: '닉네임',
                      buttonText: '중복 확인',
                      errorMsg: nnctrl.errorMsg,
                      getOPT: () async {
                        nnctrl.validateNickname();
                        if (!nnctrl.errorText) {
                          await nnctrl.isExistNickname();
                          Get.dialog(Dialog(
                            child: TextButtonDialog(
                              scrHeight: scrHeight,
                              dialogText: nnctrl.duplicated == 1
                                  ? '사용할 수 있는 닉네임입니다.'
                                  : '동일한 닉네임이 이미 등록되어 있습니다.',
                              routeFunc: () {
                                Get.back();
                              },
                            ),
                          ));
                        }
                      }, //중복확인
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 0.373 * scrHeight,
              ),
              RecSubmitButton(
                buttonText: '다음 페이지',
                scrHeight: scrHeight,
                activated: nnctrl.duplicated == 1,
                validateFunc: () {
                  if (nnctrl.duplicated == 1) {
                    String nickName = nnctrl.tec.text;
                    signInUserController.setNickName(nickName);
                    Get.to(() => SelectCancerPage());
                  }
                },
              ),
            ],
          );
        }),
      ),
    );
  }
}
