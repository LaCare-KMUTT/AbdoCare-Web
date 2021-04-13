import 'package:AbdoCare_Web/services/interfaces/firebase_service_interface.dart';
import 'package:AbdoCare_Web/services/service_locator.dart';
import 'package:flutter/material.dart';

class BloodClotForm extends StatefulWidget {
  final String hn;
  BloodClotForm({Key key, @required this.hn}) : super(key: key);

  @override
  _BloodClotFormState createState() => _BloodClotFormState();
}

class _BloodClotFormState extends State<BloodClotForm> {
  IFirebaseService _firebaseService = locator<IFirebaseService>();
  var _value1 = false;
  var _value2 = false;
  var _value3 = false;
  var _value4 = false;
  var _value5;
  var _value6;
  var _value7;
  var _value8;
  var _value9;
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
          print('แบบประเมินการเกิดภาวะลิ่มเลือดอุดตัน: ${widget.hn}');
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
                                            'แบบประเมินการเกิดภาวะลิ่มเลือดอุดตัน',
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
                                        _value4 = false;
                                      });
                                    },
                                    title: Text('1. ขาบวมข้างเดียว'),
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
                                        _value4 = false;
                                      });
                                    },
                                    title: Text('2. ปวดขาข้างที่บวม'),
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
                                        _value4 = false;
                                      });
                                    },
                                    title: Text('3. ขาแดงร้อน'),
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
                                    title: Text('4. ขาไม่มีอาการผิดปกติ'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8),
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
                                    padding:
                                        const EdgeInsets.fromLTRB(40, 0, 20, 0),
                                    child: Container(
                                      width: 500,
                                      child: RadioListTile(
                                          title: Text('10 ครั้ง/รอบ/ชั่วโมง'),
                                          value: '10 ครั้ง/รอบ/ชั่วโมง',
                                          activeColor: Color(0xFFC37447),
                                          groupValue: _value5,
                                          onChanged: (value) {
                                            setState(() {
                                              _value5 = value;
                                            });
                                          }),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(40, 0, 20, 0),
                                    child: Container(
                                      width: 500,
                                      child: RadioListTile(
                                          title: Text(
                                              'น้อยกว่า 10 ครั้ง/รอบ/ชั่วโมง'),
                                          value:
                                              'น้อยกว่า 10 ครั้ง/รอบ/ชั่วโมง',
                                          activeColor: Color(0xFFC37447),
                                          groupValue: _value5,
                                          onChanged: (value) {
                                            setState(() {
                                              _value5 = value;
                                            });
                                          }),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(40, 0, 20, 0),
                                    child: Container(
                                      width: 500,
                                      child: RadioListTile(
                                          title: Text('ไม่ปฏิบัติ'),
                                          value: 'ไม่ปฏิบัติ',
                                          activeColor: Color(0xFFC37447),
                                          groupValue: _value5,
                                          onChanged: (value) {
                                            setState(() {
                                              _value5 = value;
                                            });
                                          }),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8),
                                    child: Row(
                                      children: [
                                        Text(
                                          'ท่าที่ 2 หมุนข้อเท้า',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600),
                                          textAlign: TextAlign.left,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(40, 0, 20, 0),
                                    child: Container(
                                      width: 500,
                                      child: RadioListTile(
                                          title: Text('10 ครั้ง/รอบ/ชั่วโมง'),
                                          value: '10 ครั้ง/รอบ/ชั่วโมง',
                                          activeColor: Color(0xFFC37447),
                                          groupValue: _value6,
                                          onChanged: (value) {
                                            setState(() {
                                              _value6 = value;
                                            });
                                          }),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(40, 0, 20, 0),
                                    child: Container(
                                      width: 500,
                                      child: RadioListTile(
                                          title: Text(
                                              'น้อยกว่า 10 ครั้ง/รอบ/ชั่วโมง'),
                                          value:
                                              'น้อยกว่า 10 ครั้ง/รอบ/ชั่วโมง',
                                          activeColor: Color(0xFFC37447),
                                          groupValue: _value6,
                                          onChanged: (value) {
                                            setState(() {
                                              _value6 = value;
                                            });
                                          }),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(40, 0, 20, 0),
                                    child: Container(
                                      width: 500,
                                      child: RadioListTile(
                                          title: Text('ไม่ปฏิบัติ'),
                                          value: 'ไม่ปฏิบัติ',
                                          activeColor: Color(0xFFC37447),
                                          groupValue: _value6,
                                          onChanged: (value) {
                                            setState(() {
                                              _value6 = value;
                                            });
                                          }),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8),
                                    child: Row(
                                      children: [
                                        Text(
                                          'ท่าที่ 3 งอนิ้วเท้า',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600),
                                          textAlign: TextAlign.left,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(40, 0, 20, 0),
                                    child: Container(
                                      width: 500,
                                      child: RadioListTile(
                                          title: Text('10 ครั้ง/รอบ/ชั่วโมง'),
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
                                    padding:
                                        const EdgeInsets.fromLTRB(40, 0, 20, 0),
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
                                    padding:
                                        const EdgeInsets.fromLTRB(40, 0, 20, 0),
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
                                    padding: const EdgeInsets.only(left: 8),
                                    child: Row(
                                      children: [
                                        Text(
                                          'ท่าที่ 4 งอหัวเข่า',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600),
                                          textAlign: TextAlign.left,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(40, 0, 20, 0),
                                    child: Container(
                                      width: 500,
                                      child: RadioListTile(
                                          title: Text('5 ครั้ง/รอบ/ชั่วโมง'),
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
                                    padding:
                                        const EdgeInsets.fromLTRB(40, 0, 20, 0),
                                    child: Container(
                                      width: 500,
                                      child: RadioListTile(
                                          title: Text(
                                              'น้อยกว่า 5 ครั้ง/รอบ/ชั่วโมง'),
                                          value: 'น้อยกว่า 5 ครั้ง/รอบ/ชั่วโมง',
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
                                    padding:
                                        const EdgeInsets.fromLTRB(40, 0, 20, 0),
                                    child: Container(
                                      width: 500,
                                      child: RadioListTile(
                                          title: Text('ไม่ปฏิบัติ'),
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
                                    padding: const EdgeInsets.only(left: 8),
                                    child: Row(
                                      children: [
                                        Text(
                                          'ท่าที่ 5 งอหัวเข่าตั้งขึ้น',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600),
                                          textAlign: TextAlign.left,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(40, 0, 20, 0),
                                    child: Container(
                                      width: 500,
                                      child: RadioListTile(
                                          title: Text('5 ครั้ง/รอบ/ชั่วโมง'),
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
                                    padding:
                                        const EdgeInsets.fromLTRB(40, 0, 20, 0),
                                    child: Container(
                                      width: 500,
                                      child: RadioListTile(
                                          title: Text(
                                              'น้อยกว่า 5 ครั้ง/รอบ/ชั่วโมง'),
                                          value: 'น้อยกว่า 5 ครั้ง/รอบ/ชั่วโมง',
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
                                    padding:
                                        const EdgeInsets.fromLTRB(40, 0, 20, 0),
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
                                                        _value4 !=
                                                    true ||
                                                _value5 == null ||
                                                _value6 == null ||
                                                _value7 == null ||
                                                _value8 == null ||
                                                _value9 == null) {
                                              alert(context);
                                            } else {
                                              Map<String, dynamic>
                                                  formDataToDB = {
                                                'Choice1': _value1,
                                                'Choice2': _value2,
                                                'Choice3': _value3,
                                                'Choice4': _value4,
                                                'Exercise1': _value5,
                                                'Exercise2': _value6,
                                                'Exercise3': _value7,
                                                'Exercise4': _value8,
                                                'Exercise5': _value9,
                                              };
                                              print(
                                                  'hn in BloodClot = ${widget.hn}');
                                              var formId =
                                                  await _firebaseService
                                                      .addDataToFormsCollection(
                                                          hn: widget.hn,
                                                          formName: 'BloodClot',
                                                          data: formDataToDB);

                                              if (_value1 == false &&
                                                  _value2 == false &&
                                                  _value3 == false &&
                                                  _value4 == true &&
                                                  _value5 ==
                                                      "10 ครั้ง/รอบ/ชั่วโมง" &&
                                                  _value6 ==
                                                      "10 ครั้ง/รอบ/ชั่วโมง" &&
                                                  _value7 ==
                                                      "10 ครั้ง/รอบ/ชั่วโมง" &&
                                                  _value8 ==
                                                      "5 ครั้ง/รอบ/ชั่วโมง" &&
                                                  _value9 ==
                                                      "5 ครั้ง/รอบ/ชั่วโมง") {
                                                result = "Pass";
                                              } else {
                                                result = "NoPass";
                                                _firebaseService
                                                    .addNotification(
                                                        hn: widget.hn,
                                                        formId: formId,
                                                        formName: 'BloodClot');
                                              }
                                              Navigator.pop(context);
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

  void alert(BuildContext context) {
    showDialog(
        context: context,
        builder: (_) {
          Future.delayed(Duration(seconds: 2), () {
            Navigator.of(context).pop(true);
          });
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            title: Text("กรุณาทำแบบประเมินให้ครบถ้วน",
                style: Theme.of(context).textTheme.bodyText2,
                textAlign: TextAlign.center),
          );
        });
  }
}
