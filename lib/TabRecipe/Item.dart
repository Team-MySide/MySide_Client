import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Item extends StatelessWidget {
  final int rank;
  const Item( this.rank,{Key key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(
          children: [
            Container(
              width: 164,
              height: 170,
              margin: EdgeInsets.only(left: 16, right: 14),
              child: Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 6),
                    child: ClipRRect(
                      child: Image.asset(
                        'assets/recipe_sample.png',
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    ),
                  ),

                  if(rank<=4)
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: SvgPicture.asset("images/svg/foodranking_$rank.svg"),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Container(
                      height: 52,
                      margin: EdgeInsets.only(right: 16),
                      child: Text("올리브유로 만든 뽀바이 감바스",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ))),
                  Container(height: 23),Container(
                    child: Row(
                      children: [
                        Image.asset('assets/avatar_sample.png'),
                        Container(
                          width: 8,
                        ),
                        Expanded(child: Text("102동 옆집"))
                      ],
                    ),
                    height: 32,
                  ),

                  Container(
                    height: 4,
                  ),
                  Container(
                      height: 21,
                      child: Row(
                        children: [
                          Text("#갑상선암",
                              style: TextStyle(
                                  fontSize: 14, color: Color(0xFF3BD7E2))),
                          Text("#1기",
                              style: TextStyle(
                                  fontSize: 14, color: Color(0xFF3BD7E2))),
                          Text("#치료예정",
                              style: TextStyle(
                                  fontSize: 14, color: Color(0xFF3BD7E2))),
                        ],
                      )),
                  Container(height: 16),
                  Container(
                      height: 16,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset("assets/star_sample.png"),
                          Container(
                            // color: Color(0xDDDDDD),
                            color: Colors.black,
                            width: 1,
                            height: 8,
                          ),
                          Container(width: 10),
                          SvgPicture.asset("images/svg/time.svg"),
                          Container(width: 5),
                          Text("25분",
                              style: TextStyle(
                                height:
                                1, // 없으면 top leading 영역 때문에 텍스트가 아래로 좀 내려감 https://api.flutter.dev/flutter/painting/TextStyle-class.html
                                fontSize: 14,
                                color: Color(0xFF666666),
                                // textBaseline: TextBaseline.ideographic
                              ))
                        ],
                      ))
                ],
              ),
            )
          ],
        ));
  }
}