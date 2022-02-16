import 'package:flutter/material.dart';

class RecipeTile {
  RecipeTile({
    @required this.recipeImg,
    @required this.rankImg,
    @required this.recipeName,
    @required this.usrProfileImg,
    @required this.usrNickname,
    @required this.usrInfo,
    @required this.rate,
    @required this.minute,
  });

  String recipeImg, rankImg, recipeName, usrProfileImg, usrNickname;
  List<String> usrInfo;
  int rate, minute;
}
