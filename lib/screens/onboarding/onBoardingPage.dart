import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:my_side_client/wigets/buttonwidget/longRoundButton.dart';
import 'package:my_side_client/wigets/textwidget/richTextWithQuotes.dart';
import 'package:my_side_client/wigets/textwidget/richTextWithoutQuotos.dart';
import 'package:page_indicator/page_indicator.dart';

class OnBoardingPage extends StatelessWidget {
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
                    height: 0.0105 * scrHeight,
                  ),
                  RichTextWithoutQuotes(
                    firstText: '검색',
                    secondText: '해보세요',
                  ),
                  SizedBox(
                    height: 0.0382 * scrHeight,
                  ),
                  Image.asset('assets/onboarding.png'),
                  SizedBox(
                    height: 0.0382 * scrHeight,
                  ),
                  buildSmallRichText('\'이웃집\'', '이라는 알고 지내던 사이처럼,'),
                  simpleText('힘든 시기에 가까이에서 힘이 되어줄 수 있는'),
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
                children: [
                  RichTextWithQuotes(
                    firstText: '환우 정보',
                    secondText: '를 입력하면',
                  ),
                  SizedBox(
                    height: 0.0105 * scrHeight,
                  ),
                  RichTextWithoutQuotes(
                    firstText: '음식을 추천',
                    secondText: '해드려요',
                  ),
                  SizedBox(
                    height: 0.0382 * scrHeight,
                  ),
                  Image.asset('assets/imgonboarding.png'),
                  SizedBox(
                    height: 0.0327 * scrHeight,
                  ),
                  simpleText('로그인을 하시고 정확한 데이터를 입력하시면'),
                  simpleText('맞춤형 음식을 추천해드립니다.'),
                  SizedBox(
                    height: 0.0391 * scrHeight,
                  ),
                  LongRoundButton(
                    buttonText: '회원가입/로그인',
                    scrHeight: scrHeight,
                    activated: true,
                    validateFunc: () {
                      Get.toNamed('/LoginMainPage');
                    },
                  ),
                  SizedBox(
                    height: 0.0105 * scrHeight,
                  ),
                  InkWell(
                    onTap: () {
                      // var loginStorage = GetStorage();
                      // loginStorage.write(Constants.isFirstRunApp, false);
                      Get.toNamed('/MainTab');
                    },
                    child: Text(
                      '둘러보기',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFFAAAAAA),
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        length: 2,
        align: IndicatorAlign.bottom,
        indicatorColor: Color(0xFFAAAAAA),
        indicatorSelectorColor: Color(0xFF3BD7E2),
        padding: EdgeInsets.only(bottom: 0.11 * scrHeight),
      ),
    );
  }

  Widget simpleText(String text) {
    return Text(
      text,
      style: TextStyle(
        color: Color(0xFF666666),
        fontSize: 14.0,
        fontWeight: FontWeight.w300,
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
