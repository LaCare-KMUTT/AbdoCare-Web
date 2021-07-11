import 'package:AbdoCare_Web/Widget/shared/alert_style.dart';
import 'package:AbdoCare_Web/services/interfaces/firebase_service_interface.dart';
import 'package:AbdoCare_Web/services/service_locator.dart';
import 'package:AbdoCare_Web/view_models/evaluate_form/evaluation_view_model.dart';
import 'package:flutter/material.dart';

class DigestiveForm extends StatefulWidget {
  final String hn;
  final String evaluateStatus;
  DigestiveForm({Key key, @required this.hn, @required this.evaluateStatus})
      : super(key: key);

  @override
  _DigestiveFormState createState() => _DigestiveFormState();
}

class _DigestiveFormState extends State<DigestiveForm> {
  IFirebaseService _firebaseService = locator<IFirebaseService>();
  final EvaluationViewModel _evaluationViewModel =
      locator<EvaluationViewModel>();
  var _value1 = false;
  var _value2 = false;
  var _value3 = false;
  var _value4 = false;
  var _value5 = false;
  var _value6 = false;
  var _value7;
  var _value8;
  var _value9;
  var _value10;
  var _value11;
  var _value12;
  var _value13;
  var _value14;
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
                                                'แบบประเมินการฟื้นฟูระบบทางเดินอาหาร',
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
                                      CheckboxListTile(
                                        value: _value1,
                                        selected: _value1,
                                        controlAffinity:
                                            ListTileControlAffinity.leading,
                                        activeColor: Color(0xFFC37447),
                                        onChanged: (value) {
                                          setState(() {
                                            _value1 = value;
                                          });
                                        },
                                        title: Text('1. ผายลมแล้ว'),
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
                                          });
                                        },
                                        title: Text('2. ปวดท้อง'),
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
                                          });
                                        },
                                        title: Text('3. แน่นท้อง'),
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
                                          });
                                        },
                                        title: Text('4. รู้สึกท้องอืด'),
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
                                          });
                                        },
                                        title: Text('5. คลื่นไส้'),
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
                                          });
                                        },
                                        title: Text('6. อาเจียน'),
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
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          children: [
                                            Text(
                                              'ท่าที่ 1 ข้อเท้า',
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
                                              title:
                                                  Text('10 ครั้ง/รอบ/ชั่วโมง'),
                                              value: '10 ครั้ง/รอบ/ชั่วโมง',
                                              activeColor: Color(0xFFC37447),
                                              groupValue: _value7,
                                              onChanged: (value) {
                                                setState(() {
                                                  _value7 = value;
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
                                                  'น้อยกว่า 10 ครั้ง/รอบ/ชั่วโมง'),
                                              value:
                                                  'น้อยกว่า 10 ครั้ง/รอบ/ชั่วโมง',
                                              activeColor: Color(0xFFC37447),
                                              groupValue: _value7,
                                              onChanged: (value) {
                                                setState(() {
                                                  _value7 = value;
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
                                              title: Text('ไม่ปฏิบัติ'),
                                              value: 'ไม่ปฏิบัติ',
                                              activeColor: Color(0xFFC37447),
                                              groupValue: _value7,
                                              onChanged: (value) {
                                                setState(() {
                                                  _value7 = value;
                                                });
                                              }),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          children: [
                                            Text(
                                              'ท่าที่ 2 ข้อนิ้วเท้า',
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
                                              title:
                                                  Text('5 ครั้ง/รอบ/ชั่วโมง'),
                                              value: '5 ครั้ง/รอบ/ชั่วโมง',
                                              activeColor: Color(0xFFC37447),
                                              groupValue: _value8,
                                              onChanged: (value) {
                                                setState(() {
                                                  _value8 = value;
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
                                                  'น้อยกว่า 5 ครั้ง/รอบ/ชั่วโมง'),
                                              value:
                                                  'น้อยกว่า 5 ครั้ง/รอบ/ชั่วโมง',
                                              activeColor: Color(0xFFC37447),
                                              groupValue: _value8,
                                              onChanged: (value) {
                                                setState(() {
                                                  _value8 = value;
                                                });
                                              }),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            20, 0, 20, 0),
                                        child: ListTile(
                                          title: const Text('ไม่ปฏิบัติ'),
                                          leading: Radio(
                                              value: 'ไม่ปฏิบัติ',
                                              activeColor: Color(0xFFC37447),
                                              groupValue: _value8,
                                              onChanged: (value) {
                                                setState(() {
                                                  _value8 = value;
                                                });
                                              }),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          children: [
                                            Text(
                                              'ท่าที่ 3 ข้อเข่า',
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
                                              title:
                                                  Text('5 ครั้ง/รอบ/ชั่วโมง'),
                                              value: '5 ครั้ง/รอบ/ชั่วโมง',
                                              activeColor: Color(0xFFC37447),
                                              groupValue: _value9,
                                              onChanged: (value) {
                                                setState(() {
                                                  _value9 = value;
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
                                                  'น้อยกว่า 5 ครั้ง/รอบ/ชั่วโมง'),
                                              value:
                                                  'น้อยกว่า 5 ครั้ง/รอบ/ชั่วโมง',
                                              activeColor: Color(0xFFC37447),
                                              groupValue: _value9,
                                              onChanged: (value) {
                                                setState(() {
                                                  _value9 = value;
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
                                              title: Text('ไม่ปฏิบัติ'),
                                              value: 'ไม่ปฏิบัติ',
                                              activeColor: Color(0xFFC37447),
                                              groupValue: _value9,
                                              onChanged: (value) {
                                                setState(() {
                                                  _value9 = value;
                                                });
                                              }),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          children: [
                                            Text(
                                              'ท่าที่ 4 ข้อเข่า',
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
                                              title:
                                                  Text('5 ครั้ง/รอบ/ชั่วโมง'),
                                              value: '5 ครั้ง/รอบ/ชั่วโมง',
                                              activeColor: Color(0xFFC37447),
                                              groupValue: _value10,
                                              onChanged: (value) {
                                                setState(() {
                                                  _value10 = value;
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
                                                  'น้อยกว่า 5 ครั้ง/รอบ/ชั่วโมง'),
                                              value:
                                                  'น้อยกว่า 5 ครั้ง/รอบ/ชั่วโมง',
                                              activeColor: Color(0xFFC37447),
                                              groupValue: _value10,
                                              onChanged: (value) {
                                                setState(() {
                                                  _value10 = value;
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
                                              title: Text('ไม่ปฏิบัติ'),
                                              value: 'ไม่ปฏิบัติ',
                                              activeColor: Color(0xFFC37447),
                                              groupValue: _value10,
                                              onChanged: (value) {
                                                setState(() {
                                                  _value10 = value;
                                                });
                                              }),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          children: [
                                            Text(
                                              'ท่าที่ 5 ข้อเข่า',
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
                                              title:
                                                  Text('10 ครั้ง/รอบ/ชั่วโมง'),
                                              value: '10 ครั้ง/รอบ/ชั่วโมง',
                                              activeColor: Color(0xFFC37447),
                                              groupValue: _value11,
                                              onChanged: (value) {
                                                setState(() {
                                                  _value11 = value;
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
                                                  'น้อยกว่า 10 ครั้ง/รอบ/ชั่วโมง'),
                                              value:
                                                  'น้อยกว่า 10 ครั้ง/รอบ/ชั่วโมง',
                                              activeColor: Color(0xFFC37447),
                                              groupValue: _value11,
                                              onChanged: (value) {
                                                setState(() {
                                                  _value11 = value;
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
                                              title: Text('ไม่ปฏิบัติ'),
                                              value: 'ไม่ปฏิบัติ',
                                              activeColor: Color(0xFFC37447),
                                              groupValue: _value11,
                                              onChanged: (value) {
                                                setState(() {
                                                  _value11 = value;
                                                });
                                              }),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          children: [
                                            Text(
                                              'ท่าที่ 6 กล้ามเนื้ออุ้งเชิงกราน',
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
                                              title:
                                                  Text('10 ครั้ง/รอบ/ชั่วโมง'),
                                              value: '10 ครั้ง/รอบ/ชั่วโมง',
                                              activeColor: Color(0xFFC37447),
                                              groupValue: _value12,
                                              onChanged: (value) {
                                                setState(() {
                                                  _value12 = value;
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
                                                  'น้อยกว่า 10 ครั้ง/รอบ/ชั่วโมง'),
                                              value:
                                                  'น้อยกว่า 10 ครั้ง/รอบ/ชั่วโมง',
                                              activeColor: Color(0xFFC37447),
                                              groupValue: _value12,
                                              onChanged: (value) {
                                                setState(() {
                                                  _value12 = value;
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
                                              title: Text('ไม่ปฏิบัติ'),
                                              value: 'ไม่ปฏิบัติ',
                                              activeColor: Color(0xFFC37447),
                                              groupValue: _value12,
                                              onChanged: (value) {
                                                setState(() {
                                                  _value12 = value;
                                                });
                                              }),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          children: [
                                            Text(
                                              'การลุกออกจากเตียและเดินระยะทาง 5 เมตร',
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
                                              title: Text('ปฏิบัติ'),
                                              value: 'ปฏิบัติ',
                                              activeColor: Color(0xFFC37447),
                                              groupValue: _value13,
                                              onChanged: (value) {
                                                setState(() {
                                                  _value13 = value;
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
                                              title: Text('ไม่ปฏิบัติ'),
                                              value: 'ไม่ปฏิบัติ',
                                              activeColor: Color(0xFFC37447),
                                              groupValue: _value13,
                                              onChanged: (value) {
                                                setState(() {
                                                  _value13 = value;
                                                });
                                              }),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          children: [
                                            Text(
                                              'การลุกออกจากเตียและเดินระยะทาง 10 เมตร',
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
                                              title: Text('ปฏิบัติ'),
                                              value: 'ปฏิบัติ',
                                              activeColor: Color(0xFFC37447),
                                              groupValue: _value14,
                                              onChanged: (value) {
                                                setState(() {
                                                  _value14 = value;
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
                                              title: Text('ไม่ปฏิบัติ'),
                                              value: 'ไม่ปฏิบัติ',
                                              activeColor: Color(0xFFC37447),
                                              groupValue: _value14,
                                              onChanged: (value) {
                                                setState(() {
                                                  _value14 = value;
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
                                                if (_value1 |
                                                            _value2 |
                                                            _value3 |
                                                            _value4 |
                                                            _value5 |
                                                            _value6 !=
                                                        true ||
                                                    _value7 == null ||
                                                    _value8 == null ||
                                                    _value9 == null ||
                                                    _value10 == null ||
                                                    _value11 == null ||
                                                    _value12 == null ||
                                                    _value13 == null ||
                                                    _value14 == null) {
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
                                                    'Exercise1': _value7,
                                                    'Exercise2': _value8,
                                                    'Exercise3': _value9,
                                                    'Exercise4': _value10,
                                                    'Exercise5': _value11,
                                                    'Exercise6': _value12,
                                                    'Exercise7': _value13,
                                                    'Exercise8': _value14,
                                                  };
                                                  print(
                                                      'hn in Digestive = ${widget.hn}');
                                                  var formId =
                                                      await _firebaseService
                                                          .addDataToFormsCollection(
                                                              hn: widget.hn,
                                                              formName:
                                                                  'Digestive',
                                                              data:
                                                                  formDataToDB);
                                                  Dialogs
                                                      .alertSuccessfullySavedData(
                                                          context,
                                                          widget.hn,
                                                          _getpatientState);
                                                  if (_value1 == true &&
                                                      _value2 == false &&
                                                      _value3 == false &&
                                                      _value4 == false &&
                                                      _value5 == false &&
                                                      _value6 == false &&
                                                      _value7 ==
                                                          "10 ครั้ง/รอบ/ชั่วโมง" &&
                                                      _value8 ==
                                                          "5 ครั้ง/รอบ/ชั่วโมง" &&
                                                      _value9 ==
                                                          "5 ครั้ง/รอบ/ชั่วโมง" &&
                                                      _value10 ==
                                                          "5 ครั้ง/รอบ/ชั่วโมง" &&
                                                      _value11 ==
                                                          "10 ครั้ง/รอบ/ชั่วโมง" &&
                                                      _value12 ==
                                                          "10 ครั้ง/รอบ/ชั่วโมง" &&
                                                      _value13 == "ปฏิบัติ" &&
                                                      _value14 == "ปฏิบัติ") {
                                                    result = "Pass";
                                                  } else {
                                                    result = "NotPass";
                                                    _firebaseService
                                                        .addNotification(
                                                            hn: widget.hn,
                                                            formId: formId,
                                                            formName:
                                                                'Digestive');
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
