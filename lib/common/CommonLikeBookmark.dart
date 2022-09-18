import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart';
import 'package:my_side_client/TabBookmark/TabBookmark.dart';
import 'package:my_side_client/common/CommonComponent.dart';
import 'package:http/http.dart' as http;
import 'package:my_side_client/common/UserProfile.dart';

enum IconType { bookmark, like, share }

class LikeComponent extends StatefulWidget {
  final String id;
  bool isLike;
  int likeCnt;
  final IconType iconType;
  LikeComponent(this.id, this.isLike, this.likeCnt, this.iconType, {Key key})
      : super(key: key);

  @override
  State<LikeComponent> createState() => _LikeComponentState();
}

class _LikeComponentState extends State<LikeComponent> with LikeMixin {
  bool isOnTapEnabled = true;
  @override
  void initState() {
    isLike = widget.isLike;
    print("initstate $isLike");

    likeCnt = widget.likeCnt;
    print("initstate $likeCnt");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Row(children: [
        Padding(
            padding: EdgeInsets.only(right: 5, top: 2),
            child: SizedBox(
                width: 16,
                height: 15,
                child: isOnTapEnabled
                    ? IconTypeWidget(iconType: widget.iconType, isLike: isLike)
                    : ShimmerLoadingContainer(16, 15))),
        Text(likeCnt.toString(), style: TextStyle(fontSize: 16))
      ]),
      onTap: () async {
        print("ontapped $isLike, $isOnTapEnabled");
        if (isOnTapEnabled) {
          // setState(() {
          //   isOnTapEnabled = false;
          // });
          await requestLike(isLike, likeCnt);
          // setState(() {
          //   isOnTapEnabled = true;
          // });
          // asyncbookmarkController.fetch();

          print("ontapped $isLike, $isOnTapEnabled");
          return;
        }
      },
    );
  }

  @override
  String get commentId => widget.id;

  @override
  // TODO: implement iconType
  IconType get iconType => widget.iconType;

  @override
  // TODO: implement receipeId
  String get receipeId => widget.id;

  // @override
  // bool get isLike => widget.isLike;

  // @override
  // int get likeCnt => widget.likeCnt;
}

class IconTypeWidget extends StatelessWidget {
  const IconTypeWidget({
    Key key,
    this.iconType,
    this.isLike,
  }) : super(key: key);
  final IconType iconType;
  final bool isLike;

  @override
  Widget build(BuildContext context) {
    Widget ret;
    switch (iconType) {
      case IconType.like:
        ret = SvgPicture.asset(
            isLike ? "images/svg/like_selected.svg" : "images/svg/like.svg");
        break;
      case IconType.share:
        ret = SvgPicture.asset("assets/icons/share.svg");
        break;
      // case IconType.comment:
      //   ret = SvgPicture.asset(
      //       isLike ? "images/svg/like_selected.svg" : "images/svg/like.svg");
      //   break;
      case IconType.bookmark:
        ret = SvgPicture.asset(isLike
            ? "images/svg/bookmark_selected.svg"
            : "images/svg/bookmark.svg");
        break;
    }
    return ret;
  }
}

bool test = true;

mixin LikeMixin<T extends StatefulWidget> on State<T> {
  String get commentId;
  IconType get iconType;
  String get receipeId;
  bool isLike;
  int likeCnt;

  Future<dynamic> requestLike(bool originalLike, int originalLikeCnt) async {
    print("request like ");
    String url = "";
    switch (iconType) {
      case IconType.like:
        url = "/receipe/like";
        break;
      case IconType.bookmark:
        url = "/receipe/save";
        break;
      case IconType.share:
        url = "/receipe/share";
        break;
    }
    Response resp = await http.put(Uri.http('3.39.126.13:3000', url),
        headers: {
          "Content-Type": "application/json",
          "token": UserProfile.token
        },
        // body: {"receipe_id": commentId});
        body: json.encode({"receipe_id": 1}));
    if (resp.statusCode == 200) {
      final respBody = json.decode(resp.body);
      if (respBody['data'] == true) {
        likeCnt += 1;
      } else if (respBody['data'] == false) {
        likeCnt -= 1;
      } else {
        //상태 변경 실패
      }
      isLike = !isLike;
    }

    return resp;
  }
}
