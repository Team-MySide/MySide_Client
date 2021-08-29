import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_side_client/controllers/termOfServiceController.dart';

class TermsOfServicePage extends StatelessWidget {
  final TermsOfServiceController termsOfServiceController =
      Get.put(TermsOfServiceController());
  @override
  Widget build(BuildContext context) {
    double scrHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '이용약관',
        ),
      ),
      body: GetBuilder<TermsOfServiceController>(
        builder: (controller) {
          return SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    child: Row(
                      children: [
                        buildSelectableText(
                          scrHeight,
                          '이용약관',
                          controller.curInd == 0,
                          () {
                            controller.onClicked(0);
                          },
                        ),
                        buildSelectableText(
                          scrHeight,
                          '개인정보 취급방침',
                          controller.curInd == 1,
                          () {
                            controller.onClicked(1);
                          },
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(scrHeight * 0.0211),
                    child: controller.curInd == 0
                        ? Text(
                            '111111111111111111111111111111111111111111111111')
                        : Text(
                            '222222222222222222222222222222222222222222222222'),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget buildSelectableText(
      double scrHeight, String title, bool isSelected, VoidCallback onTap) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(
            vertical: 0.0105 * scrHeight,
          ),
          decoration: BoxDecoration(
            border: isSelected
                ? Border(
                    bottom: BorderSide(
                      color: Color(0xFF3BD7E2),
                      width: 3,
                    ),
                  )
                : Border(
                    bottom: BorderSide(
                      width: 1,
                      color: Color(0xFFDDDDDD),
                    ),
                  ),
          ),
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                color: isSelected ? Color(0xFF3BD7E2) : Color(0xFF666666),
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
