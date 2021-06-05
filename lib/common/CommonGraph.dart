import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:my_side_client/TabSearch/SearchDetailNutritionFactsRepository/SearchDetailNutritionFactsBody.dart';

class BarChartSample1 extends StatelessWidget {
  final SearchDetailNutritionFactsItem item;
  final List<Color> availableColors = [
    Colors.purpleAccent,
    Colors.yellow,
    Colors.lightBlue,
    Colors.orange,
    Colors.pink,
    Colors.redAccent,
  ];
  double MAX = 20;
  BarChartSample1(this.item);

  final Color barBackgroundColor = const Color(0xff72d8bf);
  final Duration animDuration = const Duration(milliseconds: 250);

  int touchedIndex = -1;

  bool isPlaying = false;

  @override
  Widget build(BuildContext context) {
    return RotatedBox(
        quarterTurns: 1,
        child: AspectRatio(
          aspectRatio: 1,
          child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
            color: const Color(0xff81e5cd),
            child: Stack(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: BarChart(
                            mainBarData(),
                            swapAnimationDuration: animDuration,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  BarChartGroupData makeGroupData(
    int x,
    double y, {
    bool isTouched = false,
    Color barColor = Colors.white,
    double width = 22,
    List<int> showTooltips = const [],
  }) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          y: isTouched ? y + 1 : y,
          colors: isTouched ? [Colors.yellow] : [barColor],
          width: width,
          backDrawRodData: BackgroundBarChartRodData(
            show: true,
            y: 20,
            colors: [barBackgroundColor],
          ),
        ),
      ],
      showingTooltipIndicators: showTooltips,
    );
  }

  List<BarChartGroupData> showingGroups() => List.generate(4, (i) {
        switch (i) {
          case 0:
            return makeGroupData(item.good, MAX, isTouched: i == touchedIndex);
          case 1:
            return makeGroupData(item.bad, MAX, isTouched: i == touchedIndex);
          case 2:
            return makeGroupData(item.function, MAX,
                isTouched: i == touchedIndex);
          case 3:
            return makeGroupData(item.etc, MAX, isTouched: i == touchedIndex);

          default:
            return throw Error();
        }
      });

  BarChartData mainBarData() {
    return BarChartData(
      // barTouchData: BarTouchData(
      //   touchTooltipData: BarTouchTooltipData(
      //       tooltipBgColor: Colors.blueGrey,
      //       getTooltipItem: (group, groupIndex, rod, rodIndex) {
      //         String weekDay;
      //         switch (group.x.toInt()) {
      //           case 0:
      //             weekDay = 'Monday';
      //             break;
      //           case 1:
      //             weekDay = 'Tuesday';
      //             break;
      //           case 2:
      //             weekDay = 'Wednesday';
      //             break;
      //           case 3:
      //             weekDay = 'TEST';
      //             break;

      //           default:
      //             throw Error();
      //         }
      //         return BarTooltipItem(
      //           weekDay + '\n',
      //           TextStyle(
      //             color: Colors.white,
      //             fontWeight: FontWeight.bold,
      //             fontSize: 18,
      //           ),
      //           children: <TextSpan>[
      //             TextSpan(
      //               text: (rod.y - 1).toString(),
      //               style: TextStyle(
      //                 color: Colors.yellow,
      //                 fontSize: 16,
      //                 fontWeight: FontWeight.w500,
      //               ),
      //             ),
      //           ],
      //         );
      //       }),
      // ),
      titlesData: FlTitlesData(
        show: false,
        bottomTitles: SideTitles(
          showTitles: true,
          getTextStyles: (value) => const TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
          margin: 16,
          getTitles: (double value) {
            switch (value.toInt()) {
              case 0:
                return 'M';
              case 1:
                return 'T';
              case 2:
                return 'W';

              default:
                return '';
            }
          },
        ),
        leftTitles: SideTitles(
          showTitles: false,
        ),
      ),
      borderData: FlBorderData(
        show: false,
      ),
      barGroups: showingGroups(),
    );
  }
}
