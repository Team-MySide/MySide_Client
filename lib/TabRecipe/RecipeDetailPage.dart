import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:my_side_client/constantsList.dart';
import 'package:my_side_client/controllers/RecipeControllers/RecipeDetailController.dart';
import 'package:my_side_client/wigets/etcwidgets/starRating.dart';

class RecipeDetailPage extends StatelessWidget {
  final bool hasVideo = true;
  final bool hasVideoComment = true;
  final RegisterDetailController registerDetailController =
      Get.put(RegisterDetailController());
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        buildBackgroundImage(474),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: buildRecipDetailAppbar(),
          body: GetBuilder<RegisterDetailController>(
            builder: (controller) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    hasVideo
                        ? Column(
                            children: [
                              SizedBox(height: 59),
                              SvgPicture.asset('assets/play_big.svg'),
                              SizedBox(height: 105),
                            ],
                          )
                        : SizedBox(height: 220),
                    buildFoodTypeContainer('양식', hasVideo, 15, 24),
                    SizedBox(height: 8),
                    buildRecipeDetailContainer(
                      '올리브유로 만든 뽀빠이 감바스',
                      [1, 25, 2],
                      '바다의 채소라 불리는 미역은 칼슘이 풍부해서 뼈를 튼튼하게 해준다. 식이섬유가 풍부해 포만감을 주며, 장운동을 도와 변비를 예방한다.',
                      '생새우는 위험하기 때문에 충분히 익혀주세요.',
                      '102동 옆집',
                      ['갑상선암', '수술후'],
                      [123, 22, 94, 22],
                      controller.ingredInfoExpanded,
                      controller.expandIngredInfo,
                    ),
                    !hasVideoComment && hasVideo
                        ? SizedBox()
                        : tapBarRow(controller.belowType,
                            controller.setBelowType, hasVideo),
                    buildDetailBelowContainer(controller.belowType, hasVideo),
                  ],
                ),
              );
            },
          ),
        )
      ],
    );
  }

  Widget tapBarRow(int curType, Function tapFunc, bool hasVideo) {
    return Container(
      color: Colors.white,
      child: Row(
        children: [
          selectType(
            '재료',
            curType == 1,
            tapFunc,
            1,
          ),
          selectType(
            hasVideo ? '영상설명' : '요리순서',
            curType == 2,
            tapFunc,
            2,
          ),
        ],
      ),
    );
  }

  Widget selectType(
      String typeString, bool isSelected, Function tapFunc, int id) {
    return Expanded(
      child: InkWell(
        child: Column(
          children: [
            Text(
              typeString,
              style: TextStyle(
                color: isSelected ? Color(0xFF3BD7E2) : Color(0xFF666666),
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 9),
            Container(
              height: 3,
              color: isSelected ? Color(0xFF3BD7E2) : Colors.white,
            ),
          ],
        ),
        onTap: () {
          if (id == 1) {
            tapFunc(1);
          } else {
            tapFunc(2);
          }
        },
      ),
    );
  }

  Widget buildGuideButton() {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 6,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: Color(0xFF3BD7E2),
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(30),
        ),
      ),
      child: const Text(
        '계량가이드',
        style: TextStyle(
          color: Color(0xFF3BD7E2),
          fontWeight: FontWeight.w400,
          fontSize: 14,
        ),
      ),
    );
  }

  Widget buildDetailBelowTitle(int titleType, bool hasVideo) {
    return SizedBox(
      width: double.infinity,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Text(
            titleType == 1
                ? '재료'
                : hasVideo
                    ? '영상설명'
                    : '요리순서',
            style: TextStyle(
              color: Color(0xFF111111),
              fontWeight: FontWeight.w500,
              fontSize: 22,
            ),
          ),
          Container(
            height: 12,
            width: titleType == 1 ? 43 : 75,
            color: const Color(0xFF3BD7E2).withOpacity(0.3),
          ),
        ],
      ),
    );
  }

  Widget buildDetailBelowSubtitle(String subtitle) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        SizedBox(
          width: 72,
          child: Text(
            subtitle,
            style: const TextStyle(
              color: Color(0xFF111111),
              fontWeight: FontWeight.w700,
              fontSize: 16,
            ),
          ),
        ),
        Positioned(
          left: -8,
          child: Container(
            width: 16,
            height: 16,
            decoration: BoxDecoration(
              color: const Color(0xFF3BD7E2).withOpacity(0.3),
              borderRadius: const BorderRadius.all(
                Radius.circular(50),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildDetailBelowContainer(
    int containerType,
    bool hasVideo,
  ) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16),
      color: Color(0xFFF4F4F4),
      child: Container(
        padding: EdgeInsets.all(32),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
        ),
        child: Column(
          children: [
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                buildDetailBelowTitle(containerType, hasVideo),
                containerType == 1 ? buildGuideButton() : SizedBox(),
              ],
            ),
            SizedBox(height: 24),
            containerType == 1
                ? buildIngreDetailTiles()
                : hasVideo
                    ? buildVideoCommentTile()
                    : buildRecipeOrderTiles()
          ],
        ),
      ),
    );
  }

  Widget buildVideoCommentTile() {
    return Text(
      '올리브유는 엑스트라버진 올리브유가 좋아요~!\n 추가로 방울 토마토도 넣으면 더 양양가 있는 감바스가 탄생할거예요~ 🤗',
      style: const TextStyle(
        color: Color(0xFF666666),
        fontWeight: FontWeight.w300,
        fontSize: 16,
      ),
    );
  }

  Widget buildRecipeOrderTiles() {
    List<Widget> widgetList = [];
    for (var i = 0; i < recipeOrderContent.length; i++) {
      widgetList.add(
        SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildDetailBelowSubtitle('# 0${i + 1}'),
              SizedBox(height: 8),
              recipeOrderHasPhoto[i]
                  ? Column(
                      children: [
                        Image.asset(recipeOrderPhoto[i]),
                        SizedBox(height: 8),
                      ],
                    )
                  : SizedBox(),
              Text(
                recipeOrderContent[i],
                style: const TextStyle(
                  color: Color(0xFF666666),
                  fontWeight: FontWeight.w300,
                  fontSize: 16,
                ),
              ),
              i == recipeOrderContent.length - 1
                  ? SizedBox()
                  : SizedBox(height: 24)
            ],
          ),
        ),
      );
    }
    return Column(children: widgetList);
  }

  Widget buildIngreDetailTiles() {
    List<Widget> widgetList = [];
    for (var i = 0; i < ingreTitleList.length; i++) {
      widgetList.add(
        Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildDetailBelowSubtitle(ingreTitleList[i]),
                SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: Column(
                    children: [
                      const Divider(
                        thickness: 1.5,
                        color: Color(0xFFDDDDDD),
                      ),
                      for (var j = 0; j < detailIngreList[i].length; j++)
                        buildIngredientDetail(detailIngreList[i][j]),
                    ],
                  ),
                ),
              ],
            ),
            i == ingreTitleList.length - 1 ? SizedBox() : SizedBox(height: 24)
          ],
        ),
      );
    }
    return Column(children: widgetList);
  }

  Widget buildIngredientDetail(String ingreDetail) {
    return Row(
      children: [
        SvgPicture.asset('assets/icons/dot.svg'),
        SizedBox(width: 10),
        Text(
          ingreDetail,
          style: const TextStyle(
            color: Color(0xFF666666),
            fontWeight: FontWeight.w300,
            fontSize: 16,
          ),
        ),
      ],
    );
  }

  //TODO : 이부분 class로 가져오면 쉽게 할수 있음, model이 정해지면 그때수정
  Widget buildRecipeDetailContainer(
    String recipeName,
    List<int> recipeInfoNumbers,
    String recipeExplain,
    String recipeCaution,
    String nickName,
    List<String> usrInfos,
    List<int> iconsRowNumbers,
    bool isIngredInfoExpanded,
    Function expandFunc,
  ) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 32),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            recipeName,
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 24,
            ),
          ),
          SizedBox(height: 10),
          buildIngredRelatedCancerNComponentColumns(isIngredInfoExpanded),
          InkWell(
            child: Center(
              child: isIngredInfoExpanded
                  ? SvgPicture.asset('assets/arrow2up.svg')
                  : SvgPicture.asset('assets/arrow2down.svg'),
            ),
            onTap: expandFunc,
          ),
          SizedBox(height: 32),
          buildRecipeInfoRow(recipeInfoNumbers),
          buildRecipeTextBox(recipeExplain, recipeCaution),
          buildUsrInfoBox(nickName, usrInfos[0], usrInfos[1]),
          buildRecipeIconsRow(iconsRowNumbers),
          SizedBox(height: 25),
        ],
      ),
    );
  }

  Widget buildIngredRelatedCancerNComponentColumns(bool isExpanded) {
    List<Widget> widgetList = [];
    int colNum = isExpanded ? ingredImgs.length : 1;
    for (var i = 0; i < colNum; i++) {
      widgetList.add(
        buildIngredRelatedCancerNComponent(
          imgContainerColor[i],
          ingredImgs[i],
          ingredRelatedCancer[i],
          ingredRelatedComponent[i],
        ),
      );
    }
    return SizedBox(
      height: isExpanded ? 145 : 50,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: widgetList,
          ),
        ],
      ),
    );
  }

  Widget buildIngredRelatedCancerNComponent(
    Color imgContColor,
    String imgPth,
    List<String> ingredRelatedCancers,
    List<String> ingredRelatedComponents,
  ) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              height: 35,
              width: 35,
              decoration: BoxDecoration(
                color: imgContColor,
                borderRadius: BorderRadius.all(Radius.circular(50)),
              ),
              child: Image.asset(
                imgPth,
                height: 25,
              ),
            ),
            SizedBox(width: 8),
            for (var i = 0; i < ingredRelatedCancers.length; i++)
              buildIngredInfoRow(ingredRelatedCancers[i], false),
            for (var i = 0; i < ingredRelatedComponents.length; i++)
              buildIngredInfoRow(ingredRelatedComponents[i], true)
          ],
        ),
        SizedBox(height: 8),
      ],
    );
  }

  Widget buildIngredInfoRow(String infoText, bool isIngred) {
    return Row(
      children: [
        buildRoundFoodInfo(infoText, isIngred),
        SizedBox(width: 8),
      ],
    );
  }

  Widget buildIconAndNumber(String number, String icon, bool isLast) {
    return Row(
      children: [
        SizedBox(
          width: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(icon),
              SizedBox(
                width: 5,
              ),
              Text(
                number,
                style: const TextStyle(
                  color: Color(0xFF666666),
                  fontWeight: FontWeight.w300,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
        isLast
            ? SizedBox(
                width: 0,
              )
            : const VerticalDivider(
                color: Color(0xFFDDDDDD),
                thickness: 1.5,
              ),
      ],
    );
  }

  Widget buildRecipeIconsRow(List<int> referedNumbers) {
    List<String> icons = [
      'assets/icons/like.svg',
      'assets/icons/bookmark.svg',
      'assets/icons/share.svg',
      'assets/icons/comment.svg',
    ];
    return SizedBox(
      height: 16,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          for (var i = 0; i < icons.length; i++)
            buildIconAndNumber(
              referedNumbers[i].toString(),
              icons[i],
              i == icons.length - 1,
            ),
        ],
      ),
    );
  }

  //TODO : userinfo가 많아질 때를 위해 wrap 사용
  Widget buildUsrInfoBox(String nickname, String info1, String info2) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          decoration: const BoxDecoration(
            color: Color(0xFFF4F4F4),
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
          ),
          child: Row(
            children: [
              Image.asset('assets/profile_img/person_round.png'),
              SizedBox(
                width: 8,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    nickname,
                    style: const TextStyle(
                      color: Color(0xFF666666),
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    '#$info1 #$info2',
                    style: const TextStyle(
                      color: Color(0xFF3BD7E2),
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        SizedBox(
          height: 24,
        ),
      ],
    );
  }

  Widget buildRecipeTextBox(String recipeExplain, String cautionText) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '레시피 설명',
          style: TextStyle(
            color: Color(0xFF111111),
            fontSize: 14.0,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(
          height: 8,
        ),
        Text(
          recipeExplain,
          style: const TextStyle(
            color: Color(0xFF666666),
            fontSize: 16.0,
            fontWeight: FontWeight.w300,
          ),
        ),
        SizedBox(
          height: 16,
        ),
        const Text(
          '주의점',
          style: TextStyle(
            color: Color(0xFFF76300),
            fontSize: 14.0,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(
          height: 8,
        ),
        Text(
          cautionText,
          style: const TextStyle(
            color: Color(0xFF666666),
            fontSize: 16.0,
            fontWeight: FontWeight.w300,
          ),
        ),
        SizedBox(
          height: 32,
        ),
      ],
    );
  }

  Widget buildRecipeInfoRow(List<int> recipeInfoList) {
    return Column(children: [
      SizedBox(
        height: 54,
        child: Row(
          children: [
            const Spacer(),
            buildFoodInfoBox(
              '난이도',
              StarRating(
                rating: recipeInfoList[0],
                spacing: 4.5,
                starSize: 12,
                starAlign: 1,
              ),
            ),
            const Spacer(),
            const VerticalDivider(
              color: Color(0xFFDDDDDD),
              thickness: 1.5,
            ),
            const Spacer(),
            buildFoodInfoBox(
              '소요시간',
              buildRichText(recipeInfoList[1].toString(), '분'),
            ),
            const Spacer(),
            const VerticalDivider(
              color: Color(0xFFDDDDDD),
              thickness: 1.5,
            ),
            const Spacer(),
            buildFoodInfoBox(
              '분량',
              buildRichText(recipeInfoList[2].toString(), '인분'),
            ),
            const Spacer(),
          ],
        ),
      ),
      SizedBox(
        height: 32,
      ),
    ]);
  }

  Widget buildRichText(String firstText, String secondText) {
    return RichText(
      text: TextSpan(
        text: firstText,
        style: const TextStyle(
          color: Color(0xFF111111),
          fontSize: 24.0,
          fontWeight: FontWeight.w600,
        ),
        children: [
          TextSpan(
            text: secondText,
            style: const TextStyle(
              color: Color(0xFF666666),
              fontSize: 14.0,
              fontWeight: FontWeight.w300,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildFoodInfoBox(String belowText, Widget topWidget) {
    return SizedBox(
      width: 46,
      child: Column(
        children: [
          topWidget,
          const Spacer(),
          Text(
            belowText,
            style: const TextStyle(
              color: Color(0xFF666666),
              fontSize: 12,
              fontWeight: FontWeight.w300,
            ),
          )
        ],
      ),
    );
  }

  Widget buildRoundFoodInfo(String infoText, bool isIngrediant) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 6,
        horizontal: 16,
      ),
      decoration: BoxDecoration(
        color: isIngrediant ? const Color(0xFFFFF6D6) : const Color(0xFFE4F7FB),
        borderRadius: const BorderRadius.all(
          Radius.circular(30),
        ),
      ),
      child: Text(
        infoText,
        style: TextStyle(
          color:
              isIngrediant ? const Color(0xFFFF7D05) : const Color(0xFF1260A8),
          fontSize: 14,
          fontWeight: FontWeight.w300,
        ),
      ),
    );
  }

  Widget buildBackgroundImage(double imgHeight) {
    return Container(
      height: imgHeight,
      decoration: BoxDecoration(
        image: DecorationImage(
          colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.7), BlendMode.dstATop),
          image: AssetImage('assets/food_img/food_background.png'),
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }

  Widget buildRecipDetailAppbar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      title: Center(
        child: Text(
          '레시피 정보',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset('assets/icons/question.svg'),
        )
      ],
    );
  }

  Widget buildFoodTypeContainer(
    String foodType,
    bool hasVideo,
    int durationMin,
    int durationSec,
  ) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 17),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              vertical: 8,
              horizontal: 12,
            ),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.5),
              borderRadius: const BorderRadius.all(
                Radius.circular(30),
              ),
            ),
            child: Text(
              foodType,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w300,
                fontSize: 14,
              ),
            ),
          ),
          const Spacer(),
          hasVideo
              ? Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 12,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.5),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(30),
                    ),
                  ),
                  child: Text(
                    '$durationMin:$durationSec',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w300,
                      fontSize: 14,
                    ),
                  ),
                )
              : SizedBox(),
        ],
      ),
    );
  }
}
