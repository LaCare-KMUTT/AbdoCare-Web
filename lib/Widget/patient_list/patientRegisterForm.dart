import 'dart:async';

import 'package:AbdoCare_Web/Widget/shared/alert_style.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rounded_date_picker/rounded_picker.dart';
import 'package:intl/intl.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:uuid/uuid.dart';

import '../../services/interfaces/calculation_service_interface.dart';
import '../../services/service_locator.dart';
import '../material.dart';

class PatientRegisterForm extends StatefulWidget {
  PatientRegisterForm(this.submitFn);

  final void Function({
    @required String hn,
    @required String an,
    @required String ward,
    @required String patientName,
    @required String patientSurname,
    @required String address,
    @required String gender,
    @required DateTime dob,
    @required String patientTel,
    @required String careTakerName,
    @required String careTakerSurname,
    @required String careTakerTel,
    @required String careTakerRelationship,
    @required String username,
    @required String uniqueKey,
    @required String password,
    @required DateTime latestStateChange,
  }) submitFn;

  @override
  _PatientRegisterFormState createState() => _PatientRegisterFormState();
}

class _PatientRegisterFormState extends State<PatientRegisterForm> {
  ICalculationService _calculationService = locator<ICalculationService>();
  final _formKey = GlobalKey<FormState>();
  TextEditingController controller = TextEditingController();
  final CustomMaterial _customMaterial = locator<CustomMaterial>();

  String _hn = '';
  String _an = '';
  String _patientName = '';
  String _patientSurname = '';
  String _address = '';
  String _gender = '';
  DateTime _dob;
  String _patientTel = '';
  String _careTakerName = '';
  String _careTakerSurname = '';
  String _careTakerRelationship = '';
  String _careTakerTel = '';
  String _uniqueKey = '';
  String _ward = '';

  String _createDummyUsername(String hn) {
    String dummyUsername = '@abdoCare.com';
    return '$hn$dummyUsername';
  }

  String _generateUniqueKey(int length) {
    var uuid = Uuid();
    return uuid.v1().substring(0, length);
  }

  Future<DateTime> _selectDate(
      BuildContext context, DateTime currentValue) async {
    final DateTime date = await showRoundedDatePicker(
      context: context,
      era: EraMode.BUDDHIST_YEAR,
      locale: Locale('th', 'TH'),
      firstDate: DateTime(DateTime.now().year - 200),
      initialDate: currentValue ?? DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 365)),
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
    var dateFormatted;
    if (date != null) {
      dateFormatted = _calculationService.formatDate(date: date);
      setState(() {
        _dob = dateFormatted;
      });
    }
    return dateFormatted;
  }

  void _trySubmit() {
    final isValid = _formKey.currentState.validate();
    FocusScope.of(context).unfocus();
    if (isValid) {
      _formKey.currentState.save();
      widget.submitFn(
        hn: _hn,
        an: _an,
        ward: _ward,
        patientName: _patientName,
        patientSurname: _patientSurname,
        address: _address.trim(),
        gender: _gender,
        dob: _dob,
        patientTel: _patientTel.trim(),
        careTakerName: _careTakerName,
        careTakerSurname: _careTakerSurname,
        careTakerTel: _careTakerTel.trim(),
        careTakerRelationship: _careTakerRelationship.trim(),
        username: _createDummyUsername(_hn.trim()),
        uniqueKey: _uniqueKey,
        password: '000000',
        latestStateChange: _calculationService.formatDate(date: DateTime.now()),
      );
    }
  }

  bool _isNumeric(String input) =>
      input == null ? false : double.tryParse(input) != null;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final format = DateFormat('dd/MM/yyyy');
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Container(
        child: ListView(
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(30),
              child: Card(
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: Colors.grey[300],
                              width: 1.0,
                            ),
                          ),
                        ),
                        margin: EdgeInsets.all(20),
                        child: Column(
                          children: [
                            Row(
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.all(10),
                                  child: Text(
                                    'ข้อมูลผู้ป่วย',
                                    style: TextStyle(
                                        color: Color(0xFFC37447), fontSize: 18),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 8, 20, 8),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Text(
                                      'HN:\t\t\t',
                                      style:
                                          Theme.of(context).textTheme.bodyText2,
                                      textAlign: TextAlign.end,
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Container(
                                      width: 300,
                                      child: TextFormField(
                                        inputFormatters: [
                                          FilteringTextInputFormatter.allow(
                                              RegExp("[a-zA-Z0-9]"))
                                        ],
                                        validator: (value) {
                                          return value.isEmpty
                                              ? 'กรุณากรอกหมายเลขHN'
                                              : null;
                                        },
                                        decoration: InputDecoration(
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.black26,
                                                  width: 1),
                                            ),
                                            labelText: 'HN'),
                                        onSaved: (value) =>
                                            _hn = value.toUpperCase(),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Text(
                                      'AN:\t\t\t',
                                      style:
                                          Theme.of(context).textTheme.bodyText2,
                                      textAlign: TextAlign.end,
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Container(
                                      width: 300,
                                      child: TextFormField(
                                        inputFormatters: [
                                          FilteringTextInputFormatter.allow(
                                              RegExp("[a-zA-Z0-9]"))
                                        ],
                                        validator: (value) {
                                          return value.isEmpty
                                              ? 'กรุณากรอกหมายเลขAN'
                                              : null;
                                        },
                                        decoration: InputDecoration(
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.black26,
                                                  width: 1),
                                            ),
                                            labelText: 'AN'),
                                        onSaved: (value) =>
                                            _an = value.toUpperCase(),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                      flex: 1,
                                      child: Text('Ward:\t\t\t',
                                          textAlign: TextAlign.end)),
                                  Expanded(
                                    flex: 2,
                                    child: DropdownButtonFormField(
                                      isExpanded: true,
                                      validator: (value) => value == null
                                          ? 'กรุณาเลือกWard'
                                          : null,
                                      decoration: InputDecoration(
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.black26,
                                                width: 1),
                                          ),
                                          labelText: 'Ward'),
                                      onSaved: (value) {
                                        _ward = value;
                                      },
                                      items: ['1', '2', '3', '4']
                                          .map((label) => DropdownMenuItem(
                                                child: Text(label),
                                                value: label,
                                              ))
                                          .toList(),
                                      onChanged: (value) {
                                        setState(() {
                                          _ward = value;
                                        });
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 8, 20, 8),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Container(
                                      width: 100,
                                      child: Text(
                                        'ชื่อ:\t\t\t',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText2,
                                        textAlign: TextAlign.end,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Container(
                                      width: 300,
                                      child: TextFormField(
                                        validator: (value) {
                                          return value.isEmpty
                                              ? 'กรุณากรอกชื่อผู้ป่วย'
                                              : null;
                                        },
                                        decoration: InputDecoration(
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.black26,
                                                  width: 1),
                                            ),
                                            labelText: 'ชื่อ'),
                                        onSaved: (value) =>
                                            _patientName = value,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Container(
                                      width: 100,
                                      child: Text(
                                        'นามสกุล:\t\t\t',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText2,
                                        textAlign: TextAlign.end,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Container(
                                      width: 300,
                                      child: TextFormField(
                                        validator: (value) {
                                          return value.isEmpty
                                              ? 'กรุณากรอกนามสกุลผู้ป่วย'
                                              : null;
                                        },
                                        decoration: InputDecoration(
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.black26,
                                                  width: 1),
                                            ),
                                            labelText: 'นามสกุล'),
                                        onSaved: (value) =>
                                            _patientSurname = value,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Container(
                                      width: 150,
                                      child: Text(
                                        'เพศ:\t\t\t',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText2,
                                        textAlign: TextAlign.end,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: DropdownButtonFormField(
                                      isExpanded: true,
                                      validator: (value) => value == null
                                          ? 'กรุณาเลือกเพศของผู้ป่วย'
                                          : null,
                                      decoration: InputDecoration(
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.black26,
                                                width: 1),
                                          ),
                                          labelText: 'เพศ'),
                                      onSaved: (value) {
                                        _gender = value;
                                      },
                                      items: [
                                        'ชาย',
                                        'หญิง',
                                      ]
                                          .map((label) => DropdownMenuItem(
                                                child: Text(label),
                                                value: label,
                                              ))
                                          .toList(),
                                      onChanged: (value) {
                                        setState(() {
                                          _gender = value;
                                        });
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 8, 20, 8),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Container(
                                      width: 100,
                                      child: Text(
                                        'เบอร์โทร:\t\t\t',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText2,
                                        textAlign: TextAlign.end,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Container(
                                      width: 300,
                                      child: TextFormField(
                                        inputFormatters: [
                                          FilteringTextInputFormatter.allow(
                                              RegExp("[0-9]"))
                                        ],
                                        validator: (value) {
                                          return value.isEmpty
                                              ? 'กรุณากรอกเบอร์โทร'
                                              : null;
                                        },
                                        decoration: InputDecoration(
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.black26,
                                                  width: 1),
                                            ),
                                            labelText: 'เบอร์โทร'),
                                        onSaved: (value) => _patientTel = value,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Container(
                                      width: 150,
                                      child: Text(
                                        'วัน/เดือน/ปี เกิด:\t',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText2,
                                        textAlign: TextAlign.end,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Container(
                                      width: 300,
                                      child: DateTimeField(
                                        validator: (DateTime dateTime) {
                                          if (dateTime == null) {
                                            return "กรุณากรอกวัน/เดือน/ปีเกิดของผู้ป่วย";
                                          }
                                          return null;
                                        },
                                        format: format,
                                        readOnly: false,
                                        decoration: InputDecoration(
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.black26,
                                                  width: 1),
                                            ),
                                            labelText: 'วัน/เดือน/ปี เกิด'),
                                        onShowPicker: (context, currentValue) {
                                          FocusScope.of(context)
                                              .requestFocus(new FocusNode());
                                          return _selectDate(
                                              context, currentValue);
                                        },
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 3,
                                    child: SizedBox(
                                      width: 100,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 8, 20, 20),
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                    flex: 1,
                                    child: Container(
                                      width: 100,
                                      child: Text(
                                        'ที่อยู่:\t\t\t',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText2,
                                        textAlign: TextAlign.end,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 6,
                                    child: Container(
                                      width: 300,
                                      child: TextFormField(
                                        validator: (value) {
                                          return value.isEmpty
                                              ? 'กรุณากรอกที่อยู่ของผู้ป่วย'
                                              : null;
                                        },
                                        decoration: InputDecoration(
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.black26,
                                                  width: 1),
                                            ),
                                            labelText: 'ที่อยู่'),
                                        onSaved: (value) => _address = value,
                                        maxLines: 5,
                                        minLines: 1,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: SizedBox(
                                      width: 0,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: Colors.grey[300],
                              width: 1.0,
                            ),
                          ),
                        ),
                        margin: EdgeInsets.only(left: 20, right: 20),
                        child: Column(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.all(10),
                                  child: Text(
                                    'ข้อมูลผู้ดูแล',
                                    style: TextStyle(
                                        color: Color(0xFFC37447), fontSize: 18),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 8, 20, 8),
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                    flex: 1,
                                    child: Container(
                                      width: 100,
                                      child: Text(
                                        'ชื่อ:\t\t\t',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText2,
                                        textAlign: TextAlign.end,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Container(
                                      width: 300,
                                      child: TextFormField(
                                        validator: (value) {
                                          return value.isEmpty
                                              ? 'กรุณากรอกชื่อผู้ดูแล'
                                              : null;
                                        },
                                        decoration: InputDecoration(
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.black26,
                                                  width: 1),
                                            ),
                                            labelText: 'ชื่อ'),
                                        onSaved: (value) =>
                                            _careTakerName = value,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Container(
                                      width: 100,
                                      child: Text(
                                        'นามสกุล:\t\t\t',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText2,
                                        textAlign: TextAlign.end,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Container(
                                      width: 300,
                                      child: TextFormField(
                                        validator: (value) {
                                          return value.isEmpty
                                              ? 'กรุณากรอกนามสกุลผู้ดูแล'
                                              : null;
                                        },
                                        decoration: InputDecoration(
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.black26,
                                                  width: 1),
                                            ),
                                            labelText: 'นามสกุล'),
                                        onSaved: (value) =>
                                            _careTakerSurname = value,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Container(
                                      width: 150,
                                      child: Text(
                                        'เบอร์โทร:\t\t\t',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText2,
                                        textAlign: TextAlign.end,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Container(
                                      width: 300,
                                      child: TextFormField(
                                        inputFormatters: [
                                          FilteringTextInputFormatter.allow(
                                              RegExp("[0-9]"))
                                        ],
                                        validator: (value) {
                                          return value.isEmpty
                                              ? 'กรุณากรอกเบอร์โทร'
                                              : null;
                                        },
                                        decoration: InputDecoration(
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.black26,
                                                  width: 1),
                                            ),
                                            labelText: 'เบอร์โทร'),
                                        onSaved: (value) =>
                                            _careTakerTel = value,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 10, 20, 20),
                              child: Row(children: <Widget>[
                                Expanded(
                                  flex: 2,
                                  child: Container(
                                    width: 150,
                                    child: Text(
                                      'ความเกี่ยวข้องกับผู้ป่วย:\t\t\t',
                                      style:
                                          Theme.of(context).textTheme.bodyText2,
                                      textAlign: TextAlign.end,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: Container(
                                    width: 300,
                                    child: TextFormField(
                                      validator: (value) {
                                        return value.isEmpty
                                            ? 'กรุณากรอกความเกี่ยวข้องกับผู้ป่วย'
                                            : null;
                                      },
                                      decoration: InputDecoration(
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.black26,
                                                width: 1),
                                          ),
                                          labelText:
                                              'ความเกี่ยวข้องกับผู้ป่วย'),
                                      onSaved: (value) =>
                                          _careTakerRelationship = value,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 4,
                                  child: SizedBox(width: 0),
                                )
                              ]),
                            )
                          ],
                        ),
                      ),
                      Center(
                        child: Container(
                          width: 100,
                          margin: EdgeInsets.all(20),
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(7.0),
                            ),
                            padding: EdgeInsets.all(15),
                            onPressed: () async {
                              _uniqueKey = _generateUniqueKey(6);

                              if (_formKey.currentState.validate()) {
                                _trySubmit();
                                showAlertDialog(context, _uniqueKey, _hn);
                              } else {
                                Dialogs.alertToCompleteForm(context);
                              }
                            },
                            textColor: Colors.white,
                            color: Color(0xFF2ED47A),
                            child: Text(
                              'ยืนยัน',
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

void showAlertDialog(BuildContext context, String _uniqueKey, String _hn) {
  var alertStyle = AlertStyle(
    animationType: AnimationType.grow,
    descStyle: TextStyle(fontWeight: FontWeight.bold),
    descTextAlign: TextAlign.center,
    animationDuration: Duration(milliseconds: 0),
    alertBorder: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15.0),
      side: BorderSide(
        color: Colors.grey[50],
      ),
    ),
    titleStyle: TextStyle(
      color: Color(0xFFC37447),
    ),
    alertAlignment: Alignment.center,
  );
  Alert(
    context: context,
    type: AlertType.success,
    style: alertStyle,
    title: "รหัสสำหรับลงทะเบียนแอปพลิเคชันมือถือ",
    content: Text("HN: $_hn\nรหัสโค้ด: $_uniqueKey",
        style: Theme.of(context).textTheme.bodyText2,
        textAlign: TextAlign.center),
    buttons: [
      DialogButton(
        child: Text(
          "ตกลง",
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        onPressed: () {
          Navigator.pushNamed(context, '/patientList_page');
        },
        color: Color(0xFFC37447),
      ),
    ],
  ).show();
}
