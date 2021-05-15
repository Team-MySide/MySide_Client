import 'package:flutter/material.dart';

import 'SearchBar2.dart';
import 'SearchHistory.dart';

class TabSearch extends StatelessWidget {
  const TabSearch({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
        // Padding(
        // padding: EdgeInsets.symmetric(
        //     horizontal: Constants.paddingMainContainerVertical),
        // child:
        // SingleChildScrollView(
        //     child:
        Container(
            child: Column(children: [
      SearchBar2(),
      Expanded(child: SearchHistory()),
      // AdContainer()
    ])
            // )
            );
  }
}
