import 'package:flutter/material.dart';

class RespiratoryDay0Form extends StatefulWidget {
  // final String hn;
  // RespiratoryDay0Form({Key key, @required this.hn}) : super(key: key);

  @override
  _RespiratoryDay0FormState createState() => _RespiratoryDay0FormState();
}

class _RespiratoryDay0FormState extends State<RespiratoryDay0Form> {
  var _value1;
  var _value2;
  var _value3;
  var _value4;
  var _value5;
  var _value6;
  String result;
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text("แบบประเมินภาวะแทรกซ้อนระบบทางเดินหายใจ",
          style: TextStyle(fontSize: 18)),
      padding: EdgeInsets.all(15),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7.0)),
      onPressed: () {
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
                                          'แบบประเมินภาวะแทรกซ้อนระบบทางเดินหายใจ',
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
                                  padding:
                                      const EdgeInsets.fromLTRB(20, 8, 20, 0),
                                  child: Row(
                                    children: [
                                      Text(
                                        '1. นอนท่าศีรษะสูง 30° – 45°',
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
                                        title: Text('ใช่'),
                                        value: 'ใช่',
                                        activeColor: Color(0xFFC37447),
                                        groupValue: _value1,
                                        onChanged: (value) {
                                          setState(() {
                                            _value1 = value;
                                            print('นอนท่าศีรษะสูง $_value1');
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
                                        title: Text('ไม่ใช่'),
                                        value: 'ไม่ใช่',
                                        activeColor: Color(0xFFC37447),
                                        groupValue: _value1,
                                        onChanged: (value) {
                                          setState(() {
                                            _value1 = value;
                                            print('นอนท่าศีรษะสูง $_value1');
                                          });
                                        }),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(20, 0, 20, 0),
                                  child: Row(
                                    children: [
                                      Text(
                                        '2. ออกกำลังการหายใจ',
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
                                        title: Text(
                                            'น้อยกว่า 5 ครั้ง/รอบ/ชั่วโมง'),
                                        value: 'น้อยกว่า 5 ครั้ง/รอบ/ชั่วโมง',
                                        activeColor: Color(0xFFC37447),
                                        groupValue: _value2,
                                        onChanged: (value) {
                                          setState(() {
                                            _value2 = value;
                                            print('ออกกำลังการหายใจ $_value2');
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
                                        title: Text('5 - 10 ครั้ง/รอบ/ชั่วโมง'),
                                        value: '5 -10 ครั้ง/รอบ/ชั่วโมง',
                                        activeColor: Color(0xFFC37447),
                                        groupValue: _value2,
                                        onChanged: (value) {
                                          setState(() {
                                            _value2 = value;
                                            print('ออกกำลังการหายใจ $_value2');
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
                                        title: Text('ไม่ได้ปฏิบัติ'),
                                        value: 'ไม่ได้ปฏิบัติ',
                                        activeColor: Color(0xFFC37447),
                                        groupValue: _value2,
                                        onChanged: (value) {
                                          setState(() {
                                            _value2 = value;
                                            print('ออกกำลังการหายใจ $_value2');
                                          });
                                        }),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(20, 8, 20, 8),
                                  child: Row(
                                    children: [
                                      Text(
                                        '3. ไออย่างมีประสิทธิภาพเมื่อมีเสมหะ',
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
                                        title: Text('ปฏิบัติ'),
                                        value: 'ปฏิบัติ',
                                        activeColor: Color(0xFFC37447),
                                        groupValue: _value3,
                                        onChanged: (value) {
                                          setState(() {
                                            _value3 = value;
                                            print(
                                                'ไออย่างมีประสิทธิภาพ $_value3');
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
                                        groupValue: _value3,
                                        onChanged: (value) {
                                          setState(() {
                                            _value3 = value;
                                            print(
                                                'ไออย่างมีประสิทธิภาพ $_value3');
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
                                        title: Text('ไม่มีเสมหะ'),
                                        value: 'ไม่มีเสมหะ',
                                        activeColor: Color(0xFFC37447),
                                        groupValue: _value3,
                                        onChanged: (value) {
                                          setState(() {
                                            _value3 = value;
                                            print(
                                                'ไออย่างมีประสิทธิภาพ $_value3');
                                          });
                                        }),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(20, 0, 20, 0),
                                  child: Row(
                                    children: [
                                      Text(
                                        '4. เปลี่ยนท่านอน/พลิกตะแคงตัวทุก 2 ชั่วโมง',
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
                                        title: Text('ปฏิบัติ'),
                                        value: 'ปฏิบัติ',
                                        activeColor: Color(0xFFC37447),
                                        groupValue: _value4,
                                        onChanged: (value) {
                                          setState(() {
                                            _value4 = value;
                                            print(
                                                'เปลี่ยนท่านอน/พลิกตะแคงตัวทุก 2 ชั่วโมง $_value4');
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
                                        groupValue: _value4,
                                        onChanged: (value) {
                                          setState(() {
                                            _value4 = value;
                                            print(
                                                'เปลี่ยนท่านอน/พลิกตะแคงตัวทุก 2 ชั่วโมง $_value4');
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
                                            'ต้องการความช่วยเหลือในการพลิกตะแคงตัว'),
                                        value:
                                            'ต้องการความช่วยเหลือในการพลิกตะแคงตัว',
                                        activeColor: Color(0xFFC37447),
                                        groupValue: _value4,
                                        onChanged: (value) {
                                          setState(() {
                                            _value4 = value;
                                            print(
                                                'เปลี่ยนท่านอน/พลิกตะแคงตัวทุก 2 ชั่วโมง $_value4');
                                          });
                                        }),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(20, 0, 20, 0),
                                  child: Row(
                                    children: [
                                      Text(
                                        '5. จำนวนครั้งการดูดเครื่อง Incentive spirometer',
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
                                        title: Text(
                                            'น้อยกว่า 5 ครั้ง/รอบ/ชั่วโมง'),
                                        value: 'น้อยกว่า 5 ครั้ง/รอบ/ชั่วโมง',
                                        activeColor: Color(0xFFC37447),
                                        groupValue: _value5,
                                        onChanged: (value) {
                                          setState(() {
                                            _value5 = value;
                                            print('จำนวนครั้งการดูด $_value5');
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
                                        title: Text('5 -10 ครั้ง/รอบ/ชั่วโมง'),
                                        value: '5 -10 ครั้ง/รอบ/ชั่วโมง',
                                        activeColor: Color(0xFFC37447),
                                        groupValue: _value5,
                                        onChanged: (value) {
                                          setState(() {
                                            _value5 = value;
                                            print('จำนวนครั้งการดูด $_value5');
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
                                        title: Text('ไม่ได้ปฏิบัติ'),
                                        value: 'ไม่ได้ปฏิบัติ',
                                        activeColor: Color(0xFFC37447),
                                        groupValue: _value5,
                                        onChanged: (value) {
                                          setState(() {
                                            _value5 = value;
                                            print('จำนวนครั้งการดูด $_value5');
                                          });
                                        }),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(20, 0, 20, 0),
                                  child: Row(
                                    children: [
                                      Text(
                                        '6. จำนวนลูกการดูดเครื่อง Incentive spirometer',
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
                                        title: Text('1 ลูก'),
                                        value: '1 ลูก',
                                        activeColor: Color(0xFFC37447),
                                        groupValue: _value6,
                                        onChanged: (value) {
                                          setState(() {
                                            _value6 = value;
                                            print('จำนวนลูกการดูด $_value6');
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
                                        title: Text('2 ลูก'),
                                        value: '2 ลูก',
                                        activeColor: Color(0xFFC37447),
                                        groupValue: _value6,
                                        onChanged: (value) {
                                          setState(() {
                                            _value6 = value;
                                            print('จำนวนลูกการดูด $_value6');
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
                                        title: Text('3 ลูก'),
                                        value: '3 ลูก',
                                        activeColor: Color(0xFFC37447),
                                        groupValue: _value6,
                                        onChanged: (value) {
                                          setState(() {
                                            _value6 = value;
                                            print('จำนวนลูกการดูด $_value6');
                                          });
                                        }),
                                  ),
                                ),
                                Container(
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 20),
                                    child: RaisedButton(
                                        padding: EdgeInsets.all(15),
                                        child: Text(
                                          'ยืนยัน',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText2,
                                        ),
                                        onPressed: () async {
                                          if (_value1 == null ||
                                              _value2 == null ||
                                              _value3 == null ||
                                              _value4 == null ||
                                              _value5 == null ||
                                              _value6 == null) {
                                            alert(context);
                                          } else {
                                            Map<String, dynamic> formDataToDB =
                                                {
                                              'Exercise1': _value1,
                                              'Exercise2': _value2,
                                              'Exercise3': _value3,
                                              'Exercise4': _value4,
                                              'Exercise5': _value5,
                                              'Exercise6': _value6,
                                            };
                                            // var formId =
                                            //     await _firebaseService.addDataToFormsCollection(
                                            //         formName: 'Respiratory', data: formDataToDB);
                                            if (_value1 == "ใช่" &&
                                                _value2 ==
                                                    "5 -10 ครั้ง/รอบ/ชั่วโมง" &&
                                                (_value3 == "ปฏิบัติ" ||
                                                    _value3 == "ไม่มีเสมหะ") &&
                                                _value4 == "ปฏิบัติ" &&
                                                _value5 ==
                                                    "5 -10 ครั้ง/รอบ/ชั่วโมง" &&
                                                (_value6 == "2 ลูก" ||
                                                    _value6 == "3 ลูก")) {
                                              result = "Pass";
                                            } else {
                                              result = "NotPass";
                                              // var creation = _calculationService.formatDate(
                                              //     date: DateTime.now());
                                              // var patientState = _anSubCollection['state'];
                                              // _firebaseService.addNotification({
                                              //   'formName': 'Respiratory',
                                              //   'formId': formId,
                                              //   'userId':
                                              //       UserStore.getValueFromStore('storedUserId'),
                                              //   'creation': creation,
                                              //   'patientState': patientState,
                                              //   'seen': false,
                                              // });
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
