import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/state_manager.dart';
import 'package:my_side_client/TabSearch/contants.dart';
import 'package:my_side_client/wigets/etcwidgets/recipeTileType1.dart';
import '../Constants.dart';
import 'RecipeMain.dart';
import 'Service/Recipe02ListController.dart';
import 'Service/RecipeListItem.dart';

class RecipeList extends StatefulWidget {
  RecipeList({Key key}) : super(key: key);

  final Recipe02ListController recipeListController =
      Get.put(Recipe02ListController(Get.arguments[0], Get.arguments[1]));

  @override
  State<RecipeList> createState() => _RecipeListState();
}

class _RecipeListState extends State<RecipeList> {
  TextEditingController _textEditingController;
  String _dropdownValue = "최신순";

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    double scrHeight = MediaQuery.of(context).size.height;
    double scrWidth = MediaQuery.of(context).size.width;
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
                        Category category = Get.arguments[0];
                        switch (category) {
                          case Category.disease:
                            widget.recipeListController.fetchDiseaseList();
                            break;
                          case Category.food:
                            widget.recipeListController.fetchFoodList();
                            break;
                          case Category.recommend:
                            widget.recipeListController.fetchRecommendList();
                            break;
                          case Category.best:
                            widget.recipeListController.fetchMonthAllRankList();
                            break;
                        }
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
          Obx(
            () => widget.recipeListController.isLoading.value
                ? CircularProgressIndicator()
                : Expanded(
                    child: ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: widget.recipeListController.lst.length,
                      itemBuilder: (BuildContext context, int index) {
                        return buildSingleRecipeTile(scrWidth, scrHeight,
                            widget.recipeListController.lst[index], index);
                        // recipeTiles, index);
                      },
                      separatorBuilder: (BuildContext context, int index) =>
                          SizedBox(height: 0.0296 * scrHeight),
                    ),
                  ),
          )
        ]),
      ),
    );
  }
}

Widget buildRoundedWidget(
    Widget frondWidget, Widget backWidget, double scrHeight, double scrWidth) {
  return Container(
    padding: EdgeInsets.symmetric(
      vertical: scrHeight * 0.01355,
      horizontal: 0.0427 * scrWidth,
    ),
    decoration: BoxDecoration(
      border: Border.all(
        color: const Color(0xFFDDDDDD),
      ),
      borderRadius: const BorderRadius.all(
        Radius.circular(50),
      ),
    ),
    child: Row(
      children: [
        frondWidget,
        const Spacer(),
        backWidget,
      ],
    ),
  );
}

Widget buildFoodImg(String imgPath, double scrWidth, int position) {
  return Stack(
    clipBehavior: Clip.none,
    children: [
      Image.asset(
        imgPath,
        width: 0.4373 * scrWidth,
      ),
      Positioned(
        top: -2,
        left: 10,
        child: RankBanner(position: position),
      ),
    ],
  );
}

Widget buildRecipeName(String recipeName) {
  return Text(
    recipeName,
    maxLines: 2,
    overflow: TextOverflow.ellipsis,
    style: const TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w700,
    ),
  );
}

Widget buildUsrInfo(List<String> usrInfo, double scrWidth) {
  return SizedBox(
    width: double.infinity,
    child: Wrap(
      spacing: 0.0213 * scrWidth,
      children: [
        Text(usrInfo[0], style: hashStyle),
        Text(usrInfo[1], style: hashStyle),
        Text(usrInfo[2], style: hashStyle),
      ],
    ),
  );
}

Widget buildProfileAndNickname(
    String profileImg, String nickname, double scrWidth) {
  return Row(
    children: [
      Image.asset(profileImg),
      SizedBox(
        width: 0.0213 * scrWidth,
      ),
      Text(
        nickname,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ),
    ],
  );
}

Widget buildStarRatingNMinute(double scrWidth, int minute, int rating) {
  return Row(
    children: [
      rating < 1
          ? SvgPicture.asset('assets/icons/off.svg')
          : SvgPicture.asset('assets/icons/on.svg'),
      SizedBox(
        width: 0.0107 * scrWidth,
      ),
      rating < 2
          ? SvgPicture.asset('assets/icons/off.svg')
          : SvgPicture.asset('assets/icons/on.svg'),
      SizedBox(
        width: 0.0107 * scrWidth,
      ),
      rating < 3
          ? SvgPicture.asset('assets/icons/off.svg')
          : SvgPicture.asset('assets/icons/on.svg'),
      SizedBox(
        width: 0.0267 * scrWidth,
      ),
      const VerticalDivider(
        color: Color(0xFFDDDDDD),
        thickness: 1.5,
      ),
      SizedBox(
        width: 0.0267 * scrWidth,
      ),
      SvgPicture.asset('assets/icons/time.svg'),
      SizedBox(
        width: 0.0133 * scrWidth,
      ),
      Text(
        minute.toString() + '분',
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w300,
          color: Color(0xFF666666),
        ),
      ),
    ],
  );
}

Widget buildSingleRecipeTile(
    double scrWidth, double scrHeight, RecipeItem recipeTile, int index) {
  return SizedBox(
    height: 0.22 * scrHeight,
    child: Row(
      children: [
        buildFoodImg(recipeTile.receipeImg, scrWidth, index),
        SizedBox(
          width: 0.03 * scrWidth,
        ),
        Expanded(
          child: Column(
            children: [
              buildRecipeName(recipeTile.receipeName),
              const Spacer(),
              Column(
                children: [
                  buildProfileAndNickname(
                    // recipeTile.usrProfileImg,
                    'assets/profile_img/1.png',
                    recipeTile.userName,
                    scrWidth,
                  ),
                  SizedBox(
                    height: 0.0049 * scrHeight,
                  ),
                  buildUsrInfo([
                    recipeTile.userCancerNm,
                    recipeTile.userProgressNm,
                    recipeTile.userStageNm
                  ], scrWidth),
                  SizedBox(
                    height: 0.0197 * scrHeight,
                  ),
                  SizedBox(
                    height: 0.025 * scrHeight,
                    child: buildStarRatingNMinute(
                        scrWidth,
                        int.parse(recipeTile.receipeTime),
                        int.parse(recipeTile.receipeDifficulty)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
