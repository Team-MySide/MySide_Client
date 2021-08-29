import 'package:flutter/material.dart';
import 'package:my_side_client/common/UserProfile.dart';
import 'package:my_side_client/screens/mypagescreens/myPageMain.dart';
import 'package:my_side_client/screens/mypagescreens/myPageNotLogedIn.dart';


class TabMyPage extends StatelessWidget {
  const TabMyPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return UserProfile.isLogin ? MyPageMain() : MyPageNotLogedIn();
    //return MyPageLoadingPage();
  }
}