import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
                  style: TextStyle(fontSize: 14, color: Color(0xFF666666))),
              onPressed: () {},
            ),
          ])
        : _header(title);
  }

  Widget _header(String title) {
    return Text(
      title,
      style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
    );
  }
}

class LikeBookmark extends StatelessWidget {
  final Map item;
  final String bookmark;
  final String like;
  const LikeBookmark({Key key, this.item, this.bookmark, this.like})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 90,
      height: 14,
      child: Row(children: [
        Padding(
            padding: EdgeInsets.only(right: 5),
            child: SvgPicture.asset("images/svg/like.svg")),
        Text(like, style: TextStyle(fontSize: 14)),
        Padding(
            padding: EdgeInsets.only(left: 10, right: 5),
            child: SvgPicture.asset("images/svg/bookmark.svg")),
        Text(bookmark, style: TextStyle(fontSize: 14)),
      ]),
    );
  }
}
