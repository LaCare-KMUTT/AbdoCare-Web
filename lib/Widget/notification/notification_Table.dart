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
      // columnSpacing: screenSize.width / 35,
      headingRowHeight: 50,
      headingTextStyle: TextStyle(
          fontSize: 18,
          fontFamily: 'Prompt',
          color: Colors.black54,
          fontStyle: FontStyle.italic),
      // sortAscending: _sortAsc,
      // sortColumnIndex: _sortColumnIndex,
      columns: [
        DataColumn(label: Expanded(child: Center(child: Text('HN')))),
        DataColumn(label: Expanded(child: Center(child: Text('ชื่อ-นามสกุล')))),
        DataColumn(
            label: Expanded(child: Center(child: Text('ขั้นตอนการรักษา')))),
        DataColumn(label: Expanded(child: Center(child: Text('การแจ้งเตือน')))),
        DataColumn(label: Expanded(child: Center(child: Text('เวลา')))),
        DataColumn(label: Expanded(child: Center(child: Text('สถานะ'))))
      ],
      rows: [
        DataRow(cells: [
          DataCell(Text("HN20001")),
          DataCell(Text("นางสาวพรพิมล แก้วใส")),
          DataCell(Text("Post-Operation@Home")),
          DataCell(Text("ไม่ผ่านแบบประเมินอาการที่ผิดปกติ")),
          DataCell(Text("16.30")),
          DataCell(Text("ดำเนินการแล้ว")),
        ])
      ],
    );
  }
}
