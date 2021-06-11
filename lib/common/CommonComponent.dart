import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:my_side_client/Constants.dart';
import 'package:my_side_client/Login/page/loginPage/loginMainPage.dart';
import 'package:my_side_client/TabHome/SearchBar.dart';
import 'package:my_side_client/TabSearch/SearchDisease.dart';
import 'package:my_side_client/TabSearch/SearchFood.dart';
import 'package:my_side_client/TabSearch/SearchIngredient.dart';
import 'package:my_side_client/TabSearch/SerachDiseaseResult.dart';
import 'package:shimmer/shimmer.dart';

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
    return Wrap(
      children: [
        Padding(
            padding: EdgeInsets.only(right: 5, top: 2),
            child: SvgPicture.asset("images/svg/like.svg")),
        Text(like.toString(), style: TextStyle(fontSize: 14)),
        Padding(
            padding: EdgeInsets.only(left: 10, right: 5, top: 2),
            child: SvgPicture.asset("images/svg/bookmark.svg")),
        Text(bookmark.toString(), style: TextStyle(fontSize: 14)),
      ],
      // ),
    );
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
                    hintStyle:
                        TextStyle(color: Color(0xFF999999), fontSize: 16),
                    contentPadding: EdgeInsets.only(left: 15.0),
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
    ret.add(GestureDetector(
        child: Container(
            width: 104,
            height: 95,
            decoration: BoxDecoration(
              border: Border.all(color: Color(0xFFDDDDDD)),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                SizedBox(height: 18),
                SizedBox(
                    width: 32, height: 32, child: SvgPicture.asset(d['path'])),
                SizedBox(height: 9.87),
                Text(d['disease'])
              ],
            )),
        onTap: () =>
            Get.to(() => SearchDiseaseResult(), arguments: d['disease'])));
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

class AutoCompleteListView extends StatelessWidget {
  final List<String> _searchResult;
  AutoCompleteListView(this._searchResult, this.page, {Key key})
      : super(key: key);
  final String page;
  // final Widget page;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemCount: _searchResult.length,
        separatorBuilder: (_, __) {
          return SizedBox(height: 0);
        },
        itemBuilder: (context, i) {
          return GestureDetector(
              child: Card(child: ListTile(title: Text(_searchResult[i]))),
              onTap: () => Get.toNamed(page, arguments: _searchResult[i]));
          // onTap: () => Get.to(page, arguments: _searchResult[i]));
        });
  }
}

class ImageLoadFailed extends StatelessWidget {
  const ImageLoadFailed({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset('images/svg/loading_failed_white.svg');
  }
}

class ImageLoadFailedGrey extends StatelessWidget {
  const ImageLoadFailedGrey({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset('images/svg/loading_failed_grey.svg');
  }
}

class ShimmerLoadingContainer extends StatelessWidget {
  ShimmerLoadingContainer(this.width, this.height, {isRound, Key key})
      : super(key: key);
  final double width;
  final double height;
  bool isRound = false;
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: Colors.transparent,
        highlightColor: Color(Constants.loadingColor),
        child: isRound
            ? Container(
                color: Color(0xFFEAEAEA),
                width: width,
                height: height,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(width / 2)),
                ))
            : Container(
                width: width, height: height, color: Color(0xFFEAEAEA)));
  }
}

class RequestLoginPage extends StatelessWidget {
  const RequestLoginPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Expanded(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("로그인이 필요한 서비스입니다.", style: TextStyle(fontSize: 16)),
          SizedBox(height: 8),
          GestureDetector(
              onTap: () => Get.to(() => LoginMainPage()),
              child: Text("로그인",
                  style: TextStyle(
                      fontSize: 18,
                      color: Color(0xFF3BD7E2),
                      decoration: TextDecoration.underline)))
        ],
      )),
    );
  }
}

class NetworkErrorPage extends StatelessWidget {
  const NetworkErrorPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: Column(
        children: [
          Text("네트워크 연결상태가 좋지 않습니다. ",
              style: TextStyle(fontSize: 22, color: Color(0xFF111111))),
          SizedBox(height: 16),
          Text("연결 상태를 확인 후 다시 시도해주세요.",
              style: TextStyle(fontSize: 14, color: Color(0xFF666666))),
          SizedBox(height: 32),
          SvgPicture.asset("images/refresh.svg")
        ],
      )),
    );
  }
}
