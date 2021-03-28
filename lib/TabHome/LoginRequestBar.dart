import 'package:flutter/material.dart';
import 'package:my_side_client/common/CommonComponent.dart';

class LoginRequestBar extends StatelessWidget {
  const LoginRequestBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          HeaderRow("푸른숲님", isViewMore: false),
          SizedBox(
            height: 10,
          ),
          SizedBox(
              width: 208, child: Text("더 자세하게 음식을 추천받고 싶다면 2단계 정보를 입력해주세요!")),
          SizedBox(
            height: 47,
          )
        ]),
        SizedBox(
          width: 48,
          height: 48,
          child: IconButton(
              onPressed: _goToLogin(),
              icon: Image.asset("images/gotologin.png")),
        )
      ],
    );
  }

  _goToLogin() {}
}
