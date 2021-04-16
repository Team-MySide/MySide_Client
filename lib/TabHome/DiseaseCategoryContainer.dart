import 'package:flutter/material.dart';
import 'package:my_side_client/Constants.dart';
import 'package:my_side_client/common/CommonComponent.dart';

class DiseaseCategoryContainer extends StatelessWidget {
  const DiseaseCategoryContainer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(color: Colors.white),
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                Padding(
                    padding: EdgeInsets.only(
                        top: 40, bottom: 20, left: 16, right: 16),
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: HeaderRow("질병 카테고리", isViewMore: false))),
                SizedBox(
                    height:
                        Constants.paddingBetweenDiseaseCategoryAndDiseaseList),
                Wrap(
                  direction: Axis.horizontal,
                  crossAxisAlignment: WrapCrossAlignment.start,
                  alignment: WrapAlignment.start,
                  children: _getCategories(),
                )
              ],
            )));
  }

  _getCategories() {
    List<Map> diseases = [
      {"disease": "위암", "path": "images/disease01.png"},
      {"disease": "간암", "path": "images/disease02.png"},
      {"disease": "대장암", "path": "images/disease03.png"},
      {"disease": "폐암", "path": "images/disease04.png"},
      {"disease": "유방암", "path": "images/disease05.png"},
      {"disease": "갑상선암", "path": "images/disease06.png"},
    ];
    List<Widget> ret = [];
    for (var d in diseases) {
      ret.add(Padding(
          padding: EdgeInsets.all(8),
          child: Container(
              width: 104,
              height: 95,
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xFFDDDDDD)),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  SizedBox(height: 18),
                  SizedBox(
                      width: 30, height: 32, child: Image.asset(d['path'])),
                  SizedBox(height: 5),
                  Text(d['disease'])
                ],
              ))));
    }
    return ret;
  }
}

class LabelTextWidget extends StatelessWidget {
  final String _dissease;
  final IconData icon;
  const LabelTextWidget(this.icon, this._dissease, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
        constraints: BoxConstraints(minWidth: 80),
        child: Wrap(
          children: [
            Icon(icon),
            Text(_dissease),
          ],
        ));
  }
}
