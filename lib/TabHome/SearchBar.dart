import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:my_side_client/TabHome/TotalSearch/TotalSearchController.dart';
import 'package:my_side_client/common/CommonComponent.dart';

import '../Constants.dart';

// ignore: must_be_immutable
class SearchBar extends StatefulWidget {
  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  TextEditingController _textEditingController = new TextEditingController();

  DownloadTotalSearchListController _searchController =
      Get.put(DownloadTotalSearchListController());

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
                      child: SearchContainer(_textEditingController,
                          onChanged: onSearchTextChanged)),
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
          _searchResult.length == 0
              ? SearchButtonsContainer()
              : ConstrainedBox(
                  constraints: BoxConstraints(maxHeight: 250, minHeight: 10),
                  child: ListView.separated(
                      itemCount: _searchResult.length,
                      shrinkWrap: true,
                      separatorBuilder: (_, __) {
                        return SizedBox(height: 0);
                      },
                      itemBuilder: (context, i) {
                        return GestureDetector(
                          child: Card(
                              child: Padding(
                                  padding: EdgeInsets.all(4),
                                  child: Text(_searchResult[i],
                                      style: TextStyle(fontSize: 14)))),
                          // onTap: () => Get.to()
                        );
                      })),
          SizedBox(height: 21)
        ]));
  }

  List<String> _searchResult = [];

  onSearchTextChanged(String text) async {
    _searchResult.clear();
    if (text.isEmpty) {
      setState(() {});
      return;
    }
    _searchController.lst.forEach((item) {
      if (item.contains(text)) {
        _searchResult.add(item);
      }
    });
    setState(() {});
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
