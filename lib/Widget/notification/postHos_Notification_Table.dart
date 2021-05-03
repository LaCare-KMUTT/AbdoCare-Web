import 'package:AbdoCare_Web/Widget/material.dart';
import 'package:AbdoCare_Web/models/notification_list/notification_model.dart';
import 'package:AbdoCare_Web/services/interfaces/firebase_service_interface.dart';
import 'package:AbdoCare_Web/services/service_locator.dart';
import 'package:flutter/material.dart';

class PostHosNotificationTable extends StatefulWidget {
  final List<NotiData> postHosData;
  final Function callPostHosData;
  final String patientState;
  PostHosNotificationTable(
      {Key key,
      @required this.postHosData,
      this.callPostHosData,
      this.patientState})
      : super(key: key);
  @override
  _PostHosNotificationTableState createState() =>
      _PostHosNotificationTableState();
}

class _PostHosNotificationTableState extends State<PostHosNotificationTable> {
  final CustomMaterial _customMaterial = locator<CustomMaterial>();
  final IFirebaseService _firebaseService = locator<IFirebaseService>();
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
              fontSize: 16,
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
            DataColumn(label: Expanded(child: Center(child: Text('วันที่'))))
          ],
          rows: widget.postHosData.map((user) {
            return DataRow(
                onSelectChanged: (newValue) {
                  alertSuccessfullyChangeStatus(
                      context,
                      user.notiId,
                      user.formName,
                      user.hn,
                      user.formTime,
                      user.formDate,
                      user.name,
                      user.seen);
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
                      child:
                          Text(user.formDate, style: TextStyle(fontSize: 16))))
                ]);
          }).toList(),
        ));
  }

  Future<void> alertSuccessfullyChangeStatus(BuildContext context, notiId,
      formName, hn, formTime, formDate, name, seen) async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          content: Builder(
            builder: (context) {
              var height = MediaQuery.of(context).size.height;
              var width = MediaQuery.of(context).size.width;
              return Container(
                height: height / 4,
                width: width / 2,
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Text('หมายเหตุการแจ้งเตือน',
                          style: TextStyle(
                              fontSize: 22, color: Color(0xFFC37447))),
                    ),
                    Text("$hn  ชื่อ $name",
                        style: Theme.of(context).textTheme.bodyText2,
                        textAlign: TextAlign.center),
                    Text("ผู้ป่วย$formName",
                        style: Theme.of(context).textTheme.bodyText2,
                        textAlign: TextAlign.center),
                    Text("เวลา $formTime  วันที่ $formDate",
                        style: Theme.of(context).textTheme.bodyText2,
                        textAlign: TextAlign.center),
                    Padding(
                      padding: const EdgeInsets.only(top: 15, bottom: 5),
                      child: (() {
                        if (seen == "ยังไม่ได้ดำเนินการ") {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                padding: const EdgeInsets.only(right: 0),
                                margin: EdgeInsets.only(right: 0),
                                width: 150,
                                height: 40,
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        primary: Color(0xFFEBEBEB),
                                        onPrimary: Colors.black,
                                        padding: EdgeInsets.all(15)),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text('ยกเลิก',
                                        style: TextStyle(fontSize: 16))),
                              ),
                              Container(
                                width: 150,
                                height: 40,
                                margin: EdgeInsets.only(left: 20),
                                padding: const EdgeInsets.only(left: 0),
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        primary: Color(0xFF2ED47A),
                                        onPrimary: Colors.white,
                                        padding: EdgeInsets.all(15)),
                                    onPressed: () {
                                      _firebaseService
                                          .updateDataToCollectionField(
                                              collection: 'Notifications',
                                              docId: notiId,
                                              data: {'seen': true});
                                      Navigator.pop(context);
                                    },
                                    child: Text('ดำเนินการแล้ว',
                                        style: TextStyle(fontSize: 16))),
                              ),
                            ],
                          );
                        } else {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.check_circle_outline_rounded,
                                size: 40,
                                color: Colors.greenAccent,
                              ),
                              Text(" $seen",
                                  style: TextStyle(
                                      color: Color(0xFF2ED47A), fontSize: 24),
                                  textAlign: TextAlign.center),
                            ],
                          );
                        }
                      }()),
                    )
                  ],
                ),
              );
            },
          ),
        );
      },
    ).then((value) => widget.callPostHosData(widget.patientState));
  }
}
