import 'dart:ui';

import 'package:AbdoCare_Web/models/user_list/pre_op_list_model.dart';
import 'package:AbdoCare_Web/view_models/user_list/pre_op_list_view_model.dart';
import 'package:flutter/material.dart';

import '../../services/service_locator.dart';
import '../material.dart';

class PreTable extends StatefulWidget {
  PreTable({Key key}) : super(key: key);
  @override
  _PreTableState createState() => _PreTableState();
}

class _PreTableState extends State<PreTable> {
  final PreOpViewModel _preOpViewModel = locator<PreOpViewModel>();
  final CustomMaterial _customMaterial = locator<CustomMaterial>();

  List<PreOpData> users = [];
  bool _sortAsc = true;
  bool _sortRespirationRateAsc = true;
  bool _sortHeartRateAsc = true;
  bool _sortOxygenRateAsc = true;
  bool _sortBloodPressureAsc = true;
  bool _sortTemperatureAsc = true;
  bool _sortStatusAsc = true;
  int _sortColumnIndex = 11;

  FutureBuilder dataBody() {
    var screenSize = MediaQuery.of(context).size;
    return FutureBuilder<List<PreOpData>>(
        future: _preOpViewModel.getUsers(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: CircularProgressIndicator(
                strokeWidth: 4,
              ),
            );
          } else {
            if (users.isNotEmpty) {
              users.clear();
            }
            users.addAll(snapshot.data);
            return DataTable(
              showCheckboxColumn: false,
              columnSpacing: screenSize.width / 35,
              headingRowHeight: 50,
              headingTextStyle: TextStyle(
                  fontSize: 18,
                  fontFamily: 'Prompt',
                  color: Colors.black54,
                  fontStyle: FontStyle.italic),
              sortAscending: _sortAsc,
              sortColumnIndex: _sortColumnIndex,
              columns: <DataColumn>[
                DataColumn(
                  label: Expanded(child: Center(child: Text('HN'))),
                ),
                DataColumn(
                  label: Expanded(child: Text('ชื่อ-นามสกุล')),
                ),
                DataColumn(
                  label: Expanded(child: Center(child: Text('เพศ'))),
                ),
                DataColumn(
                  label: Expanded(child: Center(child: Text('อายุ'))),
                ),
                DataColumn(
                  label: Expanded(child: Center(child: Text('ห้อง'))),
                ),
                DataColumn(
                  label: Expanded(child: Center(child: Text('เตียง'))),
                ),
                DataColumn(
                  label: Expanded(child: Center(child: Text('อัตราการหายใจ'))),
                  numeric: true,
                  onSort: (columnIndex, sortAscending) {
                    setState(() {
                      if (columnIndex == _sortColumnIndex) {
                        _sortAsc = _sortRespirationRateAsc = sortAscending;
                      } else {
                        _sortColumnIndex = columnIndex;
                        _sortAsc = _sortRespirationRateAsc;
                      }
                      _preOpViewModel.sortBy('respirationRate', sortAscending);
                    });
                  },
                ),
                DataColumn(
                  label: Expanded(child: Center(child: Text('อุณหภูมิ'))),
                  numeric: true,
                  onSort: (columnIndex, sortAscending) {
                    setState(() {
                      if (columnIndex == _sortColumnIndex) {
                        _sortAsc = _sortTemperatureAsc = sortAscending;
                      } else {
                        _sortColumnIndex = columnIndex;
                        _sortAsc = _sortTemperatureAsc;
                      }
                      _preOpViewModel.sortBy('temperature', sortAscending);
                    });
                  },
                ),
                DataColumn(
                  label: Expanded(
                      child: Center(
                          child: Text(
                    'ชีพจร',
                  ))),
                  numeric: true,
                  onSort: (columnIndex, sortAscending) {
                    setState(() {
                      if (columnIndex == _sortColumnIndex) {
                        _sortAsc = _sortHeartRateAsc = sortAscending;
                      } else {
                        _sortColumnIndex = columnIndex;
                        _sortAsc = _sortHeartRateAsc;
                      }
                      _preOpViewModel.sortBy('heartRate', sortAscending);
                    });
                  },
                ),
                DataColumn(
                  label: Expanded(child: Center(child: Text('ความดัน'))),
                  numeric: true,
                  onSort: (columnIndex, sortAscending) {
                    setState(() {
                      if (columnIndex == _sortColumnIndex) {
                        _sortAsc = _sortBloodPressureAsc = sortAscending;
                      } else {
                        _sortColumnIndex = columnIndex;
                        _sortAsc = _sortBloodPressureAsc;
                      }
                      _preOpViewModel.sortBy('bloodPressure', sortAscending);
                    });
                  },
                ),
                DataColumn(
                  label: Expanded(child: Text('ออกซิเจน')),
                  numeric: true,
                  onSort: (columnIndex, sortAscending) {
                    setState(() {
                      if (columnIndex == _sortColumnIndex) {
                        _sortAsc = _sortOxygenRateAsc = sortAscending;
                      } else {
                        _sortColumnIndex = columnIndex;
                        _sortAsc = _sortOxygenRateAsc;
                      }
                      _preOpViewModel.sortBy('oxygenRate', sortAscending);
                    });
                  },
                ),
                DataColumn(
                  label: Expanded(child: Text('สถานะ')),
                  numeric: false,
                  onSort: (columnIndex, sortAscending) {
                    setState(() {
                      if (columnIndex == _sortColumnIndex) {
                        _sortAsc = _sortStatusAsc = sortAscending;
                      } else {
                        _sortColumnIndex = columnIndex;
                        _sortAsc = _sortStatusAsc;
                      }
                      _preOpViewModel.sortBy('status', sortAscending);
                    });
                  },
                ),
              ],
              rows: users.map((user) {
                var str = user.bloodPressure;
                var parts = str.split('/');
                var s = parts[0].trim();
                var d = parts[1].trim();
                var systolic = int.parse(s);
                var diastolic = int.parse(d);
                return DataRow(
                    onSelectChanged: (newValue) {
                      print('Selected ${user.hn} ${user.name}');
                      Navigator.pushNamed(context, '/dashboard_pre',
                          arguments: user.hn);
                    },
                    cells: [
                      DataCell(Text(user.hn)),
                      DataCell(Text(user.name)),
                      DataCell(Text(user.gender)),
                      DataCell(Center(
                          child: Text(
                        user.age,
                        style: TextStyle(
                          fontSize: 17,
                        ),
                      ))),
                      DataCell(Center(child: Text(user.roomNumber))),
                      DataCell(Center(child: Text(user.bedNumber))),
                      DataCell(
                        Text('${user.respirationRate.toString()}',
                            style: TextStyle(
                                fontSize: 17,
                                color: _customMaterial.getRespirationRateColor(
                                    user.respirationRate))),
                      ),
                      DataCell(
                        Text('${user.temperature.toString()}',
                            style: TextStyle(
                                fontSize: 17,
                                color: _customMaterial
                                    .getTemperatureColor(user.temperature))),
                      ),
                      DataCell(
                        Text('${user.heartRate.toString()}',
                            style: TextStyle(
                                fontSize: 17,
                                color: _customMaterial
                                    .getHeartRateColor(user.heartRate))),
                      ),
                      DataCell(
                        Text('${user.bloodPressure.toString()}',
                            style: TextStyle(
                                fontSize: 17,
                                color: _customMaterial.getBloodPressureColor(
                                    systolic, diastolic, user.bloodPressure))),
                      ),
                      DataCell(
                        Text('${user.oxygenRate.toString()}',
                            style: TextStyle(
                                fontSize: 17,
                                color: _customMaterial
                                    .getOxygenRateColor(user.oxygenRate))),
                      ),
                      DataCell(
                        Align(
                          alignment: Alignment.center,
                          child: Text(user.status,
                              style: TextStyle(
                                  color: _customMaterial
                                      .getStatusColor(user.status))),
                        ),
                      ),
                    ]);
              }).toList(),
            );
          }
        });
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: ListView(
        children: [
          Row(children: <Widget>[
            Expanded(
              flex: 5,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.fromLTRB(screenSize.height / 7,
                        screenSize.height / 20, screenSize.height / 70, 0),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Text(
                        'ค้นหาผู้ป่วย:',
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.fromLTRB(
                        0, screenSize.height / 20, screenSize.height / 70, 0),
                    child: Container(
                      child: TextField(
                        decoration: InputDecoration(
                            isDense: true,
                            enabledBorder: const OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.black26, width: 0.0)),
                            contentPadding: EdgeInsets.all(10.0),
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(7.0))),
                            prefixIcon: Icon(Icons.search),
                            hintText: 'HN'),
                        onChanged: (val) {
                          setState(() {
                            // hn = val;
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(
                  0, screenSize.height / 20, screenSize.height / 9, 0),
              child: Container(
                child: RaisedButton(
                  child: Text("ค้นหา", style: TextStyle(fontSize: 18)),
                  padding: EdgeInsets.all(15),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7.0)),
                  onPressed: () {},
                ),
              ),
            ),
          ]),
          Padding(
            padding: EdgeInsets.fromLTRB(screenSize.height / 25,
                screenSize.height / 70, screenSize.height / 25, 0),
            child: Card(
              child: Container(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Center(
                    child: Scrollbar(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: FittedBox(child: dataBody()),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
