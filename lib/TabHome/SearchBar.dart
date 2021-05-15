import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
                    width: 40, //1.5배 why???
                    height: 34.05,
                    // child: IconButton(
                    //   icon:
                    child: Image.asset(
                      "images/searchbar_logo.png",
                    ),
                    // icon: SvgPicture.asset("images/svg/home_selected.svg"),
                    // onPressed: () => {},
                    // )
                  ),
                  SizedBox(width: 16),
                  Expanded(
                      child: TextField(
                          // textAlignVertical: TextAlignVertical.center,
                          controller: _textEditingController,
                          decoration: InputDecoration(
                            hintText: "사과",
                            hintStyle: TextStyle(color: Color(0xFF999999)),
                            contentPadding: EdgeInsets.only(left: 16.0),
                            suffixIcon: Container(
                                padding: EdgeInsets.all(13),
                                child: SvgPicture.asset(
                                    "images/svg/searchbar_search.svg")),
                            enabledBorder: const OutlineInputBorder(
                              // width: 0.0 produces a thin "hairline" border
                              borderSide: const BorderSide(
                                  color: Colors.grey, width: 0.0),
                              borderRadius: const BorderRadius.all(
                                  const Radius.circular(30.0)),
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color(Constants.primaryColorInt),
                                    width: 0),
                                borderRadius: const BorderRadius.all(
                                    const Radius.circular(30.0))),
                          ),
                          style: TextStyle(
                              fontSize: 18,
                              textBaseline: TextBaseline.alphabetic))),
                  SizedBox(width: 16),
                  SizedBox(
                      width: 24,
                      height: 24,
                      child:
                          // IconButton(
                          //     onPressed: _callNotification,
                          // icon:
                          SvgPicture.asset(
                        "images/svg/searchbar_notice.svg",
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
                      child: SearchButton(
                          "병명검색",
                          "images/svg/searchbar_disease.svg",
                          0xFFE4F7FB,
                          0xFF317BBF)),
                  SizedBox(
                      width: 104,
                      height: 40,
                      child: SearchButton(
                          "성분검색",
                          "images/svg/searchbar_ingredient.svg",
                          0xFFFFF6D6,
                          0xFFFD8F2A)),
                  SizedBox(
                      width: 104,
                      height: 40,
                      child: SearchButton(
                          "음식검색",
                          "images/svg/searchbar_food.svg",
                          0xFFEDF5E9,
                          0xFF528A36))
                ],
              )),
          SizedBox(height: 21)
        ]));
  }

  _callNotification() {}
}

TextButton SearchButton(
    String title, String iconPath, int backgroundColor, int textColor) {
  return TextButton(
      // onPressed: () {},
      style: _buttonRoundShape(backgroundColor),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(width: 16, height: 14, child: SvgPicture.asset(iconPath)),
          SizedBox(
            width: 5,
          ),
          Text(title, style: TextStyle(fontSize: 14, color: Color(textColor)))
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
