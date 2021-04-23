import 'package:AbdoCare_Web/Widget/shared/alert_style.dart';
import 'package:flutter/material.dart';

class PostHosNotificationTable extends StatefulWidget {
  PostHosNotificationTable({Key key}) : super(key: key);
  @override
  _PostHosNotificationTableState createState() =>
      _PostHosNotificationTableState();
}

class _PostHosNotificationTableState extends State<PostHosNotificationTable> {
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
        child: DataTable(
          showCheckboxColumn: false,
          columnSpacing: screenSize.width / 20,
          headingRowHeight: 50,
          headingTextStyle: TextStyle(
              fontSize: 18,
              fontFamily: 'Prompt',
              color: Colors.black54,
              fontStyle: FontStyle.italic),
          columns: [
            DataColumn(label: Expanded(child: Center(child: Text('HN')))),
            DataColumn(
                label: Expanded(child: Center(child: Text('ชื่อ-นามสกุล')))),
            DataColumn(label: Expanded(child: Center(child: Text('ห้อง')))),
            DataColumn(label: Expanded(child: Center(child: Text('เตียง')))),
            DataColumn(label: Expanded(child: Center(child: Text('หมายเหตุ')))),
            DataColumn(label: Expanded(child: Center(child: Text(' เวลา ')))),
            DataColumn(
                label: Expanded(child: Center(child: Text('สถานะการดูแล'))))
          ],
          rows: [
            DataRow(
                onSelectChanged: (newValue) {
                  Dialogs.alertSuccessfullyChangeStatus(context);
                },
                cells: [
                  DataCell(Container(child: Center(child: Text("HN20001")))),
                  DataCell(Container(child: Text("นายสมชาย นามสกุล"))),
                  DataCell(Container(child: Center(child: Text("1")))),
                  DataCell(Container(child: Center(child: Text("1")))),
                  DataCell(Container(
                      child: Center(
                          child: Text("ไม่ผ่านแบบประเมินอาการที่ผิดปกติ")))),
                  DataCell(Container(child: Center(child: Text("16.30")))),
                  DataCell(Container(
                      child: Center(
                          child: Text("ยังไม่ได้ดำเนินการ",
                              style: TextStyle(color: Colors.red)))))
                ]),
          ],
        ));
  }
}
