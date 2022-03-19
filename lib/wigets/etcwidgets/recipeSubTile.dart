import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_side_client/TabRecipe/RecipeMainService/RecipeMainRecommendRecipeItem.dart';
import 'package:my_side_client/wigets/etcwidgets/starRating.dart';

class RecipeSubTile extends StatelessWidget {
  final RecommendRecipeItem recipeTile;
  RecipeSubTile({@required this.recipeTile});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          recipeTile.name,
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
                  recipeTile.name,
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
                "#${recipeTile.name}",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                  color: Color(0xFF3BD7E2),
                ),
              ),
              Text(
                "#${recipeTile.name}",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                  color: Color(0xFF3BD7E2),
                ),
              ),
              Text(
                "#${recipeTile.name}",
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
              recipeTile.progressNm.toString() + '분',
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w300,
                color: Color(0xFF666666),
              ),
            ),
          ],
        )
      ],
    );
  }
}
