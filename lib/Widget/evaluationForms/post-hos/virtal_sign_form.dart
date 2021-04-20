import 'package:AbdoCare_Web/Widget/evaluationForms/ultilities/form_utility/pain_form_utility.dart';
import 'package:AbdoCare_Web/Widget/evaluationForms/ultilities/form_utility/vitalSign_form_utility.dart';
import 'package:AbdoCare_Web/Widget/shared/alert_style.dart';
import 'package:AbdoCare_Web/constants.dart';
import 'package:AbdoCare_Web/services/interfaces/calculation_service_interface.dart';
import 'package:AbdoCare_Web/services/interfaces/firebase_service_interface.dart';
import 'package:AbdoCare_Web/services/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class VirtalSignForm extends StatefulWidget {
  final String hn;
  final String formTime;
  final String state;
  final double dayInCurrentState;
  VirtalSignForm(
      {Key key,
      @required this.hn,
      @required this.formTime,
      @required this.state,
      this.dayInCurrentState})
      : super(key: key);

  @override
  _VirtalSignFormState createState() => _VirtalSignFormState();
}

class _VirtalSignFormState extends State<VirtalSignForm> {
  ICalculationService _calculationService = locator<ICalculationService>();
  IFirebaseService _firebaseService = locator<IFirebaseService>();
  final _formKey = GlobalKey<FormState>();
  DateTime date = DateTime.now();

  double _bt;
  double _pr;
  double _rr;
  String _bp;
  int _systolic;
  int _diastolic;
  int _o2sat;
  int _pain;
  String _status;
  LinearGradient gradient = LinearGradient(
    colors: <Color>[
      Colors.greenAccent[400],
      Colors.orangeAccent[400],
      Colors.redAccent[700],
    ],
  );
  var _getdayInCurrentState;
  var dayInCurrentState;
  var patientState;
  var _getpatientState;
  @override
  void initState() {
    super.initState();
    initData();
  }

  void initData() async {
    dayInCurrentState =
        await _firebaseService.getDayInCurrentState(hn: widget.hn);
    print('dayInCurrentState $dayInCurrentState');
    patientState = await _firebaseService.getPatientState(hn: widget.hn);
    setState(() {
      _getdayInCurrentState = dayInCurrentState;
      _getpatientState = patientState;
    });
  }

  bool checkPainNotificationCriteria(String hn, int score) {
    var shouldNotifyPain = PainFormUtility()
        .withState(_getpatientState)
        .withDayInState(_getdayInCurrentState)
        .getPainFormCriteria(score);
    print('should notify = $shouldNotifyPain');
    return shouldNotifyPain;
  }

  bool checkVitalSignNotificationCriteria(
      _bt, _pr, _rr, _systolic, _diastolic, _o2sat) {
    var shouldNotifyVital = VitalSignFormUtility()
        .withState(_getpatientState)
        .getVitalSignFormCriteria(_bt, _pr, _rr, _systolic, _diastolic, _o2sat);
    print('should notify = $shouldNotifyVital  Jaaaaa');
    return shouldNotifyVital;
  }

  @override
  Widget build(BuildContext context) {
    var dateToShow = _calculationService.formatDateToThaiString(
        date: date, isBuddhist: false);
    var timeToShow = DateFormat.Hm().format(DateTime.now()).toString();

    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(left: 10, right: 10, bottom: 5),
      child: RaisedButton(
        child: Text(widget.formTime, style: TextStyle(fontSize: 15)),
        padding: EdgeInsets.fromLTRB(40, 15, 40, 15),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7.0)),
        onPressed: () {
          print('แบบประเมินสัญญาณชีพ: ${widget.hn}');
          print("${widget.state} Day: ${widget.dayInCurrentState}");
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  content: Container(
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
                            Form(
                              key: _formKey,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text('แบบประเมินสัญญาณชีพ ',
                                            style: TextStyle(
                                                fontSize: 22,
                                                color: Color(0xFFC37447))),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text('$dateToShow'),
                                        Text('\tเวลา $timeToShow น.'),
                                        (() {
                                          if (widget.state == 'Pre-Operation') {
                                            return Text('\t ${widget.state}  ');
                                          } else {
                                            return Text(
                                                '\t ${widget.state} day: ${widget.dayInCurrentState} ');
                                          }
                                        }())
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(20, 8, 20, 8),
                                    child: Row(
                                      children: <Widget>[
                                        Expanded(
                                          flex: 1,
                                          child: Text('BT:\t\t',
                                              textAlign: TextAlign.end),
                                        ),
                                        Expanded(
                                          flex: 4,
                                          child: TextFormField(
                                            validator: (value) {
                                              return value.isEmpty
                                                  ? 'กรุณากรอกหมายเลขBT'
                                                  : null;
                                            },
                                            decoration: InputDecoration(
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.black26,
                                                      width: 1),
                                                ),
                                                labelText: 'BT'),
                                            onSaved: (value) =>
                                                _bt = double.parse(value),
                                          ),
                                        ),
                                        Expanded(
                                            flex: 1, child: Text('\t\t °C'))
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(20, 8, 20, 8),
                                    child: Row(
                                      children: <Widget>[
                                        Expanded(
                                          flex: 1,
                                          child: Text('PR:\t\t',
                                              textAlign: TextAlign.end),
                                        ),
                                        Expanded(
                                          flex: 4,
                                          child: TextFormField(
                                            validator: (value) {
                                              return value.isEmpty
                                                  ? 'กรุณากรอกหมายเลขPR '
                                                  : null;
                                            },
                                            decoration: InputDecoration(
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.black26,
                                                      width: 1),
                                                ),
                                                labelText: 'PR '),
                                            onSaved: (value) =>
                                                _pr = double.parse(value),
                                          ),
                                        ),
                                        Expanded(
                                            flex: 1, child: Text('\t\t bpm'))
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(20, 8, 20, 8),
                                    child: Row(
                                      children: <Widget>[
                                        Expanded(
                                          flex: 1,
                                          child: Text('RR:\t\t',
                                              textAlign: TextAlign.end),
                                        ),
                                        Expanded(
                                          flex: 4,
                                          child: TextFormField(
                                            validator: (value) {
                                              return value.isEmpty
                                                  ? 'กรุณากรอกหมายเลขRR'
                                                  : null;
                                            },
                                            decoration: InputDecoration(
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.black26,
                                                      width: 1),
                                                ),
                                                labelText: 'RR'),
                                            onSaved: (value) =>
                                                _rr = double.parse(value),
                                          ),
                                        ),
                                        Expanded(
                                            flex: 1,
                                            child: Text('\t\t bpm\t\t'))
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(20, 8, 20, 8),
                                    child: Row(
                                      children: <Widget>[
                                        Expanded(
                                          flex: 1,
                                          child: Text('BP:\t\t',
                                              textAlign: TextAlign.end),
                                        ),
                                        Expanded(
                                          flex: 2,
                                          child: TextFormField(
                                            validator: (value) {
                                              return value.isEmpty
                                                  ? 'กรุณากรอกหมายเลขSystolic'
                                                  : null;
                                            },
                                            decoration: InputDecoration(
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.black26,
                                                      width: 1),
                                                ),
                                                labelText: 'Systolic'),
                                            onChanged: (value) =>
                                                _systolic = int.parse(value),
                                          ),
                                        ),
                                        Container(
                                            width: 20,
                                            child: Text(
                                              '/',
                                              textAlign: TextAlign.center,
                                            )),
                                        Expanded(
                                          flex: 2,
                                          child: TextFormField(
                                            validator: (value) {
                                              return value.isEmpty
                                                  ? 'กรุณากรอกหมายเลขDiastolic'
                                                  : null;
                                            },
                                            decoration: InputDecoration(
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.black26,
                                                      width: 1),
                                                ),
                                                labelText: 'Diastolic'),
                                            onChanged: (value) =>
                                                _diastolic = int.parse(value),
                                          ),
                                        ),
                                        Expanded(flex: 1, child: Text(' mmHg')),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(20, 8, 20, 8),
                                    child: Row(
                                      children: <Widget>[
                                        Expanded(
                                          flex: 1,
                                          child: Text('O2sat:\t\t',
                                              textAlign: TextAlign.end),
                                        ),
                                        Expanded(
                                          flex: 4,
                                          child: TextFormField(
                                            validator: (value) {
                                              return value.isEmpty
                                                  ? 'กรุณากรอกหมายเลขO2sat'
                                                  : null;
                                            },
                                            decoration: InputDecoration(
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.black26,
                                                      width: 1),
                                                ),
                                                labelText: 'O2sat'),
                                            onSaved: (value) =>
                                                _o2sat = int.parse(value),
                                          ),
                                        ),
                                        Expanded(flex: 1, child: Text('\t\t %'))
                                      ],
                                    ),
                                  ),
                                  (() {
                                    if (widget.state != "Pre-Operation") {
                                      return Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            20, 8, 20, 8),
                                        child: Row(
                                          children: [
                                            Expanded(
                                              flex: 1,
                                              child: Text('Pain:\t\t',
                                                  textAlign: TextAlign.end),
                                            ),
                                            Expanded(
                                              flex: 4,
                                              child: DropdownButtonFormField(
                                                isDense: true,
                                                isExpanded: true,
                                                validator: (value) =>
                                                    value == null
                                                        ? 'กรุณาเลือกPain'
                                                        : null,
                                                decoration: InputDecoration(
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: Colors.black26,
                                                          width: 1),
                                                    ),
                                                    labelText: 'Pain'),
                                                onSaved: (value) {
                                                  _pain = int.parse(value);
                                                },
                                                items: [
                                                  '1',
                                                  '2',
                                                  '3',
                                                  '4',
                                                  '5',
                                                  '6',
                                                  '7',
                                                  '8',
                                                  '9',
                                                  '10'
                                                ]
                                                    .map((label) =>
                                                        DropdownMenuItem(
                                                          child: Text(label),
                                                          value: label,
                                                        ))
                                                    .toList(),
                                                onChanged: (value) {
                                                  setState(() {
                                                    _pain = int.parse(value);
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
                                      );
                                    } else {
                                      return Container();
                                    }
                                  }()),
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
                                          if (_formKey.currentState
                                              .validate()) {
                                            _formKey.currentState.save();
                                            _bp = '$_systolic' +
                                                '/' +
                                                '$_diastolic';
                                            Map<String, dynamic> dataToDB = {
                                              'temperature': _bt,
                                              'pulseRate': _pr,
                                              'respirationRate': _rr,
                                              'bloodPressure': _bp,
                                              'oxygen': _o2sat
                                            };
                                            Map<String, dynamic> paindataToDB =
                                                {'pain': _pain};
                                            // var formId2 = await _firebaseService
                                            //     .addDataToFormsCollection(
                                            //         data: paindataToDB,
                                            //         formName: "pain",
                                            //         hn: widget.hn,
                                            //         formTime: widget.formTime);
                                            print(
                                                'hn in Virtal-Sign = ${widget.hn}');
                                            print(
                                                'Value in pain_form = $_pain ');

                                            if (widget.state ==
                                                "Pre-Operation") {
                                              if (!checkVitalSignNotificationCriteria(
                                                  _bt,
                                                  _pr,
                                                  _rr,
                                                  _systolic,
                                                  _diastolic,
                                                  _o2sat)) {
                                                _status = "ปกติ";
                                                print("ผลลัพธ์ Pre-Operation");
                                                print(_status);
                                              } else {
                                                _status = "ผิดปกติ";
                                                //      _firebaseService
                                                //         .addNotification(
                                                //             hn: widget.hn,
                                                //             formId: formId,
                                                //             formName: 'Vital Sign');
                                                print("ผลลัพธ์ Pre-Operation");
                                                print(_status);
                                              }
                                              // dataToDB
                                              //       .addAll({'status': _status});
                                              // var formId =
                                              //       await _firebaseService
                                              //           .addDataToFormsCollection(
                                              //               hn: widget.hn,
                                              //               formName:
                                              //                   'Vital Sign',
                                              //               data: dataToDB,
                                              //               formTime:
                                              //                   widget.formTime);
                                            } else if (widget.state ==
                                                "Post-op") {
                                              if (!checkVitalSignNotificationCriteria(
                                                      _bt,
                                                      _pr,
                                                      _rr,
                                                      _systolic,
                                                      _diastolic,
                                                      _o2sat) &&
                                                  !checkPainNotificationCriteria(
                                                      widget.hn, _pain)) {
                                                _status = "ปกติ";
                                                print("ผลลัพธ์ Post-Operation");
                                                print(_status);
                                              } else {
                                                _status = "ผิดปกติ";
                                                if (checkPainNotificationCriteria(
                                                    widget.hn, _pain)) {
                                                  //     _firebaseService
                                                  //         .addNotification(
                                                  //             hn: widget.hn,
                                                  //             formId: formId2,
                                                  //             formName: 'pain');
                                                  print(
                                                      "ผลลัพธ์ Post-Operation Noti Pain");
                                                  print(_status);
                                                } else {
                                                  //     _firebaseService
                                                  //         .addNotification(
                                                  //             hn: widget.hn,
                                                  //             formId: formId,
                                                  //             formName: 'Vital Sign');
                                                  print(
                                                      "ผลลัพธ์ Post-Operation Noti Vital Sign");
                                                  print(_status);
                                                }
                                              }
                                              // dataToDB
                                              //       .addAll({'status': _status});
                                              // var formId =
                                              //       await _firebaseService
                                              //           .addDataToFormsCollection(
                                              //               hn: widget.hn,
                                              //               formName:
                                              //                   'Vital Sign',
                                              //               data: dataToDB,
                                              //               formTime:
                                              //                   widget.formTime);
                                            }

                                            // if (!checkNotificationCriteria(
                                            //         widget.hn, _pain) &&
                                            //     (_bt >=
                                            //             Constant
                                            //                 .btLowerCriteria &&
                                            //         _bt <=
                                            //             Constant
                                            //                 .btUpperCriteria) &&
                                            //     (_pr >=
                                            //             Constant
                                            //                 .prLowerCriteria &&
                                            //         _pr <=
                                            //             Constant
                                            //                 .prUpperCriteria) &&
                                            //     (_rr >=
                                            //             Constant
                                            //                 .rrLowerCriteria &&
                                            //         _rr <=
                                            //             Constant
                                            //                 .rrUpperCriteria) &&
                                            //     (_systolic <=
                                            //             Constant
                                            //                 .systolicCriteria &&
                                            //         _diastolic <=
                                            //             Constant
                                            //                 .diastolicCriteria) &&
                                            //     _o2sat >
                                            //         Constant.oxygenCriteria) {
                                            //   _status = "ปกติ";
                                            //   dataToDB
                                            //       .addAll({'status': _status});
                                            //   await _firebaseService
                                            //       .addDataToFormsCollection(
                                            //           hn: widget.hn,
                                            //           formName: 'Vital Sign',
                                            //           data: dataToDB,
                                            //           formTime:
                                            //               widget.formTime);
                                            // } else {
                                            //   _status = "ผิดปกติ";
                                            //   dataToDB
                                            //       .addAll({'status': _status});
                                            //   var formId =
                                            //       await _firebaseService
                                            //           .addDataToFormsCollection(
                                            //               hn: widget.hn,
                                            //               formName:
                                            //                   'Vital Sign',
                                            //               data: dataToDB,
                                            //               formTime:
                                            //                   widget.formTime);
                                            //   if (checkNotificationCriteria(
                                            //       widget.hn, _pain)) {
                                            //     _firebaseService
                                            //         .addNotification(
                                            //             hn: widget.hn,
                                            //             formId: formId2,
                                            //             formName: 'pain');
                                            //   } else {
                                            //     _firebaseService
                                            //         .addNotification(
                                            //             hn: widget.hn,
                                            //             formId: formId,
                                            //             formName: 'Vital Sign');
                                            //   }
                                            // }
                                            // Dialogs.alertSuccessfullySavedData(
                                            //     context,
                                            //     widget.hn,
                                            //     _getpatientState);
                                          } else {
                                            Dialogs.alertToCompleteEvalutation(
                                                context);
                                          }
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              });
        },
      ),
    );
  }
}
