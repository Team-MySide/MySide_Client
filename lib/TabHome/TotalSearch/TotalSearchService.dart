// import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:my_side_client/common/MySideConnect.dart';

import 'TotalSearchBody.dart';

abstract class IFetch {
  Future<List<String>> fetch();
}

class TotalSearchService extends MySideConnect implements IFetch {
  // static var client = http.Client();

  @override
  Future<List<String>> fetch() async {
    httpClient.baseUrl = "http://54.180.67.217:3000";

    //모든 헤더에 붙인다.
    httpClient.addRequestModifier((request) {
      request.headers['Content-Type'] = 'application/json';
      request.headers['token'] =
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwiaWF0IjoxNjIxMDgzMjY1LCJleHAiOjE2MjIyOTI4NjUsImlzcyI6ImlnIn0.F9xl2Ii-5bymNK5LQ8kLhLQ5vlIcSIBz5ZFVG5vhVcI';
      return request;
    });
    var resp = await get("/common/auto/total");

    if (resp.statusCode == 200) {
      TotalSearch f = totalSearchFromJson(resp.bodyString);

      return f.data;
    }
    return null;
  }
}