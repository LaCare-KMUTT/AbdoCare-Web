import 'package:flutter/cupertino.dart';

import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:flutter/material.dart';

class PulseRateChart extends StatefulWidget {
  @override
  _PulseRateChartState createState() => _PulseRateChartState();
}

class _PulseRateChartState extends State<PulseRateChart> {
  List<_PulseRateData> data = [
    // _PulseRateData('10/03/64\n02.00น', 80),
    // _PulseRateData('10/03/64\n06.00น', 60),
    // _PulseRateData('10/03/64\n10.00น', 60),
    // _PulseRateData('10/03/64\n14.00น', 76),
    // _PulseRateData('10/03/64\n18.00น', 66),
    // _PulseRateData('10/03/64\n22.00น', 94),
    // _PulseRateData('11/03/64\n02.00น', 90),
    // _PulseRateData('11/03/64\n06.00น', 86),
    // _PulseRateData('11/03/64\n10.00น', 106),
    // _PulseRateData('11/03/64\n14.00น', 112),
    // _PulseRateData('11/03/64\n18.00น', 96),
    // _PulseRateData('11/03/64\n22.00น', 90),
    // _PulseRateData('12/03/64\n02.00น', 80),
    // _PulseRateData('12/03/64\n06.00น', 86),
    // _PulseRateData('12/03/64\n10.00น', 78),
    // _PulseRateData('12/03/64\n14.00น', 90),
    // _PulseRateData('12/03/64\n18.00น', 100),
    // _PulseRateData('12/03/64\n22.00น', 104),
  ];

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
          ]),
    );
  }
}

class _PulseRateData {
  _PulseRateData({this.pulseRate, this.day});

  final double pulseRate;
  final String day;
}
