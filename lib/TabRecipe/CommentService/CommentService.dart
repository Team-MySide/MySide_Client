import 'package:my_side_client/TabBookmark/SearchBookmarkRepository/SearchFoodItem.dart';
import 'package:my_side_client/TabRecipe/CommentService/Comment.dart';
import 'package:my_side_client/common/MySideConnect.dart';
import 'package:my_side_client/common/UserProfile.dart';

abstract class IFetch {
  Future<List<Comment>> fetch();
}

class Commentservice extends MySideConnect implements IFetch {
  // static var client = http.Client();

  @override
  Future<List<Comment>> fetch() async {
    //
    httpClient.baseUrl = "http://54.180.67.217:3000";

    //모든 헤더에 붙인다.
    httpClient.addRequestModifier((request) {

      request.headers['Content-Type'] = 'application/json';
      request.headers['token'] = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwiaWF0IjoxNjQ2OTE3NzA0LCJleHAiOjE2NDgxMjczMDQsImlzcyI6ImlnIn0.VIO-X5jRD0zj2al5OsjN1ZTJPEkDRjo6Ps7TH8EOOHc';
      return request;

    });
    var resp = await get("/receipe/comment/main/view/1");
    if (resp.statusCode == 200) {
      print("okokokokokokokokokoko"); print("okokokokokokokokokoko"); print("okokokokokokokokokoko");
      return commentFromJson(resp.bodyString).data;
    }
    else{
      print("error");
      return commentFromJson(resp.bodyString).data;
    }

  }
}
