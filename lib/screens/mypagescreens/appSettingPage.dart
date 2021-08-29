import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:my_side_client/common/UserProfile.dart';
import 'package:my_side_client/wigets/buttonwidget/smallRoundButton.dart';
import 'package:my_side_client/wigets/etcwidgets/buildSettingTile.dart';

class AppSettingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double scrHeight = MediaQuery.of(context).size.height;
    var loginStorage = GetStorage();
    return Scaffold(
      appBar: AppBar(
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
              tileText: 'FAQ',
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
