import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rounded_date_picker/rounded_picker.dart';

import '../../services/interfaces/calculation_service_interface.dart';
import '../../services/interfaces/firebase_service_interface.dart';
import '../../services/service_locator.dart';
import 'addAppointment.dart';
import 'editAppointment.dart';

class AppointmentListTable extends StatefulWidget {
  AppointmentListTable({Key key}) : super(key: key);
  @override
  _AppointmentListTableState createState() => _AppointmentListTableState();
}

class _AppointmentListTableState extends State<AppointmentListTable> {
  DateTime selectedDate = DateTime.now();
  DateTime yesterday;
  ICalculationService _calculationService = locator<ICalculationService>();
  IFirebaseService _firebaseService = locator<IFirebaseService>();

  Future<DateTime> _selectDate(BuildContext context) async {
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
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        print(selectedDate);
      });
    }
    return selectedDate;
  }

  Future<DateTime> _yesterdayDate(BuildContext context) async {
    final DateTime yesterday = selectedDate.subtract(Duration(days: 1));
    if (yesterday != null && yesterday != selectedDate) {
      setState(() {
        selectedDate = yesterday;
        print(selectedDate);
      });
    }
    return selectedDate;
  }

  Future<DateTime> _tomorrowDate(BuildContext context) async {
    final DateTime tomorrow = selectedDate.add(Duration(days: 1));
    if (tomorrow != null && tomorrow != selectedDate) {
      setState(() {
        selectedDate = tomorrow;
        print(selectedDate);
      });
    }
    return selectedDate;
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
            Padding(
              padding: const EdgeInsets.fromLTRB(100, 10, 100, 0),
              child: Container(
                child: Card(
                  child: Row(children: <Widget>[
                    Container(
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.fromLTRB(400, 0, 0, 0),
                            child: Container(
                              height: 50,
                              width: 50,
                              child: IconButton(
                                icon: Icon(
                                  Icons.chevron_left,
                                  size: 30,
                                ),
                                color: Color(0xFFC37447),
                                onPressed: () {
                                  _yesterdayDate(context);
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Flexible(
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                            child: Container(
                              height: 50,
                              width: double.infinity,
                              child: Center(
                                child: Text(
                                  "$toShow",
                                  style: TextStyle(
                                      fontSize: 18, color: Color(0xFFC37447)),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                            child: Container(
                              height: 50,
                              width: 50,
                              child: IconButton(
                                icon: Icon(
                                  Icons.chevron_right,
                                  size: 30,
                                ),
                                color: Color(0xFFC37447),
                                onPressed: () {
                                  _tomorrowDate(context);
                                },
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 350, 0),
                            child: Container(
                              height: 50,
                              width: 50,
                              child: IconButton(
                                icon: Icon(Icons.calendar_today),
                                color: Color(0xFFC37447),
                                onPressed: () {
                                  _selectDate(context);
                                },
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ]),
                ),
              ),
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
                      FutureBuilder<List<QueryDocumentSnapshot>>(
                          future: _firebaseService.getAppointmentList(
                              currentDate: selectedDate),
                          builder: buildAppointmentList),
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

  Widget buildAppointmentList(BuildContext context,
      AsyncSnapshot<List<QueryDocumentSnapshot>> snapshot) {
    if (snapshot.hasData) {
      return ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: snapshot.data.length,
        itemBuilder: (context, index) {
          DocumentSnapshot appointment = snapshot.data[index];
          return FutureBuilder<QuerySnapshot>(
              future: _firebaseService.searchDocumentByField(
                  collection: 'Users',
                  field: 'hn',
                  fieldValue: appointment.get('hn')),
              builder: (context, user) {
                if (!user.hasData) {
                  return Text('Cannot find hn');
                } else {
                  return Row(
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Column(
                          children: <Widget>[
                            Text('${appointment.get('hn')}'),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Column(
                          children: <Widget>[
                            Text('${appointment.get('time')}'),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Column(
                          children: <Widget>[
                            Text(
                                '${user.data.docs.first.data()['name']} ${user.data.docs.first.data()['surname']}'),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Column(
                          children: <Widget>[
                            FutureBuilder<Map<String, dynamic>>(
                                future:
                                    _firebaseService.getLatestAnSubCollection(
                                        docId: user.data.docs.first.id),
                                builder: (context, anSnapshot) {
                                  if (!anSnapshot.hasData) {
                                    return Text('loading...');
                                  }
                                  return Column(
                                    children: <Widget>[
                                      anSnapshot.data['operationMethod'] != null
                                          ? Text(anSnapshot
                                              .data['operationMethod'])
                                          : Text('-'),
                                    ],
                                  );
                                }),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Column(
                          children: <Widget>[
                            Text('LAP+Operation'),
                          ],
                        ),
                      ),
                      Container(
                        child: Container(
                          width: 100,
                          child: EditAppointmentPage(),
                        ),
                      ),
                    ],
                  );
                }
              });
        },
      );
    } else if (snapshot.connectionState == ConnectionState.done &&
        !snapshot.hasData) {
      return Center(
        child: Text("No appointment found."),
      );
    } else {
      return CircularProgressIndicator();
    }
  }
}
