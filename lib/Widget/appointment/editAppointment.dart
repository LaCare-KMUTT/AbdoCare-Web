import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rounded_date_picker/rounded_picker.dart';

import '../../services/interfaces/calculation_service_interface.dart';
import '../../services/interfaces/firebase_service_interface.dart';
import '../../services/service_locator.dart';
import '../customMaterial.dart';

class EditAppointmentPage extends StatefulWidget {
  final String appointmentId;
  EditAppointmentPage({
    Key key,
    @required this.appointmentId,
  }) : super(key: key);
  @override
  _EditAppointmentPageState createState() =>
      _EditAppointmentPageState(appointmentId: appointmentId);
}

class _EditAppointmentPageState extends State<EditAppointmentPage> {
  String appointmentId;
  _EditAppointmentPageState({@required this.appointmentId});
  IFirebaseService _firebaseService = locator<IFirebaseService>();
  ICalculationService _calculationService = locator<ICalculationService>();
  final CustomMaterial _customMaterial = locator<CustomMaterial>();

  String _an = '';
  String _hn = '';
  String _reason = '';
  String _preparation = '';

  final _formKey = GlobalKey<FormState>();
  TimeOfDay _time;

  DateTime _date;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime pickedDate = await showRoundedDatePicker(
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
    if (pickedDate != null && pickedDate != _date)
      setState(() {
        _date = _calculationService.formatDate(date: pickedDate);
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
      });
  }

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7.0)),
      textColor: Colors.white,
      color: Color(0xFFF69E51),
      child: Text('แก้ไข', style: TextStyle(fontSize: 18)),
      onPressed: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return FutureBuilder<DocumentSnapshot>(
                  future: _firebaseService.searchDocumentByDocId(
                      collection: 'Appointments', docId: appointmentId),
                  builder: (context, appointment) {
                    if (!appointment.hasData) {
                      print('appointment $appointmentId doesn\'t have data');
                      return Center(
                          heightFactor: 1,
                          widthFactor: 1,
                          child: SizedBox(
                            child: CircularProgressIndicator(
                              strokeWidth: 4,
                            ),
                          ));
                    }
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
                                            child: Text('แก้ไขวันนัด',
                                                style: TextStyle(
                                                    fontSize: 24,
                                                    color: Color(0xFFC37447))),
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            20, 8, 20, 8),
                                        child: Row(
                                          children: <Widget>[
                                            Container(
                                              child: Column(
                                                children: <Widget>[
                                                  Text(
                                                    'HN',
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodyText2,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Expanded(
                                              flex: 2,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        20, 8, 0, 8),
                                                child: TextFormField(
                                                  decoration: InputDecoration(
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: Colors.black26,
                                                          width: 1),
                                                    ),
                                                  ),
                                                  initialValue: appointment.data
                                                      .get('hn'),
                                                  onSaved: (value) =>
                                                      _hn = value.toUpperCase(),
                                                  validator: (value) =>
                                                      value.isEmpty
                                                          ? 'กรุณากรอกหมายเลขHN'
                                                          : null,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 20),
                                              child: Container(
                                                child: Column(
                                                  children: <Widget>[
                                                    Text(
                                                      'AN',
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyText2,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 2,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        20, 8, 0, 8),
                                                child: TextFormField(
                                                  decoration: InputDecoration(
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: Colors.black26,
                                                          width: 1),
                                                    ),
                                                  ),
                                                  initialValue: appointment.data
                                                      .get('an'),
                                                  validator: (value) =>
                                                      value.isEmpty
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
                                        padding: const EdgeInsets.fromLTRB(
                                            20, 8, 20, 8),
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
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        20, 0, 20, 0),
                                                child: Center(
                                                  child:
                                                      dateHandler(appointment),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      8, 0, 0, 0),
                                              child: Container(
                                                child: IconButton(
                                                  icon: Icon(
                                                      Icons.calendar_today),
                                                  onPressed: () {
                                                    FocusScope.of(context)
                                                        .requestFocus(
                                                            new FocusNode());
                                                    _selectDate(
                                                      context,
                                                    );
                                                  },
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            20, 8, 20, 8),
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
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        20, 8, 20, 8),
                                                child: Center(
                                                  child:
                                                      timeHandler(appointment),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
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
                                        padding: const EdgeInsets.fromLTRB(
                                            20, 8, 20, 0),
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
                                        padding: const EdgeInsets.fromLTRB(
                                            20, 0, 20, 0),
                                        child: TextFormField(
                                          decoration: InputDecoration(
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.black26,
                                                  width: 1),
                                            ),
                                          ),
                                          initialValue:
                                              appointment.data.get('reason'),
                                          validator: (value) => value.isEmpty
                                              ? 'กรุณากรอกสาเหตุที่นัดหมาย'
                                              : null,
                                          onSaved: (value) => _reason = value,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            20, 8, 20, 0),
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
                                        padding: const EdgeInsets.fromLTRB(
                                            20, 0, 20, 0),
                                        child: TextFormField(
                                          keyboardType: TextInputType.multiline,
                                          maxLines: null,
                                          decoration: InputDecoration(
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.black26,
                                                  width: 1),
                                            ),
                                          ),
                                          initialValue: appointment.data
                                              .get('preparation'),
                                          validator: (value) => value.isEmpty
                                              ? 'กรุณากรอกการเตรียมความพร้อม'
                                              : null,
                                          onSaved: (value) =>
                                              _preparation = value,
                                        ),
                                      ),
                                      Container(
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(top: 20),
                                          child: RaisedButton(
                                            padding: EdgeInsets.all(15),
                                            child: Text(
                                              'ยืนยัน',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyText2,
                                            ),
                                            onPressed: () {
                                              if (_formKey.currentState
                                                  .validate()) {
                                                _formKey.currentState.save();
                                                Map<String, dynamic> dataToDB =
                                                    {
                                                  'hn': _hn,
                                                  'an': _an,
                                                  'date': _date,
                                                  'time': _time
                                                      .toString()
                                                      .substring(10, 15),
                                                  'reason': _reason,
                                                  'preparation': _preparation,
                                                };
                                                print(dataToDB);
                                                _firebaseService
                                                    .updateDataToCollectionField(
                                                        collection:
                                                            'Appointments',
                                                        docId: appointmentId,
                                                        data: dataToDB);
                                                Navigator.pushNamed(context,
                                                    '/appointment_page');
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
            });
      },
    );
  }

  Widget timeHandler(AsyncSnapshot<DocumentSnapshot> appointment) {
    if (_time == null) {
      var time = appointment.data.get('time');
      _time = TimeOfDay(
          hour: int.parse(time.split(":")[0]),
          minute: int.parse(time.split(":")[1]));
      return Text('$time น.');
    } else {
      return Text(
        "${_time.hour.toString().padLeft(2, '0')}:${_time.minute.toString().padLeft(2, '0')} น.",
        style: TextStyle(fontSize: 18, color: Color(0xFFC37447)),
      );
    }
  }

  Widget dateHandler(AsyncSnapshot<DocumentSnapshot> appointment) {
    if (_date == null) {
      var date = appointment.data.get('date').toDate();
      _date = date;
      return Text(
        "${_calculationService.formatDateToThaiString(date: date, isBuddhist: true)}",
        style: TextStyle(
          fontSize: 18,
          color: Color(0xFFC37447),
        ),
      );
    } else {
      return Text(
        '${_calculationService.formatDateToThaiString(isBuddhist: true, date: _date)}',
        style: TextStyle(
          fontSize: 18,
          color: Color(0xFFC37447),
        ),
      );
    }
  }
}
