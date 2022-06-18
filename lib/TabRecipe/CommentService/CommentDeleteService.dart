import 'package:my_side_client/TabRecipe/CommentService/Comment.dart';
import 'package:my_side_client/common/MySideConnect.dart';
import 'package:my_side_client/common/UserProfile.dart';

abstract class IFetch {
  Future<String> fetch(int index);
}

class CommentDeleteService extends MySideConnect implements IFetch {
  // static var client = http.Client();

  @override
  Future<String> fetch(int index) async {
    //
    httpClient.baseUrl = "http://3.39.126.13:3000";

    //모든 헤더에 붙인다.
    httpClient.addRequestModifier((request) {
      request.headers['Content-Type'] = 'application/json';
      request.headers['token'] =
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwiaWF0IjoxNjQ4MTM1MDgxLCJleHAiOjE2NDkzNDQ2ODEsImlzcyI6ImlnIn0.1CSK1NhK74auMe1xdGq5oMt3HHiVhsWYta2lQ0PbYY4';
      return request;
    });
    var resp = await delete("/receipe/comment/main/delete/1/$index");
    if (resp.statusCode == 200) {
      return commentPostFromJson(resp.bodyString).message;
    }
    return "";
  }
}
