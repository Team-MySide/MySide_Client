import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:my_side_client/TabMyPage/pages/dropOutPage.dart';
import 'package:my_side_client/TabMyPage/pages/faqPage.dart';
import 'package:my_side_client/TabMyPage/widget/smallRoundButton.dart';

class AppSettingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double scrHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          '앱 설정',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Color(0xFF111111),
          ),
        ),
        actions: [
          IconButton(
              icon: SvgPicture.asset('assets/Setting.svg'), onPressed: () {}),
        ],
      ),
      body: Container(
        child: Column(
          children: [
            Divider(
              thickness: 1,
              color: Color(0xFFDDDDDD),
            ),
            buildSettingTile('assets/faq.svg', 'FAQ', scrHeight, () {
              Get.to(() => FAQPage());
            }),
            buildSettingTile('assets/paper.svg', '이용약관', scrHeight, () {}),
            buildSettingTile(
                'assets/handshake.svg', '광고/제휴문의', scrHeight, () {}),
            buildSettingTile('assets/logout.svg', '로그아웃', scrHeight, () {}),
            SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 16,
                ),
                SmallRoundButton(
                  buttonText: '탈퇴하기',
                  onTap: () {
                    Get.to(() => DropOutPage());
                  },
                  buttonWidth: 60,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSettingTile(
      String svgPath, String tileText, double scrHeight, VoidCallback onTap) {
    return Column(
      children: [
        Container(
          height: 0.0616 * scrHeight,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 0.0197 * scrHeight,
            ),
            child: Row(
              children: [
                SvgPicture.asset(svgPath),
                Spacer(),
                Container(
                  width: 0.38 * scrHeight,
                  child: Text(
                    tileText,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF111111),
                    ),
                  ),
                ),
                Spacer(),
                InkWell(
                  child: SvgPicture.asset('assets/arrowright.svg'),
                  onTap: onTap,
                ),
              ],
            ),
          ),
        ),
        Divider(
          thickness: 1,
          color: Color(0xFFDDDDDD),
        ),
      ],
    );
  }
}
