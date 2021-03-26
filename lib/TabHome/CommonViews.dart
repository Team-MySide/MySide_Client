import 'package:flutter/material.dart';

import '../Constants.dart';

class Tags extends StatelessWidget {
  const Tags({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> ret = [];
    List<String> lst = ["위암", "비타민"];
    for (String tag in lst) {
      SizedBox tb = SizedBox(
          height: 24,
          child: TextButton(
              onPressed: () {},
              child: Text(tag, style: TextStyle(fontSize: 12)),
              style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              Constants.tagButtonRadius))),
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Color(0xFF666666)),
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Color(0xFFF4F4F4)))));
      ret.add(SizedBox(
        width: 4,
      ));
      ret.add(tb);
    }
    return Row(children: ret);
  }
}
