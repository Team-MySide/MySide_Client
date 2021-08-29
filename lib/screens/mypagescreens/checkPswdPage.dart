import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:my_side_client/controllers/checkPswdController.dart';
import 'package:my_side_client/wigets/buttonwidget/longRoundButton.dart';
import 'package:my_side_client/wigets/textfieldwidget/basicTextField.dart';

class CheckPswdPage extends StatelessWidget {
  final CheckPswdController checkPswdController =
      Get.put(CheckPswdController());

  @override
  Widget build(BuildContext context) {
    double scrHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '비밀번호 확인',
        ),
        actions: [
          IconButton(
            icon: SvgPicture.asset('assets/Setting.svg'),
            onPressed: () {},
          ),
        ],
      ),
      body: GetBuilder<CheckPswdController>(
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
                    BasicTextField(
                      scrHeight: scrHeight,
                      textFieldModel: controller.pswdTextField,
                    ),
                    SizedBox(
                      height: 0.6 * scrHeight,
                    ),
                    InkWell(
                      onTap: () {
                        Get.toNamed('/findPassword');
                      },
                      child: Text(
                        '비밀번호 찾기',
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: Color(0xFF3BD7E2),
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 0.0211 * scrHeight,
                    ),
                    LongRoundButton(
                      buttonText: '다음',
                      scrHeight: scrHeight,
                      activated: controller.pswdTextField.tec.text.isNotEmpty,
                      validateFunc: () async {
                        await controller.checkPswd(scrHeight);
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
