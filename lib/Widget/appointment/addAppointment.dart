import 'package:AbdoCare_Web/Widget/shared/alert_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';
import 'package:intl/intl.dart';

import '../../services/interfaces/calculation_service_interface.dart';
import '../../services/interfaces/firebase_service_interface.dart';
import '../../services/service_locator.dart';
import '../material.dart';

class AddAppointmentPage extends StatefulWidget {
  AddAppointmentPage({Key key}) : super(key: key);
  @override
  _AddAppointmentPageState createState() => _AddAppointmentPageState();
}

class _AddAppointmentPageState extends State<AddAppointmentPage> {
  ICalculationService _calculationService = locator<ICalculationService>();
  IFirebaseService _firebaseService = locator<IFirebaseService>();
  final CustomMaterial _customMaterial = locator<CustomMaterial>();

  final _formKey = GlobalKey<FormState>();
  TimeOfDay _time = TimeOfDay.now();
  DateTime _date = DateTime.now();
  String _an = '';
  String _hn = '';
  String _reason = '';
  String _preparation = '';
  var formDateToShow;
  @override
  void initState() {
    super.initState();
    setState(() {
      formDateToShow = DateFormat('dd/MM/yyyy').format(_date);
      _date = _calculationService.formatDate(date: _date);
    });
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime pickedDate = await showRoundedDatePicker(
      context: context,
      locale: Locale('th', 'TH'),
      era: EraMode.BUDDHIST_YEAR,
      initialDate: DateTime.now(),
      firstDate: DateTime(DateTime.now().year - 10),
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
    if (pickedDate != null && pickedDate != _date)
      setState(() {
        _date = _calculationService.formatDate(date: pickedDate);
        print('date via addAppointment$_date');
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
            locale: Locale('th', 'TH'),
            child: child,
          ),
        );
      },
    );
    if (pickedTime != null && pickedTime != _time)
      setState(() {
        _time = pickedTime;
        print('Time via appoinment$_time');
      });
  }

  @override
  Widget build(BuildContext context) {
    final localizations = MaterialLocalizations.of(context);
    return ElevatedButton(
      child: Text("เพิ่มนัด", style: TextStyle(fontSize: 18)),
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7.0)),
        padding: EdgeInsets.all(15),
        onPrimary: Colors.white,
        primary: Colors.lightGreen,
      ),
      onPressed: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                content: Container(
                  width: 500,
                  child: ListView(
                    shrinkWrap: true,
                    children: <Widget>[
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
                                  children: <Widget>[
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
                                    children: <Widget>[
                                      Container(
                                        child: Column(
                                          children: <Widget>[
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  bottom: 25.0),
                                              child: Text(
                                                'HN',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyText2,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        flex: 2,
                                        child: Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              20, 8, 0, 8),
                                          child: TextFormField(
                                            maxLength: 7,
                                            inputFormatters: [
                                              FilteringTextInputFormatter.allow(
                                                  RegExp("[a-zA-Z0-9]"))
                                            ],
                                            decoration: InputDecoration(
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.black26,
                                                    width: 1),
                                              ),
                                            ),
                                            onSaved: (value) =>
                                                _hn = value.toUpperCase(),
                                            validator: (value) => value.isEmpty
                                                ? 'กรุณากรอกหมายเลขHN '
                                                : null,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 20),
                                        child: Container(
                                          child: Column(
                                            children: <Widget>[
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    bottom: 25.0),
                                                child: Text(
                                                  'AN',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyText2,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 2,
                                        child: Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              20, 8, 0, 8),
                                          child: TextFormField(
                                            maxLength: 7,
                                            inputFormatters: [
                                              FilteringTextInputFormatter.allow(
                                                  RegExp("[a-zA-Z0-9]"))
                                            ],
                                            decoration: InputDecoration(
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.black26,
                                                    width: 1),
                                              ),
                                            ),
                                            validator: (value) => value.isEmpty
                                                ? 'กรุณากรอกหมายเลขAN'
                                                : null,
                                            onSaved: (value) =>
                                                _an = value.toUpperCase(),
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
                                          children: <Widget>[
                                            Text(
                                              'วันที่',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyText2,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        flex: 2,
                                        child: Container(
                                          padding: const EdgeInsets.fromLTRB(
                                              20, 0, 20, 0),
                                          child: Center(
                                            child: Container(
                                              child: DateFormat('dd/MM/yyyy')
                                                          .format(_date) ==
                                                      formDateToShow
                                                  ? Text(
                                                      '${_calculationService.formatDateToThaiString(date: _date, isBuddhist: false)}',
                                                      style: TextStyle(
                                                          fontSize: 18,
                                                          color: Color(
                                                              0xFFC37447)))
                                                  : Text(
                                                      "${_calculationService.formatDateToThaiString(date: _date, isBuddhist: true)}",
                                                      style: TextStyle(
                                                          fontSize: 18,
                                                          color: Color(
                                                              0xFFC37447))),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            8, 0, 0, 0),
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
                                    children: <Widget>[
                                      Container(
                                        child: Column(
                                          children: <Widget>[
                                            Text(
                                              'เวลา',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyText2,
                                            ),
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
                                                  fontSize: 18,
                                                  color: Color(0xFFC37447)),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            8, 8, 0, 8),
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
                                    children: <Widget>[
                                      Container(
                                        child: Column(
                                          children: <Widget>[
                                            Text(
                                              'สาเหตุที่นัดหมาย',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyText2,
                                            ),
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
                                    validator: (value) => value.isEmpty
                                        ? 'กรุณากรอกสาเหตุที่นัดหมาย'
                                        : null,
                                    onSaved: (value) => _reason = value,
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(20, 8, 20, 0),
                                  child: Row(
                                    children: <Widget>[
                                      Container(
                                        child: Column(
                                          children: <Widget>[
                                            Text(
                                              'การเตรียมความพร้อม',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyText2,
                                            ),
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
                                    validator: (value) => value.isEmpty
                                        ? 'กรุณากรอกการเตรียมความพร้อม'
                                        : null,
                                    onSaved: (value) => _preparation = value,
                                  ),
                                ),
                                Container(
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 20),
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          padding: EdgeInsets.all(15)),
                                      child: Text(
                                        'ยืนยัน',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText2,
                                      ),
                                      onPressed: () {
                                        if (_formKey.currentState.validate()) {
                                          _formKey.currentState.save();
                                          Map<String, dynamic> dataToDB = {
                                            'hn': _hn,
                                            'an': _an,
                                            'date': _date,
                                            'time': localizations
                                                .formatTimeOfDay(_time,
                                                    alwaysUse24HourFormat:
                                                        true),
                                            'reason': _reason,
                                            'preparation': _preparation,
                                          };
                                          _firebaseService
                                              .addDocumentToCollection(
                                                  collection: 'Appointments',
                                                  docData: dataToDB);
                                          Navigator.popAndPushNamed(
                                              context, "/appointment_page");
                                        } else {
                                          Dialogs.alertToCompleteForm(context);
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
    );
  }
}
