import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_rounded_date_picker/rounded_picker.dart';
import 'package:buddhist_datetime_dateformat/buddhist_datetime_dateformat.dart';
import 'package:flutter_rounded_date_picker/src/material_rounded_date_picker_style.dart';
import '../Widget/addAppointment.dart';

Map<int, Color> color = {
  50: Color.fromRGBO(136, 14, 79, .1),
  100: Color.fromRGBO(136, 14, 79, .2),
  200: Color.fromRGBO(136, 14, 79, .3),
  300: Color.fromRGBO(136, 14, 79, .4),
  400: Color.fromRGBO(136, 14, 79, .5),
  500: Color.fromRGBO(136, 14, 79, .6),
  600: Color.fromRGBO(136, 14, 79, .7),
  700: Color.fromRGBO(136, 14, 79, .8),
  800: Color.fromRGBO(136, 14, 79, .9),
  900: Color.fromRGBO(136, 14, 79, 1),
};

class AppointmentListTable extends StatefulWidget {
  AppointmentListTable({Key key}) : super(key: key);
  @override
  _AppointmentListTableState createState() => _AppointmentListTableState();
}

class _AppointmentListTableState extends State<AppointmentListTable> {
  DateTime selectedDate = DateTime.now();
  var customFormat = DateFormat.yMMMMEEEEd('th');
  MaterialColor colorCustom = MaterialColor(0xFFC37447, color);
  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = await showRoundedDatePicker(
      context: context,
      locale: Locale('th', 'TH'),
      era: EraMode.BUDDHIST_YEAR,
      initialDate: DateTime.now(),
      firstDate: DateTime(DateTime.now().year - 10),
      lastDate: DateTime.now().add(Duration(days: 356)),
      //errorFormatText: 'ใส่วันที่ไม่ถูกต้อง กรุณาตรวจสอบและลองใหม่อีกครั้ง',
      // fieldHintText: 'วัน/เดือน/ปี',
      theme: ThemeData(primarySwatch: colorCustom, fontFamily: "Prompt"),
      height: 320,
      styleDatePicker: MaterialRoundedDatePickerStyle(
        paddingDatePicker: EdgeInsets.all(0),
        paddingMonthHeader: EdgeInsets.all(20),
        paddingActionBar: EdgeInsets.all(16),
        backgroundHeaderMonth: Colors.grey[300],
        textStyleCurrentDayOnCalendar:
            TextStyle(color: Color(0xFFC37447), fontWeight: FontWeight.bold),
        decorationDateSelected:
            BoxDecoration(color: Colors.orange[600], shape: BoxShape.circle),
      ),
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
        print(selectedDate);
      });
  }

  @override
  Widget build(BuildContext context) {
    var toShow = customFormat.formatInBuddhistCalendarThai(selectedDate);
    return Scaffold(
      body: Container(
        child: ListView(
          children: <Widget>[
            Row(children: <Widget>[
              Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(50, 50, 50, 0),
                    child: Container(
                      width: 200,
                      child: AddAppointmentPage(),
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
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(40, 10, 40, 0),
                  child: Card(
                    child: Column(
                      children: <Widget>[
                        Container(
                          height: 50,
                          width: double.infinity,
                          child: RaisedButton(
                            color: Colors.white,
                            onPressed: () {
                              _selectDate(context);
                            },
                            child: Text(
                              "$toShow",
                              style: TextStyle(
                                  fontSize: 17, color: Color(0xFFC37447)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(40, 0, 40, 0),
              child: Card(
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Column(
                              children: [
                                Text('HN'),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Column(
                              children: [
                                Text('เวลา'),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Column(
                              children: [
                                Text('ชื่อ-นามสกุล'),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Column(
                              children: [
                                Text('ลักษณะแผลผ่าตัด'),
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
                            flex: 1,
                            child: Column(
                              children: [
                                Text('HN5678'),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Column(
                              children: [
                                Text('09.00'),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Column(
                              children: [
                                Text('นางสาว นกน้อย บินเก่ง'),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Column(
                              children: [
                                Text('LAP+Operation'),
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
                                child: Text('แก้ไข',
                                    style: TextStyle(fontSize: 16)),
                                onPressed: () {
                                  print('This is edit patient button');
                                  setState(() {});
                                  Navigator.pushNamed(
                                      context, '/editAppointment_page');
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
          ],
        ),
      ),
    );
  }
}
