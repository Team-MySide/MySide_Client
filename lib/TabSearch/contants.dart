import 'package:flutter/material.dart';

TextStyle hashStyle = const TextStyle(
  fontSize: 14,
  fontWeight: FontWeight.w300,
  color: Color(0xFF3BD7E2),
);

class RecipeTile {
  RecipeTile({
    this.recipeImg,
    this.rankImg,
    this.recipeName,
    this.usrProfileImg,
    this.usrNickname,
    this.usrInfo,
    this.rate,
    this.minute,
  });

  String recipeImg, rankImg, recipeName, usrProfileImg, usrNickname;
  List<String> usrInfo;
  int rate, minute;
}

List<RecipeTile> recipeTiles = [
  RecipeTile(
    recipeImg: 'assets/food_img/1.png',
    rankImg: 'assets/icons/01.svg',
    recipeName: '올리브유로 만든 뽀빠이 감바스',
    usrProfileImg: 'assets/profile_img/1.png',
    usrNickname: '102동옆집',
    usrInfo: ['#갑상선암', '#1기', '#치료예정'],
    rate: 3,
    minute: 25,
  ),
  RecipeTile(
    recipeImg: 'assets/food_img/2.png',
    rankImg: 'assets/icons/02.svg',
    recipeName: '표고버섯 된장찌개',
    usrProfileImg: 'assets/profile_img/2.png',
    usrNickname: '월화수목금토일',
    usrInfo: ['#위암', '#3기', '#수술후'],
    rate: 2,
    minute: 27,
  ),
  RecipeTile(
    recipeImg: 'assets/food_img/3.png',
    rankImg: 'assets/icons/03.svg',
    recipeName: '색감이 다채로운 과일 채소 허브 유자 샐러드 입니다',
    usrProfileImg: 'assets/profile_img/1.png',
    usrNickname: '102동옆집',
    usrInfo: ['#갑상선암', '#1기', '#치료예정'],
    rate: 2,
    minute: 15,
  ),
  RecipeTile(
    recipeImg: 'assets/food_img/4.png',
    rankImg: 'assets/icons/04.svg',
    recipeName: '몸에 좋은 새싹 베이글',
    usrProfileImg: 'assets/profile_img/3.png',
    usrNickname: '행복한하루',
    usrInfo: ['#대장암', '#4기', '#항암중'],
    rate: 1,
    minute: 25,
  ),
];
