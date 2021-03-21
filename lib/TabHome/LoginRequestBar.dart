import 'package:flutter/material.dart';

class LoginRequestBar extends StatelessWidget {
  const LoginRequestBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text("고객님, 안녕하세요. \n 로그인을 하시면 \n 음식 추천을 받을 수 있어요!"),
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text("로그인하러 가기"),
          IconButton(
              onPressed: _goToLogin(), icon: Icon(Icons.arrow_right_outlined))
        ],
      )
    ]);
  }

  _goToLogin() {}
}
