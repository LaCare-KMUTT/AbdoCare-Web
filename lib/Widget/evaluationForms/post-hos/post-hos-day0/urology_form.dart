import 'package:AbdoCare_Web/Widget/shared/alert_style.dart';
import 'package:AbdoCare_Web/services/interfaces/firebase_service_interface.dart';
import 'package:AbdoCare_Web/services/service_locator.dart';
import 'package:AbdoCare_Web/view_models/evaluate_form/evaluation_view_model.dart';
import 'package:flutter/material.dart';

class UrologyForm extends StatefulWidget {
  final String hn;
  final String evaluateStatus;
  UrologyForm({Key key, @required this.hn, @required this.evaluateStatus})
      : super(key: key);

  @override
  _UrologyFormState createState() => _UrologyFormState();
}

class _UrologyFormState extends State<UrologyForm> {
  IFirebaseService _firebaseService = locator<IFirebaseService>();
  EvaluationViewModel _evaluationViewModel = locator<EvaluationViewModel>();
  var _value1;
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
            crossAxisAlignment: CrossAxisAlignment.center,
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
            print('แบบประเมินระบบปัสสาวะ: ${widget.hn}');
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    content: StatefulBuilder(
                        builder: (BuildContext context, StateSetter setState) {
                      return Container(
                        width: 600,
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
                                          child: Text('แบบประเมินระบบปัสสาวะ',
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
                                              'ทำเครื่องหมาย √ ตามความเป็นจริงภายใน 6-8 ชั่วโมงหลังการผ่าตัด'),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          8, 8, 20, 0),
                                      child: Row(
                                        children: [
                                          Text(
                                            'ประเมินระบบปัสสาวะ',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600),
                                            textAlign: TextAlign.left,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          20, 0, 20, 0),
                                      child: Container(
                                        width: 500,
                                        child: RadioListTile(
                                            title: Text('ถ่ายปัสสาวะแล้ว'),
                                            value: 'ถ่ายปัสสาวะแล้ว',
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
                                          20, 0, 20, 0),
                                      child: Container(
                                        width: 500,
                                        child: RadioListTile(
                                            title: Text('ยังไม่ถ่ายปัสสาวะ'),
                                            value: 'ยังไม่ถ่ายปัสสาวะ',
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
                                          20, 0, 20, 0),
                                      child: Container(
                                        width: 500,
                                        child: RadioListTile(
                                            title: Text(
                                                'ปวดปัสสาวะแต่ถ่ายไม่ออก ต้องการความช่วยเหลือจากเจ้าหน้าที่'),
                                            value:
                                                'ปวดปัสสาวะแต่ถ่ายไม่ออก ต้องการความช่วยเหลือจากเจ้าหน้าที่',
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
                                              if (_value1 == null) {
                                                Dialogs
                                                    .alertToCompleteEvalutation(
                                                        context);
                                              } else {
                                                Map<String, dynamic>
                                                    formDataToDB = {
                                                  'Exercise1': _value1,
                                                };
                                                print(
                                                    'hn in Urology = ${widget.hn}');
                                                var formId =
                                                    await _firebaseService
                                                        .addDataToFormsCollection(
                                                            hn: widget.hn,
                                                            formName: 'Urology',
                                                            data: formDataToDB);
                                                Dialogs
                                                    .alertSuccessfullySavedData(
                                                        context,
                                                        widget.hn,
                                                        _getpatientState);
                                                if (_value1 ==
                                                    "ถ่ายปัสสาวะแล้ว") {
                                                  result = "Pass";
                                                } else {
                                                  result = "NoPass";
                                                  _firebaseService
                                                      .addNotification(
                                                          hn: widget.hn,
                                                          formId: formId,
                                                          formName: 'Urology');
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
