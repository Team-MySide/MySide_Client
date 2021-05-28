import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_side_client/TabMyPage/controller/faqController.dart';
import 'package:my_side_client/TabMyPage/widget/faqContainer.dart';

class FAQPage extends StatelessWidget {
  final FaqController faqCtrler = Get.put(FaqController());

  @override
  Widget build(BuildContext context) {
    double scrHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'FAQ',
          style: TextStyle(
            color: Color(0xFF111111),
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: GetBuilder<FaqController>(
          builder: (ctrler) {
            return Padding(
              padding: EdgeInsets.only(top: 0.0296 * scrHeight),
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: ctrler.faqList.length,
                itemBuilder: (BuildContext context, int index) {
                  return FAQContainer(
                    scrHeight: scrHeight,
                    headTitle: ctrler.faqList[index].headTitle,
                    question: ctrler.faqList[index].qusestion,
                    answer: ctrler.faqList[index].answer,
                    selected: ctrler.clicked[index],
                    toggleFunc: () {
                      ctrler.showAnswer(index);
                    },
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
