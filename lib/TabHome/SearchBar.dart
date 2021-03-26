import 'package:flutter/material.dart';

import '../Constants.dart';

// ignore: must_be_immutable
class SearchBar extends StatelessWidget {
  TextEditingController _textEditingController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return
        // ConstrainedBox(
        // constraints:
        // BoxConstraints(minHeight: 80),
        Container(
            child: Column(children: [
      Container(
          height: 64,
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
                      borderRadius:
                          const BorderRadius.all(const Radius.circular(30.0))),
                ),
              )),
              SizedBox(width: 25),
              SizedBox(
                  // width: 21,
                  // height: 24,
                  child: IconButton(
                      onPressed: _callNotification,
                      icon: const Icon(Icons.notifications_none)))
            ],
          )),
      Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                  width: 104,
                  height: 40,
                  child: _button("병명검색", "images/icondiseasesearch.png")),
              SizedBox(
                  width: 104,
                  height: 40,
                  child: _button("성분검색", "images/ingredient.png")),
              SizedBox(
                  width: 104,
                  height: 40,
                  child: _button("음식검색", "images/icondiseasesearch.png"))
            ],
          )),
      SizedBox(height: 45)
    ]));
  }

  TextButton _button(String title, String iconPath) {
    return TextButton(
        onPressed: () {},
        style: _buttonRoundShape(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(width: 16, height: 14, child: Image.asset(iconPath)),
            Text(title, style: TextStyle(fontSize: 14))
          ],
        ));
  }

  ButtonStyle _buttonRoundShape() {
    return ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Color(0xFFF3F4F4)),
        foregroundColor: MaterialStateProperty.all(Color(0xFF666666)),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Constants.tagButtonRadius),
        )));
  }

  _callNotification() {}
}
