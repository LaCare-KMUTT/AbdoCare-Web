import 'dart:ui';
import 'package:flutter/material.dart';

class PatientListTable extends StatefulWidget {
  PatientListTable({Key key}) : super(key: key);
  @override
  _PatientListTableState createState() => _PatientListTableState();
}

class _PatientListTableState extends State<PatientListTable> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: ListView(children: <Widget>[
        Row(children: <Widget>[
          Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(50, 50, 50, 0),
                child: Container(
                  width: 180,
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7.0)),
                    textColor: Colors.black,
                    color: Color(0xFFDADADA),
                    padding: EdgeInsets.all(15),
                    child: Text('ลงทะเบียนผู้ป่วยใน',
                        style: TextStyle(fontSize: 16)),
                    onPressed: () {
                      print('This is add patient button');
                      setState(() {});
                      Navigator.pushNamed(context, '/addPatient_page');
                    },
                  ),
                ),
              )
            ],
          ),
          Expanded(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(50, 50, 50, 0),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Text(
                      'ค้นหาผู้ป่วย:',
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                  ),
                )
              ],
            ),
          ),
        ]),
        Padding(
          padding: const EdgeInsets.fromLTRB(40, 30, 40, 0),
          child: Card(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Text('HN'),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Text('ชื่อ-นามสกุล'),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Text('ขั้นตอนการรักษา'),
                          ],
                        ),
                      ),
                      Container(
                        width: 100,
                        child: Column(
                          children: [
                            Text(' '),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    color: Colors.grey[300],
                    height: 20,
                    thickness: 1,
                    indent: 0,
                    endIndent: 0,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Text('HN5678'),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Text('นางสาว นกน้อย บินเก่ง'),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Text('Post-op@Hospital'),
                          ],
                        ),
                      ),
                      Container(
                        child: Container(
                          width: 100,
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(7.0)),
                            textColor: Colors.white,
                            color: Color(0xFFF69E51),
                            child:
                                Text('แก้ไข', style: TextStyle(fontSize: 16)),
                            onPressed: () {
                              print('This is edit patient button');
                              setState(() {});
                              Navigator.pushNamed(context, '/addPatient_page');
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ]),
    ));
  }
}
