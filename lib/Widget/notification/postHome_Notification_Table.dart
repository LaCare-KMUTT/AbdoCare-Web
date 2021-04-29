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
  final IFirebaseService _firebaseService = locator<IFirebaseService>();
  final CustomMaterial _customMaterial = locator<CustomMaterial>();
  //final _detailController = TextEditingController();
  // bool _validateDetail = false;
  String _adviceDetail = '';
  int _severity;
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
                  alertSuccessfullyChangeStatus(
                      context, user.notiId, user.formName, user.imgURL);
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
      BuildContext context, notiId, formName, imgURl) async {
    final IFirebaseService _firebaseService = locator<IFirebaseService>();
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
                height: height,
                width: width / 2,
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    Text('หมายเหตุการแจ้งเตือน',
                        style:
                            TextStyle(fontSize: 22, color: Color(0xFFC37447))),
                    Text("ผู้ป่วย$formName",
                        style: Theme.of(context).textTheme.bodyText2,
                        textAlign: TextAlign.center),
                    Container(
                      padding: EdgeInsets.only(top: 10),
                      width: width / 2,
                      height: height / 2,
                      child: Image.network(imgURl),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Text('ระดับความรุนแรง:\t\t',
                                textAlign: TextAlign.end),
                          ),
                          Expanded(
                            flex: 4,
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
                                  labelText: 'ระดับความรุนแรง'),
                              onSaved: (value) {
                                _severity = int.parse(value);
                              },
                              items: [
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
                          Expanded(
                            flex: 1,
                            child: SizedBox(width: 0),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child:
                                Text('คำแนะนำ:\t\t', textAlign: TextAlign.end),
                          ),
                          Expanded(
                              flex: 4,
                              child: TextFormField(
                                keyboardType: TextInputType.multiline,
                                maxLines: null,
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.black26, width: 1),
                                  ),
                                ),
                                onChanged: (value) => _adviceDetail = value,
                              )),
                          Expanded(
                            flex: 1,
                            child: SizedBox(width: 0),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15, bottom: 5),
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
                                  // _firebaseService.updateDataToCollectionField(
                                  //     collection: 'Notifications',
                                  //     docId: notiId,
                                  //     data: {
                                  //       'severity': _severity,
                                  //       'advice': _adviceDetail,
                                  //       'seen': true
                                  //     });
                                  Navigator.pop(context);
                                },
                                child: Text('ดำเนินการแล้ว',
                                    style: TextStyle(fontSize: 16))),
                          ),
                        ],
                      ),
                    )
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
