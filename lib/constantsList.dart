import 'package:flutter/material.dart';

final List<String> cancerType = [
  '위암',
  '폐암',
  '간암',
  '대장암',
  '유방암',
  '갑상선암',
];

final List<String> stageType = [
  '1기',
  '2기',
  '3기',
  '4기',
  '완치',
  '(구)',
];

final List<String> progressType = [
  '치료 예정',
  '수술전',
  '수술후',
  '항암중',
  '방사선',
  '완치',
  '(구)'
];

final List<String> diseaseList = [
  '고혈압',
  '당뇨',
  '이상지질혈증',
  '해당사항없음',
  '모름',
];

final List<String> myPageMainIconText = [
  '건강 데이터',
  '프로필 수정',
  '좋아요 목록',
];

final List<String> myPageMainIconName = [
  'assets/list.svg',
  'assets/pen.svg',
  'assets/heart.svg',
];

final List<String> monthList = [
  '1월',
  '2월',
  '3월',
  '4월',
  '5월',
  '6월',
  '7월',
  '8월',
  '9월',
  '10월',
  '11월',
  '12월'
];

final List<String> recipeList = [
  '메인요리',
  '밑반찬',
  '국/탕/찌개',
  '디저트',
  '면/만두',
  '밥/죽/떡',
  '김치/젓갈/장',
  '양식',
  '양념/잼',
  '샐러드',
  '차/음료',
  '기타'
];

final List<String> foodAmountList = [
  '1인분',
  '2인분',
  '3인분',
  '4인분',
];
//재료
final List<String> ingreTitleList = [
  '기본 재료',
  '양념장 소스 재료',
];

final List<List<String>> detailIngreList = [
  ['마늘 3개', '새우 12마리', '시금치 200g'],
  ['소금1/2 컵', '올리브유 1컵'],
];
//요리순서부분
final List<bool> recipeOrderHasPhoto = [true, false, false, true, false];
final List<String> recipeOrderContent = [
  '시금치의 밑단을 자르고 손질합니다.',
  '새우는 껍질을 까고 소금 밑간을 합니다.',
  '마늘을 편썰어 줍니다.',
  '마늘을 올리브유에 볶아줍니다.',
  '손질한 시금치를 넣어 함께 볶아주면 완성!'
];

final List<String> recipeOrderPhoto = [
  'assets/recipe_sample_imgs/01.png',
  '',
  '',
  'assets/recipe_sample_imgs/04.png',
  '',
];

final List<String> ingredImgs = [
  'assets/sample_ingred/01.png',
  'assets/sample_ingred/02.png',
  'assets/sample_ingred/03.png',
];

final List<List<String>> ingredRelatedCancer = [
  ['갑상선암'],
  ['위암', '간암', '대장암'],
  ['유방암', '대장암', '위암'],
];

final List<List<String>> ingredRelatedComponent = [
  ['요오드', '아연', '칼슘', '단백질'],
  ['셀레늄', '알리신', '핵산', '비타민B'],
  ['베타카로틴', '비타민A', '엽산', '철분'],
];

final List<Color> imgContainerColor = [
  Color(0xFFFFE5D9),
  Color(0xFFF4F4F4),
  Color(0xFFEAEED2),
];
