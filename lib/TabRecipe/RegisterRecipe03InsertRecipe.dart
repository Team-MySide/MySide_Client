import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_side_client/common/CommonHeader.dart';

class RegisterRecipe03InsertRecipe extends StatelessWidget {
  RegisterRecipe03InsertRecipe({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppbar(
        "재료 입력(2/5)",
        // Colors.white.value,
        // isBack: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
                padding: EdgeInsets.all(15),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text("기본재료",
                            style: TextStyle(
                                fontSize: 14, color: Color(0xFF666666))),
                        SizedBox(width: 7),
                        SvgPicture.asset("images/svg/edit.svg")
                      ],
                    ),
                    SizedBox(height: 8),
                    TextField(
                      maxLines: 3,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "마늘 \n새우 12마리 \n시금치 200g"),
                    ),
                    SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text("양념재료",
                                style: TextStyle(
                                    fontSize: 14, color: Color(0xFF666666))),
                            SizedBox(width: 7),
                            SvgPicture.asset("images/svg/edit.svg")
                          ],
                        ),
                        SvgPicture.asset("images/svg/x.svg")
                      ],
                    ),
                    SizedBox(height: 8),
                    TextField(
                      maxLines: 3,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "소금 1/2컵\n올리브유 1컵",
                      ),
                    ),
                    SizedBox(height: 24),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 40, top: 25),
                      child: Align(
                          child: Text("추가하기 +",
                              style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  textBaseline: TextBaseline.ideographic)),
                          alignment: Alignment.center),
                    ),
                  ],
                )),
            GuideImageList(sampleList: sampleList),
          ],
        ),
      ),
    );
  }

  List<dynamic> sampleList = [sampleImages, sampleImages, sampleImages];
}

class GuideImageList extends StatelessWidget {
  const GuideImageList({
    Key key,
    @required this.sampleList,
  }) : super(key: key);

  final List sampleList;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Color(0xFFF4F4F4)),
      child: Padding(
        padding:
            const EdgeInsets.only(left: 16, top: 19, right: 16, bottom: 32),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Text("계량가이드",
                  style: TextStyle(fontSize: 14, color: Color(0xFF666666))),
            ),
            SizedBox(
              height: 8,
            ),
            Container(
              decoration: BoxDecoration(color: Colors.white),
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: sampleList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    height: 180,
                    decoration: BoxDecoration(color: Colors.white),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

dynamic sampleImages = {
  "image": "images/profile_sample.png",
};
