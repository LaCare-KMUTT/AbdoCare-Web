import 'dart:ui';

import 'package:AbdoCare_Web/models/pre_op_list_model.dart';
import 'package:AbdoCare_Web/view_models/pre_op_list_view_model.dart';
import 'package:flutter/material.dart';

import '../../services/service_locator.dart';

class PreTable extends StatefulWidget {
  PreTable({Key key}) : super(key: key);
  @override
  _PreTableState createState() => _PreTableState();
}

class _PreTableState extends State<PreTable> {
  final PreOpViewModel _preOpViewModel = locator<PreOpViewModel>();

  List<PreOpData> users = [];
  bool _sortAsc = true;
  bool _sortRespirationRateAsc = true;
  bool _sortHeartRateAsc = true;
  bool _sortOxygenRateAsc = true;
  bool _sortBloodPressureAsc = true;
  bool _sortTemperatureAsc = true;
  bool _sortStatusAsc = true;
  int _sortColumnIndex = 11;

  Color getTemperatureColor(double temperature) {
    if (temperature < 36.0 || temperature > 37.0) {
      return Colors.red;
    }
    return Colors.green;
  }

  Color getRespirationRateColor(double respirationRate) {
    if (respirationRate < 16 || respirationRate > 20) {
      return Colors.red;
    }
    return Colors.green;
  }

  Color getHeartRateColor(double heartRate) {
    if (heartRate < 60 || heartRate > 100) {
      return Colors.red;
    }
    return Colors.green;
  }

  Color getBloodPressureColor(double bloodPressure) {
    if (bloodPressure < 130) {
      return Colors.red;
    }
    return Colors.green;
  }

  Color getOxygenRateColor(double oxygenRate) {
    if (oxygenRate < 95) {
      return Colors.red;
    }
    return Colors.green;
  }

  Color getStatusColor(String status) {
    if (status == 'ผิดปกติ') {
      return Colors.red;
    } else {
      return Colors.green;
    }
  }

  FutureBuilder dataBody() {
    var screenSize = MediaQuery.of(context).size;
    return FutureBuilder<List<PreOpData>>(
        future: _preOpViewModel.getUsers(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return CircularProgressIndicator(
              strokeWidth: 4,
            );
          } else {
            users.addAll(snapshot.data);
            print('OH MY GOD ${users.first.hn}');
            print('ทำไมไม่เวิคไอสัส ${users.length}');
            return DataTable(
              showCheckboxColumn: false,
              columnSpacing: screenSize.width / 37,
              headingRowHeight: 50,
              headingTextStyle: TextStyle(
                  fontSize: 18,
                  fontFamily: 'Prompt',
                  color: Colors.black54,
                  fontStyle: FontStyle.italic),
              sortAscending: _sortAsc,
              sortColumnIndex: _sortColumnIndex,
              columns: [
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
                      users.sort((a, b) =>
                          a.respirationRate.compareTo(b.respirationRate));
                      if (!sortAscending) {
                        users = users.reversed.toList();
                      }
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
                      users.sort(
                          (a, b) => a.temperature.compareTo(b.temperature));
                      if (!sortAscending) {
                        users = users.reversed.toList();
                      }
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
                      users.sort((a, b) => a.heartRate.compareTo(b.heartRate));
                      if (!sortAscending) {
                        users = users.reversed.toList();
                      }
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
                      users.sort(
                          (a, b) => a.bloodPressure.compareTo(b.bloodPressure));
                      if (!sortAscending) {
                        users = users.reversed.toList();
                      }
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
                      users
                          .sort((a, b) => a.oxygenRate.compareTo(b.oxygenRate));
                      if (!sortAscending) {
                        users = users.reversed.toList();
                      }
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
                      users.sort((a, b) => b.status.compareTo(a.status));
                      if (!sortAscending) {
                        users = users.reversed.toList();
                      }
                    });
                  },
                ),
              ],
              rows: users.map((user) {
                print('user in map ${user.hn}');
                return DataRow(
                    onSelectChanged: (newValue) {
                      print('Selected ${user.hn} ${user.name}');
                    },
                    cells: [
                      DataCell(Text(user.hn)),
                      DataCell(Text(user.name)),
                      DataCell(Text(user.gender)),
                      DataCell(Center(child: Text(user.age))),
                      DataCell(Center(child: Text(user.roomNumber))),
                      DataCell(Center(child: Text(user.bedNumber))),
                      DataCell(
                        Text('${user.respirationRate.toString()}',
                            style: TextStyle(
                                color: getRespirationRateColor(
                                    user.respirationRate))),
                      ),
                      DataCell(
                        Text('${user.temperature.toString()}',
                            style: TextStyle(
                                color: getTemperatureColor(user.temperature))),
                      ),
                      DataCell(
                        Text('${user.heartRate.toString()}',
                            style: TextStyle(
                                color: getHeartRateColor(user.heartRate))),
                      ),
                      DataCell(
                        Text('${user.bloodPressure.toString()}',
                            style: TextStyle(
                                color:
                                    getBloodPressureColor(user.bloodPressure))),
                      ),
                      DataCell(
                        Text('${user.oxygenRate.toString()}',
                            style: TextStyle(
                                color: getOxygenRateColor(user.oxygenRate))),
                      ),
                      DataCell(
                        Align(
                          alignment: Alignment.center,
                          child: Text(user.status,
                              style: TextStyle(
                                  color: getStatusColor(user.status))),
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
