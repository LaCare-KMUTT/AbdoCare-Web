import 'package:flutter/material.dart';

class DashboardDetail extends StatefulWidget {
  DashboardDetail({Key key}) : super(key: key);
  @override
  _DashboardDetailState createState() => _DashboardDetailState();
}

class _DashboardDetailState extends State<DashboardDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(40, 30, 40, 0),
          child: Card(
            child: Column(
              children: [
                Text(
                  'ข้อมูลการรักษา',
                  style: TextStyle(color: Color(0xFFC37447)),
                ),
                Row(
                  children: [
                    Text(
                      'ชื่อ-นามสกุล',
                      style: TextStyle(color: Color(0xFFC37447)),
                    ),
                    Text(
                      'เพศ',
                      style: TextStyle(color: Color(0xFFC37447)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    ));
  }
}
