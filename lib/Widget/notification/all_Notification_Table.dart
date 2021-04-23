import 'package:AbdoCare_Web/Widget/shared/alert_style.dart';
import 'package:flutter/material.dart';

class AllNotificationTable extends StatefulWidget {
  AllNotificationTable({Key key}) : super(key: key);
  @override
  _AllNotificationTableState createState() => _AllNotificationTableState();
}

class _AllNotificationTableState extends State<AllNotificationTable> {
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
          columnSpacing: screenSize.width / 40,
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
            DataColumn(
                label: Expanded(child: Center(child: Text('ขั้นตอนการรักษา')))),
            DataColumn(label: Expanded(child: Center(child: Text('หมายเหตุ')))),
            DataColumn(label: Expanded(child: Center(child: Text(' เวลา ')))),
            DataColumn(
                label: Expanded(child: Center(child: Text('สถานะการดูแล'))))
          ],
          rows: [
            DataRow(
                onSelectChanged: (newValue) {
                  Dialogs.alertToCompleteEvalutation(context);
                },
                cells: [
                  DataCell(Container(child: Center(child: Text("HN20001")))),
                  DataCell(Container(child: Text("นายสมชาย นามสกุล"))),
                  DataCell(Container(child: Center(child: Text("9")))),
                  DataCell(Container(child: Center(child: Text("9")))),
                  DataCell(Container(
                      child: Center(child: Text("Post-Operation@Hospital")))),
                  DataCell(Container(
                      child: Center(
                          child:
                              Text("ไม่ผ่านแบบประเมินการฟื้นฟูสมรรถภาพปอด")))),
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
