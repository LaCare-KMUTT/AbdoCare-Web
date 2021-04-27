import 'package:AbdoCare_Web/Widget/material.dart';
import 'package:AbdoCare_Web/Widget/shared/alert_style.dart';
import 'package:AbdoCare_Web/models/notification_list/post_hos_notification_model.dart';
import 'package:AbdoCare_Web/page/notification.dart';
import 'package:AbdoCare_Web/services/interfaces/firebase_service_interface.dart';
import 'package:AbdoCare_Web/services/service_locator.dart';
import 'package:flutter/material.dart';

import 'notificationDetail.dart';

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
          rows: widget.postHosData.map((user) {
            return DataRow(
                onSelectChanged: (newValue) {
                  print(user.notiId);
                  alertSuccessfullyChangeStatus(context, user.notiId);
                  setState(() {});
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
      BuildContext context, notiId) async {
    final IFirebaseService _firebaseService = locator<IFirebaseService>();
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            content: Text("บุคลากรทางการแพทย์ได้ดำเนินการแล้ว",
                style: Theme.of(context).textTheme.bodyText2,
                textAlign: TextAlign.center),
            actions: [
              FlatButton(
                  child: Text('ดำเนินการแล้ว'),
                  onPressed: () async {
                    // _firebaseService.updateDataToCollectionField(
                    //     collection: 'Notifications',
                    //     docId: notiId,
                    //     data: {'seen': true});

                    //Navigator.pushNamed(context, '/notification_page');
                    //     .then((value) => _stateUpdate());
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => NotificationPage()));
                    //Navigator.popAndPushNamed(context, '/notification_page');
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => NotificationPage()));
                  }),
              FlatButton(
                  child: Text('ยกเลิก'),
                  onPressed: () {
                    Navigator.pop(context);
                  })
            ]);
      },
    );
  }
}
