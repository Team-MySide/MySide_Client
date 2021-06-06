import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:my_side_client/Login/page/loginPage/loginMainPage.dart';
import 'package:my_side_client/TabMyPage/widget/myPageMainIconButton.dart';

class MypageNotLogedInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double scrHeight = MediaQuery.of(context).size.height;
    double scrWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xFF3BD7E2),
      appBar: AppBar(
        backgroundColor: Color(0xFF3BD7E2),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: scrWidth,
              child: Padding(
                padding: EdgeInsets.fromLTRB(34.5, 0, 34.5, 40),
                child: Container(
                  child: Column(
                    children: [
                      Opacity(
                        opacity: 0.4,
                        child: SvgPicture.asset('assets/user.svg'),
                      ),
                      SizedBox(
                        height: 0.0197 * scrHeight,
                      ),
                      Opacity(
                        opacity: 0.4,
                        child: SvgPicture.asset('assets/GuestText.svg'),
                      ),
                      SizedBox(
                        height: 0.0197 * scrHeight,
                      ),
                      Opacity(
                        opacity: 0.4,
                        child: SvgPicture.asset('assets/tag_warp.svg'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30),
                  topLeft: Radius.circular(30),
                ),
              ),
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 0.0197 * scrHeight,
                  vertical: 0.0394 * scrHeight,
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Opacity(
                          opacity: 0.4,
                          child: MyPageMainIconButton(
                            scrHeight: scrHeight,
                            iconImageNm: 'assets/list.svg',
                            iconText: '건강 데이터',
                            onTap: () {},
                          ),
                        ),
                        Spacer(),
                        Opacity(
                          opacity: 0.4,
                          child: MyPageMainIconButton(
                            scrHeight: scrHeight,
                            iconImageNm: 'assets/pen.svg',
                            iconText: '프로필 수정',
                            onTap: () {},
                          ),
                        ),
                        Spacer(),
                        Opacity(
                          opacity: 0.4,
                          child: MyPageMainIconButton(
                            scrHeight: scrHeight,
                            iconImageNm: 'assets/heart.svg',
                            iconText: '좋아요 목록',
                            onTap: () {},
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 0.0493 * scrHeight,
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
                      height: 0.0099 * scrHeight,
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(() => LoginMainPage());
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
                      height: 0.19 * scrHeight,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
