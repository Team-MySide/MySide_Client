import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_side_client/Constants.dart';

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
        : Align(child: _header(title), alignment: Alignment.centerLeft);
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

class SearchContainer extends StatelessWidget {
  final TextEditingController _textEditingController;
  const SearchContainer(this._textEditingController, {Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 42,
        child: Column(children: [
          Expanded(
              child: TextField(
                  // textAlignVertical: TextAlignVertical.center,
                  controller: _textEditingController,
                  textInputAction: TextInputAction.search,
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
                      borderSide:
                          const BorderSide(color: Colors.grey, width: 0.0),
                      borderRadius:
                          const BorderRadius.all(const Radius.circular(30.0)),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color(Constants.primaryColorInt), width: 0),
                        borderRadius: const BorderRadius.all(
                            const Radius.circular(30.0))),
                  ),
                  style: TextStyle(
                      fontSize: 18, textBaseline: TextBaseline.alphabetic))),
        ]));
  }
}

class CategoryContainer extends StatelessWidget {
  final diseases;
  CategoryContainer(this.diseases, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: Axis.horizontal,
      crossAxisAlignment: WrapCrossAlignment.start,
      alignment: WrapAlignment.start,
      spacing: 7.5,
      runSpacing: 7.5,
      children: _getCategories(diseases),
    );
  }
}

_getCategories(var diseases) {
  List<Widget> ret = [];
  for (var d in diseases) {
    ret.add(Container(
        width: 104,
        height: 95,
        decoration: BoxDecoration(
          border: Border.all(color: Color(0xFFDDDDDD)),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            SizedBox(height: 18),
            SizedBox(width: 32, height: 32, child: SvgPicture.asset(d['path'])),
            SizedBox(height: 9.87),
            Text(d['disease'])
          ],
        )));
  }
  return ret;
}
