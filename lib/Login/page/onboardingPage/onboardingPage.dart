import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:my_side_client/Login/page/loginPage/loginMainPage.dart';
import 'package:my_side_client/Login/widget/longRoundButton.dart';
import 'package:my_side_client/Login/widget/richTextWithQuotes.dart';
import 'package:my_side_client/Login/widget/richTextWithoutQuotes.dart';
import 'package:my_side_client/MainTab.dart';
import 'package:page_indicator/page_indicator.dart';

class FirstOnboardingPage extends StatelessWidget {
  final PageController pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    double scrHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: PageIndicatorContainer(
        child: PageView(
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(
                0.0653 * scrHeight,
                0.1466 * scrHeight,
                0.0653 * scrHeight,
                0.1108 * scrHeight,
              ),
              child: Column(
                children: [
                  RichTextWithQuotes(
                    firstText: '암에 좋은 음식',
                    secondText: '이 궁금할 때',
                  ),
                  SizedBox(
                    height: 0.0099 * scrHeight,
                  ),
                  RichTextWithoutQuotes(
                    firstText: '검색',
                    secondText: '해보세요',
                  ),
                  SizedBox(
                    height: 0.036 * scrHeight,
                  ),
                  Image.asset('assets/onboarding.png'),
                  SizedBox(
                    height: 0.036 * scrHeight,
                  ),
                  buildSmallRichText('\'이웃집\'', '이라는 알고 지내던 사이처럼,'),
                  Text(
                    '힘든 시기에 가까이에서 힘이 되어줄 수 있는',
                    style: TextStyle(
                      color: Color(0xFF666666),
                      fontSize: 14.0,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  buildSmallRichText('이웃집 닥터', ' 입니다.'),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.fromLTRB(
                0.0197 * scrHeight,
                0.1466 * scrHeight,
                0.0197 * scrHeight,
                0.1108 * scrHeight,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  RichTextWithQuotes(
                    firstText: '환우 정보',
                    secondText: '를 입력하면',
                  ),
                  SizedBox(
                    height: 0.0099 * scrHeight,
                  ),
                  RichTextWithoutQuotes(
                    firstText: '음식을 추천',
                    secondText: '해드려요',
                  ),
                  SizedBox(
                    height: 0.036 * scrHeight,
                  ),
                  Image.asset('assets/imgonboarding.png'),
                  SizedBox(
                    height: 0.0308 * scrHeight,
                  ),
                  Text(
                    '로그인을 하시고 정확한 데이터를 입력하시면',
                    style: TextStyle(
                      color: Color(0xFF666666),
                      fontSize: 14.0,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  Text(
                    '맞춤형 음식을 추천해드립니다.',
                    style: TextStyle(
                      color: Color(0xFF666666),
                      fontSize: 14.0,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  SizedBox(
                    height: 0.0369 * scrHeight,
                  ),
                  LongRoundButton(
                    buttonText: '회원가입/로그인',
                    scrHeight: scrHeight,
                    activated: true,
                    validateFunc: () {
                      Get.to(() => LoginMainPage());
                    },
                  ),
                  SizedBox(
                    height: 0.01 * scrHeight,
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(() => MainTab());
                    },
                    child: Text(
                      '둘러보기',
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Color(0xFFAAAAAA),
                        fontSize: 14.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        align: IndicatorAlign.bottom,
        length: 2,
        indicatorColor: Color(0xFFAAAAAA),
        indicatorSelectorColor: Color(0xFF3BD7E2),
        padding: EdgeInsets.only(bottom: 0.11 * scrHeight),
      ),
    );
  }

  Widget buildSmallRichText(String firstText, String secondText) {
    return Center(
      child: RichText(
        text: TextSpan(
          text: firstText,
          style: TextStyle(
            color: Color(0xFF666666),
            fontSize: 14.0,
            fontWeight: FontWeight.w700,
          ),
          children: [
            TextSpan(
              text: secondText,
              style: TextStyle(
                color: Color(0xFF666666),
                fontSize: 14.0,
                fontWeight: FontWeight.w300,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
