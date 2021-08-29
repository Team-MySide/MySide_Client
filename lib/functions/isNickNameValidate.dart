bool isNickNameValidate(String input) {
  String pattern = r'^(?=.*?[!@ #\$&*~])';
  RegExp regExp = new RegExp(pattern);
  if (regExp.hasMatch(input)) {
    return false;
  } else {
    if (input.length < 2 || input.length > 7) {
      return false;
    } else {
      return true;
    }
  }
}
