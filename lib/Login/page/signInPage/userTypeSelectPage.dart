import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:my_side_client/Login/controllers/signInPageControllers.dart/userTypeController.dart';
import 'package:my_side_client/Login/page/signInPage/userNicknamePage.dart';
import 'package:my_side_client/Login/widget/recSubmitButton.dart';
import 'package:my_side_client/Login/widget/titleAndSubtitleWidget.dart';
import 'package:my_side_client/Login/widget/userInfoPageNumber.dart';

class UserTypeSelectPage extends StatelessWidget {
  final UserTypeController utc = Get.put(UserTypeController());
  final String email = Get.arguments[0];
  final String name = Get.arguments[1];
  final String phone = Get.arguments[2];
  final String password = Get.arguments[3];
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
      body: GetBuilder<UserTypeController>(builder: (ctrl) {
        return Column(
          children: [
            UserInfoPageNumber(pageNum: 1, scrHeight: scrHeight),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 0.0197 * scrHeight,
                vertical: 0.0591 * scrHeight,
              ),
              child: Column(
                children: [
                  TitleAndSubtitleWidget(
                    title: '사용자의 분류를 선택해주세요.',
                    subTitle: '당신은 환우입니까? 보호자입니까?',
                    scrHeight: scrHeight,
                  ),
                  SizedBox(
                    height: 0.0493 * scrHeight,
                  ),
                  Row(
                    children: [
                      buildSelectBox(
                        ctrl.userType == 1,
                        false,
                        '환우',
                        scrHeight,
                        () {
                          ctrl.setUserType(1);
                        },
                      ),
                      SizedBox(
                        width: 0.0185 * scrHeight,
                      ),
                      buildSelectBox(
                        ctrl.userType == 2,
                        true,
                        '보호자',
                        scrHeight,
                        () {
                          ctrl.setUserType(2);
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 0.263 * scrHeight,
            ),
            RecSubmitButton(
              buttonText: '다음 페이지',
              scrHeight: scrHeight,
              activated: ctrl.userType > 0,
              validateFunc: () {
                if (ctrl.userType > 0) {
                  String usrType = ctrl.userType == 1 ? '환우' : '보호자';
                  Get.to(() => UserNicknamePage(),
                      arguments: [email, name, phone, password, usrType]);
                }
              },
            )
          ],
        );
      }),
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
