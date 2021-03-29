import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DashboardTable extends StatefulWidget {
  @override
  _DashboardTableState createState() => _DashboardTableState();
}

class _DashboardTableState extends State<DashboardTable> {
  List<Map<String, dynamic>> test = [
    {
      "Date": "10/03/64",
      "Time": "02.00 น.",
      "Admission": "-",
      "Operation": "-",
      "RespirationsRate": "-",
      "Systolic": "-",
      "Diastolic": "-",
      "O2Sat": "100",
    },
    {
      "Date": "10/03/64",
      "Time": "06.00 น.",
      "Admission": "-",
      "Operation": "-",
      "RespirationsRate": "-",
      "Systolic": "-",
      "Diastolic": "-",
      "O2Sat": "100",
    },
    {
      "Date": "10/03/64",
      "Time": "10.00 น.",
      "Admission": "-",
      "Operation": "-",
      "RespirationsRate": "-",
      "Systolic": "-",
      "Diastolic": "-",
      "O2Sat": "100",
    },
    {
      "Date": "10/03/64",
      "Time": "14.00 น.",
      "Admission": "-",
      "Operation": "-",
      "RespirationsRate": "-",
      "Systolic": "-",
      "Diastolic": "-",
      "O2Sat": "100",
    },
    {
      "Date": "10/03/64",
      "Time": "18.00 น.",
      "Admission": "-",
      "Operation": "-",
      "RespirationsRate": "-",
      "Systolic": "-",
      "Diastolic": "-",
      "O2Sat": "100",
    },
    {
      "Date": "10/03/64",
      "Time": "22.00 น.",
      "Admission": "-",
      "Operation": "-",
      "RespirationsRate": "-",
      "Systolic": "-",
      "Diastolic": "-",
      "O2Sat": "100",
    },
  ];

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    List<Map<String, Object>> itemlist = [];
    var item;
    return LayoutBuilder(builder: (context, constraints) {
      return SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Container(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                  minWidth: constraints.minWidth,
                  minHeight: constraints.minHeight),
              child: IntrinsicWidth(
                child: Container(
                  width: screenSize.width,
                  child: Table(
                    border: TableBorder.all(
                        color: Colors.grey, style: BorderStyle.solid, width: 1),
                    columnWidths: {
                      0: IntrinsicColumnWidth(),
                    },
                    children: [
                      //for (var item in test)
                      TableRow(children: [
                        Column(children: [Text('Date')]),
                        for (var item in test)
                          Column(children: [
                            Text(item['Date']),
                            Text(item['Time'])
                          ]),
                      ]),
                      TableRow(children: [
                        Column(children: [Text('Days after Admission')]),
                        for (var item in test)
                          Column(children: [Text(item['Admission'])]),
                      ]),
                      TableRow(children: [
                        Column(children: [Text('Days after Operation')]),
                        for (var item in test)
                          Column(children: [Text(item['Operation'])]),
                      ]),
                      TableRow(children: [
                        Column(children: [Text('Respirations Rate')]),
                        for (var item in test)
                          Column(children: [Text(item['RespirationsRate'])]),
                      ]),
                      TableRow(children: [
                        Column(children: [Text('Blood Pressure : Systolic')]),
                        for (var item in test)
                          Column(children: [Text(item['Systolic'])]),
                      ]),
                      TableRow(children: [
                        Column(children: [Text('Blood Pressure : Diastolic')]),
                        for (var item in test)
                          Column(children: [Text(item['Diastolic'])]),
                      ]),
                      TableRow(children: [
                        Column(children: [Text('O2 Sat')]),
                        for (var item in test)
                          Column(children: [Text(item['O2Sat'])]),
                      ]),
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
