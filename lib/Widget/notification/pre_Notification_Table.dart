import 'package:AbdoCare_Web/models/notification_list/pre_op_notification_model.dart';
import 'package:AbdoCare_Web/services/interfaces/firebase_service_interface.dart';
import 'package:AbdoCare_Web/services/service_locator.dart';
import 'package:flutter/material.dart';
import '../material.dart';

class PreNotificationTable extends StatefulWidget {
  final List<PreOpNotiData> preOpData;
  final Function callPreOpData;
  final String patientState;
  PreNotificationTable(
      {Key key,
      @required this.preOpData,
      this.callPreOpData,
      this.patientState})
      : super(key: key);
  @override
  _PreNotificationTableState createState() => _PreNotificationTableState();
}

class _PreNotificationTableState extends State<PreNotificationTable> {
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
          columnSpacing: screenSize.width / 40,
          headingRowHeight: 50,
          headingTextStyle: TextStyle(
              fontSize: 18,
              fontFamily: 'Prompt',
              color: Colors.black54,
              fontStyle: FontStyle.italic),
          columns: [
            DataColumn(label: Expanded(child: Center(child: Text(' วันที่ ')))),
            DataColumn(label: Expanded(child: Center(child: Text('เวลา')))),
            DataColumn(label: Expanded(child: Center(child: Text('HN')))),
            DataColumn(
                label: Expanded(child: Center(child: Text('ชื่อ-นามสกุล')))),
            DataColumn(label: Expanded(child: Center(child: Text('ห้อง')))),
            DataColumn(label: Expanded(child: Center(child: Text('เตียง')))),
            DataColumn(label: Expanded(child: Center(child: Text('หมายเหตุ')))),
            DataColumn(
                label: Expanded(child: Center(child: Text('สถานะการดูแล'))))
          ],
          rows: widget.preOpData.map((user) {
            return DataRow(
                onSelectChanged: (newValue) {
                  print(user.notiId);
                  alertSuccessfullyChangeStatus(
                      context, user.notiId, user.formName);
                },
                cells: [
                  DataCell(Center(child: Text(user.formDate))),
                  DataCell(Center(child: Text(user.formTime))),
                  DataCell(Center(child: Text(user.hn))),
                  DataCell(Text(user.name)),
                  DataCell(Center(child: Text(user.roomNumber))),
                  DataCell(Center(child: Text(user.bedNumber))),
                  DataCell(Text(user.formName)),
                  DataCell(Center(
                      child: Text(user.seen,
                          style: TextStyle(
                              color: _customMaterial
                                  .getNotiStatusColor(user.seen)))))
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
    ).then((value) => widget.callPreOpData(widget.patientState));
  }
}
