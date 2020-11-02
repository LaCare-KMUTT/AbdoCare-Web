import 'package:flutter/material.dart';

class PostHosTable extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _PostHosTableState();
  }
}

class _PostHosTableState extends State<PostHosTable> {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        heightFactor: 2,
        child: Card(
          //margin: EdgeInsets.all(100),
          child: Padding(
            padding: EdgeInsets.all(30),
            child: Container(
              color: Colors.white,
              //height: MediaQuery.of(context).size.height,
              // width: MediaQuery.of(context).size.width,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: DataTable(
                    columns: const <DataColumn>[
                      DataColumn(
                        label: Text(
                          'ชื่อ',
                          style: TextStyle(
                              fontSize: 18.0, fontStyle: FontStyle.italic),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'เพศ',
                          style: TextStyle(
                              fontSize: 18.0, fontStyle: FontStyle.italic),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'อายุ',
                          style: TextStyle(
                              fontSize: 18.0, fontStyle: FontStyle.italic),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'ห้อง',
                          style: TextStyle(
                              fontSize: 18.0, fontStyle: FontStyle.italic),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'หมายเลขเตียง',
                          style: TextStyle(
                              fontSize: 18.0, fontStyle: FontStyle.italic),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'ออกซิเจน',
                          style: TextStyle(
                              fontSize: 18.0, fontStyle: FontStyle.italic),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'ความดัน',
                          style: TextStyle(
                              fontSize: 18.0, fontStyle: FontStyle.italic),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'อุณหภูมิ',
                          style: TextStyle(
                              fontSize: 18.0, fontStyle: FontStyle.italic),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'สถานะ',
                          style: TextStyle(
                              fontSize: 18.0, fontStyle: FontStyle.italic),
                        ),
                      ),
                    ],
                    rows: <DataRow>[
                      DataRow(
                        cells: <DataCell>[
                          DataCell(Text('นางสาวพรพิมล แก้วใส',
                              style: Theme.of(context).textTheme.bodyText1)),
                          DataCell(Text('หญิง',
                              style: Theme.of(context).textTheme.bodyText1)),
                          DataCell(Text('22',
                              style: Theme.of(context).textTheme.bodyText1)),
                          DataCell(Text('3',
                              style: Theme.of(context).textTheme.bodyText1)),
                          DataCell(Text('2',
                              style: Theme.of(context).textTheme.bodyText1)),
                          DataCell(Text('99%',
                              style: Theme.of(context).textTheme.bodyText1)),
                          DataCell(Text('129',
                              style: Theme.of(context).textTheme.bodyText1)),
                          DataCell(Text('37.8',
                              style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.red))),
                          DataCell(Text('ปกติ',
                              style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.green))),
                        ],
                      ),
                      // DataRow(
                      //   cells: <DataCell>[
                      //     DataCell(Text('Data')),
                      //     DataCell(Text('Data')),
                      //     DataCell(Text('Data')),
                      //     DataCell(Text('Data')),
                      //     DataCell(Text('Data')),
                      //     DataCell(Text('Data')),
                      //     DataCell(Text('Data')),
                      //     DataCell(Text('Data')),
                      //     DataCell(Text('Data')),
                      //   ],
                      // ),
                      // DataRow(
                      //   cells: <DataCell>[
                      //     DataCell(Text('Data')),
                      //     DataCell(Text('Data')),
                      //     DataCell(Text('Data')),
                      //     DataCell(Text('Data')),
                      //     DataCell(Text('Data')),
                      //     DataCell(Text('Data')),
                      //     DataCell(Text('Data')),
                      //     DataCell(Text('Data')),
                      //     DataCell(Text('Data')),
                      //   ],
                      //),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
