import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
  final _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return LayoutBuilder(builder: (context, constraints) {
      return SafeArea(
        child: Scrollbar(
          isAlwaysShown: true,
          thickness: 5,
          //showTrackOnHover: true,
          controller: _scrollController,
          child: SingleChildScrollView(
              controller: _scrollController,
              scrollDirection: Axis.horizontal,
              child: Container(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minWidth: constraints.minWidth,
                    minHeight: constraints.minHeight,
                  ),
                  child: IntrinsicWidth(
                    child: Container(
                      width: screenSize.width * 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Container(
                            margin: EdgeInsets.all(10),
                            child: Text('Vital sign',
                                style: TextStyle(
                                    fontSize: 18, color: Color(0xFFC37447))),
                          ),
                          FutureBuilder<List<Map<String, dynamic>>>(
                              future: _firebaseService.getVitalSignTable(
                                  hn: widget.hn),
                              builder: (context, snapshot) {
                                if (!snapshot.hasData) {
                                  return ProgressBar.circularProgressIndicator(
                                      context);
                                }
                                if (snapshot.data.length == 0) {
                                  return Text('There is no data yet');
                                }
                                print('${snapshot.data}');
                                return Table(
                                  border: TableBorder.all(
                                      color: Colors.white,
                                      style: BorderStyle.solid,
                                      width: 2),
                                  columnWidths: {
                                    0: IntrinsicColumnWidth(),
                                  },
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
                                                item['Date'],
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
                                          Text(
                                              item['RespirationsRate']
                                                  .toString(),
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
                                                          item[
                                                              'BloodPressure'])))
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
                                );
                              }),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.all(10),
                                child: Text('Pulse Rate',
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Color(0xFFC37447))),
                              ),
                              PulseRateChart(),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.all(10),
                                child: Text('Body Temperature',
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Color(0xFFC37447))),
                              ),
                              BodyTemperatureChart(),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.all(10),
                                child: Text('Pain Score',
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Color(0xFFC37447))),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(20, 0, 20, 0),
                                child: PainChart(
                                  hn: widget.hn,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )),
        ),
      );
    });
  }
}
