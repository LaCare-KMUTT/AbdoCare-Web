import 'package:flutter/cupertino.dart';

import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:flutter/material.dart';

class BodyTemperatureChart extends StatefulWidget {
  @override
  _BodyTemperatureChartState createState() => _BodyTemperatureChartState();
}

class _BodyTemperatureChartState extends State<BodyTemperatureChart> {
  List<_PulseRateData> data = [
    _PulseRateData('10/03/64\n02.00น', 37.0, 1),
    _PulseRateData('10/03/64\n06.00น', 37.2, 2),
    _PulseRateData('10/03/64\n10.00น', 37.4, 3),
    _PulseRateData('10/03/64\n14.00น', 36.8, 4),
    _PulseRateData('10/03/64\n18.00น', 36.2, 5),
    _PulseRateData('10/03/64\n22.00น', 36.0, 6),
    _PulseRateData('11/03/64\n02.00น', 36.2, 7),
    _PulseRateData('11/03/64\n06.00น', 36.8, 8),
    _PulseRateData('11/03/64\n10.00น', 36.6, 9),
    _PulseRateData('11/03/64\n14.00น', 36.5, 10),
    _PulseRateData('11/03/64\n18.00น', 36.8, 11),
    _PulseRateData('11/03/64\n22.00น', 36.9, 12),
    _PulseRateData('12/03/64\n02.00น', 37.0, 13),
    _PulseRateData('12/03/64\n06.00น', 36.1, 14),
    _PulseRateData('12/03/64\n10.00น', 36.2, 15),
    _PulseRateData('12/03/64\n14.00น', 36.5, 16),
    _PulseRateData('12/03/64\n18.00น', 36.2, 17),
    _PulseRateData('12/03/64\n22.00น', 36.2, 18),
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
                xValueMapper: (pulse, _) => pulse.pulserate,
                yValueMapper: (pulse, _) => pulse.day,
                name: 'Body Temperature',
                color: Colors.blue,
                dataLabelSettings: DataLabelSettings(isVisible: true))
          ]),
    );
  }
}

class _PulseRateData {
  _PulseRateData(this.pulserate, this.day, this.number);

  final String pulserate;
  final double day;
  final double number;
}
