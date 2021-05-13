import 'dart:ui';
import 'package:AbdoCare_Web/Widget/shared/progress_bar.dart';
import 'package:AbdoCare_Web/page/dashboard_postHos.dart';

import 'package:AbdoCare_Web/models/user_list/post_hos_list_model.dart';
import 'package:AbdoCare_Web/view_models/user_list/post_hos_list_view_model.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../services/service_locator.dart';
import '../material.dart';

class PostHosTable extends StatefulWidget {
  PostHosTable({Key key}) : super(key: key);
  @override
  _PostHosTableState createState() => _PostHosTableState();
}

class _PostHosTableState extends State<PostHosTable> {
  final PostHosViewModel _postHosViewModel = locator<PostHosViewModel>();
  final CustomMaterial _customMaterial = locator<CustomMaterial>();

  bool _sortAsc = true;
  bool _sortRespirationRateAsc = true;
  bool _sortPulseRateAsc = true;
  bool _sortOxygenRateAsc = true;
  bool _sortBloodPressureAsc = true;
  bool _sortTemperatureAsc = true;
  bool _sortStatusAsc = true;
  int _sortColumnIndex;

  FutureBuilder dataBody() {
    var screenSize = MediaQuery.of(context).size;

    return FutureBuilder<List<PostHosData>>(
        future: _postHosViewModel.getUsers(),
        builder: (context, snapshot) {
          if (!snapshot.hasData ||
              snapshot.connectionState != ConnectionState.done) {
            return Container(
                child: ProgressBar.circularProgressIndicator(context));
          } else {
            return DataTable(
              showCheckboxColumn: false,
              columnSpacing: screenSize.width * 0.03,
              horizontalMargin: 5,
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
                  label: Expanded(child: Center(child: Text(' เพศ '))),
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
                  numeric: true,
                  label: Expanded(child: Center(child: Text('อัตราการหายใจ'))),
                  onSort: (columnIndex, sortAscending) {
                    setState(() {
                      if (columnIndex == _sortColumnIndex) {
                        _sortAsc = _sortRespirationRateAsc = sortAscending;
                      } else {
                        _sortColumnIndex = columnIndex;
                        _sortAsc = _sortRespirationRateAsc;
                      }
                      _postHosViewModel.sortBy(
                          'respirationRate', sortAscending);
                    });
                  },
                ),
                DataColumn(
                    numeric: true,
                    label: Expanded(child: Center(child: Text('อุณหภูมิ'))),
                    onSort: (columnIndex, sortAscending) {
                      setState(() {
                        if (columnIndex == _sortColumnIndex) {
                          _sortAsc = _sortTemperatureAsc = sortAscending;
                        } else {
                          _sortColumnIndex = columnIndex;
                          _sortAsc = _sortTemperatureAsc;
                        }
                        _postHosViewModel.sortBy('temperature', sortAscending);
                      });
                    }),
                DataColumn(
                  numeric: true,
                  label: Expanded(child: Center(child: Text('ชีพจร'))),
                  onSort: (columnIndex, sortAscending) {
                    setState(() {
                      if (columnIndex == _sortColumnIndex) {
                        _sortAsc = _sortPulseRateAsc = sortAscending;
                      } else {
                        _sortColumnIndex = columnIndex;
                        _sortAsc = _sortPulseRateAsc;
                      }
                      _postHosViewModel.sortBy('pulseRate', sortAscending);
                    });
                  },
                ),
                DataColumn(
                  numeric: true,
                  label: Expanded(child: Center(child: Text('ความดัน'))),
                  onSort: (columnIndex, sortAscending) {
                    setState(() {
                      if (columnIndex == _sortColumnIndex) {
                        _sortAsc = _sortBloodPressureAsc = sortAscending;
                      } else {
                        _sortColumnIndex = columnIndex;
                        _sortAsc = _sortBloodPressureAsc;
                      }
                      _postHosViewModel.sortBy('bloodPressure', sortAscending);
                    });
                  },
                ),
                DataColumn(
                  numeric: true,
                  label: Expanded(child: Text('ออกซิเจน')),
                  onSort: (columnIndex, sortAscending) {
                    setState(() {
                      if (columnIndex == _sortColumnIndex) {
                        _sortAsc = _sortOxygenRateAsc = sortAscending;
                      } else {
                        _sortColumnIndex = columnIndex;
                        _sortAsc = _sortOxygenRateAsc;
                      }
                      _postHosViewModel.sortBy('oxygenRate', sortAscending);
                    });
                  },
                ),
                DataColumn(
                  label: Expanded(child: Text('สถานะ')),
                  onSort: (columnIndex, sortAscending) {
                    setState(() {
                      if (columnIndex == _sortColumnIndex) {
                        _sortAsc = _sortStatusAsc = sortAscending;
                      } else {
                        _sortColumnIndex = columnIndex;
                        _sortAsc = _sortStatusAsc;
                      }
                      _postHosViewModel.sortBy('status', sortAscending);
                    });
                  },
                ),
              ],
              rows: snapshot.data.map((user) {
                return DataRow(
                    onSelectChanged: (newValue) {
                      print('Selected ${user.hn} ${user.name}');
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                PostHosDashboardPage(hn: user.hn),
                          ));
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
                                color: CustomMaterial().getRespirationRateColor(
                                    user.respirationRate))),
                      ),
                      DataCell(
                        Text('${user.temperature.toString()}',
                            style: TextStyle(
                                color: _customMaterial
                                    .getTemperatureColor(user.temperature))),
                      ),
                      DataCell(
                        Text('${user.pulseRate.toString()}',
                            style: TextStyle(
                                color: _customMaterial
                                    .getPulseRateColor(user.pulseRate))),
                      ),
                      DataCell(
                        Text('${user.bloodPressure.toString()}',
                            style: TextStyle(
                                color: _customMaterial.getBloodPressureColor(
                                    user.bloodPressure))),
                      ),
                      DataCell(
                        Text('${user.oxygenRate.toString()}',
                            style: TextStyle(
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
                        0, screenSize.height / 20, screenSize.height / 22, 0),
                    child: Container(
                      child: TextField(
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                              RegExp("[a-zA-Z0-9]"))
                        ],
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
                            _postHosViewModel.search(val.toUpperCase());
                          });
                        },
                      ),
                    ),
                  ),
                ],
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
