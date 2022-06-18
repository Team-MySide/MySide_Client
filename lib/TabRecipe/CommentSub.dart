import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jiffy/jiffy.dart';
import 'package:my_side_client/Constants.dart';
import 'package:my_side_client/TabRecipe/CommentDelete.dart';
import 'package:my_side_client/TabRecipe/CommentMain.dart';
import 'package:my_side_client/TabRecipe/CommentService/CommentSubItem.dart';
import 'package:my_side_client/common/CommonComponent.dart';
import 'package:my_side_client/common/CommonHeader.dart';
import 'package:http/http.dart' as http;

class CommentSub extends StatefulWidget {
  const CommentSub({Key key}) : super(key: key);
  @override
  State<CommentSub> createState() => _CommentSubState();
}

Future<SubCommentDataItem> fetchPost() async {
  final response = await http.get(
      Uri.parse('http://3.39.126.13:3000/receipe/comment/sub/view/2'),
      headers: {
        "Content-Type": "application/json",
        "token":
            "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwiaWF0IjoxNjQ4MTM1MDgxLCJleHAiOjE2NDkzNDQ2ODEsImlzcyI6ImlnIn0.1CSK1NhK74auMe1xdGq5oMt3HHiVhsWYta2lQ0PbYY4",
      });
  if (response.statusCode == 200) {
    return SubCommentDataItem.fromJson(json.decode(response.body));
  } else {
    print("망함");
    throw Exception('Failed to load post');
  }
}

class _CommentSubState extends State<CommentSub> {
  Future<SubCommentDataItem> post;
  TextEditingController textEditingController;
  bool isButtonActive = false;
  void iniState() {
    super.initState();
    textEditingController = TextEditingController();
    post = fetchPost();
    textEditingController.addListener(() {
      final isButtonActive = textEditingController.text.isNotEmpty;
      setState(() => this.isButtonActive = isButtonActive);
    });
  }

  Widget build(BuildContext context) {
    //Comment mainComment = widget.item;
    //CommentItem items = CommentItem(mainComment, true, context);

    return Scaffold(
      appBar: CommonAppbar("댓글"),
      body: Container(
        child: Column(
          children: [
            // items.createCommentItem(),
            FutureBuilder<SubCommentDataItem>(
              future: post,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return CommentSubBody(sampleList: snapshot.requireData);
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }

                return CircularProgressIndicator();
              },
            ),
            CommentFooter(
                textEditingController: textEditingController,
                isButtonActive: isButtonActive)
          ],
        ),
      ),
    );
  }
}

class CommentSubBody extends StatelessWidget {
  const CommentSubBody({
    Key key,
    @required this.sampleList,
  }) : super(key: key);

  final SubCommentDataItem sampleList;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        itemCount: sampleList.data.length,
        itemBuilder: (context, i) {
          /*CommentItem item = CommentItem(sampleList.data[i], true, context);*/
          SubCommentItem item =
              SubCommentItem(sampleList.data[i], true, context);
          return item.createCommentItem();
        },
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(height: 24);
        },
      ),
    );
  }
}

class SubCommentItem {
  final SubComment item;
  final bool isWriter;
  final context;
  SubCommentItem(this.item, this.isWriter, this.context, {Key key});
  Widget createCommentItem() {
    return createItem(false, context);
  }

  Widget createReplyItem() {
    return createItem(false, context);
  }

  Widget createItem(bool isMain, BuildContext context) {
    String timeData = Jiffy(item.create_time).fromNow();
    Jiffy.locale('ko');

    // return true;
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
          child: Image.asset(/*item.profileImage*/ "asset"),
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
                    item.nickname,
                    style: TextStyle(fontSize: 14),
                  ),
                  isWriter ? getWriter() : EmptyWidget()
                ]),

                timeData.contains("시간 전")
                    ? Text(timeData, style: TextStyle(color: Color(0xFF999999)))
                    : Text(
                        "${item.create_time.substring(0, 4)}."
                        "${item.create_time.substring(5, 7)}."
                        "${item.create_time.substring(8, 10)}",
                        style: TextStyle(color: Color(0xFF999999)))
                // nickname
              ],
            ),
            SizedBox(height: 8),
            Text(
                "${item.cancerNm}/${item.stageNm}/${item.progressNm}/${item.relationNm}",
                style: TextStyle(fontSize: 12, color: Color(0xFF999999))),
            Container(
              height: 8,
            ),
            Text(item.content,
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
                    item.like_status
                        ? InkWell(
                            child:
                                SvgPicture.asset(Constants.likeSVGSelectedPath),
                            onTap: () {},
                          )
                        : InkWell(
                            child: SvgPicture.asset(Constants.likeSVGPath),
                            onTap: () {},
                          ),

                    SizedBox(width: 5),
                    SizedBox(
                        width: 50,
                        height: 18,
                        child: Text(
                            item.likesum != 0 ? "${item.likesum}" : "좋아요 ",
                            style: TextStyle(
                                fontSize: 12.0,
                                fontFamily: "NotoSans",
                                fontWeight: FontWeight.w300,
                                color: Color(0xff666666)))),
                    SizedBox(width: 24),

                    isMain ? SizedBox(width: 5) : EmptyWidget(),
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
                            return CommentDelete(item.comment_id);
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
