import 'package:flutter/material.dart';

class NutritionForm extends StatefulWidget {
  // final String hn;
  // NutritionForm({Key key, @required this.hn}) : super(key: key);

  @override
  _NutritionFormState createState() => _NutritionFormState();
}

class _NutritionFormState extends State<NutritionForm> {
  var _value1;
  var _value2;
  var _value3;
  var _value4;
  String result;
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text("แบบประเมินการจัดการภาวะโภชนาการ ",
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
                                          'แบบประเมินการจัดการภาวะโภชนาการ ',
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
                                        '1. การจัดการภาวะโภชนาการ',
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
                                  child: Row(
                                    children: [
                                      Text(
                                        '1.1 การผายลมครั้งแรก',
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
                                        title: Text('มี'),
                                        value: 'มี',
                                        activeColor: Color(0xFFC37447),
                                        groupValue: _value1,
                                        onChanged: (value) {
                                          setState(() {
                                            _value1 = value;
                                            print('ผายลม $_value1');
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
                                        title: Text('ไม่มี'),
                                        value: 'ไม่มี',
                                        activeColor: Color(0xFFC37447),
                                        groupValue: _value1,
                                        onChanged: (value) {
                                          setState(() {
                                            _value1 = value;
                                            print('ผายลม $_value1');
                                          });
                                        }),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(40, 0, 20, 0),
                                  child: Row(
                                    children: [
                                      Text(
                                        '1.2 การเรอ',
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
                                        title: Text('มี'),
                                        value: 'มี',
                                        activeColor: Color(0xFFC37447),
                                        groupValue: _value2,
                                        onChanged: (value) {
                                          setState(() {
                                            _value2 = value;
                                            print('เรอ $_value2');
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
                                        title: Text('ไม่มี'),
                                        value: 'ไม่มี',
                                        activeColor: Color(0xFFC37447),
                                        groupValue: _value2,
                                        onChanged: (value) {
                                          setState(() {
                                            _value2 = value;
                                            print('เรอ $_value2');
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
                                        '2. การเคลื่อนไหวของลำไส้',
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
                                  child: Row(
                                    children: [
                                      Text(
                                        '2.1 ลุกนั่งบนเตียงอย่างน้อย 2 ชั่วโมง',
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
                                            print('ลุกนั่งบนเตียง $_value3');
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
                                            print('ลุกนั่งบนเตียง $_value3');
                                          });
                                        }),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(40, 0, 20, 0),
                                  child: Row(
                                    children: [
                                      Text(
                                        '2.2 เดินระยะทาง 5 เมตร',
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
                                                'เดินระยะทาง 5 เมตร $_value4');
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
                                                'เดินระยะทาง 5 เมตร $_value4');
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
                                          if (_value1 == null ||
                                              _value2 == null ||
                                              _value3 == null ||
                                              _value4 == null) {
                                            alert(context);
                                          } else {
                                            Map<String, dynamic> formDataToDB =
                                                {
                                              'Exercise1': _value1,
                                              'Exercise2': _value2,
                                              'Exercise3': _value3,
                                              'Exercise4': _value4,
                                            };
                                            // var formId =
                                            //   await _firebaseService.addDataToFormsCollection(
                                            //       formName: 'Nutrition', data: formDataToDB);
                                            if (_value1 == "มี" &&
                                                _value2 == "มี" &&
                                                _value3 == "ปฏิบัติ" &&
                                                _value4 == "ปฏิบัติ") {
                                              result = "Pass";
                                            } else {
                                              result = "NotPass";
                                              // var creation = _calculationService.formatDate(
                                              //   date: DateTime.now());
                                              // var patientState = _anSubCollection['state'];
                                              // _firebaseService.addNotification({
                                              // 'formName': 'Nutrition',
                                              // 'formId': formId,
                                              // 'userId':
                                              //     UserStore.getValueFromStore('storedUserId'),
                                              // 'creation': creation,
                                              // 'patientState': patientState,
                                              // 'seen': false,
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
