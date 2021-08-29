import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_side_client/common/UserProfile.dart';
import 'package:my_side_client/models/profileSearch.dart';
import 'package:my_side_client/models/textFieldModel.dart';
import 'package:my_side_client/services/mypageService/myPageService.dart';
import 'package:my_side_client/wigets/dialogwidget/singleButtonDialog.dart';

class ProfileModifyController extends GetxController {
  TextFieldModel nicknameTextField = new TextFieldModel(
    tec: TextEditingController(),
    fn: FocusNode(),
    hintText: '닉네임',
    isPswd: false,
    errorMsg: '',
  );
  bool changeSuccess = false;
  bool duplicatePass = false;
  Profile usrProfile = Profile();

  @override
  void onInit() async {
    await getUsrProfile();
    nicknameTextField.tec.addListener(onListenNickname);
    nicknameTextField.tec.text = usrProfile.nickname;
    super.onInit();
  }

  @override
  void onClose() {
    nicknameTextField.tec.removeListener(onListenNickname);
    super.onClose();
  }

  void onListenNickname() {
    nicknameTextField.onListenTextFieldType1();
    update();
  }

  void getUsrProfile() async {
    usrProfile = await userProfile(UserProfile.token);
    update();
  }

  void onClickedSave() async {
    nicknameTextField.validateNickname();
    if (!nicknameTextField.errorOcur) {
      duplicatePass = await checkNickname(nicknameTextField.tec.text);
      if (duplicatePass) {
        changeSuccess =
            await nicknameChange(nicknameTextField.tec.text, UserProfile.token);
      }
      if (changeSuccess) {
        await getUsrProfile();
      }
    }
    update();
  }

  void callDialog(double height) {
    if (!nicknameTextField.errorOcur) {
      Get.dialog(
        SingleButtonDialog(
          widgetBetween: Text(
            duplicatePass
                ? changeSuccess
                    ? '닉네임이 변경되었습니다.'
                    : '닉네임이 변경되지 않았습니다.'
                : '이미 존재하는 닉네임입니다.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFF111111),
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
          dialogHeight: height,
          routeFunc: () {
            Get.back();
          },
        ),
      );
    }
    duplicatePass = false;
    update();
  }
}
