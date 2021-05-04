import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../services/interfaces/firebase_service_interface.dart';
import '../../../services/service_locator.dart';
import '../../shared/progress_bar.dart';

class PrePatientDetail extends StatelessWidget {
  final hn;
  PrePatientDetail({@required this.hn});
  final IFirebaseService _firebaseService = locator<IFirebaseService>();
  final _scrollController1 = ScrollController();
  final _scrollController2 = ScrollController();
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: FutureBuilder<Map<String, dynamic>>(
                  future: _firebaseService.getPatientDetail(hn: hn),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return ProgressBar.circularProgressIndicator(context);
                    }
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
                          child: Text(
                            'ข้อมูลผู้ป่วย',
                            style: TextStyle(
                                fontSize: 18, color: Color(0xFFC37447)),
                          ),
                        ),
                        Scrollbar(
                          isAlwaysShown: true,
                          thickness: 5,
                          //showTrackOnHover: true,
                          controller: _scrollController1,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SingleChildScrollView(
                              controller: _scrollController1,
                              scrollDirection: Axis.horizontal,
                              child: ConstrainedBox(
                                constraints: BoxConstraints(
                                    minWidth: constraints.maxWidth,
                                    minHeight: constraints.minHeight),
                                child: IntrinsicWidth(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Container(
                                        child: Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              20, 0, 0, 0),
                                          child: Text('ผู้ป่วย:',
                                              textAlign: TextAlign.start),
                                        ),
                                      ),
                                      Container(
                                        child: Row(
                                          children: <Widget>[
                                            Expanded(
                                              child: Container(
                                                margin: EdgeInsets.fromLTRB(
                                                    10, 0, 0, 0),
                                                child: Text(
                                                  'ชื่อ-นามสกุล:',
                                                  textAlign: TextAlign.end,
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Container(
                                                margin: EdgeInsets.fromLTRB(
                                                    20, 0, 0, 0),
                                                child: Text(
                                                    snapshot.data['fullName']),
                                              ),
                                            ),
                                            Expanded(
                                              child: Container(
                                                margin: EdgeInsets.fromLTRB(
                                                    20, 0, 0, 0),
                                                child: Text('เพศ:',
                                                    textAlign: TextAlign.end),
                                              ),
                                            ),
                                            Expanded(
                                              child: Container(
                                                margin: EdgeInsets.fromLTRB(
                                                    20, 0, 0, 0),
                                                child: Text(
                                                    snapshot.data['gender']),
                                              ),
                                            ),
                                            Expanded(
                                              child: Container(
                                                margin: EdgeInsets.fromLTRB(
                                                    20, 0, 0, 0),
                                                child: Text('อายุ:',
                                                    textAlign: TextAlign.end),
                                              ),
                                            ),
                                            Expanded(
                                              child: Container(
                                                margin: EdgeInsets.fromLTRB(
                                                    20, 0, 0, 0),
                                                child:
                                                    Text(snapshot.data['age']),
                                              ),
                                            ),
                                            Expanded(
                                              child: Container(
                                                margin: EdgeInsets.fromLTRB(
                                                    20, 0, 0, 0),
                                                child: Text('วัน/เดือน/ปีเกิด:',
                                                    textAlign: TextAlign.end),
                                              ),
                                            ),
                                            Expanded(
                                              child: Container(
                                                margin: EdgeInsets.fromLTRB(
                                                    20, 0, 0, 0),
                                                child:
                                                    Text(snapshot.data['dob']),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        child: Row(
                                          children: <Widget>[
                                            Expanded(
                                              child: Container(
                                                margin: EdgeInsets.fromLTRB(
                                                    100, 10, 0, 0),
                                                child: Text('เบอร์โทร:',
                                                    textAlign: TextAlign.end),
                                              ),
                                            ),
                                            Expanded(
                                              child: Container(
                                                margin: EdgeInsets.fromLTRB(
                                                    20, 10, 0, 0),
                                                child: Text(snapshot
                                                    .data['patientTel']),
                                              ),
                                            ),
                                            Expanded(
                                              child: Container(
                                                margin: EdgeInsets.fromLTRB(
                                                    20, 10, 0, 0),
                                                child: Text('น้ำหนัก:',
                                                    textAlign: TextAlign.end),
                                              ),
                                            ),
                                            Expanded(
                                              child: Container(
                                                margin: EdgeInsets.fromLTRB(
                                                    20, 10, 0, 0),
                                                child: Text(
                                                    snapshot.data['weight']),
                                              ),
                                            ),
                                            Expanded(
                                              child: Container(
                                                margin: EdgeInsets.fromLTRB(
                                                    20, 10, 0, 0),
                                                child: Text('ส่วนสูง:',
                                                    textAlign: TextAlign.end),
                                              ),
                                            ),
                                            Expanded(
                                              child: Container(
                                                margin: EdgeInsets.fromLTRB(
                                                    20, 10, 0, 0),
                                                child: Text(
                                                    snapshot.data['height']),
                                              ),
                                            ),
                                            Expanded(
                                              child: Container(
                                                margin: EdgeInsets.fromLTRB(
                                                    20, 10, 0, 0),
                                                child: Text('%BWL:',
                                                    textAlign: TextAlign.end),
                                              ),
                                            ),
                                            Expanded(
                                              child: Container(
                                                margin: EdgeInsets.fromLTRB(
                                                    20, 10, 0, 0),
                                                child:
                                                    Text(snapshot.data['bwl']),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        child: Row(
                                          children: <Widget>[
                                            Expanded(
                                              flex: 1,
                                              child: Container(
                                                margin: EdgeInsets.fromLTRB(
                                                    50, 10, 0, 0),
                                                child: Text('ที่อยู่:',
                                                    textAlign: TextAlign.end),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 7,
                                              child: Container(
                                                margin: EdgeInsets.fromLTRB(
                                                    20, 10, 0, 0),
                                                child: Text(
                                                  snapshot.data['address'],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        child: Row(
                                          children: <Widget>[
                                            Expanded(
                                              child: Container(
                                                margin: EdgeInsets.fromLTRB(
                                                    20, 0, 0, 0),
                                                child: Text('ผู้ดูแล:',
                                                    textAlign: TextAlign.start),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        child: Row(
                                          children: <Widget>[
                                            Flexible(
                                              fit: FlexFit.loose,
                                              child: Container(
                                                margin:
                                                    EdgeInsets.only(left: 85),
                                                child: Text('ชื่อ-นามสกุล:',
                                                    textAlign: TextAlign.end),
                                              ),
                                            ),
                                            Expanded(
                                              child: Container(
                                                margin:
                                                    EdgeInsets.only(left: 20),
                                                child: Text(snapshot
                                                    .data['careTakerName']),
                                              ),
                                            ),
                                            Expanded(
                                              child: Container(
                                                margin:
                                                    EdgeInsets.only(left: 55),
                                                child: Text('เบอร์โทร:',
                                                    textAlign: TextAlign.end),
                                              ),
                                            ),
                                            Expanded(
                                              child: Container(
                                                margin:
                                                    EdgeInsets.only(left: 20),
                                                child: Text(snapshot
                                                    .data['careTakerTel']),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 20, 0, 20),
                          child: Text(
                            'ข้อมูลการรักษา',
                            style: TextStyle(
                                fontSize: 18, color: Color(0xFFC37447)),
                          ),
                        ),
                        Scrollbar(
                          isAlwaysShown: true,
                          thickness: 5,
                          //showTrackOnHover: true,
                          controller: _scrollController2,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SingleChildScrollView(
                              controller: _scrollController2,
                              scrollDirection: Axis.horizontal,
                              child: ConstrainedBox(
                                constraints: BoxConstraints(
                                    minWidth: constraints.minWidth,
                                    minHeight: constraints.minHeight),
                                child: IntrinsicWidth(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: <Widget>[
                                          Expanded(
                                            flex: 1,
                                            child: Container(
                                              margin: EdgeInsets.fromLTRB(
                                                  90, 0, 0, 0),
                                              child: Text('ขั้นตอนการรักษา:',
                                                  textAlign: TextAlign.end),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Container(
                                              margin: EdgeInsets.fromLTRB(
                                                  20, 0, 0, 0),
                                              child: Text(snapshot
                                                  .data['patientState']),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Container(
                                              margin: EdgeInsets.fromLTRB(
                                                  20, 0, 0, 0),
                                              child: Text('HN:',
                                                  textAlign: TextAlign.end),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Container(
                                              margin: EdgeInsets.fromLTRB(
                                                  20, 0, 0, 0),
                                              child: Text(snapshot.data['HN']),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Container(
                                              margin: EdgeInsets.fromLTRB(
                                                  20, 0, 0, 0),
                                              child: Text('AN:',
                                                  textAlign: TextAlign.end),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Container(
                                              margin: EdgeInsets.fromLTRB(
                                                  20, 0, 0, 0),
                                              child: Text(snapshot.data['AN']),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: <Widget>[
                                          Expanded(
                                            flex: 1,
                                            child: Container(
                                              margin: EdgeInsets.fromLTRB(
                                                  90, 10, 0, 0),
                                              child: Text('วันที่รับการรักษา:',
                                                  textAlign: TextAlign.end),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Container(
                                              margin: EdgeInsets.fromLTRB(
                                                  20, 10, 0, 0),
                                              child: Text(snapshot
                                                  .data['operationDate']),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Container(
                                              margin: EdgeInsets.fromLTRB(
                                                  20, 10, 0, 0),
                                              child: Text('ชื่อการผ่าตัด:',
                                                  textAlign: TextAlign.end),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Container(
                                              margin: EdgeInsets.fromLTRB(
                                                  20, 10, 0, 0),
                                              child: Text(snapshot
                                                  .data['operationName']),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Container(
                                              margin: EdgeInsets.fromLTRB(
                                                  20, 10, 0, 0),
                                              child: Text('วิธีการผ่าตัด:',
                                                  textAlign: TextAlign.end),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Container(
                                              margin: EdgeInsets.fromLTRB(
                                                  20, 10, 0, 0),
                                              child: Text(snapshot
                                                  .data['operationMethod']),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: <Widget>[
                                          Expanded(
                                            flex: 1,
                                            child: Container(
                                              margin: EdgeInsets.fromLTRB(
                                                  120, 10, 0, 0),
                                              child: Text('ASA Class:',
                                                  textAlign: TextAlign.end),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Container(
                                              margin: EdgeInsets.fromLTRB(
                                                  20, 10, 0, 0),
                                              child: Text(
                                                  snapshot.data['asaClass']),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Container(
                                              margin: EdgeInsets.fromLTRB(
                                                  20, 10, 0, 0),
                                              child: Text('โรคร่วม:',
                                                  textAlign: TextAlign.end),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Container(
                                              margin: EdgeInsets.fromLTRB(
                                                  20, 10, 0, 0),
                                              child: Text(snapshot
                                                  .data['previousIllness']),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 2,
                                            child: Container(),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  }),
            ),
          ),
        ),
      );
    });
  }
}
