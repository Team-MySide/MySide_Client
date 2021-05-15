import 'dart:developer';

import 'package:flutter/material.dart';

class SearchHistory extends StatelessWidget {
  const SearchHistory({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
          padding: EdgeInsets.only(top: 40, left: 16, right: 11),
          child: Column(
            children: [
              Container(
                child: Row(
                  children: [
                    Text("인기 검색",
                        style: TextStyle(
                            fontSize: 14,
                            color: Color(0xFF666666),
                            fontWeight: FontWeight.w500)),
                    Text("기준",
                        style: TextStyle(
                            fontSize: 12,
                            color: Color(0xFF666666),
                            fontWeight: FontWeight.w300))
                  ],
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                ),
                // decoration: BoxDecoration(color: Color(0xFF677777)),
              ),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                      child: Wrap(
                        spacing: 8,
                        children: getSearchTags(),
                      ),
                      height: 34)),
              // ListView.builder(
              //     itemBuilder: (BuildContext context, int index) {
              //       return Text(temp[index]["item"]);
              //     },
              //     itemCount: temp.length),
            ],
          )),
      decoration: BoxDecoration(color: Color(0xFFF4F4F4)),
    );
  }
}

List<Widget> getSearchTags() {
  List<Widget> ret = [];
  bool _selected = false;
  ret.addAll(temp
      .map(
        (e) => ChoiceChip(
            selected: _selected,
            label: Text(
              "#${e['item']}",
            ),
            onSelected: (bool selected) {
              log("selected ");
            },
            backgroundColor: Colors.white,
            labelStyle: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w300,
                color: Color(0xFF666666))),
      )
      .toList());
  return ret;
}

List<dynamic> temp = [
  {"item": "포도"},
  {"item": "비타민c"},
  {"item": "바나나"},
  {"item": "노니"},
  {"item": "해바라기씨"},
];

class Header extends StatelessWidget {
  const Header({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [Text("최근 검색 ")],
    );
  }
}
