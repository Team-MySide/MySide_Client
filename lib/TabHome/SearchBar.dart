import 'package:flutter/material.dart';

import '../Constants.dart';

// ignore: must_be_immutable
class SearchBar extends StatelessWidget {
  TextEditingController _textEditingController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 16, right: 16, top: 20),
        child: Column(children: [
          SizedBox(
            height: 16,
          ),
          Container(
              height: 42,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                      width: 60, //1.5배 why???
                      height: 51,
                      child: IconButton(
                        icon: Image.asset(
                          "images/iconlogo.png",
                        ),
                        onPressed: () => {},
                      )),
                  SizedBox(width: 25),
                  Expanded(
                      child: TextField(
                    controller: _textEditingController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                              const Radius.circular(30.0))),
                    ),
                  )),
                  SizedBox(width: 25),
                  SizedBox(
                      width: 24,
                      height: 24,
                      child:
                          // IconButton(
                          //     onPressed: _callNotification,
                          // icon:
                          Image.asset(
                        "images/notice.png",
                      )
                      // )
                      )
                ],
              )),
          Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                      width: 104,
                      height: 40,
                      child: _button("병명검색", "images/disease.png", 0xFFE4F7FB)),
                  SizedBox(
                      width: 104,
                      height: 40,
                      child:
                          _button("성분검색", "images/ingredient.png", 0xFFFFF6D6)),
                  SizedBox(
                      width: 104,
                      height: 40,
                      child: _button("음식검색", "images/food.png", 0xFFEDF5E9))
                ],
              )),
          SizedBox(height: 21)
        ]));
  }

  TextButton _button(String title, String iconPath, int backgroundColor) {
    return TextButton(
        onPressed: () {},
        style: _buttonRoundShape(backgroundColor),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(width: 16, height: 14, child: Image.asset(iconPath)),
            SizedBox(
              width: 5,
            ),
            Text(title, style: TextStyle(fontSize: 14))
          ],
        ));
  }

  ButtonStyle _buttonRoundShape(int backgroundColor) {
    return ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Color(backgroundColor)),
        foregroundColor: MaterialStateProperty.all(Color(0xFF666666)),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Constants.tagButtonRadius),
        )));
  }

  _callNotification() {}
}
