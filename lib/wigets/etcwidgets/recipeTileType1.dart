import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_side_client/models/recipeTileModel.dart';
import 'package:my_side_client/wigets/etcwidgets/recipeSubTile.dart';

class RecipeTileType1Widget extends StatelessWidget {
  final RecipeTile recipeTile;
  final double tileHeight;
  RecipeTileType1Widget({
    @required this.recipeTile,
    @required this.tileHeight,
  });
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: tileHeight,
      child: Row(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Image.asset(
                recipeTile.recipeImg,
                width: tileHeight,
                height: tileHeight,
              ),
              Positioned(
                top: -4.5,
                left: 10,
                child: SvgPicture.asset(recipeTile.rankImg),
              )
            ],
          ),
          SizedBox(width: 14),
          Expanded(
            child: RecipeSubTile(
              recipeTile: recipeTile,
            ),
          ),
        ],
      ),
    );
  }
}
