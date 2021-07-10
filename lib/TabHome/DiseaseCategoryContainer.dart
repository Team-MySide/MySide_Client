import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_side_client/Constants.dart';
import 'package:my_side_client/TabSearch/SerachDiseaseResult.dart';
import 'package:my_side_client/common/CommonComponent.dart';
import 'package:my_side_client/common/Data/data.dart';

class DiseaseCategoryContainer extends StatelessWidget {
  DiseaseCategoryContainer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(color: Colors.white),
        child: Padding(
            padding: EdgeInsets.only(left: 16, right: 16, bottom: 50),
            child: Column(
              children: [
                Padding(
                    padding: EdgeInsets.only(top: 40, bottom: 20),
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: HeaderRow("질병 카테고리", isViewMore: false))),
                SizedBox(
                    height:
                        Constants.paddingBetweenDiseaseCategoryAndDiseaseList),
                NavigateIconViewsContainer(diseases, "/SearchDiseaseResult")
              ],
            )));
  }
}

class LabelTextWidget extends StatelessWidget {
  final String _dissease;
  final IconData icon;
  const LabelTextWidget(this.icon, this._dissease, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: ConstrainedBox(
            constraints: BoxConstraints(minWidth: 80),
            child: Wrap(
              children: [
                Icon(icon),
                Text(_dissease),
              ],
            )),
        onTap: () =>
            Get.to(() => SearchDiseaseResult(), arguments: [_dissease]));
  }
}
