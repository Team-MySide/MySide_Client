import 'package:flutter/material.dart';

class DiseaseCategoryContainer extends StatelessWidget {
  const DiseaseCategoryContainer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("질병 카테고리", style: TextStyle(fontSize: 28)),
        Wrap(
          direction: Axis.horizontal,
          alignment: WrapAlignment.start,
          children: _getCategories(),
        )
      ],
    );
  }

  _getCategories() {
    List<String> diseases = ["위암", "간암", "대장암", "폐암", "유방암", "갑상선암"];
    List<Widget> ret = [];
    for (String d in diseases) {
      ret.add(LabelTextWidget(Icons.access_alarm, d));
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
