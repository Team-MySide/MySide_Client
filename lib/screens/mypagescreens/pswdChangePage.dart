import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:my_side_client/common/CommonHeader.dart';
import 'package:my_side_client/controllers/pswdChangeController.dart';
import 'package:my_side_client/wigets/buttonwidget/longRoundButton.dart';
import 'package:my_side_client/wigets/etcwidgets/buildInfoInputField.dart';
import 'package:my_side_client/wigets/textfieldwidget/basicTextField.dart';

class PswdChangePage extends StatelessWidget {
  final PswdChangeController pswdChangeControlelr =
      Get.put(PswdChangeController());
  @override
  Widget build(BuildContext context) {
    double scrHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: CommonAppbar(
        '비밀번호 변경',
        // actions: [
        //   IconButton(
        //     icon: SvgPicture.asset('assets/Setting.svg'),
        //     onPressed: () {},
        //   ),
        // ],
      ),
      body: GetBuilder<PswdChangeController>(
        builder: (controller) {
          bool isActive = controller.checkActive();
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
                      title: '현재 비밀번호',
                      widgetForBuild: BasicTextField(
                        scrHeight: scrHeight,
                        textFieldModel: controller.curPswdTextField,
                      ),
                      isRequired: false,
                      isTextField: true,
                    ),
                    BuildInfoInputField(
                      scrHeight: scrHeight,
                      title: '새 비밀번호',
                      widgetForBuild: BasicTextField(
                        scrHeight: scrHeight,
                        textFieldModel: controller.newPswdTextField,
                      ),
                      isRequired: false,
                      isTextField: true,
                    ),
                    BuildInfoInputField(
                      scrHeight: scrHeight,
                      title: '새 비밀번호 재확인',
                      widgetForBuild: BasicTextField(
                        scrHeight: scrHeight,
                        textFieldModel: controller.reNewPswdTextField,
                      ),
                      isRequired: false,
                      isTextField: true,
                    ),
                    SizedBox(
                      height: 0.3 * scrHeight,
                    ),
                    LongRoundButton(
                      buttonText: '저장하기',
                      scrHeight: scrHeight,
                      activated: isActive,
                      validateFunc: () async {
                        await controller.changePswd(scrHeight * 0.2635);
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
