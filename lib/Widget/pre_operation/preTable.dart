import 'dart:ui';
import 'package:flutter/material.dart';

class PreTable extends StatefulWidget {
  PreTable({Key key}) : super(key: key);
  @override
  _PreTableState createState() => _PreTableState();
}

class _PreTableState extends State<PreTable> {
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
            padding: EdgeInsets.fromLTRB(screenSize.height / 10,
                screenSize.height / 70, screenSize.height / 10, 0),
            child: Card(
              child: Container(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Center(
                    child: Scrollbar(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: DataTable(
                          columnSpacing: screenSize.width / 19,
                          headingRowHeight: 50,
                          headingTextStyle: TextStyle(
                              fontSize: 18,
                              fontFamily: 'Prompt',
                              color: Colors.black54,
                              fontStyle: FontStyle.italic),
                          columns: const <DataColumn>[
                            DataColumn(
                              label: Text(
                                'HN',
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                'ชื่อ-นามสกุล',
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                'เพศ',
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                'อายุ',
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                'ห้อง',
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                'เตียง',
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                'ออกซิเจน',
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                'ความดัน',
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                'อุณหภูมิ',
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                'สถานะ',
                              ),
                            ),
                          ],
                          rows: const <DataRow>[
                            DataRow(
                              cells: <DataCell>[
                                DataCell(Text('HN1234')),
                                DataCell(Text('วริศรา จิ๋วประดิษฐ์กุล')),
                                DataCell(Text('หญิง')),
                                DataCell(Text('23')),
                                DataCell(Text('1')),
                                DataCell(Text('1')),
                                DataCell(Text('98')),
                                DataCell(Text('99')),
                                DataCell(Text('43')),
                                DataCell(Text('ปกติ')),
                              ],
                            ),
                          ],
                        ),
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
