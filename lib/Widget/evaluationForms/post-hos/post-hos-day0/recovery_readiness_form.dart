import 'package:AbdoCare_Web/Widget/shared/alert_style.dart';
import 'package:AbdoCare_Web/services/interfaces/firebase_service_interface.dart';
import 'package:AbdoCare_Web/services/service_locator.dart';
import 'package:AbdoCare_Web/view_models/evaluate_form/evaluation_view_model.dart';
import 'package:AbdoCare_Web/view_models/evaluate_form/recoveryReadiness_view_model.dart';
import 'package:flutter/material.dart';

class RecoveryReadinessForm extends StatefulWidget {
  final String hn;
  final String evaluateStatus;
  RecoveryReadinessForm(
      {Key key, @required this.hn, @required this.evaluateStatus})
      : super(key: key);

  @override
  _RecoveryReadinessFormState createState() => _RecoveryReadinessFormState();
}

class _RecoveryReadinessFormState extends State<RecoveryReadinessForm> {
  IFirebaseService _firebaseService = locator<IFirebaseService>();
  final RecoveryReadinessFormViewModel _recoveryReadinessFormViewModel =
      locator<RecoveryReadinessFormViewModel>();
  EvaluationViewModel _evaluationViewModel = locator<EvaluationViewModel>();
  var _knowFullName = false;
  var _knowTime = false;
  var _knowPlace = false;
  var _noFever = false;
  var _noBreathGasp = false;
  var _noPalpitations = false;
  var _noDizzy = false;
  var _noVomit = false;
  var _readyRecover = false;
  var patientState;
  var _getPatientState;
  @override
  void initState() {
    super.initState();
    initData();
  }

  void initData() async {
    patientState = await _firebaseService.getPatientState(hn: widget.hn);
    setState(() {
      _getPatientState = patientState;
    });
  }

  bool completeAllCheckBox() {
    if (_knowFullName &&
        _knowTime &&
        _knowPlace &&
        _noFever &&
        _noBreathGasp &&
        _noPalpitations &&
        _noDizzy &&
        _noVomit == true) {
      return true;
    } else {
      return false;
    }
  }

  String result;
  @override
  Widget build(BuildContext context) {
    var evaluationButton =
        _evaluationViewModel.disableEvaluationformButton(widget.evaluateStatus);
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(left: 10, right: 10, bottom: 5),
      child: AbsorbPointer(
        absorbing: evaluationButton,
        child: ElevatedButton(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  child: evaluationButton
                      ? Icon(
                          Icons.check,
                          color: Colors.green,
                          size: 20.0,
                        )
                      : SizedBox()),
              Text(" แบบประเมิน", style: TextStyle(fontSize: 15)),
            ],
          ),
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.fromLTRB(40, 15, 40, 15),
            primary: evaluationButton ? Colors.grey[100] : Colors.grey[300],
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(7.0)),
            side: BorderSide(color: Colors.grey[200], width: 1),
            shadowColor: Colors.black,
            onPrimary: evaluationButton ? Colors.grey[600] : Colors.black,
          ),
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
                                      padding: const EdgeInsets.fromLTRB(
                                          8, 8, 20, 0),
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
                                          _noFever = value;
                                          _noBreathGasp = value;
                                          _noPalpitations = value;
                                          _noDizzy = value;
                                          _noVomit = value;
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
                                            value: _noFever,
                                            selected: _noFever,
                                            controlAffinity:
                                                ListTileControlAffinity.leading,
                                            activeColor: Color(0xFFC37447),
                                            onChanged: (value) {
                                              setState(() {
                                                _noFever = value;
                                                _readyRecover =
                                                    completeAllCheckBox();
                                                print("Check: $_readyRecover");
                                              });
                                            },
                                            title: Text('4. ไม่มีไข้'),
                                          ),
                                          CheckboxListTile(
                                            value: _noBreathGasp,
                                            selected: _noBreathGasp,
                                            controlAffinity:
                                                ListTileControlAffinity.leading,
                                            activeColor: Color(0xFFC37447),
                                            onChanged: (value) {
                                              setState(() {
                                                _noBreathGasp = value;
                                                _readyRecover =
                                                    completeAllCheckBox();
                                                print("Check: $_readyRecover");
                                              });
                                            },
                                            title:
                                                Text('5. ไม่มีหายใจหอบเหนื่อย'),
                                          ),
                                          CheckboxListTile(
                                            value: _noPalpitations,
                                            selected: _noPalpitations,
                                            controlAffinity:
                                                ListTileControlAffinity.leading,
                                            activeColor: Color(0xFFC37447),
                                            onChanged: (value) {
                                              setState(() {
                                                _noPalpitations = value;
                                                _readyRecover =
                                                    completeAllCheckBox();
                                              });
                                            },
                                            title: Text('6. ไม่มีอาการใจสั่น'),
                                          ),
                                          CheckboxListTile(
                                            value: _noDizzy,
                                            selected: _noDizzy,
                                            controlAffinity:
                                                ListTileControlAffinity.leading,
                                            activeColor: Color(0xFFC37447),
                                            onChanged: (value) {
                                              setState(() {
                                                _noDizzy = value;
                                                _readyRecover =
                                                    completeAllCheckBox();
                                              });
                                            },
                                            title: Text(
                                                '7. ไม่มีหน้ามืดหรือเวียนศีรษะ'),
                                          ),
                                          CheckboxListTile(
                                            value: _noVomit,
                                            selected: _noVomit,
                                            controlAffinity:
                                                ListTileControlAffinity.leading,
                                            activeColor: Color(0xFFC37447),
                                            onChanged: (value) {
                                              setState(() {
                                                _noVomit = value;
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
                                        child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            7.0)),
                                                padding: EdgeInsets.all(15),
                                                onPrimary: Colors.white,
                                                primary: Color(0xFF2ED47A)),
                                            child: Text('ยืนยัน',
                                                style: TextStyle(fontSize: 18)),
                                            onPressed: () async {
                                              if (_knowFullName |
                                                      _knowTime |
                                                      _knowPlace |
                                                      _noFever |
                                                      _noBreathGasp |
                                                      _noPalpitations |
                                                      _noDizzy |
                                                      _noVomit !=
                                                  true) {
                                                Dialogs
                                                    .alertToCompleteEvalutation(
                                                        context);
                                              } else {
                                                Map<String, dynamic>
                                                    formDataToDB = {
                                                  'knowFullName': _knowFullName,
                                                  'knowTime': _knowTime,
                                                  'knowPlace': _knowPlace,
                                                  'noFever': _noFever,
                                                  'noBreathGasp': _noBreathGasp,
                                                  'noPalpitations':
                                                      _noPalpitations,
                                                  'noDizzy': _noDizzy,
                                                  'noVomit': _noVomit,
                                                };
                                                if (_readyRecover == true) {
                                                  Map<String, dynamic>
                                                      recoveryReadinessData = {
                                                    "recoveryReadiness":
                                                        "พร้อมฟื้นสภาพหลังผ่าตัด"
                                                  };
                                                  formDataToDB.addAll(
                                                      recoveryReadinessData);
                                                  await _firebaseService
                                                      .addDataToFormsCollection(
                                                          hn: widget.hn,
                                                          formName:
                                                              'Recovery Readiness',
                                                          data: formDataToDB);
                                                  _recoveryReadinessFormViewModel
                                                      .saveRecoveryReadinessToDatabase(
                                                          hn: widget.hn,
                                                          recoveryReadinessData:
                                                              recoveryReadinessData);
                                                } else {
                                                  Map<String, dynamic>
                                                      recoveryReadinessData = {
                                                    "recoveryReadiness":
                                                        "ไม่พร้อมฟื้นสภาพหลังผ่าตัด"
                                                  };
                                                  formDataToDB.addAll(
                                                      recoveryReadinessData);
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
                                                  _recoveryReadinessFormViewModel
                                                      .saveRecoveryReadinessToDatabase(
                                                          hn: widget.hn,
                                                          recoveryReadinessData:
                                                              recoveryReadinessData);
                                                }
                                                Dialogs
                                                    .alertSuccessfullySavedData(
                                                        context,
                                                        widget.hn,
                                                        _getPatientState);
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
      ),
    );
  }
}
