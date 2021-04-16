import 'package:flutter/material.dart';
import 'package:my_side_client/common/CommonComponent.dart';

class LoginRequestBar extends StatelessWidget {
  const LoginRequestBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController(initialPage: 0);
    return
        // PageView(
        //   controller: controller,
        //   children: [
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  HeaderRow("푸른숲님", isViewMore: false),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                      width: 204,
                      child: Text("더 자세하게 음식을 추천받고 싶다면 2단계 정보를 입력해주세요!")),
                ]),
                SizedBox(
                  width: 48,
                  height: 48,
                  child: IconButton(
                      onPressed: _goToLogin(),
                      icon: Image.asset("images/gotologin.png")),
                )
              ],
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
            ));
    //   ],
    // );
  }

  _goToLogin() {}
}
