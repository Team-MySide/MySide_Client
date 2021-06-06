import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_side_client/Login/page/loginPage/signInPage.dart';
import 'package:my_side_client/TabMyPage/controller/myPageMainController.dart';
import 'package:my_side_client/TabMyPage/pages/addHealthDataPage.dart';
import 'package:my_side_client/common/CommonComponent.dart';
import 'package:my_side_client/common/UserProfile.dart';

class LoginRequestBar extends StatelessWidget {
  const LoginRequestBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController(initialPage: 0);
    MyPageMainController userController = Get.put(MyPageMainController());
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
                            HeaderRow("${userController.userData.nickname}님,",
                                isViewMore: false),
                            SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                                width: 204,
                                child: Text(
                                    "${userController.userData.nickname}님 좀 더 자세히 알려주세요.\n최근에 변화된 건 없으셨나요?")),
                          ])
                    : const Text.rich(TextSpan(
                        text: "고객님, 안녕하세요.\n",
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
                        Get.to(SignInPage());
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
