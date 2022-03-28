import 'package:flutter/material.dart';
import 'package:my_side_client/TabRecipe/RecipeMainService/RecipeMainRecommendRecipeItem.dart';
import 'package:my_side_client/wigets/etcwidgets/recipeSubTile.dart';

class RecipeTileType2Widget extends StatelessWidget {
  final RecommendRecipeItem recipeTile;
  final double imgWidth;
  final double subTileHeight;
  final bool isLoaded;
  RecipeTileType2Widget(
      {this.recipeTile, this.imgWidth, this.subTileHeight, this.isLoaded});
  @override
  Widget build(BuildContext context) {
    return isLoaded
        ? SizedBox(
            width: imgWidth,
            child: Column(
              children: [
                SizedBox(
                  child: (recipeTile.receipeImg ?? "").isEmpty
                      ? Image.asset(
                          'images/searchbar_logo.png',
                          fit: BoxFit.fitWidth,
                        )
                      : NetworkImage(
                          recipeTile.receipeImg,
                        ),
                  width: imgWidth,
                  height: imgWidth,
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
          )
        : Center(child: FlutterLogo());
  }
}
