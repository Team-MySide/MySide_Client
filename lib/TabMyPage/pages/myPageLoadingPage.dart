import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:my_side_client/TabMyPage/pages/myPageNotLogedInPage.dart';
import 'package:my_side_client/TabMyPage/widget/myPageMainIconButton.dart';

class MyPageLoadingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double scrHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(0xFF3BD7E2),
      appBar: AppBar(
        backgroundColor: Color(0xFF3BD7E2),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              SizedBox(
                height: 0.1255 * scrHeight,
              ),
              Center(
                child: SvgPicture.asset('assets/loadingCircle.svg'),
              ),
              SizedBox(
                height: 0.1452 * scrHeight,
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
                          MyPageMainIconButton(
                            scrHeight: scrHeight,
                            iconImageNm: 'assets/list.svg',
                            iconText: '건강 데이터',
                            onTap: () {},
                          ),
                          Spacer(),
                          MyPageMainIconButton(
                            scrHeight: scrHeight,
                            iconImageNm: 'assets/pen.svg',
                            iconText: '프로필 수정',
                            onTap: () {},
                          ),
                          Spacer(),
                          MyPageMainIconButton(
                            scrHeight: scrHeight,
                            iconImageNm: 'assets/heart.svg',
                            iconText: '좋아요 목록',
                            onTap: () {},
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 0.0493 * scrHeight,
                      ),
                      SvgPicture.asset('assets/loadingHealthData.svg'),
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
