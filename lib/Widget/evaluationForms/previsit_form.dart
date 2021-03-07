import 'package:AbdoCare_Web/Widget/material.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rounded_date_picker/rounded_picker.dart';
import 'package:intl/intl.dart';

import '../../services/interfaces/calculation_service_interface.dart';
import '../../services/service_locator.dart';

class PrevisitForm extends StatefulWidget {
  PrevisitForm({Key key}) : super(key: key);
  @override
  _PrevisitFormState createState() => _PrevisitFormState();
}

enum ConsentSigned { patient, other }

class _PrevisitFormState extends State<PrevisitForm> {
  ICalculationService _calculationService = locator<ICalculationService>();

  String _hn = '';
  String _an = '';
  String _patientName = '';
  String _patientSurname = '';
  DateTime _dob;
  DateTime _operationDate;
  String _gender = '';
  String _ward = '';
  String _operation = '';
  String _diagnosis = '';
  String _consentSigned = '';
  String _preMedication = '';
  String _typeOfAnesthesia = '';
  String _previousIllness = '';
  String _drugUsed = '';
  String _asaClass = '';

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
    var dateFormatted;
    if (date != null) {
      dateFormatted = _calculationService.formatDate(date: date);
    }
    return dateFormatted;
  }

  bool checkBox1 = false;
  int consentSigned;
  int typeOfAnesthesia;
  var date;

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
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                  'บันทึกการเยี่ยมผู้รับบริการสูงอายุก่อนผ่าตัด(Pre-visit)'),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: Container(
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                                child: Text('General Information',
                                    style:
                                        TextStyle(color: Color(0xFFC37447)))),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                                child: Text('Name:\t\t\t',
                                    textAlign: TextAlign.end)),
                            Expanded(
                              flex: 2,
                              child: TextFormField(
                                validator: (value) {
                                  return value.isEmpty
                                      ? 'กรุณากรอกชื่อผู้ป่วย'
                                      : null;
                                },
                                decoration: InputDecoration(
                                    contentPadding: new EdgeInsets.symmetric(
                                        vertical: 8.0, horizontal: 10.0),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.black26, width: 1),
                                    ),
                                    labelText: 'Name'),
                                onSaved: (value) => _patientName = value,
                              ),
                            ),
                            Expanded(
                                child: Text('Surname:\t\t\t',
                                    textAlign: TextAlign.end)),
                            Expanded(
                              flex: 2,
                              child: TextFormField(
                                validator: (value) {
                                  return value.isEmpty
                                      ? 'กรุณากรอกนามสกุลผู้ป่วย'
                                      : null;
                                },
                                decoration: InputDecoration(
                                    contentPadding: new EdgeInsets.symmetric(
                                        vertical: 8.0, horizontal: 10.0),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.black26, width: 1),
                                    ),
                                    labelText: 'Surname'),
                                onSaved: (value) => _patientSurname = value,
                              ),
                            ),
                            Expanded(
                                child: Text('HN:\t\t\t',
                                    textAlign: TextAlign.end)),
                            Expanded(
                              child: TextFormField(
                                validator: (value) {
                                  return value.isEmpty ? 'กรุณากรอกHN' : null;
                                },
                                decoration: InputDecoration(
                                    contentPadding: new EdgeInsets.symmetric(
                                        vertical: 8.0, horizontal: 10.0),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.black26, width: 1),
                                    ),
                                    labelText: 'HN'),
                                onSaved: (value) => _hn = value,
                              ),
                            ),
                            Expanded(
                                child: Text('AN:\t\t\t',
                                    textAlign: TextAlign.end)),
                            Expanded(
                              child: TextFormField(
                                validator: (value) {
                                  return value.isEmpty ? 'กรุณากรอกAN' : null;
                                },
                                decoration: InputDecoration(
                                    contentPadding: new EdgeInsets.symmetric(
                                        vertical: 8.0, horizontal: 10.0),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.black26, width: 1),
                                    ),
                                    labelText: 'AN'),
                                onSaved: (value) => _an = value,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                                child: Text('Gender:\t\t\t',
                                    textAlign: TextAlign.end)),
                            Expanded(
                              flex: 2,
                              child: DropdownButtonFormField(
                                isExpanded: true,
                                validator: (value) => value == null
                                    ? 'กรุณาเลือกเพศของผู้ป่วย'
                                    : null,
                                decoration: InputDecoration(
                                    contentPadding: new EdgeInsets.symmetric(
                                        vertical: 8.0, horizontal: 10.0),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.black26, width: 1),
                                    ),
                                    labelText: 'Gender'),
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
                            Expanded(
                                flex: 1,
                                child: Text('Ward:\t\t\t',
                                    textAlign: TextAlign.end)),
                            Expanded(
                              flex: 2,
                              child: DropdownButtonFormField(
                                isExpanded: true,
                                validator: (value) =>
                                    value == null ? 'กรุณาเลือกWard' : null,
                                decoration: InputDecoration(
                                    contentPadding: new EdgeInsets.symmetric(
                                        vertical: 8.0, horizontal: 10.0),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.black26, width: 1),
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
                            Expanded(
                                flex: 2,
                                child: Text('Date of Birth:\t\t\t',
                                    textAlign: TextAlign.end)),
                            Expanded(
                              flex: 2,
                              child: Container(
                                width: 300,
                                child: DateTimeField(
                                    validator: (DateTime dateTime) {
                                      if (dateTime == null) {
                                        return "กรุณากรอกวันเกิด";
                                      }
                                      return null;
                                    },
                                    format: format,
                                    readOnly: false,
                                    decoration: InputDecoration(
                                        contentPadding:
                                            new EdgeInsets.symmetric(
                                                vertical: 8.0,
                                                horizontal: 10.0),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.black26, width: 1),
                                        ),
                                        labelText: 'Date of Birth'),
                                    onShowPicker: (context, currentValue) {
                                      FocusScope.of(context)
                                          .requestFocus(new FocusNode());
                                      return date =
                                          _selectDate(context, currentValue);
                                    },
                                    onSaved: (date) {
                                      setState(
                                        () {
                                          _dob = date;
                                        },
                                      );
                                    }),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                                child: Text('Diagnosis:\t\t\t',
                                    textAlign: TextAlign.end)),
                            Expanded(
                              flex: 2,
                              child: TextFormField(
                                validator: (value) {
                                  return value.isEmpty
                                      ? 'กรุณากรอกDiagnosis'
                                      : null;
                                },
                                decoration: InputDecoration(
                                    contentPadding: new EdgeInsets.symmetric(
                                        vertical: 8.0, horizontal: 10.0),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.black26, width: 1),
                                    ),
                                    labelText: 'Diagnosis'),
                                onSaved: (value) => _diagnosis = value,
                              ),
                            ),
                            Expanded(
                                child: Text('Operation:\t\t\t',
                                    textAlign: TextAlign.end)),
                            Expanded(
                              flex: 2,
                              child: TextFormField(
                                validator: (value) {
                                  return value.isEmpty
                                      ? 'กรุณากรอกOperation'
                                      : null;
                                },
                                decoration: InputDecoration(
                                    contentPadding: new EdgeInsets.symmetric(
                                        vertical: 8.0, horizontal: 10.0),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.black26, width: 1),
                                    ),
                                    labelText: 'Operation'),
                                onSaved: (value) => _operation = value,
                              ),
                            ),
                            Expanded(
                                flex: 2,
                                child: Text('Operation date:\t\t\t',
                                    textAlign: TextAlign.end)),
                            Expanded(
                              flex: 2,
                              child: Container(
                                width: 300,
                                child: DateTimeField(
                                    validator: (DateTime dateTime) {
                                      if (dateTime == null) {
                                        return "กรุณากรอกวันที่รับการรักษา";
                                      }
                                      return null;
                                    },
                                    format: format,
                                    readOnly: false,
                                    decoration: InputDecoration(
                                        contentPadding:
                                            new EdgeInsets.symmetric(
                                                vertical: 8.0,
                                                horizontal: 10.0),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.black26, width: 1),
                                        ),
                                        labelText: 'Operation date'),
                                    onShowPicker: (context, currentValue) {
                                      FocusScope.of(context)
                                          .requestFocus(new FocusNode());
                                      return date =
                                          _selectDate(context, currentValue);
                                    },
                                    onSaved: (date) {
                                      setState(
                                        () {
                                          _operationDate = date;
                                        },
                                      );
                                    }),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                                flex: 2,
                                child: Text('Consent signed:\t\t\t',
                                    textAlign: TextAlign.end)),
                            Expanded(
                              flex: 1,
                              child: Container(
                                child: RadioListTile(
                                  title: Text('Patient'),
                                  value: 0,
                                  groupValue: consentSigned,
                                  onChanged: (newValue) {
                                    setState(() {
                                      consentSigned = newValue;
                                      checkBox1 = false;
                                      _consentSigned = 'Patient';
                                      print(_consentSigned);
                                    });
                                  },
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Container(
                                child: RadioListTile(
                                  title: Text('Other'),
                                  value: 1,
                                  groupValue: consentSigned,
                                  onChanged: (newValue) {
                                    setState(() {
                                      consentSigned = newValue;
                                      checkBox1 = true;
                                      print(consentSigned);
                                    });
                                  },
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: TextFormField(
                                enabled: checkBox1,
                                validator: (value) {
                                  return value.isEmpty
                                      ? 'กรุณากรอกConsent signed'
                                      : null;
                                },
                                decoration: InputDecoration(
                                    contentPadding: new EdgeInsets.symmetric(
                                        vertical: 8.0, horizontal: 10.0),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.black26, width: 1),
                                    ),
                                    labelText: 'Other'),
                                onSaved: (value) => _consentSigned = value,
                              ),
                            ),
                            Expanded(
                                flex: 2,
                                child: Text('Pre-medication:\t\t\t',
                                    textAlign: TextAlign.end)),
                            Expanded(
                              flex: 2,
                              child: TextFormField(
                                validator: (value) {
                                  return value.isEmpty
                                      ? 'กรุณากรอกPre-medication'
                                      : null;
                                },
                                decoration: InputDecoration(
                                    contentPadding: new EdgeInsets.symmetric(
                                        vertical: 8.0, horizontal: 10.0),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.black26, width: 1),
                                    ),
                                    labelText: 'Pre-medication'),
                                onSaved: (value) => _preMedication = value,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                                flex: 2,
                                child: Text('Type of Anesthesia:\t\t\t',
                                    textAlign: TextAlign.end)),
                            Expanded(
                              flex: 1,
                              child: Container(
                                child: RadioListTile(
                                  title: Text('GA'),
                                  value: 1,
                                  groupValue: typeOfAnesthesia,
                                  onChanged: (newValue) {
                                    setState(() {
                                      typeOfAnesthesia = newValue;
                                      _typeOfAnesthesia = 'GA';
                                      print(_typeOfAnesthesia);
                                    });
                                  },
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Container(
                                child: RadioListTile(
                                  title: Text('SB'),
                                  value: 2,
                                  groupValue: typeOfAnesthesia,
                                  onChanged: (newValue) {
                                    setState(() {
                                      typeOfAnesthesia = newValue;
                                      _typeOfAnesthesia = 'SB';
                                      print(_typeOfAnesthesia);
                                    });
                                  },
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Container(
                                child: RadioListTile(
                                  title: Text('GA+SB'),
                                  value: 3,
                                  groupValue: typeOfAnesthesia,
                                  onChanged: (newValue) {
                                    setState(() {
                                      typeOfAnesthesia = newValue;
                                      _typeOfAnesthesia = 'GA+SB';
                                      print(_typeOfAnesthesia);
                                    });
                                  },
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Container(
                                child: RadioListTile(
                                  title: Text('GA+Feneral nerve block'),
                                  value: 4,
                                  groupValue: typeOfAnesthesia,
                                  onChanged: (newValue) {
                                    setState(() {
                                      typeOfAnesthesia = newValue;
                                      _typeOfAnesthesia =
                                          'GA+Feneral nerve block';
                                      print(_typeOfAnesthesia);
                                    });
                                  },
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: SizedBox(width: 0),
                            )
                          ],
                        ),
                      )
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
