import 'package:flutter/cupertino.dart';

import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:flutter/material.dart';

class TestChart extends StatefulWidget {
  @override
  _TestChartState createState() => _TestChartState();
}

class _TestChartState extends State<TestChart> {
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
    _PulseRateData('13/03/64\n02.00น', 36.4, 19),
    _PulseRateData('13/03/64\n06.00น', 36.7, 20),
    _PulseRateData('13/03/64\n10.00น', 36.5, 21),
    _PulseRateData('13/03/64\n14.00น', 36.2, 22),
    _PulseRateData('13/03/64\n18.00น', 36.6, 23),
    _PulseRateData('13/03/64\n22.00น', 36.9, 24),
    _PulseRateData('14/03/64\n02.00น', 37.2, 25),
    _PulseRateData('14/03/64\n06.00น', 37.3, 26),
    _PulseRateData('14/03/64\n10.00น', 37.2, 27),
    _PulseRateData('14/03/64\n14.00น', 37.4, 28),
    _PulseRateData('14/03/64\n18.00น', 36.9, 29),
    _PulseRateData('14/03/64\n22.00น', 36.9, 30),
  ];
  List<_PulseRateData> data2 = [
    _PulseRateData('10/03/64\n02.00น', 68, 1),
    _PulseRateData('10/03/64\n06.00น', 68, 2),
    _PulseRateData('10/03/64\n10.00น', 68, 3),
    _PulseRateData('10/03/64\n14.00น', 75, 4),
    _PulseRateData('10/03/64\n18.00น', 75, 5),
    _PulseRateData('10/03/64\n22.00น', 75, 6),
    _PulseRateData('11/03/64\n02.00น', 75, 7),
    _PulseRateData('11/03/64\n06.00น', 75, 8),
    _PulseRateData('11/03/64\n10.00น', 75, 9),
    _PulseRateData('11/03/64\n14.00น', 75, 10),
    _PulseRateData('11/03/64\n18.00น', 75, 11),
    _PulseRateData('11/03/64\n22.00น', 75, 12),
    _PulseRateData('12/03/64\n02.00น', 75, 13),
    _PulseRateData('12/03/64\n06.00น', 75, 14),
    _PulseRateData('12/03/64\n10.00น', 75, 15),
    _PulseRateData('12/03/64\n14.00น', 75, 16),
    _PulseRateData('12/03/64\n18.00น', 75, 17),
    _PulseRateData('12/03/64\n22.00น', 75, 18),
    _PulseRateData('13/03/64\n02.00น', 75, 19),
    _PulseRateData('13/03/64\n06.00น', 75, 20),
    _PulseRateData('13/03/64\n10.00น', 75, 21),
    _PulseRateData('13/03/64\n14.00น', 75, 22),
    _PulseRateData('13/03/64\n18.00น', 75, 23),
    _PulseRateData('13/03/64\n22.00น', 75, 24),
    _PulseRateData('14/03/64\n02.00น', 75, 25),
    _PulseRateData('14/03/64\n06.00น', 75, 26),
    _PulseRateData('14/03/64\n10.00น', 75, 27),
    _PulseRateData('14/03/64\n14.00น', 75, 28),
    _PulseRateData('14/03/64\n18.00น', 75, 29),
    _PulseRateData('14/03/64\n22.00น', 75, 30),
  ];

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return LayoutBuilder(builder: (context, constraints) {
      return SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Container(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                  minWidth: constraints.minWidth,
                  minHeight: constraints.minHeight),
              child: IntrinsicWidth(
                child: Container(
                  height: screenSize.height / 2,
                  width: screenSize.width * 2,
                  child: SfCartesianChart(
                      primaryXAxis: CategoryAxis(),
                      legend: Legend(isVisible: false),
                      tooltipBehavior: TooltipBehavior(enable: true),
                      series: <ChartSeries>[
                        StackedLineSeries<_PulseRateData, double>(
                            groupName: 'Group A',
                            dataLabelSettings: DataLabelSettings(
                                isVisible: true,
                                showCumulativeValues: true,
                                useSeriesColor: true),
                            dataSource: data,
                            xValueMapper: (sales, _) => sales.number,
                            yValueMapper: (sales, _) => sales.day),
                        StackedLineSeries<_PulseRateData, double>(
                            groupName: 'Group B',
                            dataLabelSettings: DataLabelSettings(
                                isVisible: true,
                                showCumulativeValues: true,
                                useSeriesColor: true),
                            dataSource: data2,
                            xValueMapper: (sales, _) => sales.number,
                            yValueMapper: (sales, _) => sales.day),
                      ]
                      // <ChartSeries<_PulseRateData, String>>[
                      //   LineSeries<_PulseRateData, String>(
                      //       dataSource: data,
                      //       xValueMapper: (pulse, _) => pulse.pulserate,
                      //       yValueMapper: (pulse, _) => pulse.day,
                      //       name: 'Body Temperature',
                      //       color: Colors.blue,
                      //       dataLabelSettings:
                      //           DataLabelSettings(isVisible: true))
                      // ]
                      ),
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}

class _PulseRateData {
  _PulseRateData(this.pulserate, this.day, this.number);

  final String pulserate;
  final double day;
  final double number;
}
