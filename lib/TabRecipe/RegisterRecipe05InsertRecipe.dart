import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_side_client/Constants.dart';
import 'package:my_side_client/common/CommonComponent.dart';

import 'package:my_side_client/common/CommonHeader.dart';
import 'package:my_side_client/common/CommonTheme.dart';

class RegisterRecipe05InsertRecipe extends StatefulWidget {
  RegisterRecipe05InsertRecipe({Key key}) : super(key: key);

  @override
  State<RegisterRecipe05InsertRecipe> createState() =>
      _RegisterRecipe05InsertRecipeState();
}

class _RegisterRecipe05InsertRecipeState
    extends State<RegisterRecipe05InsertRecipe> {
  TextEditingController searchTextEditingController = TextEditingController();

  TextEditingController recipeTextEditingController = TextEditingController();
  @override
  void dispose() {
    searchTextEditingController.dispose();
    recipeTextEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppbar(
        "레시피 입력(4/5)",
        // Colors.white.value,
        // isBack: true,
      ),
      body: Column(
        children: [
          Padding(
              padding: EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("주의해야 할 점이 있다면 설명해 주세요.",
                          style: TextStyle(
                              fontSize: 14, color: Color(0xFF666666))),
                      Text("${recipeTextEditingController.text.length}/1000",
                          style: TextStyle(color: Color(0xFFAAAAAA)))
                    ],
                  ),
                  SizedBox(height: 8),
                  TextField(
                    controller: recipeTextEditingController,
                    maxLines: 3,
                    maxLength: 1000,
                    onChanged: (_) => setState(() {}),
                    // buildCounter: (_, {currentLength, maxLength, isFocused}) =>
                    //     Padding(
                    //   padding: const EdgeInsets.only(left: 16.0),
                    //   child: Container(
                    //       alignment: Alignment.topRight,
                    //       child: Text(currentLength.toString() +
                    //           "/" +
                    //           maxLength.toString())),
                    // ),
                    decoration: InputDecoration(
                        counterText: "",
                        // errorText: _errorText,
                        // disabledBorder: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color(Constants.primaryColorInt))),
                        border: OutlineInputBorder(),
                        hintText: "환우, 성분, 음식에 주의해야 할 점이 있다면 알려주세요."),
                  ),
                  SizedBox(height: 15),
                  RichText(
                    text: TextSpan(
                      text: "레시피 대표 음식 등록하기",
                      style: TextStyle(
                        color: Color(0xFF666666),
                        fontSize: 14.0,
                        fontWeight: FontWeight.w400,
                      ),
                      children: [
                        TextSpan(
                          text: '*',
                          style: TextStyle(
                            color: Color(0xFFEE1100),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  SearchContainer(searchTextEditingController,
                      hintText: "음식을 검색하세요."),
                  SizedBox(height: 12),
                  //Tag container
                  SizedBox(height: 16),
                  Container(
                    decoration: BoxDecoration(
                        color: Color(0xFFF4F4F4),
                        borderRadius: BorderRadius.circular(8)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("* 음식 갯수가 많을수록 레시피 노출이 많아집니다!",
                              style: TextStyle(
                                  fontSize: 13, color: Color(0xFF666666))),
                          SizedBox(height: 5),
                          Text("* 대표 음식이 이웃집닥터에 없다구요? 음식 등록을 요청해 주세요. ",
                              style: TextStyle(
                                  fontSize: 13, color: Color(0xFF666666))),
                          SizedBox(height: 5),
                          Text("* 음식 등록은 1일~2일 소요됩니다. 임시저장을 해주세요.",
                              style: TextStyle(
                                  fontSize: 13, color: Color(0xFF666666))),
                        ],
                      ),

                      // RichText(
                      //     text: TextSpan(
                      //         text: "음식 갯수가 많을수록 레시피 노출이 많아집니다!",
                      //         style: TextStyle(
                      //             fontSize: 13, color: Color(0xFF666666),),
                      //         children: [

                      //       TextSpan(
                      //           text: "음식 등록은 1일~2일 소요됩니다. 임시저장을 해주세요.",
                      //           style: TextStyle(
                      //               fontSize: 13, color: Color(0xFF666666))),
                      //     ])),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Align(
                    child:
                        // Baseline(
                        //not work

                        // baseline: 0,
                        // baselineType: TextBaseline.ideographic,
                        //https://github.com/flutter/flutter/issues/42833
                        // child:
                        Text("음식 등록 요청 >",
                            locale: Locale('ko', 'KR'), //not work
                            // textAlign: TextAlign.justify,
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                textBaseline: TextBaseline.alphabetic,
                                fontSize: 14,
                                color: Color(0xFF666666))
                            // ),
                            ),
                    alignment: Alignment.center,
                  ),
                ],
              )),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                children: [
                  Expanded(
                      child: Container(
                    height: 70,
                    child: TextButton(
                      onPressed: isSomethingInserted() ? () {} : null,
                      child: Text("임시저장", style: TextStyle(fontSize: 16)),
                      // style:
                      style: CommonTheme.getSquareGreyButtonStyle(),
                    ),
                  )),
                  Expanded(
                      child: Container(
                    height: 70,
                    child: TextButton(
                      onPressed: isSomethingInserted() ? () {} : null,
                      child: Text("미리보기", style: TextStyle(fontSize: 16)),
                      style: CommonTheme.getSquarePrimaryButtonStyle(),
                    ),
                  ))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  String get _errorText {
    final String text = recipeTextEditingController.value.text;
    return "${text.length} / 1000";
  }

  bool isSomethingInserted() {
    if (recipeTextEditingController.text.isNotEmpty) {
      return true;
    }
    return false;
  }

  List<dynamic> sampleList = [sampleImages, sampleImages, sampleImages];
}

dynamic sampleImages = {
  "image": "images/profile_sample.png",
};
