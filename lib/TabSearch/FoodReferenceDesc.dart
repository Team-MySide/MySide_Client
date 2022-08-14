import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'SearchDetailReferenceDesc/SearchDetailReferenceDesc.dart';
import 'SearchDetailReferenceDesc/SearchDetailReferenceDescController.dart';

class FoodReferenceDesc extends StatefulWidget {
  FoodReferenceDesc({Key key}) : super(key: key);

  @override
  State<FoodReferenceDesc> createState() => _FoodReferenceDescState();
}

class _FoodReferenceDescState extends State<FoodReferenceDesc> {
  // final String cancerNm = Get.parameters["cancerNm"];
  final String cancerNm = Get.arguments[0];
  final String food = Get.arguments[1];
  final String code = Get.arguments[2];

  SearchDetailReferenceDescController controller = Get.put(
      SearchDetailReferenceDescController(
          Get.arguments[0], Get.arguments[1], Get.arguments[2]));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Obx(() => controller.isLoading.value
            ? Text("출처", style: TextStyle(color: Colors.black))
            : Text("출처 ($cancerNm)", style: TextStyle(color: Colors.black))),
      ),
      body: Obx(() => controller.isLoading.value
          ? Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                  child: Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 28,
                  ),
                  Header(code: code),
                  SizedBox(
                    height: 16,
                  ),
                  ...getWidget(controller.list)
                ],
              )),
            )),
    );
  }

  List<Widget> getWidget(List<SearchDetailReferenceDescItem> lst) {
    var ret = <Widget>[];
    lst.forEach((element) {
      ret.add(MiddleText(item: controller.list[0]));
      ret.add(SizedBox(
        height: 5,
      ));
      ret.add(Text(
        "${controller.list[0].comment}",
        style: TextStyle(color: Color(0xFF666666), height: 1.5),
      ));
      ret.add(SizedBox(
        height: 16,
      ));
    });
    return ret;
  }
}

class MiddleText extends StatelessWidget {
  const MiddleText({
    Key key,
    @required this.item,
  }) : super(key: key);

  final SearchDetailReferenceDescItem item;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          child: Text(
            item.sourceDate.length >= 10
                ? "* ${item.source} / ${item.headline} / ${item.sourceDate.substring(0, 10)}"
                : "* ${item.source} / ${item.headline} ",
            style: TextStyle(
                color: Color(0xFF666666),
                fontSize: 16,
                height: 1.5,
                fontWeight: FontWeight.w600),
          ),
        ),
      ],
    );
  }
}

class Header extends StatelessWidget {
  const Header({
    Key key,
    @required this.code,
  }) : super(key: key);

  final String code;

  @override
  Widget build(BuildContext context) {
    return code == "0"
        ? Text("효과있음", style: TextStyle(color: Color(0xFF7EC05E), fontSize: 18))
        : code == "2"
            ? Text("의견갈림",
                style: TextStyle(color: Color(0xFFFECE00), fontSize: 18))
            : Text("주의",
                style: TextStyle(color: Color(0xFFFA665B), fontSize: 18));
  }
}
