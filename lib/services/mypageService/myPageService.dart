import 'package:http/http.dart' as http;
import 'package:my_side_client/constantsList.dart';
import 'package:my_side_client/models/healthDataListModel.dart';
import 'package:my_side_client/models/profileSearch.dart';
import 'dart:convert';

import 'package:my_side_client/models/userInfo.dart';

Future<bool> writeHealthData(
    String token,
    String date,
    String relationNm,
    String gender,
    String age,
    String height,
    String weight,
    String cancerNm,
    String stageNm,
    String progressNm,
    String disease,
    String memo) async {
  print(cancerNm);
  final response = await http
      .post(Uri.http('3.39.126.13:3000', '/mypage/health/insert'), headers: {
    "Accept": "applications.json",
    "token": token
  }, body: {
    "RegiDate": date,
    "relationNm": relationNm,
    "gender": gender,
    "age": age,
    "height": height,
    "weight": weight,
    "cancerNm": cancerNm,
    "stageNm": stageNm,
    "progressNm": progressNm,
    "disease": disease,
    "memo": memo,
  });
  if (response.statusCode == 200) {
    var jsondata = json.decode(response.body);
    print(jsondata['success']);
    print(jsondata['message']);
    return jsondata['success'];
  }
  return false;
}

void deleteData(int index, String token) async {
  final response = await http.delete(
    Uri.http('3.39.126.13:3000', '/mypage/health/delete/${index.toString()}'),
    headers: {"Accept": "applications.json", "token": token},
  );
  if (response.statusCode == 200) {
    var jsondata = json.decode(response.body);
  }
}

Future<UserData> getUserInfoService(String token) async {
  final response = await http.get(
    Uri.http('3.39.126.13:3000', '/mypage'),
    headers: {"Accept": "applications.json", "token": token},
  );
  if (response.statusCode == 200) {
    return userInfoFromJson(response.body).data;
  }
  return UserData();
}

Future<List<HealthData>> readTotalHealthData(String token) async {
  final response = await http.get(
    Uri.http('3.39.126.13:3000', '/mypage/health'),
    headers: {"Accept": "applications.json", "token": token},
  );
  if (response.statusCode == 200) {
    var jsondata = json.decode(response.body);
    if (jsondata['success'] == true) {
      return healthDataListFromJson(response.body).data;
    }
  }
  return [];
}

Future<List<HealthData>> readMonthYearDatList(
    String year, String month, String token) async {
  final response = await http.get(
    Uri.http('3.39.126.13:3000', '/mypage/health/$year-$month'),
    headers: {"Accept": "applications.json", "token": token},
  );
  if (response.statusCode == 200) {
    var jsondata = json.decode(response.body);
    if (jsondata['success'] == true) {
      return healthDataListFromJson(response.body).data;
    }
  }
  return [];
}

//현재 상태 읽기
Future<List<dynamic>> findCurUserInfo(String token) async {
  List<dynamic> curInfo = [];
  final response = await http.get(
    Uri.http('3.39.126.13:3000', '/mypage/health/list/detail/info'),
    headers: {"Accept": "applications.json", "token": token},
  );
  if (response.statusCode == 200) {
    var jsondata = json.decode(response.body);
    //print(jsondata);
    curInfo = [
      jsondata['data'][0]['relationNm'] == '환우' ? 1 : 2,
      jsondata['data'][0]['gender'] == '남' ? 1 : 2,
      jsondata['data'][0]['age'].toString(),
      jsondata['data'][0]['height'].toString(),
      jsondata['data'][0]['weight'].toString(),
      cancerType.indexOf(jsondata['data'][0]['cancerNm']) + 1,
      stageType.indexOf(jsondata['data'][0]['stageNm']) + 1,
      progressType.indexOf(jsondata['data'][0]['progressNm']) + 1,
      diseaseList.indexOf(jsondata['data'][0]['disease']) + 1,
    ];
  }
  return curInfo;
}

//편집하려고 하는 박스 상태 읽기
Future<List<dynamic>> findEditInfo(int id, String token) async {
  List<dynamic> curInfo = [];
  final response = await http.get(
    Uri.http('3.39.126.13:3000', '/mypage/health/list/${id.toString()}'),
    headers: {"Accept": "applications.json", "token": token},
  );
  if (response.statusCode == 200) {
    var jsondata = json.decode(response.body);
    //print(jsondata);
    curInfo = [
      jsondata['data'][0]['relationNm'] == '환우' ? 1 : 2,
      jsondata['data'][0]['gender'] == '남' ? 1 : 2,
      jsondata['data'][0]['age'].toString(),
      jsondata['data'][0]['height'].toString(),
      jsondata['data'][0]['weight'].toString(),
      cancerType.indexOf(jsondata['data'][0]['cancerNm']) + 1,
      stageType.indexOf(jsondata['data'][0]['stageNm']) + 1,
      progressType.indexOf(jsondata['data'][0]['progressNm']) + 1,
      diseaseList.indexOf(jsondata['data'][0]['disease']) + 1,
      jsondata['data'][0]['memo'],
      jsondata['data'][0]['RegiDate'],
    ];
  }
  return curInfo;
}

//프로필 얻어오기
Future<Profile> userProfile(String token) async {
  Profile curProfile = Profile();
  final response = await http.get(
    Uri.http('3.39.126.13:3000', '/mypage/profile'),
    headers: {"Accept": "applications.json", "token": token},
  );
  if (response.statusCode == 200) {
    curProfile = profileSearchFromJson(response.body).data;
    return curProfile;
  }
  return curProfile;
}

//닉네임 중복확인
Future<bool> checkNickname(String nickname) async {
  bool duplicated = false;
  final response = await http.get(
    Uri.http('3.39.126.13:3000', '/auth/duplicated/nickname/$nickname'),
    headers: {"Accept": "applications.json"},
  );
  if (response.statusCode == 200) {
    var jsondata = json.decode(response.body);
    duplicated = jsondata["success"];
  }
  return duplicated;
}

//닉네임 변경
Future<bool> nicknameChange(String nickname, String token) async {
  final response = await http.put(
    Uri.http('3.39.126.13:3000', '/mypage/profile/nickname'),
    headers: {"Accept": "applications.json", "token": token},
    body: {
      "nickname": nickname,
    },
  );
  if (response.statusCode == 200) {
    var jsondata = json.decode(response.body);
    return jsondata['success'];
  }
  return false;
}

//패스워드 체크
Future<bool> checkPassword(String pswd, String token) async {
  final response = await http.post(
    Uri.http('3.39.126.13:3000', '/mypage/profile/checkpw'),
    headers: {"Accept": "applications.json", "token": token},
    body: {
      "password": pswd,
    },
  );
  if (response.statusCode == 200) {
    var jsondata = json.decode(response.body);
    return jsondata['success'];
  }
  return false;
}

//휴대폰 번호 변경
Future<bool> changePhoneNumber(String token, String newPhone) async {
  final response = await http.put(
    Uri.http('3.39.126.13:3000', '/mypage/profile/changepb'),
    headers: {"Accept": "applications.json", "token": token},
    body: {
      "phone": newPhone,
    },
  );
  if (response.statusCode == 200) {
    var jsondata = json.decode(response.body);
    //print(jsondata);
    return jsondata['success'];
  }
  return false;
}

//비밀번호 변경
Future<bool> changePassword(String token, String pswd, String newPswd) async {
  final response = await http.put(
    Uri.http('3.39.126.13:3000', '/mypage/profile/change/password'),
    headers: {"Accept": "applications.json", "token": token},
    body: {
      "password": pswd,
      "newpassword": newPswd,
    },
  );
  if (response.statusCode == 200) {
    var jsondata = json.decode(response.body);
    return jsondata['success'];
  }
  return false;
}

//탈퇴
Future<bool> dropOutUser(String token, String reason) async {
  final response = await http.get(
    Uri.http('3.39.126.13:3000', '/mypage/leave/$reason'),
    headers: {"Accept": "applications.json", "token": token},
  );
  if (response.statusCode == 200) {
    var jsondata = json.decode(response.body);
    return jsondata['success'];
  }
  return false;
}
