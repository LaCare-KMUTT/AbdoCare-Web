import 'package:flutter/material.dart';

class InfectionForm extends StatefulWidget {
  // final String hn;
  // InfectionForm({Key key, @required this.hn}) : super(key: key);

  @override
  _InfectionFormState createState() => _InfectionFormState();
}

class _InfectionFormState extends State<InfectionForm> {
  var _value1 = false;
  var _value2 = false;
  var _value3 = false;
  var _value4 = false;
  var _value5 = false;
  var _value6 = false;
  var _value7 = false;
  var _value8 = false;
  String result;

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text("แบบประเมินการเฝ้าระวังภาวะแทรกซ้อน",
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
                                          'แบบประเมินการเฝ้าระวังภาวะแทรกซ้อน',
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
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Text(
                                        '1. การเฝ้าระวังการติดเชื้อที่แผลผ่าตัด',
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
                                      _value3 = false;
                                    });
                                  },
                                  title: Text('1. แผลผ่าตัดบวมมาก'),
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
                                      _value3 = false;
                                    });
                                  },
                                  title:
                                      Text('2. มีสิ่งคัดหลั่งออกจากแผลผ่าตัด'),
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
                                  title: Text('3. แผลผ่าตัดแห้งดี'),
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
                                      _value3 = false;
                                    });
                                  },
                                  title: Text(
                                      '4. ไม่แน่ใจ ต้องการให้พยาบาลประเมินแผล'),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      '2. ความผิดปกติของการระบายสิ่งคัดหลั่ง',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600),
                                      textAlign: TextAlign.left,
                                    ),
                                  ],
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
                                  title:
                                      Text('1. ท่อระบายอยู่ในตำแหน่งเหมาะสม'),
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
                                  title: Text(
                                      '2. กระเปาะแบน หรือ หัวจุกสีแดงยุบตัวติดกันตลอดเวลา'),
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
                                    });
                                  },
                                  title: Text(
                                      '''3. มีสิ่งคัดหลั่งออกจากแผลรอบๆ ท่อระบาย หรือแผลบวมแดง'''),
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
                                    });
                                  },
                                  title: Text(
                                      '4. สีหรือปริมาณสิ่งคัดหลั่งผิดปกติไปจากเดิม'),
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
                                            alert(context);
                                          } else {
                                            Map<String, dynamic> formDataToDB =
                                                {
                                              'Choice1': _value1,
                                              'Choice2': _value2,
                                              'Choice3': _value3,
                                              'Choice4': _value4,
                                              'Choice5': _value5,
                                              'Choice6': _value6,
                                              'Choice7': _value7,
                                              'Choice8': _value8,
                                            };
                                            // var formId =
                                            //     await _firebaseService.addDataToFormsCollection(
                                            //         formName: 'Infection', data: formDataToDB);
                                            if (_value3 == true &&
                                                (_value5 || _value6 == true) &&
                                                _value7 == false &&
                                                _value8 == false) {
                                              result = "Pass";
                                            } else {
                                              result = "NoPass";
                                              //       var creation = _calculationService.formatDate(
                                              //           date: DateTime.now());
                                              //       var patientState = _anSubCollection['state'];
                                              //       _firebaseService.addNotification({
                                              //         'formName': 'Infection',
                                              //         'formId': formId,
                                              //         'userId':
                                              //             UserStore.getValueFromStore('storedUserId'),
                                              //         'creation': creation,
                                              //         'patientState': patientState,
                                              //         'seen': false,
                                              //       });
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
