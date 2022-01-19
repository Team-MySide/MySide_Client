import 'package:flutter/material.dart';
import 'package:my_side_client/models/recipeTileModel.dart';
import 'package:my_side_client/wigets/etcwidgets/recipeSubTile.dart';

class RecipeTileType2Widget extends StatelessWidget {
  final RecipeTile recipeTile;
  final double imgWidth;
  final double subTileHeight;
  RecipeTileType2Widget({
    @required this.recipeTile,
    @required this.imgWidth,
    @required this.subTileHeight,
  });
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: imgWidth,
      child: Column(
        children: [
          Image.asset(
            recipeTile.recipeImg,
            width: imgWidth,
            height: imgWidth,
            fit: BoxFit.fitWidth,
          ),
          SizedBox(height: 8),
          SizedBox(
            height: subTileHeight,
            child: RecipeSubTile(
              recipeTile: recipeTile,
            ),
          ),
          SizedBox(height: 16),
        ],
      ),
    );
  }
}
