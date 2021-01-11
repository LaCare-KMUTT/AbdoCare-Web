import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_rounded_date_picker/rounded_picker.dart';
import 'package:buddhist_datetime_dateformat/buddhist_datetime_dateformat.dart';

class AddAppointmentPage extends StatefulWidget {
  AddAppointmentPage({Key key}) : super(key: key);
  @override
  _AddAppointmentPageState createState() => _AddAppointmentPageState();
}

class _AddAppointmentPageState extends State<AddAppointmentPage> {
  final _formKey = GlobalKey<FormState>();
  TimeOfDay _time = TimeOfDay.now();

  DateTime _date = DateTime.now();
  var customFormat = DateFormat.yMMMMEEEEd('th');

  Future<void> _selectDate(BuildContext context) async {
    final DateTime pickedDate = await showRoundedDatePicker(
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
    if (pickedDate != null && pickedDate != _date)
      setState(() {
        _date = pickedDate;
        print(_date);
      });
  }

  Future<Null> _selectTime(BuildContext context) async {
    TimeOfDay pickedTime = await showTimePicker(
      context: context,
      initialEntryMode: TimePickerEntryMode.input,
      initialTime: _time,
      builder: (BuildContext context, Widget child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
          child: Localizations.override(
            context: context,
            locale: Locale('th'),
            child: child,
          ),
        );
      },
    );
    if (pickedTime != null && pickedTime != _time)
      setState(() {
        _time = pickedTime;

        print(_time);
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
    return RaisedButton(
      color: Colors.lightGreen,
      textColor: Colors.white,
      padding: EdgeInsets.all(15),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7.0)),
      onPressed: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                content: Container(
                  width: 500,
                  child: ListView(
                    shrinkWrap: true,
                    children: [
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
                          Form(
                            key: _formKey,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text('เพิ่มวันนัด',
                                          style: TextStyle(
                                              fontSize: 24,
                                              color: Color(0xFFC37447))),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(20, 8, 20, 8),
                                  child: Row(
                                    children: [
                                      Container(
                                        child: Column(
                                          children: [
                                            Text('HN'),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        flex: 2,
                                        child: Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              20, 8, 20, 8),
                                          child: TextFormField(
                                            decoration: InputDecoration(
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.black26,
                                                    width: 1),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        child: Column(
                                          children: [
                                            Text('AN'),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        flex: 2,
                                        child: Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              20, 8, 20, 8),
                                          child: TextFormField(
                                            decoration: InputDecoration(
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.black26,
                                                    width: 1),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(20, 8, 20, 8),
                                  child: Row(
                                    children: <Widget>[
                                      Container(
                                        child: Column(
                                          children: [
                                            Text('วันที่'),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        flex: 2,
                                        child: Container(
                                          padding: const EdgeInsets.fromLTRB(
                                              20, 0, 20, 0),
                                          child: Center(
                                            child: Text(
                                              "${customFormat.formatInBuddhistCalendarThai(_date)}",
                                              style: TextStyle(
                                                  color: Color(0xFFC37447)),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            8, 0, 8, 0),
                                        child: Container(
                                          child: IconButton(
                                            icon: Icon(Icons.calendar_today),
                                            onPressed: () {
                                              FocusScope.of(context)
                                                  .requestFocus(
                                                      new FocusNode());
                                              _selectDate(context);
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(20, 8, 20, 8),
                                  child: Row(
                                    children: [
                                      Container(
                                        child: Column(
                                          children: [
                                            Text('เวลา'),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        flex: 2,
                                        child: Container(
                                          padding: const EdgeInsets.fromLTRB(
                                              20, 8, 20, 8),
                                          child: Center(
                                            child: Text(
                                              "${_time.hour.toString().padLeft(2, '0')}:${_time.minute.toString().padLeft(2, '0')} น.",
                                              style: TextStyle(
                                                  color: Color(0xFFC37447)),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            8, 8, 8, 8),
                                        child: Container(
                                          child: IconButton(
                                            icon: Icon(Icons.access_time),
                                            onPressed: () {
                                              FocusScope.of(context)
                                                  .requestFocus(
                                                      new FocusNode());
                                              _selectTime(context);
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(20, 8, 20, 0),
                                  child: Row(
                                    children: [
                                      Container(
                                        child: Column(
                                          children: [
                                            Text('สาเหตุที่นัดหมาย'),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(20, 0, 20, 0),
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.black26, width: 1),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(20, 8, 20, 0),
                                  child: Row(
                                    children: [
                                      Container(
                                        child: Column(
                                          children: [
                                            Text('การเตรียมความพร้อม'),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(20, 0, 20, 0),
                                  child: TextFormField(
                                    keyboardType: TextInputType.multiline,
                                    maxLines: null,
                                    decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.black26, width: 1),
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 20),
                                    child: RaisedButton(
                                      child: Text("ยืนยัน"),
                                      onPressed: () {
                                        if (_formKey.currentState.validate()) {
                                          _formKey.currentState.save();
                                        }
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            });
      },
      child: Text("เพิ่มนัด", style: TextStyle(fontSize: 16)),
    );
  }
}
