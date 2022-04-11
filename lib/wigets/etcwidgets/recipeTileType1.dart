import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_side_client/TabRecipe/RecipeMainBestService/RecipeMainBestData.dart';
import 'starRating.dart';

class RecipeBestTileWidget extends StatelessWidget {
  // final RecipeTile recipeTile;
  final RecipeMainBestItem recipeTile;
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
                    : Image.network(
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  recipeTile.receipeName,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Spacer(),
                Column(
                  children: [
                    Row(
                      children: [
                        // FlutterLogo(),
                        Image.asset(
                          // recipeTile.cancerNm,
                          'assets/profile_img/person_round.png',
                          width: 32,
                          height: 32,
                        ),
                        SizedBox(width: 8),
                        Text(
                          recipeTile.receipeName,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 4),
                SizedBox(
                  width: double.infinity,
                  child: Wrap(
                    spacing: 4,
                    children: [
                      Text(
                        "#${recipeTile.likesum}",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                          color: Color(0xFF3BD7E2),
                        ),
                      ),
                      Text(
                        "#${recipeTile.likesum}",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                          color: Color(0xFF3BD7E2),
                        ),
                      ),
                      Text(
                        "#${recipeTile.likesum}",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                          color: Color(0xFF3BD7E2),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16),
                Row(
                  children: [
                    StarRating(
                        rating: recipeTile.userId,
                        spacing: 4,
                        starSize: 12,
                        starAlign: 2),
                    SizedBox(width: 20),
                    Container(height: 12, width: 1.5, color: Color(0xFFDDDDDD)),
                    SizedBox(width: 20),
                    SvgPicture.asset('assets/icons/time.svg'),
                    SizedBox(width: 5),
                    Text(
                      '${recipeTile.receipeTime}분',
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        color: Color(0xFF666666),
                      ),
                    ),
                  ],
                )
              ],
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
