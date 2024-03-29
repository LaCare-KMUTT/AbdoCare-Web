import 'package:AbdoCare_Web/Widget/shared/alert_style.dart';
import 'package:AbdoCare_Web/services/interfaces/firebase_service_interface.dart';
import 'package:AbdoCare_Web/services/service_locator.dart';
import 'package:AbdoCare_Web/view_models/evaluate_form/evaluation_view_model.dart';
import 'package:flutter/material.dart';

class PulmanaryForm extends StatefulWidget {
  final String hn;
  final String evaluateStatus;
  PulmanaryForm({Key key, @required this.hn, @required this.evaluateStatus})
      : super(key: key);

  @override
  _PulmanaryFormState createState() => _PulmanaryFormState();
}

class _PulmanaryFormState extends State<PulmanaryForm> {
  IFirebaseService _firebaseService = locator<IFirebaseService>();
  final EvaluationViewModel _evaluationViewModel =
      locator<EvaluationViewModel>();
  var _value1;
  var _value2;
  var _value3;
  var _value4;
  String result;
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
                                                'แบบประเมินการฟื้นฟูสมรรถภาพของปอด',
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
                                      Row(
                                        children: [
                                          Text(
                                            '1. ออกกำลังการหายใจ (deep breathing)',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600),
                                            textAlign: TextAlign.left,
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            40, 0, 20, 0),
                                        child: Container(
                                          width: 500,
                                          child: RadioListTile(
                                              title: Text(
                                                  'น้อยกว่า 5 ครั้ง/รอบ/ชั่วโมง'),
                                              value:
                                                  'น้อยกว่า 5 ครั้ง/รอบ/ชั่วโมง',
                                              activeColor: Color(0xFFC37447),
                                              groupValue: _value1,
                                              onChanged: (value) {
                                                setState(() {
                                                  _value1 = value;
                                                });
                                              }),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            40, 0, 20, 0),
                                        child: Container(
                                          width: 500,
                                          child: RadioListTile(
                                              title:
                                                  Text('5 ครั้ง/รอบ/ชั่วโมง'),
                                              value: '5 -10 ครั้ง/รอบ/ชั่วโมง',
                                              activeColor: Color(0xFFC37447),
                                              groupValue: _value1,
                                              onChanged: (value) {
                                                setState(() {
                                                  _value1 = value;
                                                });
                                              }),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            40, 0, 20, 0),
                                        child: Container(
                                          width: 500,
                                          child: RadioListTile(
                                              title: Text('ไม่ได้ปฏิบัติ'),
                                              value: 'ไม่ได้ปฏิบัติ',
                                              activeColor: Color(0xFFC37447),
                                              groupValue: _value1,
                                              onChanged: (value) {
                                                setState(() {
                                                  _value1 = value;
                                                });
                                              }),
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            '''2. ไออย่างมีประสิทธิภาพเมื่อมีเสมหะ (effective cough)''',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600),
                                            textAlign: TextAlign.left,
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            40, 0, 20, 0),
                                        child: Container(
                                          width: 500,
                                          child: RadioListTile(
                                              title: Text('ปฏิบัติ'),
                                              value: 'ปฏิบัติ',
                                              activeColor: Color(0xFFC37447),
                                              groupValue: _value2,
                                              onChanged: (value) {
                                                setState(() {
                                                  _value2 = value;
                                                });
                                              }),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            40, 0, 20, 0),
                                        child: Container(
                                          width: 500,
                                          child: RadioListTile(
                                              title: Text('ไม่ได้ปฏิบัติ'),
                                              value: 'ไม่ได้ปฏิบัติ',
                                              activeColor: Color(0xFFC37447),
                                              groupValue: _value2,
                                              onChanged: (value) {
                                                setState(() {
                                                  _value2 = value;
                                                });
                                              }),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            40, 0, 20, 0),
                                        child: Container(
                                          width: 500,
                                          child: RadioListTile(
                                              title: Text('ไม่มีเสมหะ'),
                                              value: 'ไม่มีเสมหะ',
                                              activeColor: Color(0xFFC37447),
                                              groupValue: _value2,
                                              onChanged: (value) {
                                                setState(() {
                                                  _value2 = value;
                                                });
                                              }),
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            '''3. การหายใจโดยใช้เครื่อง Incentive spirometer:''',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600),
                                            textAlign: TextAlign.left,
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            30, 0, 20, 0),
                                        child: Row(
                                          children: [
                                            Text(
                                              'จำนวนครั้ง:',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600),
                                              textAlign: TextAlign.left,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            40, 0, 20, 0),
                                        child: Container(
                                          width: 500,
                                          child: RadioListTile(
                                              title: Text(
                                                  'น้อยกว่า 5 ครั้ง/รอบ/ชั่วโมง'),
                                              value:
                                                  'น้อยกว่า 5 ครั้ง/รอบ/ชั่วโมง',
                                              activeColor: Color(0xFFC37447),
                                              groupValue: _value3,
                                              onChanged: (value) {
                                                setState(() {
                                                  _value3 = value;
                                                });
                                              }),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            40, 0, 20, 0),
                                        child: Container(
                                          width: 500,
                                          child: RadioListTile(
                                              title: Text(
                                                  '5 -10 ครั้ง/รอบ/ชั่วโมง'),
                                              value: '5 -10 ครั้ง/รอบ/ชั่วโมง',
                                              activeColor: Color(0xFFC37447),
                                              groupValue: _value3,
                                              onChanged: (value) {
                                                setState(() {
                                                  _value3 = value;
                                                });
                                              }),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            40, 0, 20, 0),
                                        child: Container(
                                          width: 500,
                                          child: RadioListTile(
                                              title: Text('ไม่ได้ปฏิบัติ'),
                                              value: 'ไม่ได้ปฏิบัติ',
                                              activeColor: Color(0xFFC37447),
                                              groupValue: _value3,
                                              onChanged: (value) {
                                                setState(() {
                                                  _value3 = value;
                                                });
                                              }),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            30, 0, 20, 0),
                                        child: Row(
                                          children: [
                                            Text(
                                              'จำนวนลูก:',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600),
                                              textAlign: TextAlign.left,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            40, 0, 20, 0),
                                        child: Container(
                                          width: 500,
                                          child: RadioListTile(
                                              title: Text('1 ลูก'),
                                              value: '1 ลูก',
                                              activeColor: Color(0xFFC37447),
                                              groupValue: _value4,
                                              onChanged: (value) {
                                                setState(() {
                                                  _value4 = value;
                                                });
                                              }),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            40, 0, 20, 0),
                                        child: Container(
                                          width: 500,
                                          child: RadioListTile(
                                              title: Text('2 ลูก'),
                                              value: '2 ลูก',
                                              activeColor: Color(0xFFC37447),
                                              groupValue: _value4,
                                              onChanged: (value) {
                                                setState(() {
                                                  _value4 = value;
                                                });
                                              }),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            40, 0, 20, 0),
                                        child: Container(
                                          width: 500,
                                          child: RadioListTile(
                                              title: Text('3 ลูก'),
                                              value: '3 ลูก',
                                              activeColor: Color(0xFFC37447),
                                              groupValue: _value4,
                                              onChanged: (value) {
                                                setState(() {
                                                  _value4 = value;
                                                });
                                              }),
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
                                                            7.0),
                                                  ),
                                                  padding: EdgeInsets.all(15),
                                                  onPrimary: Colors.white,
                                                  primary: Color(0xFF2ED47A)),
                                              child: Text('ยืนยัน',
                                                  style:
                                                      TextStyle(fontSize: 18)),
                                              onPressed: () async {
                                                if (_value1 == null ||
                                                    _value2 == null ||
                                                    _value3 == null ||
                                                    _value4 == null) {
                                                  Dialogs
                                                      .alertToCompleteEvalutation(
                                                          context);
                                                } else {
                                                  Map<String, dynamic>
                                                      formDataToDB = {
                                                    'Exercise1': _value1,
                                                    'Exercise2': _value2,
                                                    'Exercise3': _value3,
                                                    'Exercise4': _value4,
                                                  };
                                                  print(
                                                      'hn in Pulmanary = ${widget.hn}');
                                                  var formId =
                                                      await _firebaseService
                                                          .addDataToFormsCollection(
                                                              hn: widget.hn,
                                                              formName:
                                                                  'Pulmanary',
                                                              data:
                                                                  formDataToDB);
                                                  print("finish add data");
                                                  Dialogs
                                                      .alertSuccessfullySavedData(
                                                          context,
                                                          widget.hn,
                                                          _getpatientState);
                                                  if (_value1 == "5 -10 ครั้ง/รอบ/ชั่วโมง" &&
                                                      (_value2 == "ปฏิบัติ" ||
                                                          _value2 ==
                                                              "ไม่มีเสมหะ") &&
                                                      _value3 ==
                                                          "5 -10 ครั้ง/รอบ/ชั่วโมง" &&
                                                      (_value4 == "2 ลูก" ||
                                                          _value4 == "3 ลูก")) {
                                                    result = "Pass";
                                                  } else {
                                                    result = "NotPass";
                                                    _firebaseService
                                                        .addNotification(
                                                            hn: widget.hn,
                                                            formId: formId,
                                                            formName:
                                                                'Pulmanary');
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
