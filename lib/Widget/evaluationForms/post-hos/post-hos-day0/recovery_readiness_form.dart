import 'package:AbdoCare_Web/Widget/shared/alert_style.dart';
import 'package:AbdoCare_Web/services/interfaces/firebase_service_interface.dart';
import 'package:AbdoCare_Web/services/service_locator.dart';
import 'package:flutter/material.dart';

class RecoveryReadinessForm extends StatefulWidget {
  final String hn;
  RecoveryReadinessForm({Key key, @required this.hn}) : super(key: key);

  @override
  _RecoveryReadinessFormState createState() => _RecoveryReadinessFormState();
}

class _RecoveryReadinessFormState extends State<RecoveryReadinessForm> {
  IFirebaseService _firebaseService = locator<IFirebaseService>();
  var _knowFullName = false;
  var _knowTime = false;
  var _knowPlace = false;
  var _fever = false;
  var _breathGasp = false;
  var _palpitations = false;
  var _dizzy = false;
  var _vomit = false;
  var _readyRecover = false;
  var patientState;
  var _getpatientState;
  @override
  void initState() {
    super.initState();
    initData();
  }

  void initData() async {
    patientState = await _firebaseService.getPatientState(hn: widget.hn);
    setState(() {
      _getpatientState = patientState;
    });
  }

  bool completeAllCheckBox() {
    if (_knowFullName &&
        _knowTime &&
        _knowPlace &&
        _fever &&
        _breathGasp &&
        _palpitations &&
        _dizzy &&
        _vomit == true) {
      return true;
    } else {
      return false;
    }
  }

  String result;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(left: 10, right: 10, bottom: 5),
      child: RaisedButton(
        child: Text("แบบประเมิน", style: TextStyle(fontSize: 15)),
        padding: EdgeInsets.fromLTRB(40, 15, 40, 15),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7.0)),
        onPressed: () {
          print('แบบประเมินความพร้อมการฟื้นสภาพหลังผ่าตัด: ${widget.hn}');
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  content: StatefulBuilder(
                      builder: (BuildContext context, StateSetter setState) {
                    return Container(
                      width: 500,
                      child: ListView(
                        shrinkWrap: true,
                        children: <Widget>[
                          Stack(
                            children: <Widget>[
                              Positioned(
                                right: 0.0,
                                top: 0.0,
                                child: InkResponse(
                                  onTap: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: CircleAvatar(
                                    child: Icon(Icons.close),
                                  ),
                                ),
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                            'แบบประเมินความพร้อมฟื้นสภาพหลังผ่าตัด',
                                            style: TextStyle(
                                                fontSize: 22,
                                                color: Color(0xFFC37447))),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                            'ทำเครื่องหมาย √ ในหัวข้อที่ประเมิน'),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(8, 8, 20, 0),
                                    child: Row(
                                      children: [
                                        Text(
                                          'ลักษณะการรู้สึกตัว:',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600),
                                          textAlign: TextAlign.left,
                                        ),
                                      ],
                                    ),
                                  ),
                                  CheckboxListTile(
                                    value: _readyRecover,
                                    selected: _readyRecover,
                                    controlAffinity:
                                        ListTileControlAffinity.leading,
                                    activeColor: Color(0xFFC37447),
                                    onChanged: (value) {
                                      setState(() {
                                        _readyRecover = value;
                                        _knowFullName = value;
                                        _knowTime = value;
                                        _knowPlace = value;
                                        _fever = value;
                                        _breathGasp = value;
                                        _palpitations = value;
                                        _dizzy = value;
                                        _vomit = value;
                                      });
                                    },
                                    title: Text(
                                        'ผู้ป่วยรู้สึกตัวดี (ผ่านทุกหัวข้อ)'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 40),
                                    child: Column(
                                      children: [
                                        CheckboxListTile(
                                          value: _knowFullName,
                                          selected: _knowFullName,
                                          controlAffinity:
                                              ListTileControlAffinity.leading,
                                          activeColor: Color(0xFFC37447),
                                          onChanged: (value) {
                                            setState(() {
                                              _knowFullName = value;
                                              _readyRecover =
                                                  completeAllCheckBox();
                                              print("Check: $_readyRecover");
                                            });
                                          },
                                          title: Text('1. ทราบชื่อ-สกุล'),
                                        ),
                                        CheckboxListTile(
                                          value: _knowTime,
                                          selected: _knowTime,
                                          controlAffinity:
                                              ListTileControlAffinity.leading,
                                          activeColor: Color(0xFFC37447),
                                          onChanged: (value) {
                                            setState(() {
                                              _knowTime = value;
                                              _readyRecover =
                                                  completeAllCheckBox();
                                              print("Check: $_readyRecover");
                                            });
                                          },
                                          title: Text('2. ทราบเวลา'),
                                        ),
                                        CheckboxListTile(
                                          value: _knowPlace,
                                          selected: _knowPlace,
                                          controlAffinity:
                                              ListTileControlAffinity.leading,
                                          activeColor: Color(0xFFC37447),
                                          onChanged: (value) {
                                            setState(() {
                                              _knowPlace = value;
                                              _readyRecover =
                                                  completeAllCheckBox();
                                              print("Check: $_readyRecover");
                                            });
                                          },
                                          title: Text('3. ทราบสถานที่'),
                                        ),
                                        CheckboxListTile(
                                          value: _fever,
                                          selected: _fever,
                                          controlAffinity:
                                              ListTileControlAffinity.leading,
                                          activeColor: Color(0xFFC37447),
                                          onChanged: (value) {
                                            setState(() {
                                              _fever = value;
                                              _readyRecover =
                                                  completeAllCheckBox();
                                              print("Check: $_readyRecover");
                                            });
                                          },
                                          title: Text('4. ไม่มีไข้'),
                                        ),
                                        CheckboxListTile(
                                          value: _breathGasp,
                                          selected: _breathGasp,
                                          controlAffinity:
                                              ListTileControlAffinity.leading,
                                          activeColor: Color(0xFFC37447),
                                          onChanged: (value) {
                                            setState(() {
                                              _breathGasp = value;
                                              _readyRecover =
                                                  completeAllCheckBox();
                                              print("Check: $_readyRecover");
                                            });
                                          },
                                          title:
                                              Text('5. ไม่มีหายใจหอบเหนื่อย'),
                                        ),
                                        CheckboxListTile(
                                          value: _palpitations,
                                          selected: _palpitations,
                                          controlAffinity:
                                              ListTileControlAffinity.leading,
                                          activeColor: Color(0xFFC37447),
                                          onChanged: (value) {
                                            setState(() {
                                              _palpitations = value;
                                              _readyRecover =
                                                  completeAllCheckBox();
                                            });
                                          },
                                          title: Text('6. ไม่มีอาการใจสั่น'),
                                        ),
                                        CheckboxListTile(
                                          value: _dizzy,
                                          selected: _dizzy,
                                          controlAffinity:
                                              ListTileControlAffinity.leading,
                                          activeColor: Color(0xFFC37447),
                                          onChanged: (value) {
                                            setState(() {
                                              _dizzy = value;
                                              _readyRecover =
                                                  completeAllCheckBox();
                                            });
                                          },
                                          title: Text(
                                              '7. ไม่มีหน้ามืดหรือเวียนศีรษะ'),
                                        ),
                                        CheckboxListTile(
                                          value: _vomit,
                                          selected: _vomit,
                                          controlAffinity:
                                              ListTileControlAffinity.leading,
                                          activeColor: Color(0xFFC37447),
                                          onChanged: (value) {
                                            setState(() {
                                              _vomit = value;
                                              _readyRecover =
                                                  completeAllCheckBox();
                                            });
                                          },
                                          title: Text(
                                              '8. ไม่มีอาการคลื่นไส้ อาเจียน'),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      child: RaisedButton(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(7.0)),
                                          textColor: Colors.white,
                                          padding: EdgeInsets.all(15),
                                          color: Color(0xFF2ED47A),
                                          child: Text('ยืนยัน',
                                              style: TextStyle(fontSize: 18)),
                                          onPressed: () async {
                                            if (_knowFullName |
                                                    _knowTime |
                                                    _knowPlace |
                                                    _fever |
                                                    _breathGasp |
                                                    _palpitations |
                                                    _dizzy |
                                                    _vomit !=
                                                true) {
                                              Dialogs
                                                  .alertToCompleteEvalutation(
                                                      context);
                                            } else {
                                              Map<String, dynamic>
                                                  formDataToDB = {
                                                'Choice1': _knowFullName,
                                                'Choice2': _knowTime,
                                                'Choice3': _knowPlace,
                                                'Choice4': _fever,
                                                'Choice5': _breathGasp,
                                                'Choice6': _palpitations,
                                                'Choice7': _dizzy,
                                                'Choice8': _vomit,
                                              };
                                              if (_readyRecover == true) {
                                                formDataToDB.addAll({
                                                  "Result":
                                                      "พร้อมฟื้นสภาพหลังผ่าตัด"
                                                });
                                                await _firebaseService
                                                    .addDataToFormsCollection(
                                                        hn: widget.hn,
                                                        formName:
                                                            'Recovery Readiness',
                                                        data: formDataToDB);
                                              } else {
                                                formDataToDB.addAll({
                                                  "Result":
                                                      "ไม่พร้อมฟื้นสภาพหลังผ่าตัด"
                                                });
                                                var formId = await _firebaseService
                                                    .addDataToFormsCollection(
                                                        hn: widget.hn,
                                                        formName:
                                                            'Recovery Readiness',
                                                        data: formDataToDB);
                                                await _firebaseService
                                                    .addNotification(
                                                        hn: widget.hn,
                                                        formId: formId,
                                                        formName:
                                                            'Recovery Readiness');
                                              }
                                              Dialogs
                                                  .alertSuccessfullySavedData(
                                                      context,
                                                      widget.hn,
                                                      _getpatientState);
                                            }
                                          }),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  }),
                );
              });
        },
      ),
    );
  }
}
