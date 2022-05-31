import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_side_client/common/CommonComponent.dart';
import 'package:my_side_client/common/UserProfile.dart';
import 'package:my_side_client/controllers/myPageMainController.dart';
import 'package:my_side_client/screens/loginscreens/signupPages/signUpMainPage.dart';
import 'package:my_side_client/screens/mypagescreens/addHealthDataPage.dart';

class LoginRequestBar extends StatelessWidget {
  const LoginRequestBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController(initialPage: 0);

    final MyPageMainController myPageMainController =
        Get.put(MyPageMainController());
    return
        // PageView(
        //   controller: controller,
        //   children: [
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                UserProfile.isLogin
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                            HeaderRow(
                                "${myPageMainController.userData.nickname}님,",
                                isViewMore: false),
                            SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                                width: 204,
                                child: Text(
                                    "${myPageMainController.userData.nickname}님 최근에 변화된게 있으시다면,\n좀 더 자세히 알려주세요.")),
                          ])
                    : const Text.rich(TextSpan(
                        text: "이웃사촌님, 안녕하세요.\n",
                        style: TextStyle(fontSize: 20),
                        children: [
                            TextSpan(
                              text: "로그인",
                              style: TextStyle(
                                  color: Color(0xFF3BD7E2),
                                  fontWeight: FontWeight.bold),
                            ),
                            TextSpan(text: "을 하시면\n"),
                            TextSpan(
                                text: "음식 추천",
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            TextSpan(text: "을 받을 수 있어요!"),
                          ])),
                GestureDetector(
                    onTap: () {
                      if (UserProfile.isLogin) {
                        Get.to(() => AddHealthDataPage());
                      } else {
                        Get.to(SignUpMainPage());
                      }
                    },
                    child: SizedBox(
                      width: 96,
                      height: 96,
                      child: IconButton(
                          onPressed: _goToLogin(),
                          icon: Image.asset("images/loginrequest_arrow.png")),
                    ))
              ],
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
            ));
    //   ],
    // );
  }

  _goToLogin() {}
}
