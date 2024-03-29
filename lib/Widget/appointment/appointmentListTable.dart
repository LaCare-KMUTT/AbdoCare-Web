import 'dart:ui';

import 'package:AbdoCare_Web/Widget/shared/progress_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';

import '../../services/interfaces/calculation_service_interface.dart';
import '../../services/interfaces/firebase_service_interface.dart';
import '../../services/service_locator.dart';
import '../material.dart';
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
  final CustomMaterial _customMaterial = locator<CustomMaterial>();

  Future<DateTime> _selectDate(BuildContext context) async {
    final DateTime picked = await showRoundedDatePicker(
      context: context,
      locale: Locale('th', 'TH'),
      era: EraMode.BUDDHIST_YEAR,
      initialDate: DateTime.now(),
      firstDate: DateTime(DateTime.now().year - 200),
      lastDate: DateTime.now().add(Duration(days: 356)),
      theme: ThemeData(
          primarySwatch: _customMaterial.createMaterialColor(Color(0xFFC37447)),
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

  String hn = "";

  @override
  Widget build(BuildContext context) {
    var toShow = _calculationService.formatDateToThaiString(
        date: selectedDate, isBuddhist: false);
    var screenSize = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        body: Container(
          child: ListView(
            children: <Widget>[
              Row(children: <Widget>[
                Column(
                  children: <Widget>[
                    Container(
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(screenSize.height / 9,
                            screenSize.height / 20, screenSize.height / 70, 0),
                        child: Container(
                          width: 180,
                          child: AddAppointmentPage(),
                        ),
                      ),
                    )
                  ],
                ),
                Expanded(
                  flex: 3,
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.fromLTRB(screenSize.height / 7,
                            screenSize.height / 20, screenSize.height / 70, 0),
                        child: Align(
                          alignment: Alignment.topRight,
                          child: Text(
                            'ค้นหาผู้ป่วย:',
                            style: Theme.of(context).textTheme.bodyText2,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, screenSize.height / 20,
                            screenSize.height / 70, 0),
                        child: Container(
                          child: TextField(
                            decoration: InputDecoration(
                                isDense: true,
                                enabledBorder: const OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Colors.black26, width: 0.0)),
                                contentPadding: EdgeInsets.all(10.0),
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(7.0))),
                                prefixIcon: Icon(Icons.search),
                                hintText: 'HN'),
                            onChanged: (val) {
                              setState(() {
                                hn = val;
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(
                      0, screenSize.height / 20, screenSize.height / 9, 0),
                  child: Container(
                    child: ElevatedButton(
                      child: Text("ค้นหา", style: TextStyle(fontSize: 18)),
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.all(15),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7.0)),
                      ),
                      onPressed: () {
//TODO Add Search on appointmentListTable
                      },
                    ),
                  ),
                ),
              ]),
              Padding(
                padding: EdgeInsets.fromLTRB(screenSize.height / 10,
                    screenSize.height / 70, screenSize.height / 10, 0),
                child: Container(
                  child: Card(
                    child: Row(children: <Widget>[
                      Expanded(
                          flex: 1,
                          child: SizedBox(
                            width: 0,
                          )),
                      Expanded(
                        flex: 1,
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                              child: Align(
                                alignment: Alignment.centerLeft,
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
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                              child: Center(
                                child: Container(
                                  height: 50,
                                  width: double.infinity,
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      "$toShow",
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: Color(0xFFC37447)),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                              child: Align(
                                alignment: Alignment.centerRight,
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
                              ),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                              child: Align(
                                alignment: Alignment.centerLeft,
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
                padding: EdgeInsets.fromLTRB(
                    screenSize.height / 10, 0, screenSize.height / 10, 0),
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
                                children: <Widget>[
                                  Text('HN'),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Column(
                                children: <Widget>[
                                  Text('เวลา'),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Column(
                                children: <Widget>[
                                  Text('ชื่อ-นามสกุล'),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Column(
                                children: <Widget>[
                                  Text('ลักษณะแผลผ่าตัด'),
                                ],
                              ),
                            ),
                            Container(
                              child: SizedBox(
                                width: 100,
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
                  return Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: Row(
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
                          flex: 2,
                          child: Column(
                            children: <Widget>[
                              Text(
                                  '${user.data.docs.first['name']} ${user.data.docs.first['surname']}'),
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
                                        anSnapshot.data['operationMethod'] !=
                                                null
                                            ? Text(anSnapshot
                                                .data['operationMethod'])
                                            : Text('-'),
                                      ],
                                    );
                                  }),
                            ],
                          ),
                        ),
                        Container(
                          width: 100,
                          child: EditAppointmentPage(
                            appointmentId: appointment.id,
                          ),
                        ),
                      ],
                    ),
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
      return ProgressBar.circularProgressIndicator(context);
    }
  }
}
