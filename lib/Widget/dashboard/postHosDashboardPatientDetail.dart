import 'package:flutter/material.dart';
import 'dart:ui';

class PostHosPatientDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Container(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                  minWidth: constraints.minWidth,
                  minHeight: constraints.minHeight),
              child: IntrinsicWidth(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    child: Card(
                      child: Container(
                        margin: EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
                              child: Text(
                                'ข้อมูลส่วนตัว',
                                style: TextStyle(
                                    fontSize: 18, color: Color(0xFFC37447)),
                              ),
                            ),
                            Row(
                              children: <Widget>[
                                Expanded(
                                  child: Container(
                                    width: 100,
                                    margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                                    child: Text('ผู้ป่วย:',
                                        textAlign: TextAlign.start),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Expanded(
                                  child: Container(
                                    width: 100,
                                    margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                                    child: Text(
                                      'ชื่อ-นามสกุล:',
                                      textAlign: TextAlign.end,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    width: 200,
                                    margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                                    child: Text('วริศรา จิ๋วประดิษฐ์กุล'),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    width: 100,
                                    margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                                    child:
                                        Text('เพศ:', textAlign: TextAlign.end),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    width: 200,
                                    margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                                    child: Text('หญิง'),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    width: 100,
                                    margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                                    child:
                                        Text('อายุ:', textAlign: TextAlign.end),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    width: 200,
                                    margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                                    child: Text('25'),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    width: 100,
                                    margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                                    child: Text('วัน/เดือน/ปีเกิด:',
                                        textAlign: TextAlign.end),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    width: 200,
                                    margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                                    child: Text('13/01/1997'),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Expanded(
                                  child: Container(
                                    width: 100,
                                    margin: EdgeInsets.fromLTRB(100, 10, 0, 0),
                                    child: Text('เบอร์โทร:',
                                        textAlign: TextAlign.end),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    width: 200,
                                    margin: EdgeInsets.fromLTRB(20, 10, 0, 0),
                                    child: Text('089-9876866'),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    width: 100,
                                    margin: EdgeInsets.fromLTRB(20, 10, 0, 0),
                                    child: Text('น้ำหนัก:',
                                        textAlign: TextAlign.end),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    width: 200,
                                    margin: EdgeInsets.fromLTRB(20, 10, 0, 0),
                                    child: Text('60'),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    width: 100,
                                    margin: EdgeInsets.fromLTRB(20, 10, 0, 0),
                                    child: Text('ส่วนสูง:',
                                        textAlign: TextAlign.end),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    width: 200,
                                    margin: EdgeInsets.fromLTRB(20, 10, 0, 0),
                                    child: Text('167'),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    width: 100,
                                    margin: EdgeInsets.fromLTRB(20, 10, 0, 0),
                                    child:
                                        Text('%BWL:', textAlign: TextAlign.end),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    width: 200,
                                    margin: EdgeInsets.fromLTRB(20, 10, 0, 0),
                                    child: Text('76'),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Flexible(
                                  child: Container(
                                    width: 100,
                                    margin: EdgeInsets.fromLTRB(50, 10, 0, 0),
                                    child: Text('ที่อยู่:',
                                        textAlign: TextAlign.end),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    margin: EdgeInsets.fromLTRB(20, 10, 0, 0),
                                    child: Text(
                                      '347 หมู่บ้านวรารมย์ ซอยประชาอุทิศ98 ถนนประชาอุทิศ เขตทุ่งครุ แขวงทุ่งครุ 10140 กทม',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Expanded(
                                  child: Container(
                                    width: 100,
                                    margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                                    child: Text('ผู้ดูแล:',
                                        textAlign: TextAlign.start),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Flexible(
                                  child: Container(
                                    width: 100,
                                    margin: EdgeInsets.only(left: 50),
                                    child: Text('ชื่อ-นามสกุล:',
                                        textAlign: TextAlign.end),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    width: 200,
                                    margin: EdgeInsets.only(left: 20),
                                    child: Text('นางสาวพรพิมล แก้วใส'),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    width: 100,
                                    margin: EdgeInsets.only(left: 55),
                                    child: Text('เบอร์โทร:',
                                        textAlign: TextAlign.end),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    width: 100,
                                    margin: EdgeInsets.only(left: 20),
                                    child: Text('087-8876543'),
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 20, 0, 20),
                              child: Text(
                                'ข้อมูลการรักษา',
                                style: TextStyle(
                                    fontSize: 18, color: Color(0xFFC37447)),
                              ),
                            ),
                            Row(
                              children: <Widget>[
                                Flexible(
                                  child: Container(
                                    width: 100,
                                    margin: EdgeInsets.fromLTRB(90, 0, 0, 0),
                                    child: Text('ขั้นตอนการรักษา:',
                                        textAlign: TextAlign.end),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    width: 200,
                                    margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                                    child: Text('Post-Operation@Hospital'),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    width: 100,
                                    margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                                    child:
                                        Text('HN:', textAlign: TextAlign.end),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    width: 200,
                                    margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                                    child: Text('HN1233'),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    width: 100,
                                    margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                                    child:
                                        Text('AN:', textAlign: TextAlign.end),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    width: 200,
                                    margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                                    child: Text('AN2344'),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Flexible(
                                  child: Container(
                                    width: 100,
                                    margin: EdgeInsets.fromLTRB(90, 10, 0, 0),
                                    child: Text('วันที่รับการรักษา:',
                                        textAlign: TextAlign.end),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    width: 200,
                                    margin: EdgeInsets.fromLTRB(20, 10, 0, 0),
                                    child: Text('12/03/2562'),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    width: 100,
                                    margin: EdgeInsets.fromLTRB(20, 10, 0, 0),
                                    child: Text('ชื่อการผ่าตัด:',
                                        textAlign: TextAlign.end),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    width: 200,
                                    margin: EdgeInsets.fromLTRB(20, 10, 0, 0),
                                    child: Text('ผ่าตัดนิ่วในถุงน้ำดี'),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    width: 100,
                                    margin: EdgeInsets.fromLTRB(20, 10, 0, 0),
                                    child: Text('วิธีการผ่าตัด:',
                                        textAlign: TextAlign.end),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    width: 200,
                                    margin: EdgeInsets.fromLTRB(20, 10, 0, 0),
                                    child: Text('LAP+Operation'),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Flexible(
                                  child: Container(
                                    width: 100,
                                    margin: EdgeInsets.fromLTRB(90, 10, 0, 0),
                                    child: Text('ASA Class:',
                                        textAlign: TextAlign.end),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    width: 200,
                                    margin: EdgeInsets.fromLTRB(20, 10, 0, 0),
                                    child: Text('3'),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    width: 100,
                                    margin: EdgeInsets.fromLTRB(20, 10, 0, 0),
                                    child: Text('โรคร่วม:',
                                        textAlign: TextAlign.end),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    width: 200,
                                    margin: EdgeInsets.fromLTRB(20, 10, 0, 0),
                                    child: Text('ความดันสูง, เบาหวาน'),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    width: 100,
                                    margin: EdgeInsets.fromLTRB(20, 10, 0, 0),
                                    child: Text('ระดับความรู้สึกตัว:',
                                        textAlign: TextAlign.end),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    width: 200,
                                    margin: EdgeInsets.fromLTRB(20, 10, 0, 0),
                                    child: Text('รู้สึกตัวดี'),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Flexible(
                                  child: Container(
                                    width: 100,
                                    margin: EdgeInsets.fromLTRB(90, 10, 0, 0),
                                    child: Text('อัตราชีพจร:',
                                        textAlign: TextAlign.end),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    width: 200,
                                    margin: EdgeInsets.fromLTRB(20, 10, 0, 0),
                                    child: Text('90 bpm'),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    width: 100,
                                    margin: EdgeInsets.fromLTRB(20, 10, 0, 0),
                                    child: Text('อัตราการหายใจ:',
                                        textAlign: TextAlign.end),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    width: 200,
                                    margin: EdgeInsets.fromLTRB(20, 10, 0, 0),
                                    child: Text('26 bpm'),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    width: 100,
                                    margin: EdgeInsets.fromLTRB(20, 10, 0, 0),
                                    child: Text('อุณหภูมิ:',
                                        textAlign: TextAlign.end),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    width: 200,
                                    margin: EdgeInsets.fromLTRB(20, 10, 0, 0),
                                    child: Text('37.8 °C'),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Flexible(
                                  child: Container(
                                    width: 100,
                                    margin: EdgeInsets.fromLTRB(90, 10, 0, 0),
                                    child: Text('ออกซิเจน:',
                                        textAlign: TextAlign.end),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    width: 200,
                                    margin: EdgeInsets.fromLTRB(20, 10, 0, 0),
                                    child: Text('99%'),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    width: 100,
                                    margin: EdgeInsets.fromLTRB(20, 10, 0, 0),
                                    child: Text('ความดัน:',
                                        textAlign: TextAlign.end),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    width: 200,
                                    margin: EdgeInsets.fromLTRB(20, 10, 0, 0),
                                    child: Text('120/80'),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    width: 100,
                                    margin: EdgeInsets.fromLTRB(20, 10, 0, 0),
                                    child: Text('ADL Score:',
                                        textAlign: TextAlign.end),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    width: 200,
                                    margin: EdgeInsets.fromLTRB(20, 10, 0, 0),
                                    child: Text('14'),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Flexible(
                                  child: Container(
                                    width: 100,
                                    margin: EdgeInsets.fromLTRB(90, 10, 0, 0),
                                    child: Text('หมายเลขห้อง:',
                                        textAlign: TextAlign.end),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    width: 200,
                                    margin: EdgeInsets.fromLTRB(20, 10, 0, 0),
                                    child: Text('7'),
                                  ),
                                ),
                                Flexible(
                                  child: Container(
                                    width: 100,
                                    margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                                    child: Text('หมายเลขเตียง:',
                                        textAlign: TextAlign.end),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    width: 200,
                                    margin: EdgeInsets.fromLTRB(20, 10, 0, 0),
                                    child: Text('1'),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
