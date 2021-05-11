import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../services/interfaces/firebase_service_interface.dart';
import '../../services/service_locator.dart';
import '../material.dart';
import '../shared/progress_bar.dart';
import 'bodyTemperature_chart.dart';
import 'pain_chart.dart';
import 'pulseRate_chart.dart';

class DashboardTable extends StatefulWidget {
  final String hn;
  DashboardTable({this.hn});
  @override
  _DashboardTableState createState() => _DashboardTableState();
}

class _DashboardTableState extends State<DashboardTable> {
  final CustomMaterial _customMaterial = locator<CustomMaterial>();
  final IFirebaseService _firebaseService = locator<IFirebaseService>();

  @override
  Widget build(BuildContext context) {
    var _length = 0;
    return Container(
      child: FutureBuilder<List<Map<String, dynamic>>>(
          future: _firebaseService.getVitalSignTable(
              hn: widget.hn, dashboardState: "Post-Operation@Hospital"),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(
                  child: ProgressBar.circularProgressIndicator(context));
            }
            if (snapshot.data.length == 0) {
              return Text('ไม่มีข้อมูลจากแบบฟอร์ม Vital Sign');
            }
            final formatter = DateFormat('dd/MM/yyyy');
            _length = snapshot.data.length + 1;
            return Container(
              margin: EdgeInsets.symmetric(vertical: 20.0),
              height: snapshot.data == null || snapshot.data.length == 0
                  ? 30
                  : 1180,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Table(
                              defaultColumnWidth: FixedColumnWidth(200.0),
                              border: TableBorder.all(
                                  color: Colors.white,
                                  style: BorderStyle.solid,
                                  width: 2),
                              children: [
                                TableRow(children: [
                                  TableCell(
                                    verticalAlignment:
                                        TableCellVerticalAlignment.fill,
                                    child: Container(
                                      color: Color(0xFFC37447),
                                      child: SizedBox(
                                        child: Column(children: [
                                          Text(
                                            'Date',
                                            style: TextStyle(
                                                fontStyle: FontStyle.italic,
                                                color: Colors.white,
                                                fontSize: 16),
                                          ),
                                        ]),
                                      ),
                                    ),
                                  ),
                                  for (var item in snapshot.data)
                                    Container(
                                      color: Color(0xFFC37447),
                                      child: SizedBox(
                                        child: Column(children: [
                                          Text(
                                            ' ${formatter.format(item['Date'].toDate())}',
                                            style: TextStyle(
                                                fontStyle: FontStyle.italic,
                                                color: Colors.white,
                                                fontSize: 15),
                                          ),
                                          Text(
                                            item['Time'],
                                            style: TextStyle(
                                                fontStyle: FontStyle.italic,
                                                color: Colors.white,
                                                fontSize: 15),
                                          )
                                        ]),
                                      ),
                                    ),
                                ]),
                                TableRow(children: [
                                  TableCell(
                                    verticalAlignment:
                                        TableCellVerticalAlignment.fill,
                                    child: Container(
                                      color: Colors.grey[100],
                                      child: Column(children: [
                                        Text(' Days after Admission ',
                                            style: TextStyle(
                                                fontStyle: FontStyle.italic,
                                                fontSize: 15))
                                      ]),
                                    ),
                                  ),
                                  for (var item in snapshot.data)
                                    Column(children: [
                                      Text(item['Admission'].toString(),
                                          style: TextStyle(fontSize: 16))
                                    ]),
                                ]),
                                TableRow(children: [
                                  TableCell(
                                    verticalAlignment:
                                        TableCellVerticalAlignment.fill,
                                    child: Container(
                                      color: Colors.grey[100],
                                      child: Column(children: [
                                        Text(' Days after Operation ',
                                            style: TextStyle(
                                                fontStyle: FontStyle.italic,
                                                fontSize: 15))
                                      ]),
                                    ),
                                  ),
                                  for (var item in snapshot.data)
                                    Column(children: [
                                      Text(item['Operation'].toString(),
                                          style: TextStyle(fontSize: 16))
                                    ]),
                                ]),
                                TableRow(children: [
                                  TableCell(
                                    verticalAlignment:
                                        TableCellVerticalAlignment.fill,
                                    child: Container(
                                      color: Colors.grey[100],
                                      child: Column(children: [
                                        Text(' Respirations Rate ',
                                            style: TextStyle(
                                                fontStyle: FontStyle.italic,
                                                fontSize: 15))
                                      ]),
                                    ),
                                  ),
                                  for (var item in snapshot.data)
                                    Column(children: [
                                      Text(item['RespirationsRate'].toString(),
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: _customMaterial
                                                  .getRespirationRateColor(item[
                                                      'RespirationsRate'])))
                                    ]),
                                ]),
                                TableRow(children: [
                                  TableCell(
                                    child: Container(
                                      color: Colors.grey[100],
                                      child: Column(children: [
                                        Text(' Blood Pressure : ',
                                            style: TextStyle(
                                                fontStyle: FontStyle.italic,
                                                fontSize: 15)),
                                        Text(' Systolic/Diastolic ',
                                            style: TextStyle(
                                                fontStyle: FontStyle.italic,
                                                fontSize: 15))
                                      ]),
                                    ),
                                  ),
                                  for (var item in snapshot.data)
                                    Column(children: [
                                      Text(item['BloodPressure'],
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: _customMaterial
                                                  .getBloodPressureColor(
                                                      item['BloodPressure'])))
                                    ]),
                                ]),
                                TableRow(children: [
                                  TableCell(
                                    verticalAlignment:
                                        TableCellVerticalAlignment.fill,
                                    child: Container(
                                      color: Colors.grey[100],
                                      child: Column(children: [
                                        Text(' O2 Sat ',
                                            style: TextStyle(
                                                fontStyle: FontStyle.italic,
                                                fontSize: 15))
                                      ]),
                                    ),
                                  ),
                                  for (var item in snapshot.data)
                                    Column(children: [
                                      Text(item['O2Sat'].toString(),
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: _customMaterial
                                                  .getOxygenRateColor(
                                                      item['O2Sat'])))
                                    ]),
                                ]),
                              ],
                            ),
                            Container(
                              margin: EdgeInsets.all(10),
                              child: Text('Pulse Rate',
                                  style: TextStyle(
                                      fontSize: 18, color: Color(0xFFC37447))),
                            ),
                            Container(
                              height: 280,
                              width: (_length) * 200.toDouble(),
                              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                              child: PulseRateChart(
                                snapshot: snapshot,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.all(10),
                              child: Text('Body Temperature',
                                  style: TextStyle(
                                      fontSize: 18, color: Color(0xFFC37447))),
                            ),
                            Container(
                              height: 280,
                              width: (_length) * 200.toDouble(),
                              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                              child: BodyTemperatureChart(
                                snapshot: snapshot,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.all(10),
                              child: Text('Pain Score',
                                  style: TextStyle(
                                      fontSize: 18, color: Color(0xFFC37447))),
                            ),
                            Container(
                              height: 280,
                              width: (_length) * 200.toDouble(),
                              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                              child: PainChart(
                                snapshot: snapshot,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          }),
    );
  }
}
