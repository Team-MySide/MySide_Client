import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_side_client/TabMyPage/controller/phoneOTPController.dart';

class PhoneReceiveOTP extends StatelessWidget {
  final PhoneOTPController ctrler;
  final double scrHeight;

  PhoneReceiveOTP({
    @required this.scrHeight,
    @required this.ctrler,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 0.05911 * scrHeight,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: ctrler.phoneError
                          ? Color(0xFFEE1100)
                          : ctrler.phoneFocus.hasFocus
                              ? Color(0xFF3BD7E2)
                              : Color(0xFFDDDDDD),
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 0.0172 * scrHeight,
                    ),
                    child: TextField(
                      onChanged: (text) {
                        if (text == '') {
                          ctrler.phoneClearClicked();
                        }
                        if (ctrler.phoneError && !ctrler.phoneClear) {
                          ctrler.phoneCanCelar();
                        }
                      },
                      controller: ctrler.phoneController,
                      focusNode: ctrler.phoneFocus,
                      decoration: InputDecoration(
                        hintText: '휴대폰 번호',
                        hintStyle: TextStyle(
                          color: Color(0xFFAAAAAA),
                          fontSize: 16,
                          fontWeight: FontWeight.w300,
                        ),
                        border: InputBorder.none,
                        suffixIcon: ctrler.phoneController.text.isEmpty
                            ? Container(
                                width: 0,
                              )
                            : ctrler.phoneError && !ctrler.phoneClear
                                ? Icon(Icons.error)
                                : IconButton(
                                    icon: SvgPicture.asset('assets/x.svg'),
                                    onPressed: () {
                                      ctrler.phoneController.text = '';
                                      ctrler.phoneClearClicked();
                                    },
                                  ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 0.0099 * scrHeight,
              ),
              InkWell(
                onTap: () {
                  ctrler.checkPhoneNumber();
                },
                child: Container(
                  height: 0.05911 * scrHeight,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Color(0xFF3BD7E2),
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 0.0246 * scrHeight,
                    ),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        '인증번호 받기',
                        style: TextStyle(
                          color: Color(0xFF3BD7E2),
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 0.0099 * scrHeight,
          ),
          Container(
            height: 0.05911 * scrHeight,
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(
                color: ctrler.otpError
                    ? Color(0xFFEE1100)
                    : ctrler.otpFocus.hasFocus
                        ? Color(0xFF3BD7E2)
                        : Color(0xFFDDDDDD),
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 0.0172 * scrHeight,
              ),
              child: TextField(
                onChanged: (text) {
                  if (text == '') {
                    ctrler.otpClearClicked();
                  }
                  if (ctrler.otpError && !ctrler.otpClear) {
                    ctrler.otpCanCelar();
                  }
                },
                focusNode: ctrler.otpFocus,
                controller: ctrler.otpController,
                decoration: InputDecoration(
                  hintText: '인증번호',
                  hintStyle: TextStyle(
                    color: Color(0xFFAAAAAA),
                    fontSize: 16,
                    fontWeight: FontWeight.w300,
                  ),
                  border: InputBorder.none,
                  suffixIcon: ctrler.otpController.text.isEmpty
                      ? Container(
                          width: 0,
                        )
                      : ctrler.otpError && !ctrler.otpClear
                          ? Icon(Icons.error)
                          : IconButton(
                              icon: SvgPicture.asset('assets/x.svg'),
                              onPressed: () {
                                ctrler.otpController.text = '';
                                ctrler.otpClearClicked();
                              },
                            ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 0.0099 * scrHeight,
          ),
          Container(
            width: double.infinity,
            child: Text(
              ctrler.errorMsg,
              style: TextStyle(
                color: ctrler.errorMsgColor,
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
