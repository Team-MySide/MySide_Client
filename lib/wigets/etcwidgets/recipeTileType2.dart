import 'package:flutter/material.dart';
import 'package:my_side_client/TabRecipe/RecipeMainRecommendService/RecipeMainRecommendRecipeData.dart';
import 'package:my_side_client/wigets/etcwidgets/recipeSubTile.dart';

class RecipeMainRecommendTile extends StatelessWidget {
  final RecipeMainRecommendItem recipeTile;
  final double imgWidth;
  final double subTileHeight;
  final bool isLoaded;
  RecipeMainRecommendTile(
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
                      : Image.network(
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
