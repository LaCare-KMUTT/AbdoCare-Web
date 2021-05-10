import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class PulseRateChart extends StatefulWidget {
  final AsyncSnapshot<List<Map<String, dynamic>>> snapshot;

  PulseRateChart({this.snapshot});

  @override
  _PulseRateChartState createState() => _PulseRateChartState();
}

class _PulseRateChartState extends State<PulseRateChart> {
  List<_PulseRateData> data = [];

  @override
  void initState() {
    super.initState();
    final formatter = DateFormat('dd/MM/yyyy');

    widget.snapshot.data.forEach((element) {
      var pulseRate = element['pulseRate'];
      var dateFromDb = element['Date'].toDate();
      var formattedDate = formatter.format(dateFromDb);
      var formTime = element['Time'];
      var date = '$formattedDate\n$formTime';
      data.add(_PulseRateData(day: date, pulseRate: pulseRate));
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
            series: <ChartSeries<_PulseRateData, String>>[
          LineSeries<_PulseRateData, String>(
              dataSource: data,
              xValueMapper: (pulse, _) => pulse.day,
              yValueMapper: (pulse, _) => pulse.pulseRate,
              name: 'Pulse Rate',
              color: Colors.red,
              dataLabelSettings: DataLabelSettings(isVisible: true))
        ]));
  }
}

class _PulseRateData {
  _PulseRateData({this.pulseRate, this.day});

  final double pulseRate;
  final String day;
}
