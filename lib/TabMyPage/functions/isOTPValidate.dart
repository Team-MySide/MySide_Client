int isOTPValidate(String pn) {
  // 0 : 입력되지 않음
  // 1 : 숫자가 아님
  // 2 : 6개가 아님
  // 3 : 일치하지 않음
  // 4 : 시간이 초과됨
  // 5 : 통과
  String pattern = r'^[0-9]';
  RegExp regExp = new RegExp(pattern);
  for (int i = 0; i < pn.length; i++) {
    if (!regExp.hasMatch(pn[i])) {
      return 1;
    }
  }
  if (pn.length == 6) {
    // 일치하지 않을때
    // return 3
    return 5;
  } else {
    if (pn.length == 0) {
      return 0;
    } else {
      return 2;
    }
  }
}
