import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_side_client/common/CommonLikeBookmark.dart';
import 'package:my_side_client/wigets/etcwidgets/starRating.dart';

class RecipeDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        buildBackgroundImage(474),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: buildRecipDetailAppbar(),
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 220),
                buildFoodTypeContainer('양식'),
                SizedBox(height: 8),
                buildRecipeDetailContainer(
                  '올리브유로 만든 뽀빠이 감바스',
                  ['위암', '대장암', '새우', '마늘'],
                  [false, false, true, true],
                  [1, 25, 2],
                  '바다의 채소라 불리는 미역은 칼슘이 풍부해서 뼈를 튼튼하게 해준다. 식이섬유가 풍부해 포만감을 주며, 장운동을 도와 변비를 예방한다.',
                  '생새우는 위험하기 때문에 충분히 익혀주세요.',
                  '102동 옆집',
                  ['갑상선암', '수술후'],
                  [123, 22, 94, 22],
                ),
                buildDetailBelowContainer(1),
              ],
            ),
          ),
        )
      ],
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

  Widget buildDetailBelowTitle(int titleType) {
    return SizedBox(
      width: double.infinity,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Text(
            titleType == 1 ? '재료' : '요리순서',
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
                buildDetailBelowTitle(containerType),
                containerType == 1 ? buildGuideButton() : SizedBox(),
              ],
            ),
            SizedBox(height: 24),
            // TODO : 이부분도 subtitle list, subtile 안의 재료 list따로 받아햐함.
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildDetailBelowSubtitle('기본재료'),
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
                      buildIngredientDetail('마늘 3개'),
                      buildIngredientDetail('새우 12마리'),
                      buildIngredientDetail('시금치 200g'),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 24),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildDetailBelowSubtitle('양념장 소스 재료'),
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
                      buildIngredientDetail('소금 1/2 컵'),
                      buildIngredientDetail('올리브유 1컵'),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
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
    List<String> cancerIngredInfo,
    List<bool> cancerIngredInfoType,
    List<int> recipeInfoNumbers,
    String recipeExplain,
    String recipeCaution,
    String nickName,
    List<String> usrInfos,
    List<int> iconsRowNumbers,
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
          buildFoodInfoRow(
            cancerIngredInfo,
            cancerIngredInfoType,
          ),
          buildRecipeInfoRow(recipeInfoNumbers),
          buildRecipeTextBox(recipeExplain, recipeCaution),
          buildUsrInfoBox(nickName, usrInfos[0], usrInfos[1]),
          buildRecipeIconsRow(iconsRowNumbers),
        ],
      ),
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
    return SizedBox(
      height: 16,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          LikeComponent("1", false, 123, IconType.like),
          VerticalDivider(),
          LikeComponent("1", false, 123, IconType.bookmark),
          VerticalDivider(),
          LikeComponent("1", false, 123, IconType.share),
          VerticalDivider(),
          CommentWidget("1", 123),
          // LikeComponent("1", false, 123, IconType.comment),
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

  //TODO : container가 여러개로 늘경우 wrap으로 바꿔줘야함
  Widget buildFoodInfoRow(List<String> infos, List<bool> infoTypes) {
    return Column(
      children: [
        SizedBox(
          height: 11,
        ),
        Row(
          children: [
            buildRoundFoodInfo(infos[0], infoTypes[0]),
            SizedBox(width: 8),
            buildRoundFoodInfo(infos[1], infoTypes[1]),
            SizedBox(width: 8),
            buildRoundFoodInfo(infos[2], infoTypes[2]),
            SizedBox(width: 8),
            buildRoundFoodInfo(infos[3], infoTypes[3]),
          ],
        ),
        SizedBox(
          height: 32,
        ),
      ],
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

  Widget buildFoodTypeContainer(String foodType) {
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
        ],
      ),
    );
  }
}

class CommentWidget extends StatelessWidget {
  final String id;
  final int cnt;
  const CommentWidget(
    this.id,
    this.cnt, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: SizedBox(
        width: 70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset("assets/icons/comment.svg"),
            SizedBox(
              width: 5,
            ),
            Text(
              cnt.toString(),
              style: const TextStyle(
                color: Color(0xFF666666),
                fontWeight: FontWeight.w300,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
      // onTap: ,navigate to 댓글 목록
    );
  }
}
