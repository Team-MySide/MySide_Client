import 'package:my_side_client/common/MySideConnect.dart';
import 'package:my_side_client/common/UserProfile.dart';

abstract class IFetch {
  void registerRecipe();
}

//wiki link
class RegisterRecipeService extends MySideConnect implements IFetch {
  @override
  Future<bool> registerRecipe() async {
    httpClient.baseUrl = "http://54.180.67.217:3000";

    //모든 헤더에 붙인다.
    httpClient.addRequestModifier((request) {
      request.headers['Content-Type'] = 'application/json';
      request.headers['token'] = UserProfile.token;
      return request;
    });
    var resp = await get(""); //request path
    if (resp.statusCode == 200) {
      return true; //pass
    }
    return false; //fail
  }
}
