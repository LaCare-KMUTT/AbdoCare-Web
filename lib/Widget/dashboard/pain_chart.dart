import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class PainChart extends StatefulWidget {
  final AsyncSnapshot<List<Map<String, dynamic>>> snapshot;
  PainChart({this.snapshot});
  @override
  _PainChartState createState() => _PainChartState();
}

class _PainChartState extends State<PainChart> {
  List<_PainData> data = [];

  @override
  void initState() {
    super.initState();
    final formatter = DateFormat('dd/MM/yyyy');

    widget.snapshot.data.forEach((element) {
      var painScore = element['pulseRate'];
      var dateFromDb = element['Date'].toDate();
      var formattedDate = formatter.format(dateFromDb);
      var formTime = element['Time'];
      var date = '$formattedDate\n$formTime';
      data.add(_PainData(day: date, painScore: painScore));
    });
  }

  Widget build(BuildContext context) {
    return Container(
      child: SfCartesianChart(
          primaryXAxis: CategoryAxis(),
          legend: Legend(isVisible: false),
          tooltipBehavior: TooltipBehavior(enable: true),
          series: <ChartSeries<_PainData, String>>[
            LineSeries<_PainData, String>(
                dataSource: data,
                xValueMapper: (pain, _) => pain.day,
                yValueMapper: (pain, _) => pain.painScore,
                name: 'Pain score',
                color: Colors.red,
                dataLabelSettings: DataLabelSettings(isVisible: true))
          ]),
    );
  }
}

class _PainData {
  _PainData({this.painScore, this.day});
  final String day;
  final double painScore;
}
