import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_rounded_date_picker/rounded_picker.dart';

import '../../services/interfaces/calculation_service_interface.dart';
import '../../services/service_locator.dart';
import 'addAppointment.dart';

class AppointmentListTable extends StatefulWidget {
  AppointmentListTable({Key key}) : super(key: key);
  @override
  _AppointmentListTableState createState() => _AppointmentListTableState();
}

class _AppointmentListTableState extends State<AppointmentListTable> {
  DateTime selectedDate = DateTime.now();
  ICalculationService _calculationService = locator<ICalculationService>();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = await showRoundedDatePicker(
      context: context,
      locale: Locale('th', 'TH'),
      era: EraMode.BUDDHIST_YEAR,
      initialDate: DateTime.now(),
      firstDate: DateTime(DateTime.now().year - 10),
      lastDate: DateTime.now().add(Duration(days: 356)),
      theme: ThemeData(
          primarySwatch: createMaterialColor(Color(0xFFC37447)),
          fontFamily: "Prompt"),
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

  MaterialColor createMaterialColor(Color color) {
    List strengths = <double>[.05];
    Map swatch = <int, Color>{};
    final int r = color.red, g = color.green, b = color.blue;

    for (int i = 1; i < 10; i++) {
      strengths.add(0.1 * i);
    }
    strengths.forEach((strength) {
      final double ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    });
    return MaterialColor(color.value, swatch);
  }

  @override
  Widget build(BuildContext context) {
    var toShow = _calculationService.formatDateToThaiString(date: selectedDate);
    return Scaffold(
      body: Container(
        child: ListView(
          children: <Widget>[
            Row(children: <Widget>[
              Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(105, 50, 100, 0),
                    child: Container(
                      width: 100,
                      child: AddAppointmentPage(),
                    ),
                  )
                ],
              ),
              Expanded(
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(100, 50, 100, 0),
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
                  padding: const EdgeInsets.fromLTRB(100, 10, 100, 0),
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
              padding: const EdgeInsets.fromLTRB(100, 0, 100, 0),
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
