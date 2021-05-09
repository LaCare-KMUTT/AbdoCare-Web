import 'package:AbdoCare_Web/services/interfaces/firebase_service_interface.dart';
import 'package:AbdoCare_Web/services/service_locator.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:flutter/material.dart';

class PainChart extends StatefulWidget {
  final hn;
  PainChart({this.hn});
  @override
  _PainChartState createState() => _PainChartState();
}

class _PainChartState extends State<PainChart> {
  final _firebaseService = locator<IFirebaseService>();
  List<_PainData> data = [];
// _PainData('10/03/64\n02.00น', 9),
  // _PainData('10/03/64\n06.00น', 9),
  // _PainData('10/03/64\n10.00น', 8),
  // _PainData('10/03/64\n14.00น', 8),
  // _PainData('10/03/64\n18.00น', 8),
  // _PainData('10/03/64\n22.00น', 8),
  // _PainData('11/03/64\n02.00น', 7),
  // _PainData('11/03/64\n06.00น', 9),
  // _PainData('11/03/64\n10.00น', 9),
  // _PainData('11/03/64\n14.00น', 7),
  // _PainData('11/03/64\n18.00น', 6),
  // _PainData('11/03/64\n22.00น', 6),
  // _PainData('12/03/64\n02.00น', 6),
  // _PainData('12/03/64\n06.00น', 6),
  // _PainData('12/03/64\n10.00น', 7),
  // _PainData('12/03/64\n14.00น', 6),
  // _PainData('12/03/64\n18.00น', 5),
  // _PainData('12/03/64\n22.00น', 5),

  void initData() async {
    var painData = await _firebaseService.getPainChart(hn: widget.hn);
    painData.forEach((element) {
      var painScore = element['formData']['pain'];
      final formatter = DateFormat('dd/MM/yyyy');
      String format = formatter.format(element['creation'].toDate());
      String formTime = element['formTime'];
      String date = '$format\n$formTime';
      data.add(_PainData(date, painScore));
    });

    print('pain Data = $data');
  }

  @override
  void initState() {
    super.initState();
    initData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SfCartesianChart(
          primaryXAxis: CategoryAxis(),
          legend: Legend(isVisible: false),
          tooltipBehavior: TooltipBehavior(enable: true),
          series: <ChartSeries<_PainData, String>>[
            LineSeries<_PainData, String>(
                dataSource: data,
                xValueMapper: (pain, _) => pain.painscore,
                yValueMapper: (pain, _) => pain.day,
                name: 'Pain score',
                color: Colors.red,
                dataLabelSettings: DataLabelSettings(isVisible: true))
          ]),
    );
  }
}

class _PainData {
  _PainData(this.painscore, this.day);
  final String painscore;
  final double day;
}
