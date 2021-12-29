import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_side_client/Constants.dart';
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
  @override
  void initState() {
    super.initState();
    textEditingController = TextEditingController();
    textEditingController.addListener(() {
      final isButtonActive = textEditingController.text.isNotEmpty;
      setState(() => this.isButtonActive = isButtonActive);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppbar("댓글(${sampleList.length})"),
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: ListView.separated(
                itemCount: sampleList.length,
                itemBuilder: (context, i) {
                  CommentMainItem item =
                      CommentMainItem(Comment.fromJson(sampleList[i]));
                  return item.createItem();
                },
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(height: 24);
                },
              ),
            ),
            Container(
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
                  style: CommonTheme().getSquareButtonStyle(60, 54),
                  onPressed: isButtonActive ? () {} : null,
                  child: Text("전송"),
                  // ),
                )
              ]),
            )
          ],
        ),
      ),
    );
  }
}

class CommentMainItem {
  final Comment item;
  CommentMainItem(this.item, {Key key});

  Widget createItem() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 16,
      ),
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Image.asset(item.profileImage),
        Container(
          width: 8,
        ),
        Expanded(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(
              children: [
                Text(item.userId, style: TextStyle(fontSize: 14)),
                // nickname
              ],
            ),
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
              children: [
                SvgPicture.asset(Constants.likeSVGPath),
                SizedBox(width: 5),
                SizedBox(
                    width: 33,
                    height: 18,
                    child: Text(
                        item.likeCount != 0 ? "${item.likeCount}" : "좋아요")),
                SizedBox(width: 24),
                SvgPicture.asset(Constants.chatSVGPath),
                SizedBox(width: 5),
                SizedBox(
                    width: 46,
                    height: 16,
                    child: Text(item.commentCount != 0
                        ? "${item.commentCount}"
                        : "댓글 쓰기")),
                // item.commentCount != 0
                //     ? SvgPicture.asset("img/svg/vertical_dots.svg")
                //     : null
              ],
            ),
          ]),
        ),
        Text("1시간전", style: TextStyle(color: Color(0xFF999999)))
      ]),
    );
  }
}
