import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:my_side_client/controllers/profileModifyController.dart';
import 'package:my_side_client/wigets/buttonwidget/longRoundButton.dart';
import 'package:my_side_client/wigets/etcwidgets/buildInfoInputField.dart';
import 'package:my_side_client/wigets/textfieldwidget/basicTextField.dart';
import 'package:my_side_client/wigets/widgetforscreen/profileModifyPageWidget.dart';

class ProfileModifyPage extends StatelessWidget {
  final ProfileModifyController profileModifyController =
      Get.put(ProfileModifyController());
  @override
  Widget build(BuildContext context) {
    double scrHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '프로필 수정',
        ),
        actions: [
          IconButton(
            icon: SvgPicture.asset('assets/Setting.svg'),
            onPressed: () {
              Get.toNamed('/settings');
            },
          ),
        ],
      ),
      body: GetBuilder<ProfileModifyController>(
        builder: (controller) {
          return SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                      vertical: 0.0527 * scrHeight,
                      horizontal: 0.0211 * scrHeight,
                    ),
                    child: Column(
                      children: [
                        BuildInfoInputField(
                          scrHeight: scrHeight,
                          title: '닉네임',
                          widgetForBuild: BasicTextField(
                            scrHeight: scrHeight,
                            textFieldModel: controller.nicknameTextField,
                          ),
                          isRequired: false,
                          isTextField: true,
                        ),
                        LongRoundButton(
                          buttonText: '저장하기',
                          scrHeight: scrHeight,
                          activated:
                              controller.nicknameTextField.tec.text.isNotEmpty,
                          validateFunc: () async {
                            await controller.onClickedSave();
                            controller.callDialog(scrHeight * 0.2635);
                          },
                        ),
                        SizedBox(
                          height: 0.03 * scrHeight,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(),
                        ),
                      ],
                    ),
                  ),
                  buildProfileInfoTile(
                    scrHeight,
                    '이메일',
                    Text(
                      '${controller.usrProfile.email}',
                      style: TextStyle(
                        color: Color(0xFF3BD7E2),
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Get.toNamed('/checkPswd');
                    },
                    child: buildProfileInfoTile(
                      scrHeight,
                      '휴대폰 번호',
                      Row(
                        children: [
                          controller.isLoading
                              ? Text("")
                              : Text(
                                  '+82 10-${controller.usrProfile.phone.substring(4, 6)}**-${controller.usrProfile.phone.substring(9, 11)}**',
                                  style: TextStyle(
                                    color: Color(0xFF3BD7E2),
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                          SizedBox(
                            width: scrHeight * 0.0105,
                          ),
                          SvgPicture.asset('assets/arrowright.svg'),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Get.toNamed('/changePswd');
                    },
                    child: buildProfileInfoTile(
                      scrHeight,
                      '비밀번호 변경',
                      SvgPicture.asset('assets/arrowright.svg'),
                    ),
                  ),
                  Divider(
                    thickness: 1.5,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
