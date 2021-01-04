import 'package:flutter/cupertino.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class LineChart extends StatelessWidget {
  final List<PointSeries> data2;
  LineChart({@required this.data2});
  final customTickFormatter = charts.BasicNumericTickFormatterSpec((value) {
    if (value == 0) {
      return "19 ก.ย";
    } else if (value == 1) {
      return "20 ก.ย";
    } else if (value == 2) {
      return "21 ก.ย";
    } else if (value == 3) {
      return "22 ก.ย";
    } else if (value == 4) {
      return "23 ก.ย";
    } else if (value == 5) {
      return "24 ก.ย";
    } else if (value == 6) {
      return "25 ก.ย";
    }
  });

  @override
  Widget build(BuildContext context) {
    var serieslist = <charts.Series<PointSeries, int>>[
      charts.Series(
        id: "Pain",
        data: data2,
        domainFn: (PointSeries serieslist, _) => serieslist.day,
        measureFn: (PointSeries serieslist, _) => serieslist.point,
      ),
    ];
    return Container(
      height: 400,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Column(
            children: [
              Expanded(
                child: charts.LineChart(
                  serieslist,
                  animate: false,
                  primaryMeasureAxis: charts.NumericAxisSpec(
                    tickProviderSpec: charts.BasicNumericTickProviderSpec(
                        desiredTickCount: 6),
                  ),
                  domainAxis: charts.NumericAxisSpec(
                    tickProviderSpec: charts.BasicNumericTickProviderSpec(
                        desiredTickCount: 7),
                    tickFormatterSpec: customTickFormatter,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PointSeries {
  final int day;
  final int point;
  PointSeries({
    @required this.day,
    @required this.point,
  });
}
