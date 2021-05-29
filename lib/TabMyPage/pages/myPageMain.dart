import 'package:flutter/material.dart';
import 'package:my_side_client/TabMyPage/widget/dataListWidget.dart';
import 'package:my_side_client/TabMyPage/widget/myPageMainIconButton.dart';
import 'package:my_side_client/TabMyPage/widget/whiteRoundTextWidget.dart';

class MyPageMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double scrHeight = MediaQuery.of(context).size.height;
    double scrWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xFF3BD7E2),
      appBar: AppBar(
        backgroundColor: Color(0xFF3BD7E2),
        elevation: 0,
        actions: [
          IconButton(icon: Image.asset('assets/top.png'), onPressed: () {})
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 0.3399 * scrHeight,
              width: scrWidth,
              child: Padding(
                padding: EdgeInsets.fromLTRB(34.5, 0, 34.5, 40),
                child: Column(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.cyan,
                      radius: 0.0605 * scrHeight,
                      backgroundImage: AssetImage('assets/person_face.jpg'),
                    ),
                    SizedBox(
                      height: 0.0197 * scrHeight,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '푸른숲님',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          width: 0.006 * scrWidth,
                        ),
                        Text(
                          '(홍길동 환우)',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 0.0197 * scrHeight,
                    ),
                    Wrap(
                      
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        WhiteRountTextWidget(
                          textInside: '#위암',
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        WhiteRountTextWidget(
                          textInside: '#2기',
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        WhiteRountTextWidget(
                          textInside: '#수술전',
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        WhiteRountTextWidget(
                          textInside: '#고혈압',
                        ),
                      ],
                    ),
                  ],
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
                      height: 0.059 * scrHeight,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '건강 데이터 목록',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(
                          width: 0.1872 * scrHeight,
                        ),
                        Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () {},
                            child: Text(
                              '더보기 +',
                              style: TextStyle(
                                color: Color(0xFF666666),
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    DataListWidget(
                      dataNum: 2,
                      scrHeight: scrHeight,
                      isMain: true,
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
