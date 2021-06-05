import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_side_client/TabMyPage/controller/termsOfServiceController.dart';

class TermsOfServicePage extends StatelessWidget {
  final TermsOfServiceController termsOfServiceController =
      Get.put(TermsOfServiceController());
  @override
  Widget build(BuildContext context) {
    double scrHeight = MediaQuery.of(context).size.height;
    double scrWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          '이용약관',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Color(0xFF111111),
          ),
        ),
      ),
      body: GetBuilder<TermsOfServiceController>(builder: (ctrl) {
        return Container(
          padding: EdgeInsets.only(top: 0.0197 * scrHeight),
          child: Column(
            children: [
              buildSelectButtons(
                  scrWidth, scrHeight, ctrl.termofservice, ctrl.onClicked),
              Container(
                padding: EdgeInsets.symmetric(
                  vertical: 0.0296 * scrHeight,
                  horizontal: 0.0197 * scrHeight,
                ),
                width: double.infinity,
                child: ctrl.termofservice
                    ? Text('이것은 개인정보 취급방침 내용입니다.')
                    : Text('이것은 이용약관에 관련한 내용입니다.'),
              ),
            ],
          ),
        );
      }),
    );
  }

  Widget buildSelectButtons(double scrWidth, double scrHeight,
      bool termsofservice, Function onClick) {
    return Row(
      children: [
        InkWell(
          onTap: () {
            onClick(0);
          },
          child: Container(
            width: scrWidth * 0.5,
            decoration: BoxDecoration(
              border: !termsofservice
                  ? Border(
                      bottom: BorderSide(
                        color: Color(0xFF3BD7E2),
                        width: 3,
                      ),
                    )
                  : Border(),
            ),
            padding: EdgeInsets.symmetric(vertical: 0.0099 * scrHeight),
            child: Center(
              child: Text(
                '이용약관',
                style: TextStyle(
                  color:
                      !termsofservice ? Color(0xFF3BD7E2) : Color(0xFF666666),
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ),
        InkWell(
          onTap: () {
            onClick(1);
          },
          child: Container(
            width: scrWidth * 0.5,
            decoration: BoxDecoration(
              border: termsofservice
                  ? Border(
                      bottom: BorderSide(
                        color: Color(0xFF3BD7E2),
                        width: 3,
                      ),
                    )
                  : Border(),
            ),
            padding: EdgeInsets.symmetric(vertical: 0.0099 * scrHeight),
            child: Center(
              child: Text(
                '개인정보 취급방침',
                style: TextStyle(
                  color: termsofservice ? Color(0xFF3BD7E2) : Color(0xFF666666),
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
