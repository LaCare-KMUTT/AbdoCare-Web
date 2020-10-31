import 'package:flutter/material.dart';

class PatientRegisterForm extends StatefulWidget {
  @override
  _PatientRegisterFormState createState() => _PatientRegisterFormState();
}

class _PatientRegisterFormState extends State<PatientRegisterForm> {
  var _gender;
  var _name;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 50,
        ),
        Center(
          child: Text(
            'เพิ่มผู้ป่วย',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        Card(
          margin: EdgeInsets.all(80),
          child: Padding(
            padding: EdgeInsets.all(30),
            child: Container(
              height: 300,
              child: Column(
                // mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'ข้อมูลผู้ป่วย',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 15),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    child: Text(
                      'ข้อมูลส่วนตัว',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: 15),
                  Flexible(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40),
                      child: Form(
                        child: Row(
                          children: <Widget>[
                            Flexible(
                              child: Column(
                                children: <Widget>[
                                  Flexible(
                                    child: Row(
                                      children: <Widget>[
                                        Container(
                                          width: 100,
                                          child: Text('ชื่อ-นามสกุล'),
                                        ),
                                        SizedBox(width: 20),
                                        Flexible(
                                          child: TextFormField(
                                            decoration: InputDecoration(
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.black26,
                                                      width: 1),
                                                ),
                                                labelText: 'ชื่อ-นามสกุล'),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Flexible(
                                    child: Row(
                                      children: <Widget>[
                                        Container(
                                          width: 100,
                                          child: Text('ที่อยู่'),
                                        ),
                                        SizedBox(width: 20),
                                        Flexible(
                                          child: TextFormField(
                                            decoration: InputDecoration(
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.black26,
                                                      width: 1),
                                                ),
                                                labelText: 'ที่อยู่'),
                                            maxLines: 5,
                                            minLines: 1,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 50),
                            Flexible(
                              child: Column(
                                children: <Widget>[
                                  Flexible(
                                    child: Row(
                                      children: <Widget>[
                                        Container(
                                          width: 100,
                                          child: Text('เพศ'),
                                        ),
                                        Flexible(
                                          child: DropdownButtonFormField(
                                            decoration: InputDecoration(
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.black26,
                                                      width: 1),
                                                ),
                                                labelText: 'เพศ'),
                                            value: _gender,
                                            items: [
                                              'ชาย',
                                              'หญิง',
                                            ]
                                                .map(
                                                    (label) => DropdownMenuItem(
                                                          child: Text(label),
                                                          value: label,
                                                        ))
                                                .toList(),
                                            onChanged: (value) {
                                              setState(() {
                                                _gender = value;
                                              });
                                            },
                                          ),
                                        ),
                                        Container(
                                          width: 100,
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 15),
                                  Flexible(
                                    child: Row(
                                      children: <Widget>[
                                        Container(
                                          width: 100,
                                          child: Text('น้ำหนัก'),
                                        ),
                                        Flexible(
                                          child: TextFormField(
                                            decoration: InputDecoration(
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.black26,
                                                      width: 1),
                                                ),
                                                labelText: 'น้ำหนัก'),
                                          ),
                                        ),
                                        Container(
                                          width: 100,
                                          child: Text(
                                            'กิโลกรัม',
                                            textAlign: TextAlign.end,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 15),
                                  Flexible(
                                    child: Row(
                                      children: <Widget>[
                                        Container(
                                          width: 100,
                                          child: Text('เบอร์โทร'),
                                        ),
                                        Flexible(
                                          child: TextFormField(
                                            decoration: InputDecoration(
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.black26,
                                                      width: 1),
                                                ),
                                                labelText: 'เบอร์โทร'),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 50),
                            Flexible(
                              child: Column(
                                children: <Widget>[
                                  Flexible(
                                    child: Row(
                                      children: <Widget>[
                                        Container(
                                          width: 100,
                                          child: Text('วัน เดือน ปีเกิด'),
                                        ),
                                        Flexible(
                                          child: TextFormField(
                                            decoration: InputDecoration(
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.black26,
                                                      width: 1),
                                                ),
                                                labelText: 'วัน เดือน ปีเกิด'),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 15),
                                  Flexible(
                                    child: Row(
                                      children: <Widget>[
                                        Container(
                                          width: 100,
                                          child: Text('ส่วนสูง'),
                                        ),
                                        Flexible(
                                          child: TextFormField(
                                            decoration: InputDecoration(
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.black26,
                                                      width: 1),
                                                ),
                                                labelText: 'ส่วนสูง'),
                                          ),
                                        ),
                                        Container(
                                          width: 100,
                                          child: Text(
                                            'เซนติเมตร',
                                            textAlign: TextAlign.end,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
