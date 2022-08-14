import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:my_side_client/Constants.dart';
import 'package:my_side_client/common/UserProfile.dart';
import 'package:my_side_client/wigets/buttonwidget/smallRoundButton.dart';
import 'package:my_side_client/wigets/etcwidgets/buildSettingTile.dart';
import 'package:url_launcher/url_launcher.dart';

class AppSettingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double scrHeight = MediaQuery.of(context).size.height;
    var loginStorage = GetStorage();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(Constants.primaryColorInt),
        title: Text(
          '앱 설정',
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Divider(
              thickness: 1,
              color: Color(0xFFDDDDDD),
            ),
            BuildSettingTile(
              svgPath: 'assets/faq.svg',
              tileText: '문의하기',
              scrHeight: scrHeight,
              onTap: () {
                // Get.toNamed('/FAQ');
                String encodeQueryParameters(Map<String, String> params) {
                  return params.entries
                      .map((MapEntry<String, String> e) =>
                          '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
                      .join('&');
                }

                final Uri emailLaunchUri = Uri(
                  scheme: 'mailto',
                  path: '2022myside@gmail.com',
                  query: encodeQueryParameters(<String, String>{
                    'subject': '이웃집 닥터 문의',
                  }),
                );

                launchUrl(emailLaunchUri);
              },
            ),
            BuildSettingTile(
              svgPath: "images/svg/questionmark2.svg",
              tileText: '자주 하는 질문',
              scrHeight: scrHeight,
              onTap: () {
                Get.toNamed('/FAQ');
              },
            ),
            BuildSettingTile(
              svgPath: 'assets/paper.svg',
              tileText: '이용약관',
              scrHeight: scrHeight,
              onTap: () {
                Get.toNamed('/TermOfService');
              },
            ),
            BuildSettingTile(
              svgPath: 'assets/handshake.svg',
              tileText: '광고/제휴문의',
              scrHeight: scrHeight,
              onTap: () {},
            ),
            BuildSettingTile(
              svgPath: 'assets/logout.svg',
              tileText: '로그아웃',
              scrHeight: scrHeight,
              onTap: () {
                loginStorage.write('email', '');
                loginStorage.write('password', '');
                loginStorage.write('autologin', false);
                UserProfile.token = "";
                UserProfile.isLogin = false;
                Get.offAllNamed('/');
              },
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: 0.0105 * scrHeight,
                horizontal: 0.0211 * scrHeight,
              ),
              child: Row(
                children: [
                  SmallRoundButton(
                    scrHeight: scrHeight,
                    buttonText: '탈퇴하기',
                    onTap: () {
                      Get.toNamed('/dropOut');
                    },
                  ),
                  Spacer(),
                  Text(
                    '현재 버전 1.0',
                    style: TextStyle(
                      color: Color(0xFFAAAAAA),
                      fontSize: 12,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
