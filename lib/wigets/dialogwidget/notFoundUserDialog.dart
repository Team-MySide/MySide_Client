import 'package:flutter/material.dart';
import 'package:my_side_client/wigets/dialogwidget/singleButtonDialog.dart';

class NotFountUserDialog extends StatelessWidget {
  final String whichInfo;
  final VoidCallback routeFunc;
  final VoidCallback gotoSignUp;

  NotFountUserDialog({
    @required this.whichInfo,
    @required this.routeFunc,
    @required this.gotoSignUp,
  });

  @override
  Widget build(BuildContext context) {
    double scrHeight = MediaQuery.of(context).size.height;
    return SingleButtonDialog(
      widgetBetween: Column(
        children: [
          Text(
            '검색되는 $whichInfo가 없습니다.',
            style: TextStyle(
              color: Color(0xFF111111),
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            '정보를 다시 한번 정확하게 입력해주세요.',
            style: TextStyle(
              color: Color(0xFF111111),
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(
            height: 0.03 * scrHeight,
          ),
          InkWell(
            onTap: gotoSignUp,
            child: Text(
              '회원가입하러 가기',
              style: TextStyle(
                color: Color(0xFF3BD7E2),
                fontSize: 14,
                fontWeight: FontWeight.w500,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        ],
      ),
      dialogHeight: 0.35 * scrHeight,
      routeFunc: routeFunc,
    );
  }
}
