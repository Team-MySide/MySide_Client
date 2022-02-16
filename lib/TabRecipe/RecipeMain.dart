import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:my_side_client/Constants.dart';
import 'package:my_side_client/common/CommonComponent.dart';

class RecipeMain extends StatefulWidget {
  @override
  State<RecipeMain> createState() => _RecipeMainState();
}

bool isRecipe = true;

class _RecipeMainState extends State<RecipeMain> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
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
                // RecommendRecipeContainer(),
                // BestRecipeContainer()
              ],
            ),
          ),
        ),
      ),
    );
  }

  final String namedWidgetPath = "/Recipe03InsertRecipe";

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

class BestRecipeContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}

class RecommendRecipeContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
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
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: isRecipe ? 4 : 3,
          // const SliverGridDelegateWithMaxCrossAxisExtent(
          //     maxCrossAxisExtent: 75,
          //     mainAxisExtent: 101,

          childAspectRatio: isRecipe ? 75 / 101 : 104 / 95,
          mainAxisSpacing: 16,
          crossAxisSpacing: 14),
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
        child: isRecipe
            ? RecipeCategoryItem(iconPath: iconPath, title: title)
            : DiseaseCategoryItem(iconPath: iconPath, title: title),
        onTap: () => Get.toNamed(namedWidget, arguments: title));
  }
}

class DiseaseCategoryItem extends StatelessWidget {
  const DiseaseCategoryItem({
    Key key,
    @required this.iconPath,
    @required this.title,
  }) : super(key: key);

  final String iconPath;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // FractionallySizedBox(
          //     widthFactor: 40 / 104, child:
          AspectRatio(aspectRatio: 104 / 40, child: SvgPicture.asset(iconPath)),
          Text(title, style: TextStyle(fontSize: 14, height: 1.428))
        ],
      ),
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xFFC29E9E)),
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}

class RecipeCategoryItem extends StatelessWidget {
  const RecipeCategoryItem({
    Key key,
    @required this.iconPath,
    @required this.title,
  }) : super(key: key);

  final String iconPath;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          // width: 75,
          // height: 75,
          decoration: BoxDecoration(
            border: Border.all(color: Color(0xFFC29E9E)),
            borderRadius: BorderRadius.circular(10),
          ),
          child: AspectRatio(
              aspectRatio: 1,
              child: FractionallySizedBox(
                  widthFactor: 40 / 75,
                  heightFactor: 40 / 75,
                  child: SvgPicture.asset(iconPath))),
        ),
        SizedBox(height: 8),
        Text(title,
            // style: TextStyle(fontSize: 13, height: 1.0, letterSpacing: -0.015)) //note10 works
            style:
                TextStyle(fontSize: 14, height: 18 / 14, letterSpacing: -0.015))
      ],
    );
  }
}
