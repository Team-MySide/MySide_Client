import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_side_client/controllers/faqController.dart';
import 'package:my_side_client/wigets/etcwidgets/faqContainer.dart';

class FaqPage extends StatelessWidget {
  final FaqController faqController = Get.put(FaqController());
  @override
  Widget build(BuildContext context) {
    double scrHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'FAQ',
        ),
      ),
      body: GetBuilder<FaqController>(
        builder: (controller) {
          return SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: controller.faqs.length,
                    itemBuilder: (BuildContext context, int index) {
                      return FAQContainer(
                        scrHeight: scrHeight,
                        headTitle: controller.faqs[index].category,
                        question: controller.faqs[index].title,
                        answer: controller.faqs[index].content,
                        selected: controller.clicked[index],
                        toggleFunc: () {
                          controller.showAnswer(index);
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
