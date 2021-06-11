import 'package:flutter/material.dart';
import 'package:my_side_client/common/CommonComponent.dart';

import '../Constants.dart';

class ColorTags extends StatelessWidget {
  // final List<String> lst;
  // const Tags({this.lst, Key key}) : super(key: key);
  int forgroundColor = -1;
  int backgroundColor = -1;
  int height;
  ColorTags(this.lst, {this.height, Key key}) : super(key: key);
  // List<String> lst = ["위암", "비타민E", "곡류"];
  final List<String> lst;
  List<dynamic> colorList = [
    {
      'foreground': 0xFF5091CD,
      'background': 0xFFE4F7FB,
    },
    {
      'foreground': 0xFFFF9635,
      'background': 0xFFFFF6D6,
    },
    {
      'foreground': 0xFF629848,
      'background': 0xFFE1F0DB,
    }
  ];

  Map<String, dynamic> tagColorMap = Map();
  Map<String, Widget> tagCache = Map();
  @override
  Widget build(BuildContext context) {
    if (lst.length > 0) {
      for (String tag in lst) {
        // print("tag : $tag ");
        //왜 오류?
        if (tag.isNotEmpty) {
          if (!tagColorMap.containsKey(tag)) {
            tagColorMap.putIfAbsent(tag, () => colorList[0]);
            colorList.removeAt(0);

            Widget tb = ColorTag(tag, tagColorMap[tag]['foreground'],
                tagColorMap[tag]['background']);
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
      return Wrap(
          spacing: 6, runSpacing: 6, direction: Axis.horizontal, children: ret);
    } else {
      return null;
    }
  }
}

class ColorTag extends StatelessWidget {
  final String tag;
  final int foregroundColor;
  final int backgroundColor;
  const ColorTag(this.tag, this.foregroundColor, this.backgroundColor,
      {Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 22,
        child: Chip(
            label: Text(tag,
                style: TextStyle(
                  fontSize: 12,
                  color: Color(foregroundColor),
                  textBaseline: TextBaseline.ideographic,
                )),
            labelPadding: EdgeInsets.fromLTRB(5, -5, 5, 0),
            backgroundColor: Color(backgroundColor),
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap));
  }
}

Widget getImage(String path) {
  return FadeInImage.assetNetwork(
      image: path,
      placeholder: Constants.IMG_PLACE_HOLDER_GREY,
      // placeholderScale: 0.5,
      placeholderCacheWidth: 52,
      placeholderCacheHeight: 44,
      imageErrorBuilder: (context, _, __) {
        return SizedBox(width: 52, height: 44, child: ImageLoadFailedGrey());
      });
}
