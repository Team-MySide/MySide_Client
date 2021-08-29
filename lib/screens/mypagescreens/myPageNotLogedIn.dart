import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:my_side_client/constantsList.dart';
import 'package:my_side_client/wigets/widgetforscreen/widgetForMyPageMain.dart';

class MyPageNotLogedIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double scrHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(0xFF3BD7E2),
      appBar: AppBar(
        backgroundColor: Color(0xFF3BD7E2),
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(
                  horizontal: 0.0422 * scrHeight,
                ),
                child: Column(
                  children: [
                    Opacity(
                      opacity: 0.4,
                      child: SvgPicture.asset('assets/user.svg'),
                    ),
                    SizedBox(
                      height: 0.0211 * scrHeight,
                    ),
                    Opacity(
                      opacity: 0.4,
                      child: SvgPicture.asset('assets/GuestText.svg'),
                    ),
                    SizedBox(
                      height: 0.0211 * scrHeight,
                    ),
                    Opacity(
                      opacity: 0.4,
                      child: SvgPicture.asset('assets/tag_warp.svg'),
                    ),
                    SizedBox(
                      height: 0.0527 * scrHeight,
                    ),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 0.0211 * scrHeight,
                    vertical: 0.0422 * scrHeight,
                  ),
                  child: Column(
                    children: [
                      Opacity(
                        opacity: 0.4,
                        child: buildIconButtons(
                          myPageMainIconText,
                          myPageMainIconName,
                          [() {}, () {}, () {}],
                          scrHeight,
                        ),
                      ),
                      SizedBox(
                        height: 0.0632 * scrHeight,
                      ),
                      Text(
                        '로그인이 필요한 서비스입니다',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF111111),
                        ),
                      ),
                      SizedBox(
                        height: 0.011 * scrHeight,
                      ),
                      InkWell(
                        onTap: () {
                          Get.toNamed('/');
                        },
                        child: Text(
                          '로그인',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF3BD7E2),
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 0.23 * scrHeight,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
