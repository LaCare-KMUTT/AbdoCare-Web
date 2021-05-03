import 'dart:math';

import 'package:AbdoCare_Web/Widget/shared/alert_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../services/interfaces/firebase_service_interface.dart';
import '../../services/service_locator.dart';

class MedicalTeamRegisterForm extends StatefulWidget {
  MedicalTeamRegisterForm({Key key}) : super(key: key);
  @override
  _MedicalTeamRegisterFormState createState() =>
      _MedicalTeamRegisterFormState();
}

class _MedicalTeamRegisterFormState extends State<MedicalTeamRegisterForm> {
  IFirebaseService _firebaseService = locator<IFirebaseService>();

  final _formKey = GlobalKey<FormState>();
  String _medicalcode;
  String _password;
  String _name;
  String _surname;
  String _role;
  String _ward;
  bool isEnableDropdown = false;

  String _generateRandomNumber(int length) {
    Random random = new Random();
    String min = '1';
    String max = '9';
    for (int i = 0; i < length - 1; i++) {
      min = '$min${0}';
      max = '$max${9}';
    }
    int randomedNumber =
        int.parse(min) + random.nextInt(int.parse(max) - int.parse(min));
    return randomedNumber.toString();
  }

  @override
  Widget build(BuildContext context) {
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
              margin: EdgeInsets.fromLTRB(60, 30, 60, 30),
              child: Card(
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.all(40),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(10, 8, 40, 8),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Text(
                                      'รหัสพยาบาล:\t\t\t',
                                      style:
                                          Theme.of(context).textTheme.bodyText2,
                                      textAlign: TextAlign.end,
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: TextFormField(
                                      maxLength: 6,
                                      inputFormatters: [
                                        FilteringTextInputFormatter.allow(
                                            RegExp("[a-zA-Z0-9]"))
                                      ],
                                      validator: (value) {
                                        return value.isEmpty
                                            ? 'กรุณากรอกรหัสพยาบาล'
                                            : null;
                                      },
                                      decoration: InputDecoration(
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.black26,
                                                width: 1),
                                          ),
                                          labelText: 'รหัสพยาบาล'),
                                      onSaved: (value) => _medicalcode = value,
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Text(
                                      'Password:\t\t\t',
                                      style:
                                          Theme.of(context).textTheme.bodyText2,
                                      textAlign: TextAlign.end,
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: TextFormField(
                                      validator: (value) {
                                        return value.isEmpty || value.length < 6
                                            ? 'Passwordต้องมีตัวอักษรมากกว่า6ตัว'
                                            : null;
                                      },
                                      decoration: InputDecoration(
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.black26,
                                                width: 1),
                                          ),
                                          labelText: 'Password'),
                                      onSaved: (value) => _password = value,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(10, 8, 40, 8),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Text(
                                      'ชื่อ:\t\t\t',
                                      style:
                                          Theme.of(context).textTheme.bodyText2,
                                      textAlign: TextAlign.end,
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: TextFormField(
                                      validator: (value) {
                                        return value.isEmpty
                                            ? 'กรุณากรอกชื่อ'
                                            : null;
                                      },
                                      decoration: InputDecoration(
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.black26,
                                                width: 1),
                                          ),
                                          labelText: 'ชื่อ'),
                                      onSaved: (value) => _name = value,
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Text(
                                      'นามสกุล:\t\t\t',
                                      style:
                                          Theme.of(context).textTheme.bodyText2,
                                      textAlign: TextAlign.end,
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: TextFormField(
                                      validator: (value) {
                                        return value.isEmpty
                                            ? 'กรุณากรอกนามสกุล'
                                            : null;
                                      },
                                      decoration: InputDecoration(
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.black26,
                                                width: 1),
                                          ),
                                          labelText: 'นามสกุล'),
                                      onSaved: (value) => _surname = value,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(10, 8, 40, 8),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Text(
                                      'ตำแหน่ง:\t\t',
                                      style:
                                          Theme.of(context).textTheme.bodyText2,
                                      textAlign: TextAlign.end,
                                    ),
                                  ),
                                  Container(
                                    child: Align(
                                      alignment: Alignment.centerRight,
                                      child: Radio(
                                          value: 'Medical Admin',
                                          activeColor: Color(0xFFC37447),
                                          groupValue: _role,
                                          onChanged: (value) {
                                            setState(() {
                                              _role = value;
                                              isEnableDropdown = false;
                                            });
                                          }),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 5,
                                    child: Text('Medical Admin',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText2),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(10, 8, 40, 8),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: SizedBox(),
                                  ),
                                  Container(
                                    child: Align(
                                      alignment: Alignment.centerRight,
                                      child: Radio(
                                          value: 'Medical Team',
                                          activeColor: Color(0xFFC37447),
                                          groupValue: _role,
                                          onChanged: (value) {
                                            setState(() {
                                              _role = value;
                                              isEnableDropdown = true;
                                            });
                                          }),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 5,
                                    child: Text('Medical Team',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText2),
                                  ),
                                ],
                              ),
                            ),
                            if (isEnableDropdown)
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(20, 8, 40, 8),
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Text(
                                        'Ward:\t\t\t',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText2,
                                        textAlign: TextAlign.end,
                                      ),
                                    ),
                                    Expanded(
                                      flex: 5,
                                      child: AbsorbPointer(
                                        absorbing: !isEnableDropdown,
                                        child: DropdownButtonFormField<String>(
                                          isExpanded: true,
                                          value: _ward,
                                          decoration: InputDecoration(
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.black26,
                                                  width: 1),
                                            ),
                                            labelText: 'Ward',
                                          ),
                                          onChanged: (value) =>
                                              setState(() => _ward = value),
                                          validator: (value) =>
                                              isEnableDropdown && value == null
                                                  ? 'กรุณาเลือกWard'
                                                  : null,
                                          items: ['1', '2', '3', '4']
                                              .map<DropdownMenuItem<String>>(
                                                  (String value) {
                                            return DropdownMenuItem<String>(
                                              value: value,
                                              child: Text(value),
                                            );
                                          }).toList(),
                                        ),
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
                    const MED_ID_LENGTH = 4;
                    if (_formKey.currentState.validate()) {
                      _formKey.currentState.save();

                      Map<String, dynamic> dataToDB = {
                        'name': _name,
                        'surname': _surname,
                        'medicalId':
                            'MD${_generateRandomNumber(MED_ID_LENGTH)}',
                        'username': '$_medicalcode@abdocare.com',
                        'password': _password,
                        'ward': _ward ?? '-',
                        'role': _role
                      };
                      _firebaseService.createMedicalTeam(data: dataToDB);

                      Navigator.pushNamed(context, '/postHos_page');
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
    );
  }
}
