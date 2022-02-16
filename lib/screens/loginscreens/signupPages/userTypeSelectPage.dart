import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:my_side_client/controllers/signUpUserController.dart';
import 'package:my_side_client/controllers/userTypeController.dart';
import 'package:my_side_client/wigets/buttonwidget/recSubmitButton.dart';
import 'package:my_side_client/wigets/etcwidgets/userInfoPageNumber.dart';
import 'package:my_side_client/wigets/textwidget/titleAndSubtitleWidget.dart';

class UserTypeSelectPage extends StatelessWidget {
  final UserTypeController userTypeController = Get.put(UserTypeController());
  final SignUpUserController signUpUserController =
      Get.put(SignUpUserController());

  @override
  Widget build(BuildContext context) {
    double scrHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '환우 정보 입력',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Color(0xFF31B6F7),
      ),
      body: GetBuilder<UserTypeController>(
        builder: (controller) {
          return SingleChildScrollView(
            child: Column(
              children: [
                UserInfoPageNumber(pageNum: 1, scrHeight: scrHeight),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 0.0211 * scrHeight,
                    vertical: 0.0632 * scrHeight,
                  ),
                  child: Column(
                    children: [
                      TitleAndSubtitleWidget(
                        title: '사용자의 분류를 선택해주세요.',
                        subTitle: '당신은 환우입니까? 보호자입니까?',
                        scrHeight: scrHeight,
                      ),
                      SizedBox(
                        height: 0.0527 * scrHeight,
                      ),
                      Row(
                        children: [
                          buildSelectBox(
                            controller.userType == 1,
                            false,
                            '환우',
                            scrHeight,
                            () {
                              controller.setUserType(1);
                            },
                          ),
                          SizedBox(
                            width: 0.0185 * scrHeight,
                          ),
                          buildSelectBox(
                            controller.userType == 2,
                            true,
                            '보호자',
                            scrHeight,
                            () {
                              controller.setUserType(2);
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 0.25 * scrHeight,
                ),
                RecSubmitButton(
                  buttonText: '다음 페이지',
                  buttonHeight: scrHeight,
                  activated: controller.userType > 0,
                  validateFunc: () {
                    if (controller.userType > 0) {
                      signUpUserController
                          .setUserType(controller.userType == 1 ? '환우' : '보호자');
                      Get.toNamed('/nickName');
                    }
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget buildSelectBox(bool isSelected, bool userType, String typeText,
      double scrHeight, VoidCallback clicked) {
    return Expanded(
      child: InkWell(
        onTap: clicked,
        child: Container(
          padding: EdgeInsets.symmetric(
            vertical: 0.0431 * scrHeight,
          ),
          decoration: BoxDecoration(
            color: isSelected ? Color(0xFF3BD7E2) : Color(0xFFF4F4F4),
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
          ),
          child: Column(
            children: [
              userType
                  ? isSelected
                      ? SvgPicture.asset('assets/patientselected.svg')
                      : SvgPicture.asset('assets/patientunselected.svg')
                  : isSelected
                      ? SvgPicture.asset('assets/guardianselect.svg')
                      : SvgPicture.asset('assets/guardianunselected.svg'),
              SizedBox(
                height: 0.0148 * scrHeight,
              ),
              Text(
                typeText,
                style: TextStyle(
                  color: isSelected ? Colors.white : Color(0xFF666666),
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
