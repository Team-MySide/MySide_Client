import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:my_side_client/common/Data/MenuData.dart';

import 'ReasonForFood.dart';

class AdContainer extends StatelessWidget {
  AdContainer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: GestureDetector(
            child: AdTile(adContainerItem),
            onTap: () => Get.to(
                  () => ReasonForFood(),
                )));
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
              width: MediaQuery.of(context).size.width,
              height: 152,
              child: Image.asset(item['path'], fit: BoxFit.cover)),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 31, vertical: 26),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                    flex: 1,
                    child: Container(
                      width: 108,
                      height: 100,
                      child: Column(
                        children: [
                          Text(item['title'],
                              style: TextStyle(
                                  color: Color(0xFFFFFFFF), fontSize: 18)),
                          SizedBox(
                            height: 2,
                          ),
                          Text(item['content'],
                              style: TextStyle(
                                  color: Color(0xFFFFFFFF), fontSize: 12))
                        ],
                      ),
                    )),
                Flexible(
                    flex: 1,
                    child: SizedBox(
                        width: 80,
                        height: 72,
                        child: SvgPicture.asset(item['not'])))
              ],
            ),
          )
        ]));
  }
}
