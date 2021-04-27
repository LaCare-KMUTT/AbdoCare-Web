import 'package:AbdoCare_Web/Widget/material.dart';
import 'package:AbdoCare_Web/Widget/shared/alert_style.dart';
import 'package:AbdoCare_Web/models/notification_list/post_hos_notification_model.dart';
import 'package:AbdoCare_Web/services/service_locator.dart';
import 'package:flutter/material.dart';

class PostHosNotificationTable extends StatefulWidget {
  final List<PostHosNotiData> postHosData;
  PostHosNotificationTable({Key key, @required this.postHosData})
      : super(key: key);
  @override
  _PostHosNotificationTableState createState() =>
      _PostHosNotificationTableState();
}

class _PostHosNotificationTableState extends State<PostHosNotificationTable> {
  final CustomMaterial _customMaterial = locator<CustomMaterial>();
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
          rows: widget.postHosData.map((user) {
            return DataRow(
                onSelectChanged: (newValue) {
                  Dialogs.alertSuccessfullyChangeStatus(context);
                },
                cells: [
                  DataCell(Container(child: Center(child: Text(user.hn)))),
                  DataCell(Container(child: Text(user.name))),
                  DataCell(
                      Container(child: Center(child: Text(user.roomNumber)))),
                  DataCell(
                      Container(child: Center(child: Text(user.bedNumber)))),
                  DataCell(
                      Container(child: Center(child: Text(user.formName)))),
                  DataCell(
                      Container(child: Center(child: Text(user.formTime)))),
                  DataCell(Container(
                      child: Center(
                          child: Text(user.seen,
                              style: TextStyle(
                                  color: _customMaterial
                                      .getNotiStatusColor(user.seen))))))
                ]);
          }).toList(),
        ));
  }
}
