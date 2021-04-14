import 'package:flutter/material.dart';
import 'dart:ui';

class PostHomePatientDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
                    child: Text(
                      'ข้อมูลผู้ป่วย',
                      style: TextStyle(fontSize: 18, color: Color(0xFFC37447)),
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                          minWidth: constraints.minWidth,
                          minHeight: constraints.minHeight),
                      child: IntrinsicWidth(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                                child: Text('ผู้ป่วย:',
                                    textAlign: TextAlign.start),
                              ),
                            ),
                            Container(
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                    child: Container(
                                      margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                                      child: Text(
                                        'ชื่อ-นามสกุล:',
                                        textAlign: TextAlign.end,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                                      child: Text('วริศรา จิ๋วประดิษฐ์กุล'),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                                      child: Text('เพศ:',
                                          textAlign: TextAlign.end),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                                      child: Text('หญิง'),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                                      child: Text('อายุ:',
                                          textAlign: TextAlign.end),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                                      child: Text('25'),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                                      child: Text('วัน/เดือน/ปีเกิด:',
                                          textAlign: TextAlign.end),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                                      child: Text('13/01/1997'),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                    flex: 1,
                                    child: Container(
                                      margin:
                                          EdgeInsets.fromLTRB(100, 10, 0, 0),
                                      child: Text('เบอร์โทร:',
                                          textAlign: TextAlign.end),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Container(
                                      margin: EdgeInsets.fromLTRB(20, 10, 0, 0),
                                      child: Text('089-9876866'),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Container(
                                      margin: EdgeInsets.fromLTRB(20, 10, 0, 0),
                                      child: Text('น้ำหนัก:',
                                          textAlign: TextAlign.end),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Container(
                                      margin: EdgeInsets.fromLTRB(20, 10, 0, 0),
                                      child: Text('60'),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Container(
                                      margin: EdgeInsets.fromLTRB(20, 10, 0, 0),
                                      child: Text('ส่วนสูง:',
                                          textAlign: TextAlign.end),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Container(
                                      margin: EdgeInsets.fromLTRB(20, 10, 0, 0),
                                      child: Text('167'),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Container(
                                      margin: EdgeInsets.fromLTRB(20, 10, 0, 0),
                                      child: Text('%BWL:',
                                          textAlign: TextAlign.end),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Container(
                                      margin: EdgeInsets.fromLTRB(20, 10, 0, 0),
                                      child: Text('76'),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                    flex: 1,
                                    child: Container(
                                      margin: EdgeInsets.fromLTRB(50, 10, 0, 0),
                                      child: Text('ที่อยู่:',
                                          textAlign: TextAlign.end),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 7,
                                    child: Container(
                                      margin: EdgeInsets.fromLTRB(20, 10, 0, 0),
                                      child: Text(
                                        '347 หมู่บ้านวรารมย์ ซอยประชาอุทิศ98 ถนนประชาอุทิศ เขตทุ่งครุ แขวงทุ่งครุ 10140 กทม',
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                    child: Container(
                                      margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                                      child: Text('ผู้ดูแล:',
                                          textAlign: TextAlign.start),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                    flex: 1,
                                    child: Container(
                                      margin: EdgeInsets.only(left: 50),
                                      child: Text('ชื่อ-นามสกุล:',
                                          textAlign: TextAlign.end),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Container(
                                      margin: EdgeInsets.only(left: 20),
                                      child: Text('นางสาวพรพิมล แก้วใส'),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Container(
                                      width: 100,
                                      margin: EdgeInsets.only(left: 55),
                                      child: Text('เบอร์โทร:',
                                          textAlign: TextAlign.end),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Container(
                                      margin: EdgeInsets.only(left: 20),
                                      child: Text('087-8876543'),
                                    ),
                                  ),
                                  Expanded(flex: 4, child: SizedBox())
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 20, 0, 20),
                    child: Text(
                      'ข้อมูลการรักษา',
                      style: TextStyle(fontSize: 18, color: Color(0xFFC37447)),
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                          minWidth: constraints.minWidth,
                          minHeight: constraints.minHeight),
                      child: IntrinsicWidth(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: <Widget>[
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                                    child: Text('ขั้นตอนการรักษา:',
                                        textAlign: TextAlign.end),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Container(
                                    margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                                    child: Text('Post-Operation@Home'),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                                    child:
                                        Text('HN:', textAlign: TextAlign.end),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Container(
                                    margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                                    child: Text('HN1233'),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                                    child:
                                        Text('AN:', textAlign: TextAlign.end),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Container(
                                    margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                                    child: Text('AN2344'),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    margin: EdgeInsets.fromLTRB(20, 10, 0, 0),
                                    child: Text('วันที่รับการรักษา:',
                                        textAlign: TextAlign.end),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Container(
                                    margin: EdgeInsets.fromLTRB(20, 10, 0, 0),
                                    child: Text('12/03/2562'),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    margin: EdgeInsets.fromLTRB(20, 10, 0, 0),
                                    child: Text('ชื่อการผ่าตัด:',
                                        textAlign: TextAlign.end),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Container(
                                    margin: EdgeInsets.fromLTRB(20, 10, 0, 0),
                                    child: Text('ผ่าตัดนิ่วในถุงน้ำดี'),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    margin: EdgeInsets.fromLTRB(20, 10, 0, 0),
                                    child: Text('วิธีการผ่าตัด:',
                                        textAlign: TextAlign.end),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Container(
                                    margin: EdgeInsets.fromLTRB(20, 10, 0, 0),
                                    child: Text('LAP+Operation'),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    margin: EdgeInsets.fromLTRB(0, 10, 0, 20),
                                    child: Text('ASA Class:',
                                        textAlign: TextAlign.end),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Container(
                                      margin:
                                          EdgeInsets.fromLTRB(20, 10, 0, 20),
                                      child: Text('3')),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    margin: EdgeInsets.fromLTRB(0, 10, 0, 20),
                                    child: Text('โรคร่วม:',
                                        textAlign: TextAlign.end),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Container(
                                    margin: EdgeInsets.fromLTRB(20, 10, 0, 20),
                                    child: Text('ความดันสูง, เบาหวาน'),
                                  ),
                                ),
                                Expanded(flex: 3, child: SizedBox(width: 0)),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
