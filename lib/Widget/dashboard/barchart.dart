import 'package:flutter/cupertino.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class BarChart extends StatelessWidget {
  final List<SubscriberSeries> data;
  BarChart({@required this.data});

  @override
  Widget build(BuildContext context) {
    var series = <charts.Series<SubscriberSeries, String>>[
      charts.Series(
          id: "Subscribers",
          data: data,
          domainFn: (SubscriberSeries series, _) => series.topic,
          measureFn: (SubscriberSeries series, _) => series.point,
          colorFn: (SubscriberSeries series, _) => series.barColor),
    ];

    return Container(
      height: 400,
      padding: EdgeInsets.all(0),
      child: Card(
        child: Column(
          children: [
            Expanded(
              child: charts.BarChart(
                series,
                animate: true,
                barGroupingType: charts.BarGroupingType.grouped,
                defaultRenderer: new charts.BarRendererConfig(
                    cornerStrategy: const charts.ConstCornerStrategy(5)),
                vertical: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SubscriberSeries {
  final String topic;
  final int point;
  final charts.Color barColor;
  SubscriberSeries(
      {@required this.topic, @required this.point, @required this.barColor});
}
