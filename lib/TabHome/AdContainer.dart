import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'ReasonForFood.dart';

class AdContainer extends StatelessWidget {
  List<Map> items = [
    {
      "title": "아무 음식이나 먹으면 안되는 이유?",
      "content": "질병별 추천음식을 알아보세요.",
      "path": "images/ad1.png",
      "not": "images/svg/no.svg"
    }
  ];
  AdContainer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        // height: 152,
        // width: double.infinity,
        child: GestureDetector(
            child: AdTile(items[0]),
            onTap: () => Get.to(
                  () => ReasonForFood(),
                ))
        // child: ListView.builder(
        //     scrollDirection: Axis.horizontal,
        //     itemCount: items.length,
        //     itemBuilder: (BuildContext context, int index) {
        //       return AdTile(items[index]);
        //     })
        );
  }
}

class AdTile extends StatelessWidget {
  final Map item;
  const AdTile(this.item, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 50),
        child: Stack(children: [
          Container(
              height: 152, child: Image.asset(item['path'], fit: BoxFit.fill)),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 31, vertical: 26),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 108,
                  height: 100,
                  child: Column(
                    children: [
                      Text(item['title'],
                          style: TextStyle(
                              color: Color(0xFFFFFFFF), fontSize: 18)),
                      Text(item['content'],
                          style:
                              TextStyle(color: Color(0xFFFFFFFF), fontSize: 12))
                    ],
                  ),
                ),
                SizedBox(
                    width: 80, height: 72, child: SvgPicture.asset(item['not']))
              ],
            ),
          )
        ]));
  }
}
