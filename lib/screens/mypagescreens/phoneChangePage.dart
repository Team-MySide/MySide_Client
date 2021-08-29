import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:my_side_client/controllers/phoneChangeController.dart';
import 'package:my_side_client/controllers/profileModifyController.dart';
import 'package:my_side_client/wigets/buttonwidget/longRoundButton.dart';
import 'package:my_side_client/wigets/etcwidgets/buildInfoInputField.dart';
import 'package:my_side_client/wigets/textfieldwidget/basicTextField.dart';

class PhoneChangePage extends StatelessWidget {
  final PhoneChangeConroller phoneChangeConroller =
      Get.put(PhoneChangeConroller());
  final ProfileModifyController profileModifyController =
      Get.put(ProfileModifyController());
  @override
  Widget build(BuildContext context) {
    double scrHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '휴대폰 번호',
        ),
        actions: [
          IconButton(
            icon: SvgPicture.asset('assets/Setting.svg'),
            onPressed: () {},
          ),
        ],
      ),
      body: GetBuilder<PhoneChangeConroller>(
        builder: (controller) {
          return SafeArea(
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(
                  vertical: 0.0527 * scrHeight,
                  horizontal: 0.0211 * scrHeight,
                ),
                child: Column(
                  children: [
                    BuildInfoInputField(
                      scrHeight: scrHeight,
                      title: '휴대폰',
                      widgetForBuild: BasicTextField(
                        scrHeight: scrHeight,
                        textFieldModel: controller.phoneTextField,
                      ),
                      isRequired: false,
                      isTextField: true,
                    ),
                    BuildInfoInputField(
                      scrHeight: scrHeight,
                      title: '휴대폰 재확인',
                      widgetForBuild: BasicTextField(
                        scrHeight: scrHeight,
                        textFieldModel: controller.rephoneTextField,
                      ),
                      isRequired: false,
                      isTextField: true,
                    ),
                    SizedBox(
                      height: 0.4611 * scrHeight,
                    ),
                    LongRoundButton(
                      buttonText: '저장하기',
                      scrHeight: scrHeight,
                      activated:
                          controller.phoneTextField.tec.text.isNotEmpty &&
                              controller.rephoneTextField.tec.text.isNotEmpty,
                      validateFunc: () async {
                        bool success = await controller.changePhone();
                        if (success) {
                          await profileModifyController.getUsrProfile();
                          Get.until(
                              (route) => Get.currentRoute == '/ProfileChange');
                          //Get.until(ModalRoute.withName('/ProfileChange'));
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
