import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_side_client/Constants.dart';
import 'package:my_side_client/TabRecipe/CommentDelete.dart';
import 'package:my_side_client/common/CommonComponent.dart';
import 'package:my_side_client/common/CommonHeader.dart';
import 'package:my_side_client/common/CommonTheme.dart';

import 'Comment.dart';

class CommentMain extends StatefulWidget {
  CommentMain({Key key}) : super(key: key);

  @override
  State<CommentMain> createState() => _CommentMainState();
}

class _CommentMainState extends State<CommentMain> {
  List<dynamic> sampleList = Comment.sampleList;
  TextEditingController textEditingController;
  bool isButtonActive = false;
  String writtenId = ""; //이전 화면에서 넘긴 글쓴이 id
  @override
  void initState() {
    super.initState();
    textEditingController = TextEditingController();
    textEditingController.addListener(() {
      final isButtonActive = textEditingController.text.isNotEmpty;
      setState(() => this.isButtonActive = isButtonActive);
    });
  }

  void showDeletePoP(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return CommentDelete();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppbar("댓글(${sampleList.length})"),
      body: Container(
        child: Column(
          children: [
            CommentBody(sampleList: sampleList),
            CommentFooter(
                textEditingController: textEditingController,
                isButtonActive: isButtonActive)
          ],
        ),
      ),
    );
  }
}

class CommentFooter extends StatelessWidget {
  const CommentFooter({
    Key key,
    this.textEditingController,
    this.isButtonActive,
  }) : super(key: key);

  final TextEditingController textEditingController;
  final bool isButtonActive;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Color(0xFFF4F4F4)),
      padding: EdgeInsets.all(16),
      child: Row(children: [
        Expanded(
            child: TextField(
          controller: textEditingController,
          decoration: InputDecoration(
            hintText: "이웃주민에게 댓글을 입력해주세요!",
            hintStyle: TextStyle(color: Color(0xFFAAAAAA)),
            fillColor: Colors.white,
            filled: true, // <- this is required.
            border: OutlineInputBorder(
              borderRadius: BorderRadius.zero,
              borderSide: BorderSide.none,
            ),
          ),
        )),
        // ConstrainedBox(
        //   constraints: BoxConstraints.tightFor(width: 60, height: 154),
        // child:
        TextButton(
          style: CommonTheme.getSquarePrimaryButtonStyle(w: 60, h: 54),
          onPressed: isButtonActive ? () {} : null,
          child: Text("전송"),
          // ),
        )
      ]),
    );
  }
}

class CommentBody extends StatelessWidget {
  const CommentBody({
    Key key,
    this.sampleList,
  }) : super(key: key);

  final List sampleList;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        itemCount: sampleList.length,
        itemBuilder: (context, i) {
          CommentItem item =
              CommentItem(Comment.fromJson(sampleList[i]), true, context);
          return item.createCommentItem();
        },
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(height: 24);
        },
      ),
    );
  }
}

class CommentItem {
  final Comment item;
  final bool isWriter;
  final context;
  CommentItem(this.item, this.isWriter, this.context, {Key key});
  Widget createCommentItem() {
    return createItem(true, context);
  }

  Widget createReplyItem() {
    return createItem(false, context);
  }

  Widget createItem(bool isMain, BuildContext context) {
    isMain = false;
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 16,
      ),
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        isMain
            ? SizedBox(width: 0)
            : Container(
                child: Row(children: [
                SvgPicture.asset("images/svg/comment_reply_arrow.svg"),
                SizedBox(width: 20)
              ])),
        Container(
          width: 32,
          height: 32,
          child: Image.asset(item.profileImage),
          decoration: isWriter
              ? BoxDecoration(
                  // backgroundBlendMode: BlendMode.dst,
                  shape: BoxShape.circle,
                  color: Color(Constants.primaryColorInt),
                  // borderRadius:BorderRadius.
                  border: Border.all(
                      width: 1, color: Color(Constants.primaryColorInt)))
              : null,
        ),
        Container(
          width: 8,
        ),
        Expanded(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(children: [
                  Text(
                    item.userId,
                    style: TextStyle(fontSize: 14),
                  ),
                  isWriter ? getWriter() : EmptyWidget()
                ]),
                Text("1시간전", style: TextStyle(color: Color(0xFF999999)))
                // nickname
              ],
            ),
            SizedBox(height: 8),
            Text(item.commentary.join("/"),
                style: TextStyle(fontSize: 12, color: Color(0xFF999999))),
            Container(
              height: 8,
            ),
            Text(item.comment,
                style: TextStyle(
                  height: 1.3,
                )),
            Container(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    item.isLiked
                        ? SvgPicture.asset(Constants.likeSVGSelectedPath)
                        : SvgPicture.asset(Constants.likeSVGPath),
                    SizedBox(width: 5),
                    SizedBox(
                        width: 33,
                        height: 18,
                        child: Text(
                            item.likeCount != 0 ? "${item.likeCount}" : "좋아요")),
                    SizedBox(width: 24),
                    isMain
                        ? SvgPicture.asset(Constants.chatSVGPath)
                        : EmptyWidget(),
                    isMain ? SizedBox(width: 5) : EmptyWidget(),
                    isMain
                        ? SizedBox(
                            width: 46,
                            height: 16,
                            child: Text(item.commentCount != 0
                                ? "${item.commentCount}"
                                : "댓글 쓰기"))
                        : EmptyWidget(),
                    // item.commentCount != 0
                    //     ? SvgPicture.asset("img/svg/vertical_dots.svg")
                    //     : null
                  ],
                ),
                Row(
                  children: [
                    InkWell(
                      child: SvgPicture.asset('assets/deletemenu.svg'),
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return CommentDelete();
                          },
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ]),
        ),
      ]),
    );
  }

  Widget getWriter() {
    return Padding(
      padding: EdgeInsets.only(left: 8),
      child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                  color: Color(Constants.primaryColorInt),
                  width: 1,
                  style: BorderStyle.solid)),
          child: Padding(
            padding: const EdgeInsets.all(3.5),
            child: Text("글쓴이",
                style: TextStyle(
                    fontSize: 12, color: Color(Constants.primaryColorInt))),
          )),
    );
  }
}
