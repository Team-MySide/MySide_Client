import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_side_client/TabSearch/SearchNutritionDetail/NutritionDetailController.dart';
import 'package:my_side_client/common/CommonHeader.dart';

class NutritionDetail extends StatelessWidget {
  NutritionDetail({key});
  NutritionDetailController controller =
      Get.put(NutritionDetailController(Get.arguments[0], Get.arguments[1]));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CommonAppbar("상세 성분 전체보기"),
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              NutritionMainWidget(controller: controller),
              SizedBox(height: 16),
              Obx(
                () => controller.isLoading.value
                    ? Center(child: CircularProgressIndicator())
                    : Expanded(
                        child: ListView.separated(
                          itemBuilder: ((context, index) {
                            List<String> keys = controller.map.keys.toList();
                            String key = keys[index];

                            return Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(key, style: TextStyle(fontSize: 14)),
                                  Text(controller.map[key].toString(),
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400))
                                ]);
                          }),
                          itemCount: controller.map.length,
                          separatorBuilder: (BuildContext context, int index) {
                            return Divider();
                          },
                        ),
                      ),
              ),
            ],
          ),
        ));
  }
}

class NutritionMainWidget extends StatelessWidget {
  const NutritionMainWidget({
    Key key,
    @required this.controller,
  }) : super(key: key);

  final NutritionDetailController controller;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xFFF4F4F4),
      margin: EdgeInsets.zero,
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "분량기준",
                style: TextStyle(fontSize: 16),
              ),
              Text(
                "100g",
                style: TextStyle(fontSize: 16, color: Color(0xFF666666)),
              )
            ],
          ),
        ),
        SizedBox(
          height: 6,
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 16, left: 16, right: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "에너지",
                style: TextStyle(fontSize: 16),
              ),
              Obx(() => controller.isLoading.value
                  ? Text(
                      "? kcal",
                      style: TextStyle(fontSize: 16, color: Color(0xFF666666)),
                    )
                  : Text(
                      "${controller.energy}kcal",
                      style: TextStyle(fontSize: 16, color: Color(0xFF666666)),
                    ))
            ],
          ),
        ),
      ]),
    );
  }
}