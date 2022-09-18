import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:my_side_client/Constants.dart';
import 'package:my_side_client/TabHome/SearchBar.dart';
import 'package:my_side_client/TabSearch/SearchDisease.dart';
import 'package:my_side_client/TabSearch/SearchFood.dart';
import 'package:my_side_client/TabSearch/SearchIngredient.dart';
import 'package:my_side_client/common/ChangeBookmarkStatusRepository/ChangeBookmarkController.dart';
import 'package:my_side_client/screens/loginscreens/loginMainPage.dart';
import 'package:shimmer/shimmer.dart';

class HeaderRow extends StatelessWidget {
  final String title;
  final bool isViewMore;
  final Function onClickAction;
  const HeaderRow(this.title, {this.isViewMore, this.onClickAction, Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            child: Expanded(
              child: Text(
                title,
                overflow: TextOverflow.fade,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          isViewMore
              ? InkWell(
                  child: Text("더보기 +",
                      style: TextStyle(fontSize: 14, color: Color(0xFFAAAAAA))),
                  onTap: onClickAction,
                )
              : SizedBox(),
        ]);
  }
}

class LikeBookmark extends StatefulWidget {
  int bookmark;
  int like;
  int likeStatus;
  int bookmarkStatus;
  String food;
  bool isOnTabDisabled = true;
  // const LikeBookmark(this.food, this.item, this.bookmark, this.like,
  //     this.likeStatus, this.bookmarkStatus,
  //     {Key key})
  //     : super(key: key);

  LikeBookmark(
      this.food, this.like, this.bookmark, this.likeStatus, this.bookmarkStatus,
      {this.isOnTabDisabled, Key key})
      : super(key: key);

  @override
  _LikeBookmarkState createState() => _LikeBookmarkState();
}

class _LikeBookmarkState extends State<LikeBookmark> {
  ChangeBookmarkStatusController controller =
      Get.put(ChangeBookmarkStatusController());

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        GestureDetector(
          child: Wrap(children: [
            Padding(
                padding: EdgeInsets.only(right: 5, top: 2),
                child: SizedBox(
                    width: 14,
                    height: 14,
                    child: SvgPicture.asset(widget.likeStatus == 0
                        ? "images/svg/like.svg"
                        : "images/svg/like_selected.svg"))),
            Text(widget.like.toString(),
                style: TextStyle(
                    fontSize: 16,
                    color: Color(0xFF666666),
                    fontWeight: FontWeight.w300))
          ]),
          onTap: () async {
            if (widget.isOnTabDisabled) {
              return;
            } else {
              bool result =
                  await controller.putLike(widget.food, widget.likeStatus);
              if (result) {
                if (widget.likeStatus == 0) {
                  widget.likeStatus = 1;
                  widget.like += 1;
                } else {
                  widget.likeStatus = 0;
                  widget.like -= 1;
                }
                Constants.isFoodInformationChanged =
                    !Constants.isFoodInformationChanged;
              }
              setState(() {});
            }
          },
        ),
        GestureDetector(
            child: Wrap(children: [
              Padding(
                  padding: EdgeInsets.only(
                    left: 10,
                    right: 5,
                  ),
                  child: SizedBox(
                      width: 19,
                      height: 19,
                      child: SvgPicture.asset("images/svg/icon_eye.svg"))),
              Text(widget.bookmark.toString(),
                  style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFF666666),
                      fontWeight: FontWeight.w300))
            ]),
            onTap: () async {
              bool result = await controller.putBookmark(
                  widget.food, widget.bookmarkStatus);
              if (result) {
                if (widget.bookmarkStatus == 0) {
                  widget.bookmarkStatus = 1;
                  widget.bookmark += 1;
                } else {
                  widget.bookmarkStatus = 0;
                  widget.bookmark -= 1;
                }
                Constants.isFoodInformationChanged =
                    !Constants.isFoodInformationChanged;
              }
              setState(() {});
            }),
      ],
      // ),
    );
  }
}

class SearchContainer extends StatelessWidget {
  final TextEditingController _textEditingController;
  final Function onChanged;
  final String hintText;
  // final Future<dynamic> onSubmitted;
  final Function onSubmitted;
  const SearchContainer(this._textEditingController,
      {this.onChanged, this.onSubmitted, this.hintText, Key key})
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
                    hintText: hintText ?? "사과",
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

class NavigateIconViewsContainer extends StatelessWidget {
  final data;
  final namedWidget;
  NavigateIconViewsContainer(this.data, this.namedWidget, {Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: Axis.horizontal,
      crossAxisAlignment: WrapCrossAlignment.start,
      alignment: WrapAlignment.start,
      spacing: 7.5,
      runSpacing: 7.5,
      children: _getNavigateIconViews(data, namedWidget),
    );
  }
}

_getNavigateIconViews(var diseases, String namedWidget) {
  List<Widget> ret = [];
  for (var d in diseases) {
    ret.add(NavigateIconView(d['path'], d['title'], namedWidget));
  }
  return ret;
}

// 주의 : main.dart에 namedRoute 추가 할 것
// ex : GetPage(name: "/SearchDiseaseResult", page: () => SearchDiseaseResult()),
class NavigateIconView extends StatelessWidget {
  final String iconPath;
  final String title;
  final String namedWidget;
  const NavigateIconView(this.iconPath, this.title, this.namedWidget, {Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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
                    width: 32, height: 32, child: SvgPicture.asset(iconPath)),
                SizedBox(height: 9.87),
                Text(title)
              ],
            )),
        onTap: () => Get.toNamed(namedWidget, arguments: title));
  }
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
              // child: Card(child: ListTile(title: Text(_searchResult[i]))),
              child: Card(
                  child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(_searchResult[i]))),
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

Widget loadingPage() {
  return Center(
      child: SizedBox(
          width: 40,
          height: 40,
          child: CircularProgressIndicator(
            color: Color(
              Constants.primaryColorInt,
            ),
          )));
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
      ),
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

class EmptyWidget extends StatelessWidget {
  const EmptyWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 0,
      height: 0,
    );
  }
}
