import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_side_client/Login/functions/isNicknameValidate.dart';
import 'package:my_side_client/TabMyPage/model/ProfileSearch.dart';
import 'package:http/http.dart' as http;
import 'package:my_side_client/common/UserProfile.dart';

class ProfileChangePageController extends GetxController {
  // index 0 : 환우 닉네임, index 1 : 보호자 닉네임
  List<TextEditingController> tec = [
    TextEditingController(),
    TextEditingController()
  ];
  List<FocusNode> fn = [FocusNode(), FocusNode()];

  List<bool> errorOcur = [false, false];
  List<bool> canClear = [true, true];

  //나중에 보호자 닉네임 존재하는지 확인
  List<bool> hasData = [true, false];

  List<String> errorMsg = ['특수문자 제외', '특수문자 제외'];

  bool checked = false;

  Profile profile = Profile();

  @override
  void onInit() async {
    super.onInit();
    await getUserProfile();
    tec[0].text = profile.nickname;
    tec[0].addListener(() {
      onListen(0);
    });
    tec[1].addListener(() {
      onListen(1);
    });
  }

  @override
  void onClose() {
    super.onClose();
    tec[1].removeListener(() {
      onListen(1);
    });
    tec[1].removeListener(() {
      onListen(1);
    });
  }

  void onListen(int i) {
    if (tec[i].text == '') {
      if (hasData[i]) {
        hasData[i] = false;
      }
      errorOcur[i] = false;
      // if (i == 0) {
      //   errorMsg[i] = '';
      // }
    }
    if (errorOcur[i] && !canClear[i]) {
      canClear[i] = true;
    }
    update();
  }

  void validateNickname(int index) {
    if (isNickNameValidate(tec[index].text)) {
      errorMsg[index] = '특수문자 제외';
      errorOcur[index] = false;
      canClear[index] = true;
    } else {
      errorMsg[index] = '2~7자를 사용하세요.(특수기호, 공백 사용 불가)';
      errorOcur[index] = true;
      canClear[index] = false;
    }
    update();
  }

  void getUserProfile() async {
    final response = await http.get(
      Uri.http('54.180.67.217:3000', '/mypage/profile'),
      headers: {"Accept": "applications.json", "token": UserProfile.token},
    );
    if (response.statusCode == 200) {
      profile = profileSearchFromJson(response.body).data;
    }

    update();
  }
}
