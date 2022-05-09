// import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:my_side_client/common/MySideConnect.dart';
import 'package:my_side_client/common/UserProfile.dart';

import 'TotalSearchBody.dart';

abstract class IFetch {
  Future<TotalSearchBody> fetch();
}

class DownloadTotalSearchListService extends MySideConnect implements IFetch {
  // static var client = http.Client();

  @override
  Future<TotalSearchBody> fetch() async {
    httpClient.baseUrl = "http://54.180.67.217:3000";

    //모든 헤더에 붙인다.
    httpClient.addRequestModifier((request) {
      request.headers['Content-Type'] = 'application/json';
      request.headers['token'] = UserProfile.token;

      return request;
    });
    var resp = await get("/common/auto/total");

    if (resp.statusCode == 200) {
      return totalSearchBodyFromJson(resp.bodyString);
    }
    return null;
  }
}
