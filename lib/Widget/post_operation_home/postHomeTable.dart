import 'dart:ui';

import 'package:AbdoCare_Web/models/post_home_list_model.dart';
import 'package:AbdoCare_Web/view_models/post_home_list_view_model.dart';
import 'package:flutter/material.dart';

import '../../services/service_locator.dart';
import '../material.dart';

class PostHomeTable extends StatefulWidget {
  PostHomeTable({Key key}) : super(key: key);
  @override
  _PostHomeTableState createState() => _PostHomeTableState();
}

class _PostHomeTableState extends State<PostHomeTable> {
  final PostHomeViewModel _postHomeViewModel = locator<PostHomeViewModel>();
  final CustomMaterial _customMaterial = locator<CustomMaterial>();

  List<PostHomeData> users = [];
  bool _sortAsc = true;
  bool _sortPainScore = true;
  bool _sortWoundImgAsc = true;
  int _sortColumnIndex = 7;

  FutureBuilder dataBody() {
    var screenSize = MediaQuery.of(context).size;
    return FutureBuilder<List<PostHomeData>>(
        future: _postHomeViewModel.getUsers(),
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
              columnSpacing: screenSize.width / 20,
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
                  label:
                      Expanded(child: Center(child: Text('ลักษณะแผลผ่าตัด'))),
                ),
                DataColumn(
                  label: Expanded(child: Center(child: Text('คะแนนความปวด'))),
                  numeric: true,
                  onSort: (columnIndex, sortAscending) {
                    users.forEach((element) {
                      print(
                          'list Before sorted by painScore ==>${element.name} ${element.hn}');
                    });
                    setState(() {
                      if (columnIndex == _sortColumnIndex) {
                        _sortAsc = _sortPainScore = sortAscending;
                      } else {
                        _sortColumnIndex = columnIndex;
                        _sortAsc = _sortPainScore;
                      }
                      _postHomeViewModel.sortBy('painScore', sortAscending);
                    });
                  },
                ),
                DataColumn(
                  label: Expanded(child: Center(child: Text('รูปแผลผ่าตัด'))),
                  numeric: false,
                  onSort: (columnIndex, sortAscending) {
                    setState(() {
                      if (columnIndex == _sortColumnIndex) {
                        _sortAsc = _sortWoundImgAsc = sortAscending;
                      } else {
                        _sortColumnIndex = columnIndex;
                        _sortAsc = _sortWoundImgAsc;
                      }
                      _postHomeViewModel.sortBy('woundImg', sortAscending);
                    });
                  },
                ),
                DataColumn(
                  label:
                      Expanded(child: Center(child: Text('ครั้งที่มารักษา'))),
                  numeric: true,
                ),
              ],
              rows: users.map((user) {
                return DataRow(
                    onSelectChanged: (newValue) {
                      print('Selected ${user.hn} ${user.name}');
                    },
                    cells: [
                      DataCell(Text(user.hn)),
                      DataCell(Text(user.name)),
                      DataCell(Text(user.gender)),
                      DataCell(Center(child: Text(user.age))),
                      DataCell(Text('${user.operationType.toString()}')),
                      DataCell(
                        Text('${user.painScore.toString()}',
                            style: TextStyle(
                                color: _customMaterial
                                    .getPainScoreColor(user.painScore))),
                      ),
                      DataCell(
                        Text('${user.woundImg.toString()}',
                            style: TextStyle(
                                color: _customMaterial
                                    .getWoundImgColor(user.woundImg))),
                      ),
                      DataCell(
                        Text('${user.admissionCount.toString()}'),
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
