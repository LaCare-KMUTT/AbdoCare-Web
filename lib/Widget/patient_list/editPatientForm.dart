import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';
import 'package:flutter_rounded_date_picker/rounded_picker.dart';

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
        firstDate: DateTime(1900),
        initialDate: currentValue ?? DateTime.now(),
        lastDate: DateTime(2100));
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

  @override
  Widget build(BuildContext context) {
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
                  children: [
                    Card(
                      margin: EdgeInsets.all(20),
                      child: Column(
                        children: [
                          Row(
                            children: [
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
                            padding: const EdgeInsets.fromLTRB(20, 8, 50, 8),
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
                                  flex: 1,
                                  child: SizedBox(
                                    width: 100,
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: SizedBox(
                                    width: 100,
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(20, 8, 50, 8),
                            child: Row(
                              children: [
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
                            padding: const EdgeInsets.fromLTRB(20, 8, 50, 20),
                            child: Row(
                              children: [
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
                                  flex: 2,
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
                                  flex: 1,
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
                                  flex: 1,
                                  child: Container(
                                    width: 300,
                                    child: DateTimeField(
                                      validator: (DateTime dateTime) {
                                        if (dateTime == null) {
                                          return "กรุณากรอกสัน/เดือน/ปีเกิดของผู้ป่วย";
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
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Card(
                      margin: EdgeInsets.all(20),
                      child: Column(
                        children: [
                          Row(
                            children: [
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
                            padding: const EdgeInsets.fromLTRB(52, 8, 50, 8),
                            child: Row(
                              children: [
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
                            padding: const EdgeInsets.fromLTRB(0, 8, 8, 20),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    width: 200,
                                    child: Text(
                                      'มีความเกี่ยวข้องเป็น:\t\t\t',
                                      style:
                                          Theme.of(context).textTheme.bodyText2,
                                      textAlign: TextAlign.end,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Container(
                                    width: 250,
                                    child: TextFormField(
                                      validator: (value) {
                                        return value.isEmpty
                                            ? 'กรุณากรอกความสัมพันธ์กับผู้ป่วย'
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
                                  child: SizedBox(
                                    width: 100,
                                  ),
                                ),
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
                          padding: EdgeInsets.all(10),
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