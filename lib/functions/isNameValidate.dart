bool isNameValidate(String input) {
  if (input.length >= 2 && input.length <= 6) {
    for (int i = 0; i < input.length; i++) {
      if (!isKorean(input[i])) {
        return false;
      }
    }

    return true;
  }

  return false;
}

bool isKoreanWord(String input) {
  for (int i = 0; i < input.length; i++) {
    if (!isKorean(input[i])) {
      return false;
    }
  }

  return true;
}

bool isKorean(String input) {
  bool isKorean = false;
  int inputToUniCode = input.codeUnits[0];

  isKorean = (inputToUniCode >= 12593 && inputToUniCode <= 12643)
      ? true
      : (inputToUniCode >= 44032 && inputToUniCode <= 55203)
          ? true
          : false;

  return isKorean;
}
