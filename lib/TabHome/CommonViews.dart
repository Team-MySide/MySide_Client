import 'package:flutter/material.dart';

import '../Constants.dart';

class Tags extends StatelessWidget {
  // final List<String> lst;
  // const Tags({this.lst, Key key}) : super(key: key);
  int forgroundColor = -1;
  int backgroundColor = -1;
  int height;
  Tags(this.lst, {this.height, Key key}) : super(key: key);
  // List<String> lst = ["위암", "비타민E", "곡류"];
  final List<String> lst;
  List<int> forgroundColors = [
    0xFFFFE4E4,
    0xFFFFF2C5,
    0xFFF1E3E3,
  ];
  List<int> backgroundColors = [
    0xFFFFE4E4,
    0xFFFFF2C5,
    0xFFF1E3E3,
  ];
  Map<String, int> tagColorMap = Map();
  Map<String, SizedBox> tagCache = Map();
  @override
  Widget build(BuildContext context) {
    if (lst.length > 0) {
      for (String tag in lst) {
        print("tag : $tag ");
        //왜 오류?
        if (tag.isNotEmpty) {
          if (!tagColorMap.containsKey(tag)) {
            tagColorMap.putIfAbsent(tag, () => forgroundColors[0]);
            forgroundColors.removeAt(0);

            tagColorMap.putIfAbsent(tag, () => forgroundColors[0]);
            SizedBox tb = SizedBox(
                height: 22,
                child: TextButton(
                    onPressed: () {},
                    child: Text(tag,
                        style: TextStyle(
                            fontSize: 12,
                            // height: 0.5,
                            // decoration: TextDecoration.none)),
                            textBaseline: TextBaseline.ideographic)),
                    style: ButtonStyle(
                        padding: MaterialStateProperty.all(EdgeInsets.zero),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        Constants.tagButtonRadius))),
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Color(0xFF666666)),
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Color(tagColorMap[tag])))));
            tagCache.putIfAbsent(tag, () => tb);
          }
        }
      }
      List<Widget> ret = [];

      for (String tag in lst) {
        if (tag.trim().isNotEmpty) {
          ret.add(tagCache[tag]);
        }
      }
      return Wrap(spacing: 6, direction: Axis.horizontal, children: ret);
    } else {
      return null;
    }
  }
}

class ColorTag extends StatelessWidget {
  const ColorTag(this.tag, this.foreColor, this.backColor, {Key key})
      : super(key: key);
  final String tag;
  final int foreColor;
  final int backColor;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 22,
        child: TextButton(
            onPressed: () {},
            child: Text(tag,
                style: TextStyle(
                    fontSize: 12,
                    // height: 0.5,
                    // decoration: TextDecoration.none)),
                    textBaseline: TextBaseline.ideographic)),
            style: ButtonStyle(
                padding: MaterialStateProperty.all(EdgeInsets.zero),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(Constants.tagButtonRadius))),
                foregroundColor:
                    MaterialStateProperty.all<Color>(Color(foreColor)),
                backgroundColor:
                    MaterialStateProperty.all<Color>(Color(backColor)))));
  }
}
