import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:my_side_client/Login/widget/longRoundButton.dart';
import 'package:my_side_client/TabMyPage/controller/phoneOTPController.dart';
import 'package:my_side_client/TabMyPage/widget/phoneReceiveOTP.dart';

class ChangePhoneNumberPage extends StatelessWidget {
  final PhoneOTPController phoneOTPController = Get.put(PhoneOTPController());

  @override
  Widget build(BuildContext context) {
    double scrHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          '휴대폰 번호 변경',
          style: TextStyle(
            color: Color(0xFF111111),
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        elevation: 0,
        actions: [
          IconButton(
            icon: SvgPicture.asset('assets/Setting.svg'),
            onPressed: () {},
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 0.0197 * scrHeight,
            vertical: 0.0308 * scrHeight,
          ),
          child: GetBuilder<PhoneOTPController>(
            builder: (ctrler) {
              return Column(
                children: [
                  PhoneReceiveOTP(
                    scrHeight: scrHeight,
                    ctrler: ctrler,
                  ),
                  SizedBox(
                    height: 0.5222 * scrHeight,
                  ),
                  LongRoundButton(
                    buttonText: '저장하기',
                    scrHeight: scrHeight,
                    activated: ctrler.otpController.text.isNotEmpty,
                    validateFunc: ctrler.checkOTPNumber,
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
