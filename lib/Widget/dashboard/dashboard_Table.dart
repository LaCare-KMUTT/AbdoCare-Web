import 'package:AbdoCare_Web/services/service_locator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../material.dart';
//import 'package:horizontal_data_table/horizontal_data_table.dart';

class DashboardTable extends StatefulWidget {
  @override
  _DashboardTableState createState() => _DashboardTableState();
}

class _DashboardTableState extends State<DashboardTable> {
  final CustomMaterial _customMaterial = locator<CustomMaterial>();
  List<Map<String, dynamic>> dashboardtable = [
    {
      "Date": "10/03/64",
      "Time": "02.00 น.",
      "Admission": 1,
      "Operation": "0",
      "RespirationsRate": 14,
      "BloodPressure": "125/80",
      "O2Sat": 100,
      "WtHt": 56,
    },
    {
      "Date": "10/03/64",
      "Time": "06.00 น.",
      "Admission": 2,
      "Operation": 1,
      "RespirationsRate": 18,
      "BloodPressure": "130/80",
      "O2Sat": 98,
      "WtHt": 56,
    },
    {
      "Date": "10/03/64",
      "Time": "10.00 น.",
      "Admission": 3,
      "Operation": 2,
      "RespirationsRate": 20,
      "BloodPressure": "125/85",
      "O2Sat": 90,
      "WtHt": 56,
    },
    {
      "Date": "10/03/64",
      "Time": "14.00 น.",
      "Admission": 4,
      "Operation": 3,
      "RespirationsRate": 21,
      "BloodPressure": "122/90",
      "O2Sat": 100,
      "WtHt": 56,
    },
    {
      "Date": "10/03/64",
      "Time": "18.00 น.",
      "Admission": 5,
      "Operation": 4,
      "RespirationsRate": 13,
      "BloodPressure": "129/78",
      "O2Sat": 94,
      "WtHt": 56,
    },
    {
      "Date": "10/03/64",
      "Time": "22.00 น.",
      "Admission": 6,
      "Operation": 5,
      "RespirationsRate": 18,
      "BloodPressure": "125/82",
      "O2Sat": 100,
      "WtHt": 56,
    },
    {
      "Date": "11/03/64",
      "Time": "02.00 น.",
      "Admission": 7,
      "Operation": 6,
      "RespirationsRate": 14,
      "BloodPressure": "125/80",
      "O2Sat": 100,
      "WtHt": 56,
    },
    {
      "Date": "11/03/64",
      "Time": "06.00 น.",
      "Admission": 8,
      "Operation": 7,
      "RespirationsRate": 18,
      "BloodPressure": "130/80",
      "O2Sat": 98,
      "WtHt": 56,
    },
    {
      "Date": "11/03/64",
      "Time": "10.00 น.",
      "Admission": 9,
      "Operation": 8,
      "RespirationsRate": 20,
      "BloodPressure": "125/85",
      "O2Sat": 90,
      "WtHt": 56,
    },
    {
      "Date": "11/03/64",
      "Time": "14.00 น.",
      "Admission": 10,
      "Operation": 9,
      "RespirationsRate": 21,
      "BloodPressure": "122/90",
      "O2Sat": 100,
      "WtHt": 56,
    },
    {
      "Date": "11/03/64",
      "Time": "18.00 น.",
      "Admission": 11,
      "Operation": 10,
      "RespirationsRate": 13,
      "BloodPressure": "129/78",
      "O2Sat": 94,
      "WtHt": 56,
    },
    {
      "Date": "11/03/64",
      "Time": "22.00 น.",
      "Admission": 12,
      "Operation": 11,
      "RespirationsRate": 18,
      "BloodPressure": "125/82",
      "O2Sat": 100,
      "WtHt": 56,
    },
    {
      "Date": "12/03/64",
      "Time": "02.00 น.",
      "Admission": 13,
      "Operation": 12,
      "RespirationsRate": 14,
      "BloodPressure": "125/80",
      "O2Sat": 100,
      "WtHt": 56,
    },
    {
      "Date": "12/03/64",
      "Time": "06.00 น.",
      "Admission": 14,
      "Operation": 13,
      "RespirationsRate": 18,
      "BloodPressure": "130/80",
      "O2Sat": 98,
      "WtHt": 56,
    },
    {
      "Date": "12/03/64",
      "Time": "10.00 น.",
      "Admission": 15,
      "Operation": 14,
      "RespirationsRate": 20,
      "BloodPressure": "125/85",
      "O2Sat": 90,
      "WtHt": 56,
    },
    {
      "Date": "12/03/64",
      "Time": "14.00 น.",
      "Admission": 16,
      "Operation": 15,
      "RespirationsRate": 21,
      "BloodPressure": "122/90",
      "O2Sat": 100,
      "WtHt": 56,
    },
    {
      "Date": "12/03/64",
      "Time": "18.00 น.",
      "Admission": 17,
      "Operation": 16,
      "RespirationsRate": 13,
      "BloodPressure": "129/78",
      "O2Sat": 94,
      "WtHt": 56,
    },
    {
      "Date": "12/03/64",
      "Time": "22.00 น.",
      "Admission": 18,
      "Operation": 17,
      "RespirationsRate": 18,
      "BloodPressure": "125/82",
      "O2Sat": 100,
      "WtHt": 56,
    },
  ];
  splitdiastolic(String bloodpressure) {
    if (bloodpressure != null) {
      var str = bloodpressure;
      var parts = str.split('/');
      var d = parts[1].trim();
      var diastolic = int.parse(d);
      return diastolic;
    }
  }

  splitsystolic(String bloodpressure) {
    if (bloodpressure != null) {
      var str = bloodpressure;
      var parts = str.split('/');
      var s = parts[0].trim();
      var systolic = int.parse(s);
      return systolic;
    }
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return LayoutBuilder(builder: (context, constraints) {
      return SafeArea(
        child: SingleChildScrollView(
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
                    children: [
                      DataTable(
                        dataRowHeight: 60,
                        columnSpacing: screenSize.width / 50,
                        columns: [
                          DataColumn(
                            label: Text(
                              'Date',
                              style: TextStyle(
                                  fontStyle: FontStyle.italic, fontSize: 16),
                            ),
                          ),
                          for (var item in dashboardtable)
                            DataColumn(
                              label: Column(
                                children: [
                                  Text(
                                    item['Date'],
                                    style: TextStyle(
                                        fontStyle: FontStyle.italic,
                                        fontSize: 16),
                                  ),
                                  Text(
                                    item['Time'],
                                    style: TextStyle(
                                        fontStyle: FontStyle.italic,
                                        fontSize: 16),
                                  )
                                ],
                              ),
                            ),
                        ],
                        rows: [
                          DataRow(
                            cells: <DataCell>[
                              DataCell(Text(
                                'Days after Admission',
                                style: TextStyle(
                                    fontStyle: FontStyle.italic, fontSize: 16),
                              )),
                              for (var item in dashboardtable)
                                DataCell(Text(
                                  item['Admission'].toString(),
                                )),
                            ],
                          ),
                          DataRow(
                            cells: <DataCell>[
                              DataCell(Text(
                                'Days after Operation',
                                style: TextStyle(
                                    fontStyle: FontStyle.italic, fontSize: 16),
                              )),
                              for (var item in dashboardtable)
                                DataCell(Text(
                                  item['Operation'].toString(),
                                )),
                            ],
                          ),
                          DataRow(
                            cells: <DataCell>[
                              DataCell(Text(
                                'Respirations Rate',
                                style: TextStyle(
                                    fontStyle: FontStyle.italic, fontSize: 16),
                              )),
                              for (var item in dashboardtable)
                                DataCell(Text(
                                    item['RespirationsRate'].toString(),
                                    style: TextStyle(
                                        color: _customMaterial
                                            .getRespirationRateColor(
                                                item['RespirationsRate'])))),
                            ],
                          ),
                          DataRow(
                            cells: <DataCell>[
                              DataCell(
                                Column(children: [
                                  Text(
                                    'Blood Pressure :',
                                    style: TextStyle(
                                        fontStyle: FontStyle.italic,
                                        fontSize: 16),
                                  ),
                                  Text(
                                    'Systolic/Diastolic',
                                    style: TextStyle(
                                        fontStyle: FontStyle.italic,
                                        fontSize: 16),
                                  )
                                ]),
                              ),
                              for (var item in dashboardtable)
                                DataCell(Text(item['BloodPressure'].toString(),
                                    style: TextStyle(
                                        color: _customMaterial
                                            .getBloodPressureColor(
                                                splitsystolic(
                                                    item['BloodPressure']),
                                                splitdiastolic(
                                                    item['BloodPressure']),
                                                item['BloodPressure']),
                                        fontSize: 16))),
                            ],
                          ),
                          DataRow(
                            cells: <DataCell>[
                              DataCell(Text(
                                'O2 Sat',
                                style: TextStyle(
                                    fontStyle: FontStyle.italic, fontSize: 16),
                              )),
                              for (var item in dashboardtable)
                                DataCell(Text(item['O2Sat'].toString(),
                                    style: TextStyle(
                                        color: _customMaterial
                                            .getOxygenRateColor(item['O2Sat']),
                                        fontSize: 16))),
                            ],
                          ),
                          DataRow(
                            cells: <DataCell>[
                              DataCell(Text(
                                'Wt and Ht',
                                style: TextStyle(
                                    fontStyle: FontStyle.italic, fontSize: 16),
                              )),
                              for (var item in dashboardtable)
                                DataCell(Text(
                                  item['WtHt'].toString(),
                                )),
                            ],
                          ),
                        ],
                      ),
                      Table(
                        border: TableBorder.all(
                            color: Colors.grey,
                            style: BorderStyle.solid,
                            width: 1),
                        columnWidths: {
                          0: IntrinsicColumnWidth(),
                        },
                        children: [
                          TableRow(children: [
                            TableCell(
                              verticalAlignment:
                                  TableCellVerticalAlignment.fill,
                              child: Container(
                                color: Color(0xFFFCECBC),
                                child: SizedBox(
                                  child: Column(children: [
                                    Text(
                                      'Date',
                                      style: TextStyle(
                                          fontStyle: FontStyle.italic,
                                          fontSize: 16),
                                    ),
                                  ]),
                                ),
                              ),
                            ),
                            for (var item in dashboardtable)
                              Container(
                                color: Color(0xFFFCECBC),
                                child: SizedBox(
                                  child: Column(children: [
                                    Text(
                                      item['Date'],
                                      style: TextStyle(
                                          fontStyle: FontStyle.italic,
                                          fontSize: 16),
                                    ),
                                    Text(
                                      item['Time'],
                                      style: TextStyle(
                                          fontStyle: FontStyle.italic,
                                          fontSize: 16),
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
                                color: Color(0xFFFCECBC),
                                child: Column(children: [
                                  Text('Days after Admission',
                                      style: TextStyle(
                                          fontStyle: FontStyle.italic,
                                          fontSize: 16))
                                ]),
                              ),
                            ),
                            for (var item in dashboardtable)
                              Column(children: [
                                Text(
                                  item['Admission'].toString(),
                                )
                              ]),
                          ]),
                          TableRow(children: [
                            TableCell(
                              verticalAlignment:
                                  TableCellVerticalAlignment.fill,
                              child: Container(
                                color: Color(0xFFFCECBC),
                                child: Column(children: [
                                  Text('Days after Operation',
                                      style: TextStyle(
                                          fontStyle: FontStyle.italic,
                                          fontSize: 16))
                                ]),
                              ),
                            ),
                            for (var item in dashboardtable)
                              Column(children: [
                                Text(
                                  item['Operation'].toString(),
                                )
                              ]),
                          ]),
                          TableRow(children: [
                            TableCell(
                              verticalAlignment:
                                  TableCellVerticalAlignment.fill,
                              child: Container(
                                color: Color(0xFFFCECBC),
                                child: Column(children: [
                                  Text('Respirations Rate',
                                      style: TextStyle(
                                          fontStyle: FontStyle.italic,
                                          fontSize: 16))
                                ]),
                              ),
                            ),
                            for (var item in dashboardtable)
                              Column(children: [
                                Text(item['RespirationsRate'].toString(),
                                    style: TextStyle(
                                        color: _customMaterial
                                            .getRespirationRateColor(
                                                item['RespirationsRate'])))
                              ]),
                          ]),
                          TableRow(children: [
                            TableCell(
                              child: Container(
                                color: Color(0xFFFCECBC),
                                child: Column(children: [
                                  Text('Blood Pressure :',
                                      style: TextStyle(
                                          fontStyle: FontStyle.italic,
                                          fontSize: 16)),
                                  Text('Systolic/Diastolic',
                                      style: TextStyle(
                                          fontStyle: FontStyle.italic,
                                          fontSize: 16))
                                ]),
                              ),
                            ),
                            for (var item in dashboardtable)
                              Column(children: [
                                Text(
                                  item['BloodPressure'],
                                )
                              ]),
                          ]),
                          TableRow(children: [
                            TableCell(
                              verticalAlignment:
                                  TableCellVerticalAlignment.fill,
                              child: Container(
                                color: Color(0xFFFCECBC),
                                child: Column(children: [
                                  Text('O2 Sat',
                                      style: TextStyle(
                                          fontStyle: FontStyle.italic,
                                          fontSize: 16))
                                ]),
                              ),
                            ),
                            for (var item in dashboardtable)
                              Column(children: [
                                Text(item['O2Sat'].toString(),
                                    style: TextStyle(
                                        color: _customMaterial
                                            .getOxygenRateColor(item['O2Sat']),
                                        fontSize: 16))
                              ]),
                          ]),
                          TableRow(children: [
                            TableCell(
                              verticalAlignment:
                                  TableCellVerticalAlignment.fill,
                              child: Container(
                                color: Color(0xFFFCECBC),
                                child: Column(children: [
                                  Text('Wt and Ht',
                                      style: TextStyle(
                                          fontStyle: FontStyle.italic,
                                          fontSize: 16))
                                ]),
                              ),
                            ),
                            for (var item in dashboardtable)
                              Column(children: [
                                Text(
                                  item['WtHt'].toString(),
                                )
                              ]),
                          ]),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
