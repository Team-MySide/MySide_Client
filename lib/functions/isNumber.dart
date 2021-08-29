bool isNumber(String inputNum) {
  String pattern = r'^[0-9]';
  RegExp regExp = new RegExp(pattern);

  if (inputNum.length == 0) {
    return false;
  }

  for (int i = 0; i < inputNum.length; i++) {
    if (!regExp.hasMatch(inputNum[i])) {
      return false;
    }
  }
  return true;
}
