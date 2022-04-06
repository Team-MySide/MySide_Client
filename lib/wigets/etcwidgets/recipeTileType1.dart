import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_side_client/TabRecipe/RecipeMainService/RecipeMainRecommendRecipeItem.dart';
import 'package:my_side_client/wigets/etcwidgets/recipeSubTile.dart';

class RecipeBestTileWidget extends StatelessWidget {
  // final RecipeTile recipeTile;
  final RecommendRecipeItem recipeTile;
  final double tileHeight;
  final int position;
  RecipeBestTileWidget({this.recipeTile, this.tileHeight, this.position});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: tileHeight,
      child: Row(
        children: [
          Stack(
            clipBehavior: Clip.none,
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
                width: tileHeight,
                height: tileHeight,
              ),
              Positioned(
                top: -4.5,
                left: 10,
                child: rankBanner(position),
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

  Widget rankBanner(int position) {
    switch (position) {
      case 1:
        return SvgPicture.asset('assets/icons/02.svg');
      case 2:
        return SvgPicture.asset('assets/icons/03.svg');
      case 3:
        return SvgPicture.asset('assets/icons/04.svg');
      default:
        return SvgPicture.asset('assets/icons/01.svg');
    }
  }
}
