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
  var _value1 = false;
  var _value2 = false;
  var _value3 = false;
  var _value4 = false;
  var _value5 = false;
  var _value6 = false;
  var _value7 = false;
  var _value8 = false;
  var _value9 = false;
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
    if (_value1 &&
        _value2 &&
        _value3 &&
        _value4 &&
        _value5 &&
        _value6 &&
        _value7 &&
        _value8 == true) {
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
                                    value: _value9,
                                    selected: _value9,
                                    controlAffinity:
                                        ListTileControlAffinity.leading,
                                    activeColor: Color(0xFFC37447),
                                    onChanged: (value) {
                                      setState(() {
                                        _value9 = value;
                                        _value1 = value;
                                        _value2 = value;
                                        _value3 = value;
                                        _value4 = value;
                                        _value5 = value;
                                        _value6 = value;
                                        _value7 = value;
                                        _value8 = value;
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
                                          value: _value1,
                                          selected: _value1,
                                          controlAffinity:
                                              ListTileControlAffinity.leading,
                                          activeColor: Color(0xFFC37447),
                                          onChanged: (value) {
                                            setState(() {
                                              _value1 = value;
                                              _value9 = completeAllCheckBox();
                                              print("Check: $_value9");
                                            });
                                          },
                                          title: Text('1. ทราบชื่อ-สกุล'),
                                        ),
                                        CheckboxListTile(
                                          value: _value2,
                                          selected: _value2,
                                          controlAffinity:
                                              ListTileControlAffinity.leading,
                                          activeColor: Color(0xFFC37447),
                                          onChanged: (value) {
                                            setState(() {
                                              _value2 = value;
                                              _value9 = completeAllCheckBox();
                                              print("Check: $_value9");
                                            });
                                          },
                                          title: Text('2. ทราบเวลา'),
                                        ),
                                        CheckboxListTile(
                                          value: _value3,
                                          selected: _value3,
                                          controlAffinity:
                                              ListTileControlAffinity.leading,
                                          activeColor: Color(0xFFC37447),
                                          onChanged: (value) {
                                            setState(() {
                                              _value3 = value;
                                              _value9 = completeAllCheckBox();
                                              print("Check: $_value9");
                                            });
                                          },
                                          title: Text('3. ทราบสถานที่'),
                                        ),
                                        CheckboxListTile(
                                          value: _value4,
                                          selected: _value4,
                                          controlAffinity:
                                              ListTileControlAffinity.leading,
                                          activeColor: Color(0xFFC37447),
                                          onChanged: (value) {
                                            setState(() {
                                              _value4 = value;
                                              _value9 = completeAllCheckBox();
                                              print("Check: $_value9");
                                            });
                                          },
                                          title: Text('4. ไม่มีไข้'),
                                        ),
                                        CheckboxListTile(
                                          value: _value5,
                                          selected: _value5,
                                          controlAffinity:
                                              ListTileControlAffinity.leading,
                                          activeColor: Color(0xFFC37447),
                                          onChanged: (value) {
                                            setState(() {
                                              _value5 = value;
                                              _value9 = completeAllCheckBox();
                                              print("Check: $_value9");
                                            });
                                          },
                                          title:
                                              Text('5. ไม่มีหายใจหอบเหนื่อย'),
                                        ),
                                        CheckboxListTile(
                                          value: _value6,
                                          selected: _value6,
                                          controlAffinity:
                                              ListTileControlAffinity.leading,
                                          activeColor: Color(0xFFC37447),
                                          onChanged: (value) {
                                            setState(() {
                                              _value6 = value;
                                              _value9 = completeAllCheckBox();
                                            });
                                          },
                                          title: Text('6. ไม่มีอาการใจสั่น'),
                                        ),
                                        CheckboxListTile(
                                          value: _value7,
                                          selected: _value7,
                                          controlAffinity:
                                              ListTileControlAffinity.leading,
                                          activeColor: Color(0xFFC37447),
                                          onChanged: (value) {
                                            setState(() {
                                              _value7 = value;
                                              _value9 = completeAllCheckBox();
                                            });
                                          },
                                          title: Text(
                                              '7. ไม่มีหน้ามืดหรือเวียนศีรษะ'),
                                        ),
                                        CheckboxListTile(
                                          value: _value8,
                                          selected: _value8,
                                          controlAffinity:
                                              ListTileControlAffinity.leading,
                                          activeColor: Color(0xFFC37447),
                                          onChanged: (value) {
                                            setState(() {
                                              _value8 = value;
                                              _value9 = completeAllCheckBox();
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
                                            if (_value1 |
                                                    _value2 |
                                                    _value3 |
                                                    _value4 |
                                                    _value5 |
                                                    _value6 |
                                                    _value7 |
                                                    _value8 !=
                                                true) {
                                              Dialogs
                                                  .alertToCompleteEvalutation(
                                                      context);
                                            } else {
                                              Map<String, dynamic>
                                                  formDataToDB = {
                                                'Choice1': _value1,
                                                'Choice2': _value2,
                                                'Choice3': _value3,
                                                'Choice4': _value4,
                                                'Choice5': _value5,
                                                'Choice6': _value6,
                                                'Choice7': _value7,
                                                'Choice8': _value8,
                                              };
                                              if (_value9 == true) {
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
