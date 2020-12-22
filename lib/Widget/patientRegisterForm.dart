import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

class PatientRegisterForm extends StatefulWidget {
  PatientRegisterForm(this.submitFn);

  final void Function({
    @required String patientName,
    @required String address,
    @required String gender,
    @required String dob,
    @required double weight,
    @required double height,
    @required String patientTel,
    @required String careTakerName,
    @required String careTakerTel,
    @required String careTakerRelationship,
    @required String username,
    @required String uniqueKey,
    @required String password,
  }) submitFn;

  @override
  _PatientRegisterFormState createState() => _PatientRegisterFormState();
}

class _PatientRegisterFormState extends State<PatientRegisterForm> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController controller = TextEditingController();
  String pickedDate = '';
  String _patientName = '';
  String _address = '';
  String _gender = '';
  String _dob = '';
  double _weight;
  double _height;
  String _patientTel = '';
  String _careTakerName = '';
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

  Future _selectDate() async {
    DateTime picked = await showDatePicker(
        context: context,
        builder: (BuildContext context, Widget child) {
          return Theme(
            data: ThemeData.light().copyWith(
              primaryColor: const Color(0xFFC37447),
              accentColor: const Color(0xFFC37447),
              colorScheme: ColorScheme.light(primary: const Color(0xFFC37447)),
              //buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
            ),
            child: child,
          );
        },
        initialDate: new DateTime.now(),
        firstDate: new DateTime(1900),
        lastDate: new DateTime.now().add(Duration(days: 365)));
    if (picked != null)
      setState(() {
        _dob = _convertDateTimeDisplay(picked.toString());
        controller.text = _dob;
      });
  }

  void _trySubmit() {
    final isValid = _formKey.currentState.validate();
    FocusScope.of(context).unfocus();
    if (isValid) {
      _formKey.currentState.save();
      widget.submitFn(
        patientName: _patientName.trim(),
        address: _address.trim(),
        gender: _gender,
        dob: _dob,
        weight: _weight,
        height: _height,
        patientTel: _patientTel.trim(),
        careTakerName: _careTakerName.trim(),
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
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          // SizedBox(
          //   height: 50,
          // ),
          // Center(
          //   child: Text(
          //     'เพิ่มผู้ป่วย',
          //     style: Theme.of(context).textTheme.bodyText2,
          //   ),
          // ),
          Card(
            margin: EdgeInsets.all(50),
            child: Padding(
              padding: EdgeInsets.all(30),
              child: Container(
                height: 500,
                child: Form(
                  key: _formKey,
                  child: Column(
                    // mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'ข้อมูลผู้ป่วย',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      SizedBox(height: 15),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 40),
                        child: Text(
                          'ข้อมูลส่วนตัว',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ),
                      SizedBox(height: 15),
                      Flexible(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 40),
                          child: Row(
                            children: <Widget>[
                              Flexible(
                                child: Column(
                                  children: <Widget>[
                                    Flexible(
                                      child: Row(
                                        children: <Widget>[
                                          Container(
                                            width: 100,
                                            child: Text(
                                              'ชื่อ-นามสกุล',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyText2,
                                            ),
                                          ),
                                          SizedBox(width: 20),
                                          Flexible(
                                            child: TextFormField(
                                              validator: (value) {
                                                return value.isEmpty
                                                    ? 'กรุณากรอกชื่อนามสกุล'
                                                    : null;
                                              },
                                              decoration: InputDecoration(
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors.black26,
                                                        width: 1),
                                                  ),
                                                  labelText: 'ชื่อ-นามสกุล'),
                                              onSaved: (value) =>
                                                  _patientName = value,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Flexible(
                                      child: Row(
                                        children: <Widget>[
                                          Container(
                                            width: 100,
                                            child: Text(
                                              'ที่อยู่',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyText2,
                                            ),
                                          ),
                                          SizedBox(width: 20),
                                          Flexible(
                                            child: TextFormField(
                                              validator: (value) {
                                                return value.isEmpty
                                                    ? 'กรุณากรอกที่อยู่ของผู้ป่วย'
                                                    : null;
                                              },
                                              decoration: InputDecoration(
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors.black26,
                                                        width: 1),
                                                  ),
                                                  labelText: 'ที่อยู่'),
                                              onSaved: (value) =>
                                                  _address = value,
                                              maxLines: 5,
                                              minLines: 1,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(width: 50),
                              Flexible(
                                child: Column(
                                  children: <Widget>[
                                    Flexible(
                                      child: Row(
                                        children: <Widget>[
                                          Container(
                                            width: 100,
                                            child: Text(
                                              'เพศ',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyText2,
                                            ),
                                          ),
                                          Flexible(
                                            child: DropdownButtonFormField(
                                              validator: (value) => value ==
                                                      null
                                                  ? 'กรุณาเลือกเพศของผู้ป่วย'
                                                  : null,
                                              decoration: InputDecoration(
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors.black26,
                                                        width: 1),
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
                                                  .map((label) =>
                                                      DropdownMenuItem(
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
                                          Container(
                                            width: 100,
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 15),
                                    Flexible(
                                      child: Row(
                                        children: <Widget>[
                                          Container(
                                            width: 100,
                                            child: Text(
                                              'น้ำหนัก',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyText2,
                                            ),
                                          ),
                                          Flexible(
                                            child: TextFormField(
                                              validator: (value) {
                                                return value.isEmpty
                                                    ? 'กรุณากรอกน้ำหนัก'
                                                    : !_isNumeric(value)
                                                        ? 'กรุณากรอกเฉพาะตัวเลขเท่านั้น'
                                                        : null;
                                              },
                                              decoration: InputDecoration(
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors.black26,
                                                        width: 1),
                                                  ),
                                                  labelText: 'น้ำหนัก'),
                                              onSaved: (value) {
                                                _weight = double.parse(value);
                                              },
                                            ),
                                          ),
                                          Container(
                                            width: 100,
                                            child: Text(
                                              'กิโลกรัม',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyText2,
                                              textAlign: TextAlign.end,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 15),
                                    Flexible(
                                      child: Row(
                                        children: <Widget>[
                                          Container(
                                            width: 100,
                                            child: Text(
                                              'เบอร์โทร',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyText2,
                                            ),
                                          ),
                                          Flexible(
                                            child: TextFormField(
                                              validator: (value) {
                                                return value.isEmpty
                                                    ? 'กรุณากรอกเบอร์โทรศัพท์'
                                                    : null;
                                              },
                                              decoration: InputDecoration(
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors.black26,
                                                        width: 1),
                                                  ),
                                                  labelText: 'เบอร์โทร'),
                                              onSaved: (value) =>
                                                  _patientTel = value,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(width: 50),
                              Flexible(
                                child: Column(
                                  children: <Widget>[
                                    Flexible(
                                      child: Row(
                                        children: <Widget>[
                                          Container(
                                            width: 100,
                                            child: Text(
                                              'วัน เดือน ปีเกิด',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyText2,
                                            ),
                                          ),
                                          Flexible(
                                            child: TextFormField(
                                              validator: (value) {
                                                return value.isEmpty
                                                    ? 'กรุณากรอกวันเกิด'
                                                    : null;
                                              },
                                              controller: controller,
                                              // initialValue: pickedDate,
                                              decoration: InputDecoration(
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors.black26,
                                                        width: 1),
                                                  ),
                                                  labelText:
                                                      'วัน เดือน ปีเกิด'),
                                              onTap: () {
                                                FocusScope.of(context)
                                                    .requestFocus(
                                                        new FocusNode());
                                                _selectDate();
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 15),
                                    Flexible(
                                      child: Row(
                                        children: <Widget>[
                                          Container(
                                            width: 100,
                                            child: Text(
                                              'ส่วนสูง',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyText2,
                                            ),
                                          ),
                                          Flexible(
                                            child: TextFormField(
                                              validator: (value) {
                                                return value.isEmpty
                                                    ? 'กรุณากรอกส่วนสูง'
                                                    : !_isNumeric(value)
                                                        ? 'กรุณากรอกเฉพาะตัวเลขเท่านั้น'
                                                        : null;
                                              },
                                              decoration: InputDecoration(
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors.black26,
                                                        width: 1),
                                                  ),
                                                  labelText: 'ส่วนสูง'),
                                              onSaved: (value) =>
                                                  _height = double.parse(value),
                                            ),
                                          ),
                                          Container(
                                            width: 100,
                                            child: Text(
                                              'เซนติเมตร',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyText2,
                                              textAlign: TextAlign.end,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      // SizedBox(height: 10),
                      Padding(
                        padding:
                            EdgeInsets.only(bottom: 50, left: 50, right: 50),
                        child: Divider(color: Colors.black54),
                      ),
                      // SizedBox(height: 10),//
                      Container(
                        height: 100,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'ข้อมูลผู้ดูแล',
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 40),
                              child: Row(
                                children: <Widget>[
                                  Flexible(
                                    child: Row(
                                      children: <Widget>[
                                        Container(
                                          width: 100,
                                          child: Text(
                                            'ชื่อ-นามสกุล',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText2,
                                          ),
                                        ),
                                        SizedBox(width: 20),
                                        Flexible(
                                          child: TextFormField(
                                            validator: (value) {
                                              return value.isEmpty
                                                  ? 'กรุณากรอกชื่อนามสกุลของผู้ดูแล'
                                                  : null;
                                            },
                                            decoration: InputDecoration(
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.black26,
                                                      width: 1),
                                                ),
                                                labelText: 'ชื่อ-นามสกุล'),
                                            onSaved: (value) =>
                                                _careTakerName = value,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(width: 50),
                                  Flexible(
                                    child: Row(
                                      children: <Widget>[
                                        Container(
                                          width: 100,
                                          child: Text(
                                            'เบอร์โทร',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText2,
                                          ),
                                        ),
                                        Flexible(
                                          child: TextFormField(
                                            validator: (value) {
                                              return value.isEmpty
                                                  ? 'กรุณากรอกเบอร์โทรศัพท์ผู้ดูแล'
                                                  : null;
                                            },
                                            decoration: InputDecoration(
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.black26,
                                                      width: 1),
                                                ),
                                                labelText: 'เบอร์โทร'),
                                            onSaved: (value) =>
                                                _careTakerTel = value,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(width: 50),
                                  Flexible(
                                    child: Row(
                                      children: <Widget>[
                                        Container(
                                          width: 150,
                                          child: Text(
                                            'มีความเกี่ยวข้องเป็น',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText2,
                                          ),
                                        ),
                                        Flexible(
                                          child: TextFormField(
                                            validator: (value) {
                                              return value.isEmpty
                                                  ? 'กรุณากรอกความสัมพันธ์กับผู้ป่วย'
                                                  : null;
                                            },
                                            decoration: InputDecoration(
                                                enabledBorder:
                                                    OutlineInputBorder(
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
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Center(
            child: RaisedButton(
              padding: EdgeInsets.all(20),
              onPressed: _trySubmit,
              textColor: Colors.white,
              color: Colors.greenAccent,
              child: Text(
                'ยืนยัน',
                style: TextStyle(fontSize: 15),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
