import 'package:flutter/material.dart';

import '../Constants.dart';

class Tags extends StatelessWidget {
  // final List<String> lst;
  // const Tags({this.lst, Key key}) : super(key: key);
  Tags({Key key}) : super(key: key);
  // List<String> lst = ["위암", "비타민E", "곡류"];
  List<String> lst = ["위암", "비타민E"];
  List<int> colorLst = [0xFFFFE4E4, 0xFFFFF2C5, 0xFFF1E3E3];
  Map<String, int> tagColorMap = Map();
  Map<String, SizedBox> tagCache = Map();
  @override
  Widget build(BuildContext context) {
    for (String tag in lst) {
      //왜 오류?
      if (!tagColorMap.containsKey(tag)) {
        tagColorMap.putIfAbsent(tag, () => colorLst[0]);
        colorLst.removeAt(0);

        tagColorMap.putIfAbsent(tag, () => colorLst[0]);
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
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
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
    List<Widget> ret = lst.map((element) => tagCache[element]).toList();
    return Wrap(spacing: 6, direction: Axis.horizontal, children: ret);
  }
}
