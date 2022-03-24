import 'dart:convert';
import 'dart:core';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:my_side_client/Constants.dart';
import 'package:http/http.dart' as http;
import 'package:my_side_client/TabRecipe/CommentDelete.dart';
import 'package:my_side_client/TabRecipe/CommentService/Comment.dart';
import 'package:my_side_client/TabRecipe/CommentService/CommentController.dart';
import 'package:my_side_client/TabRecipe/CommentSub.dart';
import 'package:my_side_client/TabSearch/FoodInformation.dart';
import 'package:my_side_client/common/CommonComponent.dart';
import 'package:my_side_client/common/CommonHeader.dart';
import 'package:my_side_client/common/CommonTheme.dart';
import 'CommentService/Comment.dart';
import 'package:my_side_client/common/MySideConnect.dart';
import 'package:my_side_client/common/UserProfile.dart';
import 'package:jiffy/jiffy.dart';

class CommentMain extends StatefulWidget {
  CommentMain({Key key}) : super(key: key);

  @override
  State<CommentMain> createState() => _CommentMainState();
}

bool isChangedBookmark = true;
class _CommentMainState extends State<CommentMain> {




  Future<CommentDataItem> fetchPost() async {
    final response =
    await http.get(Uri.parse('http://54.180.67.217:3000/receipe/comment/main/view/1'),
      headers:
        {
          "Content-Type": "application/json",
        "token":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwiaWF0IjoxNjQ4MTM1MDgxLCJleHAiOjE2NDkzNDQ2ODEsImlzcyI6ImlnIn0.1CSK1NhK74auMe1xdGq5oMt3HHiVhsWYta2lQ0PbYY4",
          }
    );
    if (response.statusCode == 200) {

      return CommentDataItem.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load post');
    }
  }

  Future<CommentDataItem> post;

  List<dynamic> sampleList = Comment.sampleList;
  TextEditingController textEditingController;
  bool isButtonActive = false;
  String writtenId = ""; //이전 화면에서 넘긴 글쓴이 id
  @override
  void initState() {
    super.initState();
    textEditingController = TextEditingController();
    post=fetchPost();
    textEditingController.addListener(() {
      final isButtonActive = textEditingController.text.isNotEmpty;
      setState(() => this.isButtonActive = isButtonActive);
    });
  }

  void showDeletePoP(BuildContext context){
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return CommentDelete();
      },
    );
  }
  Future<bool> _onWillPop() async {
    Get.back(result: isChangedBookmark);
    return false;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
                  appBar: CommonAppbar("댓글"),
                  body: Container(
                    child: Column(
                      children: [
                        FutureBuilder<CommentDataItem>(
                          future: post,
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return CommentBody(sampleList: snapshot.requireData);
                            } else if (snapshot.hasError) {
                              return Text("${snapshot.error}");
                            }

                            return CircularProgressIndicator();
                          },
                        ),
                        //CommentBody(sampleList: post),
                        CommentFooter(
                            textEditingController: textEditingController,
                            isButtonActive: isButtonActive)
                      ],
                    ),
                  ),
              );
          }
  }

class CommentFooter extends StatefulWidget {
  const CommentFooter({
    Key key,
    @required this.textEditingController,
    @required this.isButtonActive,

  }) : super(key: key);

  final TextEditingController textEditingController;
  final bool isButtonActive;

  @override
  State<CommentFooter> createState() => _CommentFooterState();
}

class _CommentFooterState extends State<CommentFooter> {
  void postComment(String comment) async {
    final response =
    await http.post(Uri.parse('http://54.180.67.217:3000/receipe/comment/main/write'),
        headers:
        {
          "Content-Type": "application/json",
          "token":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwiaWF0IjoxNjQ2OTE3NzA0LCJleHAiOjE2NDgxMjczMDQsImlzcyI6ImlnIn0.VIO-X5jRD0zj2al5OsjN1ZTJPEkDRjo6Ps7TH8EOOHc",
        },
        body:
        {
          "receipe_id" : 1,
          "comment_content" : "$comment"
        }
    );
    if (response.statusCode == 200) {
      print(json.decode(response.body));
    } else {
      print(json.decode(response.body));
    }
  }

  void handleSubmitted(String text){
    setState(() {
      widget.textEditingController.clear();
      postComment(text);

    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Color(0xFFF4F4F4)),
      padding: EdgeInsets.all(16),
      child: Row(children: [
        Expanded(
            child: TextField(
          controller: widget.textEditingController,
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
          onPressed: widget.isButtonActive ? () {
            handleSubmitted(widget.textEditingController.text);
          } : null,
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
    @required this.sampleList,
  }) : super(key: key);



  final CommentDataItem sampleList;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        itemCount: sampleList.data.length,
        itemBuilder: (context, i) {
          CommentItem item = CommentItem(sampleList.data[i], true, context);
         /* CommentItem item = CommentItem(Comment.fromJson(sampleList[i]), true, context);*/
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
  CommentItem(this.item, this.isWriter, this.context,{Key key});
  Widget createCommentItem() {
    return createItem(true,context);
  }

  Widget createReplyItem() {
    return createItem(false,context);
  }

  Widget createItem(bool isMain, BuildContext context) {
    String timeData= Jiffy(item.comment_time).fromNow();
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
          child: Image.asset(/*item.profileImage*/"asset"),
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

                timeData.contains("시간 전")?
                Text(timeData, style: TextStyle(color: Color(0xFF999999)))
                :Text("${item.comment_time.substring(0,4)}."
                    "${item.comment_time.substring(5,7)}."
                    "${item.comment_time.substring(8,10)}", style: TextStyle(color: Color(0xFF999999)))
                // nickname
              ],
            ),
            SizedBox(height: 8),
            Text("${item.cancerNm}/${item.stageNm}/${item.progressNm}/${item.relationNm}",
                style: TextStyle(fontSize: 12, color: Color(0xFF999999))),
            Container(
              height: 8,
            ),
            Text(item.comment_content,
                style: TextStyle(
                  height: 1.3,
                )),
            Container(
              height: 8,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    item.like_status
                        ? InkWell(child:SvgPicture.asset(Constants.likeSVGSelectedPath),
                    onTap: (){},)
                        : InkWell(child:SvgPicture.asset(Constants.likeSVGPath),
                    onTap: (){},),

                    SizedBox(width: 5),
                    SizedBox(
                        width: 50,
                        height: 18,
                        child: Text(
                            item.likesum != 0 ? "${item.likesum}" : "좋아요 "
                        ,style : TextStyle(
                            fontSize: 12.0,
                            fontFamily: "NotoSans",
                            fontWeight: FontWeight.w300,
                            color: Color(0xff666666)
                        ))),
                    SizedBox(width: 24),
                    isMain
                        ? InkWell(child:SvgPicture.asset('images/svg/chat.svg'),
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CommentSub()));

                    },)
                        : EmptyWidget(),
                    isMain ? SizedBox(width: 5) : EmptyWidget(),
                    isMain
                        ? SizedBox(
                            width: 70,
                            height: 18,
                            child: Text(item.subcomment_sum != 0
                                ? "${item.subcomment_sum}"
                                : "댓글 쓰기",style : TextStyle(
                                fontSize: 12.0,
                                fontFamily: "NotoSans",
                                fontWeight: FontWeight.w300,
                                color: Color(0xff666666)
                            )))
                        : EmptyWidget(),
                    // item.commentCount != 0
                    //     ? SvgPicture.asset("img/svg/vertical_dots.svg")
                    //     : null
                  ],
                ),
                Row(children: [
                  InkWell(
                    child: SvgPicture.asset('assets/deletemenu.svg'),
                    onTap: (){
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return CommentDelete();
                        },
                      );
                    },
                  ),
                ],),
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

