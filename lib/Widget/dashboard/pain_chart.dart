import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../services/interfaces/firebase_service_interface.dart';
import '../../services/service_locator.dart';
import '../shared/progress_bar.dart';

class PainChart extends StatefulWidget {
  final hn;
  PainChart({this.hn});
  @override
  _PainChartState createState() => _PainChartState();
}

class _PainChartState extends State<PainChart> {
  final _firebaseService = locator<IFirebaseService>();
  List<_PainData> data = [];

  Widget build(BuildContext context) {
    return FutureBuilder<List<Map<String, dynamic>>>(
        future: _firebaseService.getPainChart(hn: widget.hn),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return ProgressBar.circularProgressIndicator(context);
          }
          snapshot.data.forEach((element) {
            var painScore = element['formData']['pain'];
            final formatter = DateFormat('dd/MM/yyyy');
            String format = formatter.format(element['creation'].toDate());
            String formTime = element['formTime'];
            String date = '$format\n$formTime';
            data.add(_PainData(day: date, painscore: painScore));
          });
          return Container(
            child: SfCartesianChart(
                primaryXAxis: CategoryAxis(),
                legend: Legend(isVisible: false),
                tooltipBehavior: TooltipBehavior(enable: true),
                series: <ChartSeries<_PainData, String>>[
                  LineSeries<_PainData, String>(
                      dataSource: data,
                      xValueMapper: (pain, _) => pain.day,
                      yValueMapper: (pain, _) => pain.painscore,
                      name: 'Pain score',
                      color: Colors.red,
                      dataLabelSettings: DataLabelSettings(isVisible: true))
                ]),
          );
        });
  }
}

class _PainData {
  _PainData({this.painscore, this.day});
  final String day;
  final double painscore;
}
