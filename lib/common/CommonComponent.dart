import 'package:flutter/material.dart';

class HeaderRow extends StatelessWidget {
  final String title;
  final bool isViewMore;
  const HeaderRow(this.title, {this.isViewMore, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isViewMore
        ? Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            _header(title),
            TextButton(
              child: Text("더보기 +",
                  style: TextStyle(fontSize: 21, color: Color(0xFF666666))),
              onPressed: () {},
            ),
          ])
        : _header(title);
  }

  Widget _header(String title) {
    return Text(
      title,
      style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
    );
  }
}
