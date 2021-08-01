import 'package:flutter/material.dart';
import 'package:my_side_client/TabMyPage/pages/myPageNotLogedInPage.dart';
import 'package:my_side_client/common/UserProfile.dart';

import 'pages/myPageMain.dart';

class TabMyPage extends StatelessWidget {
  const TabMyPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return UserProfile.isLogin ? MyPageMain() : MypageNotLogedInPage();
    //return MyPageLoadingPage();
  }
}
