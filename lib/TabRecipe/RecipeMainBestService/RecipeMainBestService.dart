import 'dart:convert';
import 'dart:developer';

import 'package:my_side_client/common/MySideConnect.dart';
import 'package:my_side_client/common/UserProfile.dart';

import 'RecipeMainBestModel.dart';

abstract class IFetch {
  void getRecipeList();
}

//wiki link
class RecipeMainBestService extends MySideConnect implements IFetch {
  @override
  Future<List<RecipeMainBestItem>> getRecipeList() async {
    httpClient.baseUrl = "http://54.180.67.217:3000";

    //모든 헤더에 붙인다.
    httpClient.addRequestModifier((request) {
      request.headers['Content-Type'] = 'application/json';
      request.headers['token'] = UserProfile.token;
      return request;
    });

    var resp = await get("/recipe/month/top");
    if (resp.statusCode == 200) {
      return recipeMainBestDataFromJson(sample).data;
    } else {
      log("error : ${resp.statusCode}");
    }
    return []; //fail
  }

  String sample = jsonEncode({
    "status": 200,
    "success": true,
    "message": "레시피 조회 성공",
    "data": [
      {
        "receipe_id": 21,
        "likesum": 1,
        "receipe_name": "보현이의 레시피",
        "receipe_img":
            "https://mysidebucket.s3.ap-northeast-2.amazonaws.com/1643101037447.png",
        "receipe_difficulty": 1,
        "receipe_time": 25,
        "user_id": 1
      },
      {
        "receipe_id": 21,
        "likesum": 1,
        "receipe_name": "보현이의 레시피",
        "receipe_img":
            "https://mysidebucket.s3.ap-northeast-2.amazonaws.com/1643101037447.png",
        "receipe_difficulty": 1,
        "receipe_time": 25,
        "user_id": 1
      },
      {
        "receipe_id": 21,
        "likesum": 1,
        "receipe_name": "보현이의 레시피",
        "receipe_img":
            "https://mysidebucket.s3.ap-northeast-2.amazonaws.com/1643101037447.png",
        "receipe_difficulty": 1,
        "receipe_time": 25,
        "user_id": 1
      },
      {
        "receipe_id": 21,
        "likesum": 1,
        "receipe_name": "보현이의 레시피",
        "receipe_img":
            "https://mysidebucket.s3.ap-northeast-2.amazonaws.com/1643101037447.png",
        "receipe_difficulty": 1,
        "receipe_time": 25,
        "user_id": 1
      },
    ]
  });
}
