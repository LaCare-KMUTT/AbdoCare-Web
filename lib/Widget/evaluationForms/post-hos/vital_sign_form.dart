import 'package:AbdoCare_Web/Widget/evaluationForms/ultilities/form_utility/pain_form_utility.dart';
import 'package:AbdoCare_Web/Widget/evaluationForms/ultilities/form_utility/vitalSign_form_utility.dart';
import 'package:AbdoCare_Web/Widget/shared/alert_style.dart';
import 'package:AbdoCare_Web/services/interfaces/calculation_service_interface.dart';
import 'package:AbdoCare_Web/services/interfaces/firebase_service_interface.dart';
import 'package:AbdoCare_Web/services/service_locator.dart';
import 'package:AbdoCare_Web/view_models/evaluate_form/evaluation_view_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class VitalSignForm extends StatefulWidget {
  final String hn;
  final String formTime;
  final String evaluateStatus;
  VitalSignForm({
    Key key,
    @required this.hn,
    @required this.formTime,
    @required this.evaluateStatus,
  }) : super(key: key);

  @override
  _VitalSignFormState createState() => _VitalSignFormState();
}

class _VitalSignFormState extends State<VitalSignForm> {
  ICalculationService _calculationService = locator<ICalculationService>();
  IFirebaseService _firebaseService = locator<IFirebaseService>();
  EvaluationViewModel _evaluationViewModel = locator<EvaluationViewModel>();
  final _formKey = GlobalKey<FormState>();
  DateTime date = DateTime.now();
  double _bt;
  double _pr;
  double _rr;
  String _bp;
  int _systolic;
  int _diastolic;
  double _o2sat;
  int _pain;
  String _status;
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
    patientState = await _firebaseService.getPatientState(hn: widget.hn);
    setState(() {
      _getdayInCurrentState = dayInCurrentState;
      _getpatientState = patientState;
    });
  }

  Future<void> addToDashboardData() async {
    var date = _calculationService.formatDate(date: DateTime.now());
    var operation = await _firebaseService.getDayInCurrentState(hn: widget.hn);
    var admission = await _firebaseService.getDayInHospital(
        hn: widget.hn, dateToCompare: date);
    Map<String, dynamic> dashboardData = {
      'hn': widget.hn,
      'name': 'dashboardTable',
      'Date': date,
      'Time': widget.formTime,
      'BloodPressure': "$_systolic/$_diastolic",
      'O2Sat': _o2sat,
      'RespirationsRate': _rr,
      'Operation': operation,
      'Admission': admission,
    };

    await _firebaseService.addToDashboardCollection(dashboardData);
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
    var shouldNotifyVitalSign = VitalSignFormUtility()
        .getVitalSignFormCriteria(_bt, _pr, _rr, _systolic, _diastolic, _o2sat);
    print('should notify = $shouldNotifyVitalSign');
    return shouldNotifyVitalSign;
  }

  @override
  Widget build(BuildContext context) {
    var dateToShow = _calculationService.formatDateToThaiString(
        date: date, isBuddhist: false);
    var timeToShow = DateFormat.Hm().format(DateTime.now()).toString();
    var evaluationButton = _evaluationViewModel.disableVitalSignformButton(
        widget.evaluateStatus, widget.formTime);
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
                  child:
                      evaluationButton && widget.evaluateStatus == "completed"
                          ? Icon(
                              Icons.check,
                              color: Colors.green,
                              size: 20.0,
                            )
                          : SizedBox()),
              Text(widget.formTime, style: TextStyle(fontSize: 15)),
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
            print('แบบประเมินสัญญาณชีพ: ${widget.hn}');
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
                                      padding:
                                          const EdgeInsets.only(bottom: 8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text('$dateToShow'),
                                          Text('\tเวลา $timeToShow น.'),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          20, 8, 20, 8),
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
                                      padding: const EdgeInsets.fromLTRB(
                                          20, 8, 20, 8),
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
                                      padding: const EdgeInsets.fromLTRB(
                                          20, 8, 20, 8),
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
                                      padding: const EdgeInsets.fromLTRB(
                                          20, 8, 20, 8),
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
                                          Expanded(
                                              flex: 1, child: Text(' mmHg')),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          20, 8, 20, 8),
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
                                                  _o2sat = double.parse(value),
                                            ),
                                          ),
                                          Expanded(
                                              flex: 1, child: Text('\t\t %'))
                                        ],
                                      ),
                                    ),
                                    (() {
                                      if (_getpatientState != "Pre-Operation") {
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
                                                            color:
                                                                Colors.black26,
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
                                              Map<String, dynamic>
                                                  paindataToDB = {
                                                'pain': _pain
                                              };
                                              print(
                                                  'hn in Virtal-Sign = ${widget.hn}');
                                              print(
                                                  'Value in pain_form = $_pain ');

                                              if (_getpatientState ==
                                                  "Pre-Operation") {
                                                if (!checkVitalSignNotificationCriteria(
                                                    _bt,
                                                    _pr,
                                                    _rr,
                                                    _systolic,
                                                    _diastolic,
                                                    _o2sat)) {
                                                  _status = "ปกติ";
                                                  dataToDB.addAll(
                                                      {'status': _status});
                                                  await _firebaseService
                                                      .addDataToFormsCollection(
                                                          hn: widget.hn,
                                                          formName:
                                                              'Vital Sign',
                                                          data: dataToDB,
                                                          formTime:
                                                              widget.formTime);
                                                } else {
                                                  _status = "ผิดปกติ";
                                                  dataToDB.addAll(
                                                      {'status': _status});
                                                  var formId =
                                                      await _firebaseService
                                                          .addDataToFormsCollection(
                                                              hn: widget.hn,
                                                              formName:
                                                                  'Vital Sign',
                                                              data: dataToDB,
                                                              formTime: widget
                                                                  .formTime);
                                                  _firebaseService
                                                      .addNotification(
                                                          hn: widget.hn,
                                                          formId: formId,
                                                          formName:
                                                              'Vital Sign');
                                                }
                                                // Add to dashboard collection
                                                await addToDashboardData();
                                              } else if (_getpatientState ==
                                                  "Post-Operation@Hospital") {
                                                var formId2 =
                                                    await _firebaseService
                                                        .addDataToFormsCollection(
                                                            data: paindataToDB,
                                                            formName: "pain",
                                                            hn: widget.hn,
                                                            formTime: widget
                                                                .formTime);
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

                                                  dataToDB.addAll(
                                                      {'status': _status});
                                                  await _firebaseService
                                                      .addDataToFormsCollection(
                                                          hn: widget.hn,
                                                          formName:
                                                              'Vital Sign',
                                                          data: dataToDB,
                                                          formTime:
                                                              widget.formTime);
                                                } else {
                                                  _status = "ผิดปกติ";
                                                  dataToDB.addAll(
                                                      {'status': _status});
                                                  var formId =
                                                      await _firebaseService
                                                          .addDataToFormsCollection(
                                                              hn: widget.hn,
                                                              formName:
                                                                  'Vital Sign',
                                                              data: dataToDB,
                                                              formTime: widget
                                                                  .formTime);
                                                  if (checkPainNotificationCriteria(
                                                      widget.hn, _pain)) {
                                                    _firebaseService
                                                        .addNotification(
                                                            hn: widget.hn,
                                                            formId: formId2,
                                                            formName: 'pain');
                                                  } else {
                                                    _firebaseService
                                                        .addNotification(
                                                            hn: widget.hn,
                                                            formId: formId,
                                                            formName:
                                                                'Vital Sign');
                                                  }
                                                }
                                              }
                                              Dialogs
                                                  .alertSuccessfullySavedData(
                                                      context,
                                                      widget.hn,
                                                      patientState);
                                            } else {
                                              Dialogs
                                                  .alertToCompleteEvalutation(
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
      ),
    );
  }
}
