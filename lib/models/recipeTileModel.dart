import 'package:flutter/material.dart';

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
