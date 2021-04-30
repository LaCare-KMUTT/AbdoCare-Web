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
  final IFirebaseService _firebaseService = locator<IFirebaseService>();
  String _adviceDetail = '-';
  int _severity = 0;
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
                onSelectChanged: (newValue) async {
                  var notiCollection = await this
                      ._firebaseService
                      .searchDocumentByDocId(
                          collection: "Notifications", docId: user.notiId);
                  var serverity = notiCollection.data()['severity'];
                  var advice = notiCollection.data()['advice'];
                  alertSuccessfullyChangeStatusPostHome(
                      context,
                      user.notiId,
                      user.formName,
                      user.hn,
                      user.formTime,
                      user.formDate,
                      user.name,
                      user.imgURL,
                      user.seen,
                      serverity,
                      advice);
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

  Future<void> alertSuccessfullyChangeStatusPostHome(
      BuildContext context,
      notiId,
      formName,
      hn,
      formTime,
      formDate,
      name,
      imgURL,
      seen,
      serverity,
      advice) async {
    final IFirebaseService _firebaseService = locator<IFirebaseService>();
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Builder(
            builder: (context) {
              var height = MediaQuery.of(context).size.height;
              var width = MediaQuery.of(context).size.width;
              return Container(
                height: height,
                width: width / 2,
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    Text('หมายเหตุการแจ้งเตือน',
                        style:
                            TextStyle(fontSize: 24, color: Color(0xFFC37447))),
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Text("ผู้ป่วย$formName",
                          style: Theme.of(context).textTheme.bodyText2,
                          textAlign: TextAlign.center),
                    ),
                    Text("เวลา $formTime  วันที่ $formDate",
                        style: Theme.of(context).textTheme.bodyText2,
                        textAlign: TextAlign.center),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                      child: Row(
                        children: [
                          Flexible(
                            flex: 2,
                            child: Container(
                              child: Text('HN:  ',
                                  textAlign: TextAlign.end,
                                  style: Theme.of(context).textTheme.bodyText2),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Container(
                              child: Text("$hn",
                                  style: Theme.of(context).textTheme.bodyText2),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                      child: Row(
                        children: [
                          Flexible(
                            flex: 2,
                            child: Container(
                              child: Text('ชื่อ-นามสกุล:  ',
                                  textAlign: TextAlign.end,
                                  style: Theme.of(context).textTheme.bodyText2),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Container(
                              child: Text("$name",
                                  style: Theme.of(context).textTheme.bodyText2),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30, 0, 30, 8),
                      child: Container(
                        child: Text('รูปภาพแผล:',
                            style: Theme.of(context).textTheme.bodyText2),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 0, bottom: 8),
                      width: 400,
                      height: 300,
                      child: Image.network(imgURL),
                    ),
                    Container(
                      child: (() {
                        if (seen == "ยังไม่ได้ดำเนินการ") {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(30, 0, 30, 0),
                                child: Container(
                                  child: Text('ระดับความรุนแรง:\t\t',
                                      textAlign: TextAlign.start,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText2),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(30, 0, 30, 10),
                                child: DropdownButtonFormField(
                                  isDense: true,
                                  isExpanded: true,
                                  validator: (value) => value == null
                                      ? 'กรุณาเลือกระดับความรุนแรง'
                                      : null,
                                  decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.black26, width: 1),
                                      ),
                                      labelText: 'ระบุระดับความรุนแรง'),
                                  onSaved: (value) {
                                    _severity = int.parse(value);
                                  },
                                  items: [
                                    '0',
                                    '1',
                                    '2',
                                    '3',
                                    '4',
                                    '5',
                                  ]
                                      .map((label) => DropdownMenuItem(
                                            child: Text(label),
                                            value: label,
                                          ))
                                      .toList(),
                                  onChanged: (value) {
                                    setState(() {
                                      _severity = int.parse(value);
                                    });
                                  },
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(30, 0, 30, 0),
                                child: Container(
                                  child: Text(
                                    'คำแนะนำ:\t\t',
                                    style:
                                        Theme.of(context).textTheme.bodyText2,
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(30, 0, 30, 10),
                                child: TextFormField(
                                  keyboardType: TextInputType.multiline,
                                  maxLines: null,
                                  decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.black26, width: 1),
                                      ),
                                      labelText: 'กรอกคำแนะนำ'),
                                  onChanged: (value) => _adviceDetail = value,
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 20, bottom: 20),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.only(right: 0),
                                      margin: EdgeInsets.only(right: 0),
                                      width: 150,
                                      height: 40,
                                      child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    new BorderRadius.circular(
                                                        7.0),
                                              ),
                                              primary: Color(0xFFEBEBEB),
                                              onPrimary: Colors.black,
                                              padding: EdgeInsets.all(15)),
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text('ยกเลิก',
                                              style: TextStyle(fontSize: 18))),
                                    ),
                                    Container(
                                      width: 150,
                                      height: 40,
                                      margin: EdgeInsets.only(left: 20),
                                      padding: const EdgeInsets.only(left: 0),
                                      child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    new BorderRadius.circular(
                                                        7.0),
                                              ),
                                              primary: Color(0xFF2ED47A),
                                              onPrimary: Colors.white,
                                              padding: EdgeInsets.all(15)),
                                          onPressed: () {
                                            _firebaseService
                                                .updateDataToCollectionField(
                                                    collection: 'Notifications',
                                                    docId: notiId,
                                                    data: {
                                                  'severity': _severity,
                                                  'advice': _adviceDetail,
                                                  'seen': true
                                                });
                                            Navigator.pop(context);
                                          },
                                          child: Text('ดำเนินการ',
                                              style: TextStyle(fontSize: 18))),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          );
                        } else {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(30, 0, 30, 0),
                                child: Row(
                                  children: [
                                    Flexible(
                                      flex: 2,
                                      child: Container(
                                        child: Text('ระดับความรุนแรง:  ',
                                            textAlign: TextAlign.end,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText2),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: Container(
                                        child: Text("$serverity",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText2),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(30, 0, 30, 0),
                                child: Row(
                                  children: [
                                    Flexible(
                                      flex: 2,
                                      child: Container(
                                        child: Text('คำแนะนำ:  ',
                                            textAlign: TextAlign.end,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText2),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: Container(
                                        child: Text("$advice",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText2),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.check_circle_outline_rounded,
                                    size: 40,
                                    color: Colors.greenAccent,
                                  ),
                                  Text(" $seen",
                                      style: TextStyle(
                                          color: Color(0xFF2ED47A),
                                          fontSize: 24),
                                      textAlign: TextAlign.center),
                                ],
                              ),
                            ],
                          );
                        }
                      }()),
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    ).then((value) => widget.callPostHomeData(widget.patientState));
  }
}
