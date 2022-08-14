import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_side_client/common/CommonHeader.dart';
import 'package:my_side_client/controllers/dropOutController.dart';
import 'package:my_side_client/wigets/buttonwidget/longRoundButton.dart';
import 'package:my_side_client/wigets/textfieldwidget/memoTextField.dart';

class DropOutPage extends StatelessWidget {
  final DropOutController dropOutController = Get.put(DropOutController());
  @override
  Widget build(BuildContext context) {
    double scrHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: CommonAppbar(
        '탈퇴하기',
      ),
      body: GetBuilder<DropOutController>(builder: (controller) {
        return SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: 0.0527 * scrHeight,
                horizontal: 0.0211 * scrHeight,
              ),
              child: Column(
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
                    height: 0.0422 * scrHeight,
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
                    height: 0.0105 * scrHeight,
                  ),
                  buildCausionText(
                    scrHeight,
                    '회원탈퇴 시 계정정보는 복구가 불가하며 1일 이후 재가입이 가능합니다.',
                  ),
                  buildCausionText(
                    scrHeight,
                    '등록된 좋아요, 찜목록은 자동으로 삭제되지 않습니다. 탈퇴 전 개별적으로 삭제 부탁드립니다.',
                  ),
                  SizedBox(
                    height: 0.0395 * scrHeight,
                  ),
                  MemoTextField(
                    scrHeight: scrHeight,
                    textFieldModel: controller.reasonTextField,
                    maxLines: 5,
                  ),
                  SizedBox(
                    height: 0.2 * scrHeight,
                  ),
                  LongRoundButton(
                    buttonText: '탈퇴하기',
                    scrHeight: scrHeight,
                    activated: controller.reasonTextField.tec.text.isNotEmpty,
                    validateFunc: () async {
                      controller.dropOut();
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }

  Widget buildCausionText(double scrHeight, String causionText) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            SizedBox(
              height: 0.0105 * scrHeight,
            ),
            Container(
              width: 0.0052 * scrHeight,
              height: 0.0052 * scrHeight,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFF666666),
              ),
            ),
          ],
        ),
        SizedBox(
          width: scrHeight * 0.0105,
        ),
        Expanded(
          child: Text(
            causionText,
            style: TextStyle(
              color: Color(0xFF666666),
              fontSize: 14,
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
      ],
    );
  }
}
