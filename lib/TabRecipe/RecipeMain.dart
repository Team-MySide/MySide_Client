import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../Constants.dart';

class RecipeMain extends StatefulWidget {
  RecipeMain({Key key}) : super(key: key);

  @override
  State<RecipeMain> createState() => _RecipeMainState();
}

class _RecipeMainState extends State<RecipeMain> {
  TextEditingController _textEditingController;
  String _dropdownValue = "최신순";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _textEditingController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          Container(
              margin: EdgeInsets.all(16),
              // decoration: BoxDecoration(color: Colors.amber),
              height: 49,
              child: Row(children: [
                Container(
                  margin: EdgeInsets.only(right: 16),
                  width: 101,
                  height: 49,
                  child: DropdownButtonFormField<String>(
                    items: <String>['최신순', '좋아요순', '별점순', '난이도순']
                        .map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(left: 15),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                    ),
                    value: _dropdownValue,
                    onChanged: (String newValue) {
                      setState(() {
                        _dropdownValue = newValue;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: TextField(

                      // textAlignVertical: TextAlignVertical.center,
                      controller: _textEditingController,
                      textInputAction: TextInputAction.search,
                      onSubmitted: (String value) {
                        print("submitted run");
                        // onSubmitted(context);
                      },
                      // onChanged: onChanged,
                      decoration: InputDecoration(
                        hintText: "음식을 입력하세요",
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
                          borderRadius: const BorderRadius.all(
                              const Radius.circular(30.0)),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color(Constants.primaryColorInt),
                                width: 0),
                            borderRadius: const BorderRadius.all(
                                const Radius.circular(30.0))),
                      ),
                      style: TextStyle(
                          fontSize: 18, textBaseline: TextBaseline.alphabetic)),
                )
              ])),
          // SingleChildScrollView(
          //   child:
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: 15,
              itemBuilder: (BuildContext context, int index) {
                return Item();
              },
            ),
            // ),
          )
        ]),
      ),
    );
  }
}

class Item extends StatelessWidget {
  const Item({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(
      children: [
        Container(
          width: 164,
          height: 170,
          margin: EdgeInsets.only(left: 16, right: 14),
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 6),
                child: ClipRRect(
                  child: Image.asset(
                    'assets/recipe_sample.png',
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: SvgPicture.asset("images/svg/foodranking_1.svg"),
              ),
            ],
          ),
        ),
        Expanded(
          child: Column(
            children: [
              Container(
                  height: 52,
                  margin: EdgeInsets.only(right: 16),
                  child: Text("올리브유로 만든 뽀바이 감바스",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ))),
              Container(height: 23),
              Container(
                child: Row(
                  children: [
                    Image.asset('assets/avatar_sample.png'),
                    Container(
                      width: 8,
                    ),
                    Expanded(child: Text("102동 옆집"))
                  ],
                ),
                height: 32,
              ),
              Container(
                height: 4,
              ),
              Container(
                  height: 21,
                  child: Row(
                    children: [
                      Text("#갑상선암",
                          style: TextStyle(
                              fontSize: 14, color: Color(0xFF3BD7E2))),
                      Text("#1기",
                          style: TextStyle(
                              fontSize: 14, color: Color(0xFF3BD7E2))),
                      Text("#치료예정",
                          style: TextStyle(
                              fontSize: 14, color: Color(0xFF3BD7E2))),
                    ],
                  )),
              Container(height: 16),
              Container(
                  height: 16,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset("assets/star_sample.png"),
                      Container(
                        // color: Color(0xDDDDDD),
                        color: Colors.black,
                        width: 1,
                        height: 8,
                      ),
                      Container(width: 10),
                      SvgPicture.asset("images/svg/time.svg"),
                      Container(width: 5),
                      Text("25분",
                          style: TextStyle(
                            height:
                                1, // 없으면 top leading 영역 때문에 텍스트가 아래로 좀 내려감 https://api.flutter.dev/flutter/painting/TextStyle-class.html
                            fontSize: 14,
                            color: Color(0xFF666666),
                            // textBaseline: TextBaseline.ideographic
                          ))
                    ],
                  ))
            ],
          ),
        )
      ],
    ));
  }
}
