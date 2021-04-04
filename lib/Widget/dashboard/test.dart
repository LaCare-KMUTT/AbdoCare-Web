import 'package:flutter/cupertino.dart';

import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:flutter/material.dart';

class TestChart extends StatefulWidget {
  @override
  _TestChartState createState() => _TestChartState();
}

class _TestChartState extends State<TestChart> {
  List<_TestData> data = [
    _TestData('10/03/64\n02.00น', 37.0),
    _TestData('10/03/64\n06.00น', 37.2),
    _TestData('10/03/64\n10.00น', 37.4),
    _TestData('10/03/64\n14.00น', 36.8),
    _TestData('10/03/64\n18.00น', 36.2),
    _TestData('10/03/64\n22.00น', 36.0),
    _TestData('11/03/64\n02.00น', 36.2),
    _TestData('11/03/64\n06.00น', 36.8),
    _TestData('11/03/64\n10.00น', 36.6),
    _TestData('11/03/64\n14.00น', 36.5),
    _TestData('11/03/64\n18.00น', 36.8),
    _TestData('11/03/64\n22.00น', 36.9),
    // _TestData('12/03/64\n02.00น', 37.0),
    // _TestData('12/03/64\n06.00น', 36.1),
    // _TestData('12/03/64\n10.00น', 36.2),
    // _TestData('12/03/64\n14.00น', 36.5),
    // _TestData('12/03/64\n18.00น', 36.2),
    // _TestData('12/03/64\n22.00น', 36.2),
  ];
  List<_TestData> data2 = [
    _TestData('10/03/64\n02.00น', 68),
    _TestData('10/03/64\n06.00น', 68),
    _TestData('10/03/64\n10.00น', 68),
    _TestData('10/03/64\n14.00น', 75),
    _TestData('10/03/64\n18.00น', 80),
    _TestData('10/03/64\n22.00น', 72),
    _TestData('11/03/64\n02.00น', 76),
    _TestData('11/03/64\n06.00น', 89),
    _TestData('11/03/64\n10.00น', 90),
    _TestData('11/03/64\n14.00น', 85),
    _TestData('11/03/64\n18.00น', 78),
    _TestData('11/03/64\n22.00น', 79),
    // _TestData('12/03/64\n02.00น', 82),
    // _TestData('12/03/64\n06.00น', 85),
    // _TestData('12/03/64\n10.00น', 90),
    // _TestData('12/03/64\n14.00น', 92),
    // _TestData('12/03/64\n18.00น', 94),
    // _TestData('12/03/64\n22.00น', 89),
  ];
  ZoomPanBehavior _zoomPanBehavior;

  @override
  void initState() {
    _zoomPanBehavior = ZoomPanBehavior(
      enablePanning: true,
      enablePinching: true,
      zoomMode: ZoomMode.x,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return LayoutBuilder(builder: (context, constraints) {
      return SafeArea(
        child:
            // SingleChildScrollView(
            //   scrollDirection: Axis.horizontal,
            //   child: Container(
            //     child: ConstrainedBox(
            //       constraints: BoxConstraints(
            //           minWidth: constraints.minWidth,
            //           minHeight: constraints.minHeight),
            //       child: IntrinsicWidth(
            //         child: Container(
            //           height: screenSize.height / 2,
            //           width: screenSize.width * 2,
            //           child:
            SfCartesianChart(
                zoomPanBehavior: _zoomPanBehavior,
                primaryXAxis:
                    CategoryAxis(name: 'test2', title: AxisTitle(text: 'Date')),
                primaryYAxis: NumericAxis(
                    name: 'test',
                    title: AxisTitle(
                        text: 'Body tempurature',
                        textStyle: TextStyle(color: Colors.blue)),
                    anchorRangeToVisiblePoints: false),
                // legend: Legend(isVisible: true),
                tooltipBehavior: TooltipBehavior(enable: true),
                axes: <ChartAxis>[
              NumericAxis(
                  name: 'xAxis', title: AxisTitle(text: 'Secondary X Axis')),
              NumericAxis(
                  name: 'yAxis',
                  interval: 1,
                  title: AxisTitle(
                      text: 'Pulse Rate',
                      textStyle: TextStyle(color: Colors.red)))
            ],
                series: <ChartSeries<_TestData, String>>[
              // ColumnSeries<_TestData, String>(
              //     dataSource: data,
              //     xValueMapper: (pulse, _) => pulse.pulserate,
              //     yValueMapper: (pulse, _) => pulse.day,
              //     name: 'Unit Sold'),
              LineSeries<_TestData, String>(
                  dataSource: data,
                  xValueMapper: (pulse, _) => pulse.pulserate,
                  yValueMapper: (pulse, _) => pulse.day,
                  dataLabelSettings: DataLabelSettings(isVisible: true),
                  color: Colors.blue,
                  name: 'Body Temperature'),
              LineSeries<_TestData, String>(
                  dataSource: data2,
                  xValueMapper: (pulse, _) => pulse.pulserate,
                  yValueMapper: (pulse, _) => pulse.day,
                  yAxisName: 'yAxis',
                  color: Colors.red,
                  dataLabelSettings: DataLabelSettings(isVisible: true),
                  name: 'Pulse Rate')
            ]
                //////
                // <ChartSeries>[
                //   StackedLineSeries<_TestData, double>(
                //       groupName: 'Group A',
                //       dataLabelSettings: DataLabelSettings(
                //           isVisible: true,
                //           showCumulativeValues: true,
                //           useSeriesColor: true),
                //       dataSource: data,
                //       xValueMapper: (sales, _) => sales.number,
                //       yValueMapper: (sales, _) => sales.day),
                //   StackedLineSeries<_TestData, double>(
                //       groupName: 'Group B',
                //       dataLabelSettings: DataLabelSettings(
                //           isVisible: true,
                //           showCumulativeValues: true,
                //           useSeriesColor: true),
                //       dataSource: data2,
                //       xValueMapper: (sales, _) => sales.number,
                //       yValueMapper: (sales, _) => sales.day),
                // ]
                //////////
                // <ChartSeries<_TestData, String>>[
                //   LineSeries<_TestData, String>(
                //       dataSource: data,
                //       xValueMapper: (pulse, _) => pulse.pulserate,
                //       yValueMapper: (pulse, _) => pulse.day,
                //       name: 'Body Temperature',
                //       color: Colors.blue,
                //       dataLabelSettings:
                //           DataLabelSettings(isVisible: true))
                // ]
                ),
        //         ),
        //       ),
        //     ),
        //   ),
        // ),
      );
    });
  }
}

class _TestData {
  _TestData(this.pulserate, this.day);

  final String pulserate;
  final double day;
}
