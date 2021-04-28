import 'package:AbdoCare_Web/models/notification_list/post_home_notification_model.dart';
import 'package:AbdoCare_Web/services/interfaces/firebase_service_interface.dart';
import 'package:AbdoCare_Web/services/service_locator.dart';
import 'package:flutter/material.dart';
import '../material.dart';

class PostHomeNotificationTable extends StatefulWidget {
  final List<PostHomeNotiData> postHomeData;
  final Function callPostHomeData;
  final String patientState;
  PostHomeNotificationTable(
      {Key key,
      @required this.postHomeData,
      this.callPostHomeData,
      this.patientState})
      : super(key: key);
  @override
  _PostHomeNotificationTableState createState() =>
      _PostHomeNotificationTableState();
}

class _PostHomeNotificationTableState extends State<PostHomeNotificationTable> {
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
          columnSpacing: screenSize.width / 16,
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
            DataColumn(label: Expanded(child: Center(child: Text('หมายเหตุ')))),
            DataColumn(label: Expanded(child: Center(child: Text('เวลา')))),
            DataColumn(label: Expanded(child: Center(child: Text('วันที่'))))
          ],
          rows: widget.postHomeData.map((user) {
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
                  DataCell(Text(user.formName, style: TextStyle(fontSize: 16))),
                  DataCell(Center(
                      child:
                          Text(user.formTime, style: TextStyle(fontSize: 16)))),
                  DataCell(Center(
                      child:
                          Text(user.formDate, style: TextStyle(fontSize: 16))))
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
    ).then((value) => widget.callPostHomeData(widget.patientState));
  }
}
