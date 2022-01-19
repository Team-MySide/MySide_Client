import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:my_side_client/Constants.dart';
import 'package:my_side_client/TabRecipe/RecipeListExample.dart';
import 'package:my_side_client/common/CommonComponent.dart';
import 'package:my_side_client/models/recipeTileModel.dart';
import 'package:my_side_client/wigets/buttonwidget/textWithMoreButton.dart';
import 'package:my_side_client/wigets/etcwidgets/recipeTileType1.dart';
import 'package:my_side_client/wigets/etcwidgets/recipeTileType2.dart';
import 'package:my_side_client/wigets/etcwidgets/starRating.dart';

class RecipeMain extends StatefulWidget {
  @override
  State<RecipeMain> createState() => _RecipeMainState();
}

class _RecipeMainState extends State<RecipeMain> {
  TextEditingController controller = TextEditingController();
  final ScrollController _scrollCtrl = ScrollController();

  bool isRecipe = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SearchContainer(
                  controller,
                  hintText: "레시피를 입력하세요",
                ),
                SizedBox(
                  height: 40,
                ),
                CategoryTitle(),
                SizedBox(
                  height: 24,
                ),
                isRecipe
                    ? NavigateIconViewsContainer2(categoryList)
                    : NavigateIconViewsContainer2(diseasesList),
                buildRecommendRecipe(() {}, recipeTiles, 410, 223),
                buildBestRecipe(() {}, recipeTiles),
              ],
            ),
          ),
        ),
      ),
    );
  }

  final String namedWidgetPath = "/Recipe03InsertRecipe";

  Widget buildRecommendRecipe(
    VoidCallback onTap,
    List<RecipeTile> recipeTiles,
    double listviewHeight,
    double imgSize,
  ) {
    return Column(
      children: [
        SizedBox(height: 40),
        TextWithMoreButton(titleText: '위암에 좋은 추천 레시피', onTap: onTap),
        SizedBox(height: 26),
        SizedBox(
          height: listviewHeight,
          child: Scrollbar(
            controller: _scrollCtrl,
            showTrackOnHover: true,
            isAlwaysShown: true,
            thickness: 2,
            child: ListView.separated(
              controller: _scrollCtrl,
              physics: ScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return RecipeTileType2Widget(
                  recipeTile: recipeTiles[index],
                  imgWidth: imgSize,
                  subTileHeight: listviewHeight - imgSize - 24,
                );
              },
              separatorBuilder: (BuildContext context, int index) =>
                  SizedBox(width: 16),
              itemCount: recipeTiles.length,
            ),
          ),
        ),
      ],
    );
  }

  Widget buildBestRecipe(VoidCallback onTap, List<RecipeTile> recipeTiles) {
    return Column(
      children: [
        SizedBox(height: 40),
        TextWithMoreButton(titleText: '이달의 BEST 레시피', onTap: onTap),
        SizedBox(height: 26),
        ListView.separated(
          physics: ScrollPhysics(),
          shrinkWrap: true,
          itemCount: recipeTiles.length,
          itemBuilder: (BuildContext context, int index) {
            return RecipeTileType1Widget(
              recipeTile: recipeTiles[index],
              tileHeight: 164,
            );
          },
          separatorBuilder: (BuildContext context, int index) =>
              SizedBox(height: 30),
        ),
      ],
    );
  }

  Widget CategoryTitle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () => setState(() {
            isRecipe = true;
          }),
          child: Column(children: [
            Text("종류별 레시피",
                style: TextStyle(
                    fontSize: 16,
                    color: isRecipe
                        ? Color(Constants.primaryColorInt)
                        : Color(0xFFAAAAAA))),
            SizedBox(
              height: 8,
            ),
            Container(
              height: 3,
              width: 92,
              decoration: BoxDecoration(
                  color: isRecipe
                      ? Color(Constants.primaryColorInt)
                      : Colors.transparent),
            )
          ]),
        ),
        SizedBox(
          width: 20,
        ),
        GestureDetector(
          onTap: () => setState(() {
            isRecipe = false;
          }),
          child: Column(children: [
            Text("질병별 레시피",
                style: TextStyle(
                    fontSize: 16,
                    color: isRecipe
                        ? Color(0xFFAAAAAA)
                        : Color(Constants.primaryColorInt))),
            SizedBox(
              height: 8,
            ),
            Container(
              height: 3,
              width: 92,
              decoration: BoxDecoration(
                  color: isRecipe
                      ? Colors.transparent
                      : Color(Constants.primaryColorInt)),
            )
          ]),
        ),
      ],
    );
  }
}

//will move to CommonComponent. And will replace NavigateIconViewsContainer
class NavigateIconViewsContainer2 extends StatelessWidget {
  final data;

  NavigateIconViewsContainer2(this.data, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return _getNavigateIconViews(data)
    return GridView.builder(
      shrinkWrap: true,
      itemCount: data.length,
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 75,
          mainAxisExtent: 101,
          mainAxisSpacing: 16,
          crossAxisSpacing: 15),
      itemBuilder: (context, index) => NavigateIconView(data[index]),
    );
  }
}

const List<Map> diseasesList = [
  {"title": "위암", "iconPath": "images/svg/disease_1.svg", "namedRoute": ""},
  {"title": "간암", "iconPath": "images/svg/disease_2.svg", "namedRoute": ""},
  {"title": "대장암", "iconPath": "images/svg/disease_3.svg", "namedRoute": ""},
  {"title": "폐암", "iconPath": "images/svg/disease_4.svg", "namedRoute": ""},
  {"title": "유방암", "iconPath": "images/svg/disease_5.svg", "namedRoute": ""},
  {"title": "갑상선암", "iconPath": "images/svg/disease_6.svg", "namedRoute": ""},
];

const List<dynamic> categoryList = [
  {"iconPath": "images/svg/maindish.svg", "title": "메인요리", "namedRoute": ""},
  {"iconPath": "images/svg/side.svg", "title": "밑반찬", "namedRoute": ""},
  {"iconPath": "images/svg/stew.svg", "title": "국/탕/찌개", "namedRoute": ""},
  {"iconPath": "images/svg/dessert.svg", "title": "디저트", "namedRoute": ""},
  {"iconPath": "images/svg/nudle.svg", "title": "면/만두", "namedRoute": ""},
  {"iconPath": "images/svg/rice.svg", "title": "밥/죽/떡", "namedRoute": ""},
  {"iconPath": "images/svg/kimchi.svg", "title": "김치/젓갈/장", "namedRoute": ""},
  {"iconPath": "images/svg/steak.svg", "title": "양식", "namedRoute": ""},
  {"iconPath": "images/svg/jam.svg", "title": "양념/잼", "namedRoute": ""},
  {"iconPath": "images/svg/salad.svg", "title": "샐러드", "namedRoute": ""},
  {
    "iconPath": "images/svg/category_tea.svg",
    "title": "차/음료",
    "namedRoute": ""
  },
  {"iconPath": "images/svg/category_etc.svg", "title": "기타", "namedRoute": ""}
];

class NavigateIconView extends StatelessWidget {
  final data;
  const NavigateIconView(this.data, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String iconPath = data['iconPath'];
    String title = data['title'];
    String namedWidget = data['namedRoute'];

    return GestureDetector(
        child: Column(
          children: [
            Container(
              width: 75,
              height: 75,
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xFFDDDDDD)),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(child: SvgPicture.asset(iconPath)),
            ),
            SizedBox(height: 8),
            Text(title, style: TextStyle(fontSize: 14))
          ],
        ),
        onTap: () => Get.toNamed(namedWidget, arguments: title));
  }
}
