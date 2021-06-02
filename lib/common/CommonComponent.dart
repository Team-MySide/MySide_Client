import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:my_side_client/Constants.dart';
import 'package:my_side_client/TabHome/SearchBar.dart';
import 'package:my_side_client/TabSearch/SearchDisease.dart';
import 'package:my_side_client/TabSearch/SearchFood.dart';
import 'package:my_side_client/TabSearch/SearchIngredient.dart';

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
  final int bookmark;
  final int like;
  const LikeBookmark({Key key, this.item, this.bookmark, this.like})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        // width: 90,
        height: 14,
        // child: Center(
        child: Row(
          children: [
            Padding(
                padding: EdgeInsets.only(right: 5),
                child: SvgPicture.asset("images/svg/like.svg")),
            Text(like.toString(), style: TextStyle(fontSize: 14)),
            Padding(
                padding: EdgeInsets.only(left: 10, right: 5),
                child: SvgPicture.asset("images/svg/bookmark.svg")),
            Text(bookmark.toString(), style: TextStyle(fontSize: 14)),
          ],
          // ),
        ));
  }
}

class SearchContainer extends StatelessWidget {
  final TextEditingController _textEditingController;
  final Function onChanged;
  // final Future<dynamic> onSubmitted;
  final Function onSubmitted;
  const SearchContainer(this._textEditingController,
      {this.onChanged, this.onSubmitted, Key key})
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
                  onSubmitted: (String value) {
                    print("submitted run");
                    onSubmitted(context);
                  },
                  onChanged: onChanged,
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

class SearchButtonsContainer extends StatelessWidget {
  const SearchButtonsContainer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              child: SizedBox(
                  width: 104,
                  height: 40,
                  child: SearchButton(
                      "병명검색",
                      "images/svg/searchbar_disease.svg",
                      0xFFE4F7FB,
                      0xFF317BBF)),
              onTap: () => Get.to(SearchDisease()),
            ),
            GestureDetector(
              child: SizedBox(
                  width: 104,
                  height: 40,
                  child: SearchButton(
                      "성분검색",
                      "images/svg/searchbar_ingredient.svg",
                      0xFFFFF6D6,
                      0xFFFD8F2A)),
              onTap: () => Get.to(SearchIngredient()),
            ),
            GestureDetector(
                child: SizedBox(
                    width: 104,
                    height: 40,
                    child: SearchButton("음식검색", "images/svg/searchbar_food.svg",
                        0xFFEDF5E9, 0xFF528A36)),
                onTap: () => Get.to(SearchFood()))
          ],
        ));
  }
}

class SearchAutoCompleteContainer extends StatefulWidget {
  SearchAutoCompleteContainer(searchResult, {Key key}) : super(key: key);

  @override
  _SearchAutoCompleteContainerState createState() =>
      _SearchAutoCompleteContainerState();
}

class _SearchAutoCompleteContainerState
    extends State<SearchAutoCompleteContainer> {
  List<String> _searchResult = [];

  @override
  Widget build(BuildContext context) {
    print(_searchResult.length);
    return ListView.builder(
        itemCount: _searchResult.length,
        // shrinkWrap: true,
        itemBuilder: (context, i) {
          return GestureDetector(
            child: Card(
                child: ListTile(
                    title: Text(
              _searchResult[i],
            ))),
            // onTap: () => Get.to()
          );
        });
  }
}
