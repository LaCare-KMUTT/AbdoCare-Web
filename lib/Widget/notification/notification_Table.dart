import 'package:flutter/material.dart';

class NotificationTable extends StatefulWidget {
  NotificationTable({Key key}) : super(key: key);
  @override
  _NotificationTableState createState() => _NotificationTableState();
}

class _NotificationTableState extends State<NotificationTable> {
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
      child: Column(
        children: [
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
                        child: FittedBox(child: notificationData()),
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

  Widget notificationData() {
    var screenSize = MediaQuery.of(context).size;
    return DataTable(
      showCheckboxColumn: false,
      columnSpacing: screenSize.width / 15,
      //columnSpacing: 100,
      headingRowHeight: 50,
      headingTextStyle: TextStyle(
          fontSize: 18,
          fontFamily: 'Prompt',
          color: Colors.black54,
          fontStyle: FontStyle.italic),
      columns: [
        DataColumn(
            label: Container(width: 100, child: Center(child: Text('HN')))),
        DataColumn(
            label: Container(
                width: 200, child: Center(child: Text('ชื่อ-นามสกุล')))),
        DataColumn(
            label: Container(
                width: 300, child: Center(child: Text('การแจ้งเตือน')))),
        DataColumn(
            label: Container(width: 50, child: Center(child: Text(' เวลา ')))),
        DataColumn(
            label: Container(width: 150, child: Center(child: Text('สถานะ'))))
      ],
      rows: [
        DataRow(cells: [
          DataCell(
              Container(width: 100, child: Center(child: Text("HN20001")))),
          DataCell(Container(width: 200, child: Text("นายสมชาย นามสกุล"))),
          DataCell(Container(
              width: 300,
              child: Center(child: Text("ไม่ผ่านแบบประเมินอาการที่ผิดปกติ")))),
          DataCell(Container(width: 50, child: Center(child: Text("16.30")))),
          DataCell(Container(
              width: 150,
              child: Center(
                  child: Text("ยังไม่ได้ดำเนินการ",
                      style: TextStyle(color: Colors.red)))))
        ]),
        DataRow(cells: [
          DataCell(
              Container(width: 100, child: Center(child: Text("HN20001")))),
          DataCell(Container(width: 200, child: Text("นางสาวสมหญิง นามสกุล "))),
          DataCell(Container(
              width: 300, child: Center(child: Text("ไม่ผ่านแบบประเมินแผล")))),
          DataCell(Container(width: 50, child: Center(child: Text("12.30")))),
          DataCell(Container(
              width: 150,
              child: Center(
                  child: Text("ดำเนินการแล้ว",
                      style: TextStyle(color: Colors.green)))))
        ])
      ],
    );
  }
}
