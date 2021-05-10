import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class BodyTemperatureChart extends StatefulWidget {
  final AsyncSnapshot<List<Map<String, dynamic>>> snapshot;
  BodyTemperatureChart({this.snapshot});
  @override
  _BodyTemperatureChartState createState() => _BodyTemperatureChartState();
}

class _BodyTemperatureChartState extends State<BodyTemperatureChart> {
  List<_BodyTemperatureData> data = [];

  @override
  void initState() {
    super.initState();
    final formatter = DateFormat('dd/MM/yyyy');

    widget.snapshot.data.forEach((element) {
      var bodyTemperature = element['BodyTemperature'];
      var dateFromDb = element['Date'].toDate();
      var formattedDate = formatter.format(dateFromDb);
      var formTime = element['Time'];
      var date = '$formattedDate\n$formTime';
      data.add(
          _BodyTemperatureData(bodyTemperature: bodyTemperature, day: date));
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SfCartesianChart(
          primaryXAxis: CategoryAxis(),
          legend: Legend(isVisible: false),
          tooltipBehavior: TooltipBehavior(enable: true),
          series: <ChartSeries<_BodyTemperatureData, String>>[
            LineSeries<_BodyTemperatureData, String>(
                dataSource: data,
                xValueMapper: (bodyTemperature, _) => bodyTemperature.day,
                yValueMapper: (bodyTemprature, _) =>
                    bodyTemprature.bodyTemperature,
                name: 'Body Temperature',
                color: Colors.blue,
                dataLabelSettings: DataLabelSettings(isVisible: true))
          ]),
    );
  }
}

class _BodyTemperatureData {
  _BodyTemperatureData({this.bodyTemperature, this.day});

  final double bodyTemperature;
  final String day;
}
