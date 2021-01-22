import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';
import 'package:flutter_rounded_date_picker/rounded_picker.dart';

import '../material.dart';

class EditPatientForm extends StatefulWidget {
  EditPatientForm(this.submitFn);

  final void Function({
    @required String hn,
    @required String an,
    @required String patientName,
    @required String patientSurname,
    @required String address,
    @required String gender,
    @required String dob,
    @required double weight,
    @required double height,
    @required String patientTel,
    @required String careTakerName,
    @required String careTakerSurname,
    @required String careTakerTel,
    @required String careTakerRelationship,
    @required String operationDate,
    @required String operationName,
    @required String operationMethod,
    @required String previousIllness,
    @required String state,
    @required String doctorName,
    @required String bedNumber,
    @required String roomNumber,
    @required String username,
    @required String uniqueKey,
    @required String password,
  }) submitFn;

  @override
  _EditPatientFormState createState() => _EditPatientFormState();
}

class _EditPatientFormState extends State<EditPatientForm> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController controller = TextEditingController();
  String pickedDate = '';
  String _hn = '';
  String _an = '';
  String _patientName = '';
  String _patientSurname = '';
  String _address = '';
  String _gender = '';
  String _dob = '';
  double _weight;
  double _height;
  String _patientTel = '';
  String _careTakerName = '';
  String _careTakerSurname = '';
  String _careTakerRelationship = '';
  String _careTakerTel = '';
  String _operationDate = '';
  String _operationName = '';
  String _operationMethod = '';
  String _previousIllness = '';
  String _state = '';
  String _doctorName = '';
  String _bedNumber = '';
  String _roomNumber = '';
  String _createDummyUsername(String _patientTel) {
    String dummyUsername = '@abdoCare.com';
    return '$_patientTel$dummyUsername';
  }

  String _generateUniqueKey(int length) {
    var uuid = Uuid();
    return uuid.v1().substring(0, length);
  }

  String _convertDateTimeDisplay(String date) {
    final DateFormat displayFormater = DateFormat('yyyy-MM-dd HH:mm:ss.SSS');
    final DateFormat serverFormater = DateFormat('dd-MM-yyyy');
    final DateTime displayDate = displayFormater.parse(date);
    final String formatted = serverFormater.format(displayDate);
    return formatted;
  }

  Future<DateTime> _selectDate(
      BuildContext context, DateTime currentValue) async {
    final DateTime date = await showRoundedDatePicker(
      context: context,
      era: EraMode.BUDDHIST_YEAR,
      locale: Locale('th', 'TH'),
      firstDate: DateTime(DateTime.now().year - 10),
      initialDate: currentValue ?? DateTime.now(),
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
    if (date != null)
      setState(() {
        _dob = _convertDateTimeDisplay(date.toString());
        controller.text = _dob;
      });
    print(_dob);
    return date;
  }

  void _trySubmit() {
    final isValid = _formKey.currentState.validate();
    FocusScope.of(context).unfocus();
    if (isValid) {
      _formKey.currentState.save();
      widget.submitFn(
        hn: _hn,
        an: _an,
        patientName: _patientName,
        patientSurname: _patientSurname,
        address: _address.trim(),
        gender: _gender,
        dob: _dob,
        weight: _weight,
        height: _height,
        patientTel: _patientTel.trim(),
        careTakerName: _careTakerName,
        careTakerSurname: _careTakerSurname,
        careTakerTel: _careTakerTel.trim(),
        careTakerRelationship: _careTakerRelationship.trim(),
        operationDate: _operationDate,
        operationName: _operationName,
        operationMethod: _operationMethod,
        previousIllness: _previousIllness,
        state: _state,
        doctorName: _doctorName,
        bedNumber: _bedNumber,
        roomNumber: _roomNumber,
        username: _createDummyUsername(_patientTel.trim()),
        uniqueKey: _generateUniqueKey(6),
        password: '000000',
      );
    }
  }

  bool _isNumeric(String input) =>
      input == null ? false : double.tryParse(input) != null;

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    controller.dispose();
    super.dispose();
  }

  bool _enabled = false;
  @override
  Widget build(BuildContext context) {
    var date;
    String formm;
    final format = DateFormat('dd/MM/yyyy');
    return Container(
      child: ListView(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(30),
            child: Card(
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    Card(
                      margin: EdgeInsets.all(20),
                      child: Column(
                        children: <Widget>[
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
                              children: <Widget>[
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
                                      onSaved: (value) => _hn = value,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
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
                                      onSaved: (value) => _an = value,
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
                            padding: const EdgeInsets.fromLTRB(0, 8, 20, 8),
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    width: 100,
                                    child: Text(
                                      'ชื่อ:\t\t\t',
                                      style:
                                          Theme.of(context).textTheme.bodyText2,
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
                                      onSaved: (value) => _patientName = value,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    width: 100,
                                    child: Text(
                                      'นามสกุล:\t\t\t',
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
                                      style:
                                          Theme.of(context).textTheme.bodyText2,
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
                                              color: Colors.black26, width: 1),
                                        ),
                                        labelText: 'เพศ'),
                                    onSaved: (value) {
                                      _gender = value;
                                    },
                                    // value: _gender,
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
                              children: <Widget>[
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    width: 100,
                                    child: Text(
                                      'เบอร์โทร:\t\t\t',
                                      style:
                                          Theme.of(context).textTheme.bodyText2,
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
                                  flex: 2,
                                  child: Container(
                                    width: 150,
                                    child: Text(
                                      'วัน/เดือน/ปี เกิด:\t\t\t',
                                      style:
                                          Theme.of(context).textTheme.bodyText2,
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
                                        return date =
                                            _selectDate(context, currentValue);
                                      },
                                      onChanged: (date) => setState(
                                        () {
                                          formm = format.format(date);
                                          _dob = formm;
                                          print('operationDate: $_dob');
                                        },
                                      ),
                                      onSaved: (date) => setState(
                                        () {
                                          formm = format.format(date);
                                          _dob = formm;
                                          print('operationDate: $_dob');
                                        },
                                      ),
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
                                      style:
                                          Theme.of(context).textTheme.bodyText2,
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
                                  flex: 3,
                                  child: SizedBox(
                                    width: 100,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Card(
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
                            padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    width: 100,
                                    child: Text(
                                      'ชื่อ:\t\t\t',
                                      style:
                                          Theme.of(context).textTheme.bodyText2,
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
                                      style:
                                          Theme.of(context).textTheme.bodyText2,
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
                                      style:
                                          Theme.of(context).textTheme.bodyText2,
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
                                      onSaved: (value) => _careTakerTel = value,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 10, 8, 8),
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  flex: 3,
                                  child: Container(
                                    child: Text(
                                      'ความเกี่ยวข้องกับผู้ป่วย:\t\t\t',
                                      style:
                                          Theme.of(context).textTheme.bodyText2,
                                      textAlign: TextAlign.end,
                                    ),
                                  ),
                                ),
                                Flexible(
                                  flex: 1,
                                  child: Radio(
                                    value: 'สามี/ภรรยา',
                                    groupValue: _careTakerRelationship,
                                    onChanged: (value) {
                                      setState(() {
                                        print(value);
                                        _careTakerRelationship = value;
                                      });
                                    },
                                  ),
                                ),
                                Expanded(flex: 2, child: Text('สามี/ภรรยา')),
                                Flexible(
                                  flex: 1,
                                  child: Radio(
                                    value: 'บุตร',
                                    groupValue: _careTakerRelationship,
                                    onChanged: (value) {
                                      setState(() {
                                        print(value);
                                        _careTakerRelationship = value;
                                      });
                                    },
                                  ),
                                ),
                                Expanded(flex: 2, child: Text('บุตร')),
                                Flexible(
                                  flex: 1,
                                  child: Radio(
                                    value: 'บิดา/มารดา',
                                    groupValue: _careTakerRelationship,
                                    onChanged: (value) {
                                      setState(() {
                                        print(value);
                                        _careTakerRelationship = value;
                                      });
                                    },
                                  ),
                                ),
                                Expanded(flex: 2, child: Text('บิดา/มารดา')),
                                Flexible(
                                  flex: 2,
                                  child: Radio(
                                    value: 'พี่ชาย/น้องชาย',
                                    groupValue: _careTakerRelationship,
                                    onChanged: (value) {
                                      setState(() {
                                        print(value);
                                        _careTakerRelationship = value;
                                      });
                                    },
                                  ),
                                ),
                                Expanded(
                                    flex: 2, child: Text('พี่ชาย/น้องชาย')),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 8, 8, 20),
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  flex: 3,
                                  child: SizedBox(
                                    width: 0,
                                  ),
                                ),
                                Flexible(
                                  flex: 1,
                                  child: Radio(
                                    value: 'พี่สาว/น้องสาว',
                                    groupValue: _careTakerRelationship,
                                    onChanged: (value) {
                                      setState(() {
                                        print(value);
                                        _careTakerRelationship = value;
                                      });
                                    },
                                  ),
                                ),
                                Expanded(
                                    flex: 2, child: Text('พี่สาว/น้องสาว')),
                                Flexible(
                                  flex: 1,
                                  child: Radio(
                                    value: 'ญาติ',
                                    groupValue: _careTakerRelationship,
                                    onChanged: (value) {
                                      setState(() {
                                        print(value);
                                        _careTakerRelationship = value;
                                      });
                                    },
                                  ),
                                ),
                                Expanded(flex: 2, child: Text('ญาติ')),
                                Flexible(
                                  flex: 1,
                                  child: Radio(
                                    value: 'อื่นๆ..',
                                    groupValue: _careTakerRelationship,
                                    onChanged: (value) {
                                      setState(() {
                                        print(value);
                                        _careTakerRelationship = value;
                                        _enabled = true;
                                      });
                                    },
                                  ),
                                ),
                                Flexible(flex: 2, child: Text('อื่นๆ\t\t')),
                                Expanded(
                                  flex: 3,
                                  child: AbsorbPointer(
                                    absorbing: !_enabled,
                                    child: TextFormField(
                                      enabled: _enabled,
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
                                  flex: 1,
                                  child: SizedBox(width: 0),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Card(
                      margin: EdgeInsets.all(20),
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.all(10),
                                child: Text(
                                  'ข้อมูลทางการแพทย์',
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
                                      'วันที่รับการรักษา:\t\t\t',
                                      style:
                                          Theme.of(context).textTheme.bodyText2,
                                      textAlign: TextAlign.end,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
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
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.black26,
                                                width: 1),
                                          ),
                                          labelText: 'วันที่รับการรักษา'),
                                      onShowPicker: (context, currentValue) {
                                        FocusScope.of(context)
                                            .requestFocus(new FocusNode());
                                        return date =
                                            _selectDate(context, currentValue);
                                      },
                                      onChanged: (date) => setState(
                                        () {
                                          formm = format.format(date);
                                          _operationDate = formm;
                                          print(
                                              'operationDate: $_operationDate');
                                        },
                                      ),
                                      onSaved: (date) => setState(
                                        () {
                                          formm = format.format(date);
                                          _operationDate = formm;
                                          print(
                                              'operationDate: $_operationDate');
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    width: 100,
                                    child: Text(
                                      'ชื่อแพทย์ที่รักษา:\t\t\t',
                                      style:
                                          Theme.of(context).textTheme.bodyText2,
                                      textAlign: TextAlign.end,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    width: 300,
                                    child: TextFormField(
                                      validator: (value) {
                                        return value.isEmpty
                                            ? 'กรุณากรอกชื่อชื่อแพทย์ที่รักษา'
                                            : null;
                                      },
                                      decoration: InputDecoration(
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.black26,
                                                width: 1),
                                          ),
                                          labelText: 'ชื่อแพทย์ที่รักษา'),
                                      onSaved: (value) => _doctorName = value,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    width: 100,
                                    child: Text(
                                      'ชื่อการผ่าตัด:\t\t\t',
                                      style:
                                          Theme.of(context).textTheme.bodyText2,
                                      textAlign: TextAlign.end,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    width: 300,
                                    child: TextFormField(
                                      validator: (value) {
                                        return value.isEmpty
                                            ? 'กรุณากรอกชื่อการผ่าตัด'
                                            : null;
                                      },
                                      decoration: InputDecoration(
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.black26,
                                                width: 1),
                                          ),
                                          labelText: 'ชื่อการผ่าตัด'),
                                      onSaved: (value) =>
                                          _operationName = value,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 8, 20, 8),
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    width: 150,
                                    child: Text(
                                      'ประเภทการผ่าตัด:\t\t\t',
                                      style:
                                          Theme.of(context).textTheme.bodyText2,
                                      textAlign: TextAlign.end,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: DropdownButtonFormField(
                                    isExpanded: true,
                                    validator: (value) => value == null
                                        ? 'กรุณาเลือกประเภทการผ่าตัด'
                                        : null,
                                    decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.black26, width: 1),
                                        ),
                                        labelText: 'ประเภทการผ่าตัด'),
                                    onSaved: (value) {
                                      _operationMethod = value;
                                    },
                                    items: [
                                      'Exploration',
                                      'LAP+Operation',
                                    ]
                                        .map((label) => DropdownMenuItem(
                                              child: Text(label),
                                              value: label,
                                            ))
                                        .toList(),
                                    onChanged: (value) {
                                      setState(() {
                                        _operationMethod = value;
                                      });
                                    },
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    width: 200,
                                    child: Text(
                                      'ขั้นตอนการรักษา:\t\t\t',
                                      style:
                                          Theme.of(context).textTheme.bodyText2,
                                      textAlign: TextAlign.end,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: DropdownButtonFormField(
                                    isExpanded: true,
                                    validator: (value) => value == null
                                        ? 'กรุณาเลือกขั้นตอนการรักษา'
                                        : null,
                                    decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.black26, width: 1),
                                        ),
                                        labelText: 'ขั้นตอนการรักษา'),
                                    onSaved: (value) {
                                      _state = value;
                                    },
                                    items: [
                                      'Pre-Operation',
                                      'Post-Operation@Hospital',
                                      'Post-Operation@Home'
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
                                  child: Container(
                                    width: 100,
                                    child: Text(
                                      'โรคร่วม:\t\t\t',
                                      style:
                                          Theme.of(context).textTheme.bodyText2,
                                      textAlign: TextAlign.end,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    width: 300,
                                    child: TextFormField(
                                      validator: (value) {
                                        return value.isEmpty
                                            ? 'กรุณากรอกโรคร่วม'
                                            : null;
                                      },
                                      decoration: InputDecoration(
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.black26,
                                                width: 1),
                                          ),
                                          labelText: 'โรคร่วม'),
                                      onSaved: (value) =>
                                          _previousIllness = value,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 8, 20, 20),
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  flex: 1,
                                  child: Text(
                                    'หมายเลขห้อง:\t\t\t',
                                    style:
                                        Theme.of(context).textTheme.bodyText2,
                                    textAlign: TextAlign.end,
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    width: 300,
                                    child: TextFormField(
                                      validator: (value) {
                                        return value.isEmpty
                                            ? 'กรุณากรอกหมายเลขห้อง'
                                            : null;
                                      },
                                      decoration: InputDecoration(
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.black26,
                                                width: 1),
                                          ),
                                          labelText: 'หมายเลขห้อง'),
                                      onSaved: (value) => _roomNumber = value,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Text(
                                    'หมายเลขเตียง:\t\t\t',
                                    style:
                                        Theme.of(context).textTheme.bodyText2,
                                    textAlign: TextAlign.end,
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    width: 300,
                                    child: TextFormField(
                                      validator: (value) {
                                        return value.isEmpty
                                            ? 'กรุณากรอกหมายเลขเตียง'
                                            : null;
                                      },
                                      decoration: InputDecoration(
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.black26,
                                                width: 1),
                                          ),
                                          labelText: 'หมายเลขเตียง'),
                                      onSaved: (value) => _bedNumber = value,
                                    ),
                                  ),
                                ),
                                Expanded(flex: 2, child: SizedBox(width: 0))
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Center(
                      child: Container(
                        width: 100,
                        margin: EdgeInsets.all(30),
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7.0),
                          ),
                          padding: EdgeInsets.all(15),
                          onPressed: _trySubmit,
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
    );
  }
}
