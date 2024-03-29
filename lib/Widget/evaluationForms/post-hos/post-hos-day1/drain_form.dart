import 'package:AbdoCare_Web/Widget/shared/alert_style.dart';
import 'package:AbdoCare_Web/services/interfaces/firebase_service_interface.dart';
import 'package:AbdoCare_Web/services/service_locator.dart';
import 'package:AbdoCare_Web/view_models/evaluate_form/evaluation_view_model.dart';
import 'package:flutter/material.dart';

class DrainForm extends StatefulWidget {
  final String hn;
  final String evaluateStatus;
  DrainForm({Key key, @required this.hn, @required this.evaluateStatus})
      : super(key: key);

  @override
  _DrainFormState createState() => _DrainFormState();
}

class _DrainFormState extends State<DrainForm> {
  IFirebaseService _firebaseService = locator<IFirebaseService>();
  EvaluationViewModel _evaluationViewModel = locator<EvaluationViewModel>();
  var _value1 = false;
  var _value2 = false;
  var _value3 = false;
  var _value4 = false;
  var _value5 = false;
  var _value6 = false;
  var _value7 = false;
  var _value8 = false;
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
            if (widget.evaluateStatus == 'noPassRecoveryReadiness') {
              Dialogs.alertToCompleteRecoveryReadinessForm(
                  context, widget.hn, widget.evaluateStatus);
            } else
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      content: StatefulBuilder(builder:
                          (BuildContext context, StateSetter setState) {
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
                                                'แบบประเมินการจัดการแผลผ่าตัดและสายระบาย',
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
                                                'ทำเครื่องหมาย √ ในข้อที่ท่านมีอาการ'),
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            8, 8, 20, 0),
                                        child: Row(
                                          children: [
                                            Text(
                                              'แผลผ่าตัด:',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600),
                                              textAlign: TextAlign.left,
                                            ),
                                          ],
                                        ),
                                      ),
                                      CheckboxListTile(
                                        value: _value1,
                                        selected: _value1,
                                        controlAffinity:
                                            ListTileControlAffinity.leading,
                                        activeColor: Color(0xFFC37447),
                                        onChanged: (value) {
                                          setState(() {
                                            _value1 = value;
                                            _value2 = false;
                                            _value3 = false;
                                            _value4 = false;
                                          });
                                        },
                                        title: Text('1. แห้งดี'),
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
                                            _value1 = false;
                                            _value3 = false;
                                            _value4 = false;
                                          });
                                        },
                                        title: Text(
                                            '2. มีเลือดซึมผ้าก๊อซเล็กน้อย'),
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
                                            _value1 = false;
                                            _value2 = false;
                                            _value4 = false;
                                          });
                                        },
                                        title: Text('3. มีเลือดชุ่มผ้าก๊อซ'),
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
                                            _value1 = false;
                                            _value2 = false;
                                            _value3 = false;
                                          });
                                        },
                                        title: Text(
                                            '4. ไม่ทราบ ต้องการให้พยาบาลประเมินแผล'),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            8, 8, 20, 0),
                                        child: Row(
                                          children: [
                                            Text(
                                              'อาการและอาการแสดง:',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600),
                                              textAlign: TextAlign.left,
                                            ),
                                          ],
                                        ),
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
                                            _value8 = false;
                                          });
                                        },
                                        title: Text('1. ใจสั่น'),
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
                                            _value8 = false;
                                          });
                                        },
                                        title: Text('2. หน้ามืด'),
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
                                            _value8 = false;
                                          });
                                        },
                                        title: Text('3. หัวใจเต้นเร็ว'),
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
                                            _value5 = false;
                                            _value6 = false;
                                            _value7 = false;
                                          });
                                        },
                                        title: Text('4. ไม่มีอาการข้างต้น'),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            7.0),
                                                  ),
                                                  padding: EdgeInsets.all(15),
                                                  onPrimary: Colors.white,
                                                  primary: Color(0xFF2ED47A)),
                                              child: Text('ยืนยัน',
                                                  style:
                                                      TextStyle(fontSize: 18)),
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
                                                  print(
                                                      'hn in Drain = ${widget.hn}');
                                                  var formId =
                                                      await _firebaseService
                                                          .addDataToFormsCollection(
                                                              hn: widget.hn,
                                                              formName: 'Drain',
                                                              data:
                                                                  formDataToDB);
                                                  Dialogs
                                                      .alertSuccessfullySavedData(
                                                          context,
                                                          widget.hn,
                                                          _getpatientState);
                                                  if ((_value1 ||
                                                          _value2 == true) &&
                                                      _value3 == false &&
                                                      _value4 == false &&
                                                      _value5 == false &&
                                                      _value6 == false &&
                                                      _value7 == false &&
                                                      _value8 == true) {
                                                    result = "Pass";
                                                    print(result);
                                                  } else {
                                                    result = "NotPass";
                                                    print(result);
                                                    _firebaseService
                                                        .addNotification(
                                                            hn: widget.hn,
                                                            formId: formId,
                                                            formName: 'Drain');
                                                  }
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
