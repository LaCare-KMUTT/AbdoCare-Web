import 'package:AbdoCare_Web/Widget/material.dart';
import 'package:AbdoCare_Web/models/notification_list/all_notification_model.dart';
import 'package:AbdoCare_Web/services/interfaces/firebase_service_interface.dart';
import 'package:AbdoCare_Web/services/service_locator.dart';
import 'package:flutter/material.dart';

class AllNotificationTable extends StatefulWidget {
  final List<AllNotiData> allData;
  final Function callAllData;
  final String patientState;
  AllNotificationTable(
      {Key key, @required this.allData, this.callAllData, this.patientState})
      : super(key: key);
  @override
  _AllNotificationTableState createState() => _AllNotificationTableState();
}

class _AllNotificationTableState extends State<AllNotificationTable> {
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
          columnSpacing: screenSize.width / 25,
          headingRowHeight: 50,
          headingTextStyle: TextStyle(
              fontSize: 18,
              fontFamily: 'Prompt',
              color: Colors.black54,
              fontStyle: FontStyle.italic),
          columns: [
            DataColumn(
                label: Expanded(child: Center(child: Text('สถานะการดูแล')))),
            DataColumn(label: Expanded(child: Center(child: Text('HN')))),
            DataColumn(
                label: Expanded(child: Center(child: Text('ชื่อ-นามสกุล')))),
            DataColumn(label: Expanded(child: Center(child: Text('ห้อง')))),
            DataColumn(label: Expanded(child: Center(child: Text('เตียง')))),
            DataColumn(label: Expanded(child: Center(child: Text('หมายเหตุ')))),
            DataColumn(label: Expanded(child: Center(child: Text('เวลา')))),
            DataColumn(label: Expanded(child: Center(child: Text('วันที่')))),
            DataColumn(
                label: Expanded(child: Center(child: Text('ขั้นตอนการรักษา')))),
          ],
          rows: widget.allData.map((user) {
            return DataRow(
                onSelectChanged: (newValue) {
                  print(user.notiId);
                  alertSuccessfullyChangeStatus(
                      context, user.notiId, user.formName);
                },
                cells: [
                  DataCell(Center(
                      child: Text(user.seen,
                          style: TextStyle(
                              fontSize: 16,
                              color: _customMaterial
                                  .getNotiStatusColor(user.seen))))),
                  DataCell(Center(
                      child: Text(user.hn, style: TextStyle(fontSize: 16)))),
                  DataCell(Text(user.name, style: TextStyle(fontSize: 16))),
                  DataCell(Center(
                      child: Text(user.roomNumber,
                          style: TextStyle(fontSize: 16)))),
                  DataCell(Center(
                      child: Text(user.bedNumber,
                          style: TextStyle(fontSize: 16)))),
                  DataCell(Text(user.formName, style: TextStyle(fontSize: 16))),
                  DataCell(Center(
                      child:
                          Text(user.formTime, style: TextStyle(fontSize: 16)))),
                  DataCell(Center(
                      child: Text(user.formDate.toString(),
                          style: TextStyle(fontSize: 16)))),
                  DataCell(Center(
                      child: Text(user.patientState,
                          style: TextStyle(fontSize: 16)))),
                ]);
          }).toList(),
        ));
  }

  Future<void> alertSuccessfullyChangeStatus(
      BuildContext context, notiId, formName) async {
    final IFirebaseService _firebaseService = locator<IFirebaseService>();
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            content: Text("ผู้ป่วย$formName",
                style: Theme.of(context).textTheme.bodyText2,
                textAlign: TextAlign.center),
            actions: [
              FlatButton(
                  child: Text('ดำเนินการแล้ว'),
                  onPressed: () async {
                    _firebaseService.updateDataToCollectionField(
                        collection: 'Notifications',
                        docId: notiId,
                        data: {'seen': true});
                    Navigator.pop(context);
                  }),
              FlatButton(
                  child: Text('ยกเลิก'),
                  onPressed: () {
                    Navigator.pop(context);
                  })
            ]);
      },
    ).then((value) => widget.callAllData(widget.patientState));
  }
}
