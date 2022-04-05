import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:my_side_client/Constants.dart';
import 'package:my_side_client/TabRecipe/RecipeMainService/RecipeMainController.dart';
import 'package:my_side_client/common/CommonComponent.dart';
import 'package:my_side_client/wigets/buttonwidget/textWithMoreButton.dart';
import 'package:my_side_client/wigets/etcwidgets/recipeTileType1.dart';
import 'package:my_side_client/wigets/etcwidgets/recipeTileType2.dart';
import 'RecipeMainService/RecipeMainRecommendRecipeItem.dart';

class RecipeMain extends StatefulWidget {
  @override
  State<RecipeMain> createState() => _RecipeMainState();
}

bool isRecipe = true;

// bool isRecommendRecipeLoaded = false;
class _RecipeMainState extends State<RecipeMain> {
  TextEditingController controller = TextEditingController();
  final ScrollController _scrollCtrl = ScrollController();
  RecipeMainRecommendRecipeController recommendRecipeController =
      Get.put(RecipeMainRecommendRecipeController());
  @override
  void initState() {
    super.initState();
    recommendRecipeController.fetch();
  }

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
                categoryTitleWidget(),
                SizedBox(
                  height: 24,
                ),
                isRecipe
                    ? NavigateIconViewsContainer2(categoryList)
                    : NavigateIconViewsContainer2(diseasesList),
                Obx(() => recommendRecipeController.isLoaded.value
                    ? buildRecommendRecipe(
                        () {}, recommendRecipeController.lst, 410, 223, true)
                    : buildRecommendRecipe(() {}, [], 410, 223, false)),
                Obx(() => recommendRecipeController.isLoaded.value
                    ? buildBestRecipe(() {}, recommendRecipeController.lst)
                    : buildBestRecipe(() {}, [])),
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
      List<RecommendRecipeItem> recipeTiles,
      double listviewHeight,
      double imgSize,
      bool isLoaded) {
    return Column(
      children: [
        SizedBox(height: 40),
        TextWithMoreButton(
            titleText: recipeTiles.length == 0
                ? '암에 좋은 추천 레시피'
                : '${recipeTiles[0].cancerNm}에 좋은 추천 레시피',
            onTap: onTap),
        SizedBox(height: 26),
        SizedBox(
          height: listviewHeight,
          child: Scrollbar(
            controller: _scrollCtrl,
            showTrackOnHover: true,
            isAlwaysShown: true,
            thickness: 2,
            child: RecipeRecommendTileWidget(
                recipeTiles: recipeTiles,
                scrollCtrl: _scrollCtrl,
                isLoaded: isLoaded),
          ),
        ),
      ],
    );
  }

  Widget buildBestRecipe(
      VoidCallback onTap, List<RecommendRecipeItem> recipeTiles) {
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
            return RecipeBestTileWidget(
              recipeTile: recipeTiles[index],
              position: index,
              tileHeight: 164,
            );
          },
          separatorBuilder: (BuildContext context, int index) =>
              SizedBox(height: 30),
        ),
      ],
    );
  }

  Widget categoryTitleWidget() {
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

class RecipeRecommendTileWidget extends StatelessWidget {
  const RecipeRecommendTileWidget(
      {Key key, this.scrollCtrl, this.isLoaded, this.recipeTiles});
  final List<RecommendRecipeItem> recipeTiles;
  final ScrollController scrollCtrl;
  final bool isLoaded;
  final double imgSize = 223;
  final double listviewHeight = 410;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      controller: scrollCtrl,
      physics: ScrollPhysics(),
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemBuilder: (BuildContext context, int index) {
        return RecipeTileType2Widget(
            recipeTile: recipeTiles[index],
            imgWidth: imgSize,
            subTileHeight: listviewHeight - imgSize - 24,
            isLoaded: isLoaded);
      },
      separatorBuilder: (BuildContext context, int index) =>
          SizedBox(width: 16),
      itemCount: recipeTiles.length,
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
      physics: new NeverScrollableScrollPhysics(),
      gridDelegate: isRecipe
          ?
          // SliverGridDelegateWithMaxCrossAxisExtent(

          const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 75,
              mainAxisExtent: 101,
              mainAxisSpacing: 16,
              crossAxisSpacing: 15,
            )
          // crossAxisCount: 4,
          // childAspectRatio: 75 / 104 : 104 / 95,//  75/101
          // mainAxisSpacing: 16,
          // crossAxisSpacing: 14)
          : const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 104 / 95,
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
    this.iconPath,
    this.title,
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
    this.iconPath,
    this.title,
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
        // SizedBox(height: 6),
        Text(title,
            // style: TextStyle(fontSize: 13, height: 1.0, letterSpacing: -0.015)) //note10 works
            style: TextStyle(
                fontSize: title == "김치/젓갈/장" ? 13 : 14,
                height: 18 / 14,
                letterSpacing: -0.15))
      ],
    );
  }
}
