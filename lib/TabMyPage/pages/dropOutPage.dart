import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_side_client/Login/page/loginPage/loginMainPage.dart';
import 'package:my_side_client/Login/widget/longRoundButton.dart';
import 'package:my_side_client/TabMyPage/controller/dropOutReasonController.dart';
import 'package:my_side_client/TabMyPage/widget/decorationForInput.dart';

class DropOutPage extends StatelessWidget {
  final DropOutReasonController dorCntrler = Get.put(DropOutReasonController());
  @override
  Widget build(BuildContext context) {
    double scrHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          '탈퇴하기',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Color(0xFF111111),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Divider(
              thickness: 1,
              color: Color(0xFFDDDDDD),
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                horizontal: 0.0197 * scrHeight,
                vertical: 0.0493 * scrHeight,
              ),
              child: GetBuilder<DropOutReasonController>(
                builder: (ctrler) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '탈퇴 사유를 알려주세요',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                          color: Color(
                            0xFF111111,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 0.0394 * scrHeight,
                      ),
                      Text(
                        '주의사항',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Color(
                            0xFF666666,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 0.0099 * scrHeight,
                      ),
                      Column(
                        children: [
                          buildCausionText(
                              '회원탈퇴 시 계정정보는 복구가 불가하며 1일 이후 재가입이 가능합니다.',
                              scrHeight),
                          buildCausionText(
                              '등록된 좋아요, 찜목록은 자동으로 삭제되지 않습니다. 탈퇴 전 개별적으로 삭제 부탁드립니다.',
                              scrHeight),
                        ],
                      ),
                      SizedBox(
                        height: 0.0369 * scrHeight,
                      ),
                      DecorationForInput(
                        childWidget: Container(
                          width: double.infinity,
                          height: 0.1478 * scrHeight,
                          child: TextField(
                            controller: ctrler.reasonTEC,
                            focusNode: ctrler.reasonFN,
                            maxLines: 4,
                            decoration: InputDecoration(
                              hintText: '내용을 입력해주세요.',
                              hintStyle: TextStyle(
                                color: Color(0xFFAAAAAA),
                                fontSize: 16,
                                fontWeight: FontWeight.w300,
                              ),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        scrHeight: scrHeight,
                        vertPadding: 0,
                        borderColor: ctrler.reasonFN.hasFocus
                            ? Color(0xFF3BD7E2)
                            : Color(0xFFDDDDDD),
                      ),
                      SizedBox(
                        height: 0.0099 * scrHeight,
                      ),
                      Text(
                        '탈퇴하는 이유를 알려주시면 많은 도움이 됩니다.',
                        style: TextStyle(
                          color: ctrler.reasonFN.hasFocus
                              ? Color(0xFF3BD7E2)
                              : Color(0xFFAAAAAA),
                          fontSize: 12,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      SizedBox(
                        height: 0.1478 * scrHeight,
                      ),
                      LongRoundButton(
                        buttonText: '탈퇴하기',
                        scrHeight: scrHeight,
                        activated: ctrler.reasonTEC.text.isNotEmpty,
                        validateFunc: () async {
                          await ctrler.dropOut();
                          Get.to(() => LoginMainPage());
                        },
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCausionText(String causionStr, double scrHeight) {
    return IntrinsicHeight(
      child: Row(
        children: [
          SizedBox(
            width: 0.0123 * scrHeight,
          ),
          Column(
            children: [
              SizedBox(
                height: 0.0123 * scrHeight,
              ),
              Container(
                width: 0.0062 * scrHeight,
                height: 0.0062 * scrHeight,
                decoration: BoxDecoration(
                  color: Color(0xFF666666),
                  shape: BoxShape.circle,
                ),
              ),
              Expanded(
                child: SizedBox(),
              ),
            ],
          ),
          SizedBox(
            width: 0.0123 * scrHeight,
          ),
          Expanded(
            child: Container(
              child: Text(
                causionStr,
                style: TextStyle(
                  color: Color(0xFF666666),
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
