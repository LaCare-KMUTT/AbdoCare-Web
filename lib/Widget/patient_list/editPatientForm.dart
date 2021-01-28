import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rounded_date_picker/rounded_picker.dart';
import 'package:intl/intl.dart';

import '../../services/interfaces/calculation_service_interface.dart';
import '../../services/interfaces/firebase_service_interface.dart';
import '../../services/service_locator.dart';
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
    @required DateTime dob,
    @required String patientTel,
    @required String careTakerName,
    @required String careTakerSurname,
    @required String careTakerTel,
    @required String careTakerRelationship,
    @required DateTime operationDate,
    @required String operationName,
    @required String operationMethod,
    @required String previousIllness,
    @required String state,
    @required String doctorName,
    @required String bedNumber,
    @required String roomNumber,
  }) submitFn;

  @override
  _EditPatientFormState createState() => _EditPatientFormState();
}

class _EditPatientFormState extends State<EditPatientForm> {
  final IFirebaseService _firebaseService = locator<IFirebaseService>();
  final ICalculationService _calculationService =
      locator<ICalculationService>();
  final _formKey = GlobalKey<FormState>();
  String pickedDate = '';
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
  DateTime _operationDate;
  String _operationName = '';
  String _operationMethod = '';
  String _previousIllness = '';
  String _state = '';
  String _doctorName = '';
  String _bedNumber = '';
  String _roomNumber = '';

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
    return _calculationService.formatDate(date: date);
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
      );
    }
  }

  var date;
  String _anId;

  void _fetchAnId(String userId) {
    Future.delayed(
      Duration(seconds: 2),
    ).then((value) async {
      var anId = await _firebaseService
          .getLatestAnSubCollection(docId: userId)
          .then((value) {
        return value['id'];
      });
      if (this.mounted) {
        setState(() {
          _anId = anId;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final String hn = ModalRoute.of(context).settings.arguments as String;

    final format = DateFormat('dd/MM/yyyy');

    return FutureBuilder<QuerySnapshot>(
        future: _firebaseService.searchDocumentByField(
            collection: 'Users', field: 'hn', fieldValue: hn),
        builder: (context, userCollection) {
          if (!userCollection.hasData) {
            print('userCollection does\'t have data in editPatientForm');
            return CircularProgressIndicator();
          } else {
            _fetchAnId(userCollection.data.docs.first.id);
            var user = userCollection.data.docs.first;
            return FutureBuilder<Map<String, dynamic>>(
                future: _firebaseService.getLatestSubCollectionSnapshot(
                    collection: 'Users',
                    docId: '${userCollection.data.docs.first.id}',
                    subCollection: 'an',
                    subCollectionDocId: _anId),
                builder: (context, anSubCollection) {
                  if (!anSubCollection.hasData) {
                    print('anSubCollection doesn\'t have data');
                    return CircularProgressIndicator();
                  } else {
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
                                    Container(
                                      decoration: BoxDecoration(
                                        border: Border(
                                          bottom: BorderSide(
                                            color: Colors.grey[300],
                                            width: 1.0,
                                          ),
                                        ),
                                      ),
                                      margin:
                                          EdgeInsets.fromLTRB(20, 20, 20, 20),
                                      child: Column(
                                        children: <Widget>[
                                          Row(
                                            children: <Widget>[
                                              Container(
                                                padding: EdgeInsets.all(10),
                                                child: Text(
                                                  'ข้อมูลผู้ป่วย',
                                                  style: TextStyle(
                                                      color: Color(0xFFC37447),
                                                      fontSize: 18),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                0, 8, 20, 8),
                                            child: Row(
                                              children: <Widget>[
                                                Expanded(
                                                  flex: 1,
                                                  child: Text(
                                                    'HN:\t\t\t',
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodyText2,
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
                                                      initialValue: hn,
                                                      decoration:
                                                          InputDecoration(
                                                              enabledBorder:
                                                                  OutlineInputBorder(
                                                                borderSide: BorderSide(
                                                                    color: Colors
                                                                        .black26,
                                                                    width: 1),
                                                              ),
                                                              labelText: 'HN'),
                                                      onSaved: (value) => _hn =
                                                          value.toUpperCase(),
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 2,
                                                  child: Text(
                                                    'AN:\t\t\t',
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodyText2,
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
                                                      initialValue:
                                                          anSubCollection
                                                              .data['an'],
                                                      decoration:
                                                          InputDecoration(
                                                              enabledBorder:
                                                                  OutlineInputBorder(
                                                                borderSide: BorderSide(
                                                                    color: Colors
                                                                        .black26,
                                                                    width: 1),
                                                              ),
                                                              labelText: 'AN'),
                                                      onSaved: (value) => _an =
                                                          value.toUpperCase(),
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
                                            padding: const EdgeInsets.fromLTRB(
                                                0, 8, 20, 8),
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
                                                            ? 'กรุณากรอกชื่อผู้ป่วย'
                                                            : null;
                                                      },
                                                      initialValue:
                                                          user.get('name'),
                                                      decoration:
                                                          InputDecoration(
                                                              enabledBorder:
                                                                  OutlineInputBorder(
                                                                borderSide: BorderSide(
                                                                    color: Colors
                                                                        .black26,
                                                                    width: 1),
                                                              ),
                                                              labelText:
                                                                  'ชื่อ'),
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
                                                  flex: 3,
                                                  child: Container(
                                                    width: 300,
                                                    child: TextFormField(
                                                      validator: (value) {
                                                        return value.isEmpty
                                                            ? 'กรุณากรอกนามสกุลผู้ป่วย'
                                                            : null;
                                                      },
                                                      initialValue:
                                                          user.get('surname'),
                                                      decoration:
                                                          InputDecoration(
                                                              enabledBorder:
                                                                  OutlineInputBorder(
                                                                borderSide: BorderSide(
                                                                    color: Colors
                                                                        .black26,
                                                                    width: 1),
                                                              ),
                                                              labelText:
                                                                  'นามสกุล'),
                                                      onSaved: (value) =>
                                                          _patientSurname =
                                                              value,
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
                                                  child:
                                                      DropdownButtonFormField(
                                                    isExpanded: true,
                                                    validator: (value) => value ==
                                                            null
                                                        ? 'กรุณาเลือกเพศของผู้ป่วย'
                                                        : null,
                                                    hint: DropdownMenuItem(
                                                      child: Text(
                                                        user.get('gender'),
                                                      ),
                                                      value: user.get('gender'),
                                                    ),
                                                    decoration: InputDecoration(
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color:
                                                                Colors.black26,
                                                            width: 1),
                                                      ),
                                                    ),
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
                                                              child:
                                                                  Text(label),
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
                                            padding: const EdgeInsets.fromLTRB(
                                                0, 8, 20, 8),
                                            child: Row(
                                              children: <Widget>[
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
                                                      validator: (value) {
                                                        return value.isEmpty
                                                            ? 'กรุณากรอกเบอร์โทร'
                                                            : null;
                                                      },
                                                      initialValue: user
                                                          .get('patientTel'),
                                                      decoration:
                                                          InputDecoration(
                                                              enabledBorder:
                                                                  OutlineInputBorder(
                                                                borderSide: BorderSide(
                                                                    color: Colors
                                                                        .black26,
                                                                    width: 1),
                                                              ),
                                                              labelText:
                                                                  'เบอร์โทร'),
                                                      onSaved: (value) =>
                                                          _patientTel = value,
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 2,
                                                  child: Container(
                                                    width: 150,
                                                    child: Text(
                                                      'วัน/เดือน/ปี เกิด:\t\t\t',
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
                                                      initialValue: user
                                                          .get('dob')
                                                          .toDate(),
                                                      validator:
                                                          (DateTime dateTime) {
                                                        if (dateTime == null) {
                                                          return "กรุณากรอกวัน/เดือน/ปีเกิดของผู้ป่วย";
                                                        }
                                                        return null;
                                                      },
                                                      format: format,
                                                      readOnly: false,
                                                      decoration:
                                                          InputDecoration(
                                                              enabledBorder:
                                                                  OutlineInputBorder(
                                                                borderSide: BorderSide(
                                                                    color: Colors
                                                                        .black26,
                                                                    width: 1),
                                                              ),
                                                              labelText:
                                                                  'วัน/เดือน/ปี เกิด'),
                                                      onShowPicker: (context,
                                                          currentValue) async {
                                                        FocusScope.of(context)
                                                            .requestFocus(
                                                                new FocusNode());
                                                        var date =
                                                            await _selectDate(
                                                                context,
                                                                currentValue);
                                                        return date;
                                                      },
                                                      onSaved: (date) =>
                                                          setState(
                                                        () {
                                                          _dob = date;
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
                                            padding: const EdgeInsets.fromLTRB(
                                                0, 8, 20, 20),
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
                                                      initialValue:
                                                          user.get('address'),
                                                      validator: (value) {
                                                        return value.isEmpty
                                                            ? 'กรุณากรอกที่อยู่ของผู้ป่วย'
                                                            : null;
                                                      },
                                                      decoration:
                                                          InputDecoration(
                                                              enabledBorder:
                                                                  OutlineInputBorder(
                                                                borderSide: BorderSide(
                                                                    color: Colors
                                                                        .black26,
                                                                    width: 1),
                                                              ),
                                                              labelText:
                                                                  'ที่อยู่'),
                                                      onSaved: (value) =>
                                                          _address = value,
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
                                    Container(
                                      decoration: BoxDecoration(
                                        border: Border(
                                          bottom: BorderSide(
                                            color: Colors.grey[300],
                                            width: 1.0,
                                          ),
                                        ),
                                      ),
                                      margin:
                                          EdgeInsets.fromLTRB(20, 0, 20, 20),
                                      child: Column(
                                        children: <Widget>[
                                          Row(
                                            children: <Widget>[
                                              Container(
                                                padding: EdgeInsets.all(10),
                                                child: Text(
                                                  'ข้อมูลผู้ดูแล',
                                                  style: TextStyle(
                                                      color: Color(0xFFC37447),
                                                      fontSize: 18),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                0, 8, 20, 8),
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
                                                      initialValue:
                                                          anSubCollection.data[
                                                              'careTakerName'],
                                                      validator: (value) {
                                                        return value.isEmpty
                                                            ? 'กรุณากรอกชื่อผู้ดูแล'
                                                            : null;
                                                      },
                                                      decoration:
                                                          InputDecoration(
                                                              enabledBorder:
                                                                  OutlineInputBorder(
                                                                borderSide: BorderSide(
                                                                    color: Colors
                                                                        .black26,
                                                                    width: 1),
                                                              ),
                                                              labelText:
                                                                  'ชื่อ'),
                                                      onSaved: (value) =>
                                                          _careTakerName =
                                                              value,
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
                                                  flex: 3,
                                                  child: Container(
                                                    width: 300,
                                                    child: TextFormField(
                                                      initialValue:
                                                          anSubCollection.data[
                                                              'careTakerSurname'],
                                                      validator: (value) {
                                                        return value.isEmpty
                                                            ? 'กรุณากรอกนามสกุลผู้ดูแล'
                                                            : null;
                                                      },
                                                      decoration:
                                                          InputDecoration(
                                                              enabledBorder:
                                                                  OutlineInputBorder(
                                                                borderSide: BorderSide(
                                                                    color: Colors
                                                                        .black26,
                                                                    width: 1),
                                                              ),
                                                              labelText:
                                                                  'นามสกุล'),
                                                      onSaved: (value) =>
                                                          _careTakerSurname =
                                                              value,
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
                                                      initialValue:
                                                          anSubCollection.data[
                                                              'careTakerTel'],
                                                      validator: (value) {
                                                        return value.isEmpty
                                                            ? 'กรุณากรอกเบอร์โทร'
                                                            : null;
                                                      },
                                                      decoration:
                                                          InputDecoration(
                                                              enabledBorder:
                                                                  OutlineInputBorder(
                                                                borderSide: BorderSide(
                                                                    color: Colors
                                                                        .black26,
                                                                    width: 1),
                                                              ),
                                                              labelText:
                                                                  'เบอร์โทร'),
                                                      onSaved: (value) =>
                                                          _careTakerTel = value,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                0, 10, 8, 20),
                                            child: Row(children: <Widget>[
                                              Expanded(
                                                flex: 2,
                                                child: Container(
                                                  width: 150,
                                                  child: Text(
                                                    'ความเกี่ยวข้องกับผู้ป่วย:\t\t\t',
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodyText2,
                                                    textAlign: TextAlign.end,
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                flex: 3,
                                                child: Container(
                                                  width: 300,
                                                  child: TextFormField(
                                                    initialValue: anSubCollection
                                                            .data[
                                                        'careTakerRelationship'],
                                                    validator: (value) {
                                                      return value.isEmpty
                                                          ? 'กรุณากรอกความเกี่ยวข้องกับผู้ป่วย'
                                                          : null;
                                                    },
                                                    decoration: InputDecoration(
                                                        enabledBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                                  color: Colors
                                                                      .black26,
                                                                  width: 1),
                                                        ),
                                                        labelText:
                                                            'ความเกี่ยวข้องกับผู้ป่วย'),
                                                    onSaved: (value) =>
                                                        _careTakerRelationship =
                                                            value,
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
                                    Container(
                                      decoration: BoxDecoration(
                                        border: Border(
                                          bottom: BorderSide(
                                            color: Colors.grey[300],
                                            width: 1.0,
                                          ),
                                        ),
                                      ),
                                      margin:
                                          EdgeInsets.fromLTRB(20, 0, 20, 20),
                                      child: Column(
                                        children: <Widget>[
                                          Row(
                                            children: <Widget>[
                                              Container(
                                                padding: EdgeInsets.all(10),
                                                child: Text(
                                                  'ข้อมูลทางการแพทย์',
                                                  style: TextStyle(
                                                      color: Color(0xFFC37447),
                                                      fontSize: 18),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                0, 8, 20, 8),
                                            child: Row(
                                              children: <Widget>[
                                                Expanded(
                                                  flex: 1,
                                                  child: Container(
                                                    width: 100,
                                                    child: Text(
                                                      'วันที่รับการรักษา:\t\t\t',
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyText2,
                                                      textAlign: TextAlign.end,
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 1,
                                                  child: Container(
                                                    width: 300,
                                                    child: DateTimeField(
                                                        initialValue:
                                                            anSubCollection
                                                                .data[
                                                                    'operationDate']
                                                                .toDate(),
                                                        validator: (DateTime
                                                            dateTime) {
                                                          if (dateTime ==
                                                              null) {
                                                            return "กรุณากรอกวันที่รับการรักษา";
                                                          }
                                                          return null;
                                                        },
                                                        format: format,
                                                        readOnly: false,
                                                        decoration:
                                                            InputDecoration(
                                                                enabledBorder:
                                                                    OutlineInputBorder(
                                                                  borderSide: BorderSide(
                                                                      color: Colors
                                                                          .black26,
                                                                      width: 1),
                                                                ),
                                                                labelText:
                                                                    'วันที่รับการรักษา'),
                                                        onShowPicker: (context,
                                                            currentValue) {
                                                          FocusScope.of(context)
                                                              .requestFocus(
                                                                  new FocusNode());
                                                          return date =
                                                              _selectDate(
                                                                  context,
                                                                  currentValue);
                                                        },
                                                        onSaved: (date) {
                                                          setState(
                                                            () {
                                                              _operationDate =
                                                                  date;
                                                            },
                                                          );
                                                        }),
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 1,
                                                  child: Container(
                                                    width: 100,
                                                    child: Text(
                                                      'ชื่อการผ่าตัด:\t\t\t',
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyText2,
                                                      textAlign: TextAlign.end,
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 1,
                                                  child: Container(
                                                    width: 300,
                                                    child: TextFormField(
                                                      initialValue:
                                                          anSubCollection.data[
                                                              'operationName'],
                                                      validator: (value) {
                                                        return value.isEmpty
                                                            ? 'กรุณากรอกชื่อการผ่าตัด'
                                                            : null;
                                                      },
                                                      decoration:
                                                          InputDecoration(
                                                              enabledBorder:
                                                                  OutlineInputBorder(
                                                                borderSide: BorderSide(
                                                                    color: Colors
                                                                        .black26,
                                                                    width: 1),
                                                              ),
                                                              labelText:
                                                                  'ชื่อการผ่าตัด'),
                                                      onSaved: (value) =>
                                                          _operationName =
                                                              value,
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 1,
                                                  child: Container(
                                                    width: 100,
                                                    child: Text(
                                                      'ชื่อแพทย์ที่รักษา:\t\t\t',
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
                                                            ? 'กรุณากรอกชื่อชื่อแพทย์ที่รักษา'
                                                            : null;
                                                      },
                                                      initialValue:
                                                          anSubCollection.data[
                                                              'doctorName'],
                                                      decoration:
                                                          InputDecoration(
                                                              enabledBorder:
                                                                  OutlineInputBorder(
                                                                borderSide: BorderSide(
                                                                    color: Colors
                                                                        .black26,
                                                                    width: 1),
                                                              ),
                                                              labelText:
                                                                  'ชื่อแพทย์ที่รักษา'),
                                                      onSaved: (value) =>
                                                          _doctorName = value,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                0, 8, 20, 8),
                                            child: Row(
                                              children: <Widget>[
                                                Expanded(
                                                  flex: 1,
                                                  child: Container(
                                                    width: 100,
                                                    child: Text(
                                                      'โรคร่วม:\t\t\t',
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyText2,
                                                      textAlign: TextAlign.end,
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 1,
                                                  child: Container(
                                                    width: 300,
                                                    child: TextFormField(
                                                      initialValue:
                                                          anSubCollection.data[
                                                              'previousIllness'],
                                                      validator: (value) {
                                                        return value.isEmpty
                                                            ? 'กรุณากรอกโรคร่วม'
                                                            : null;
                                                      },
                                                      decoration:
                                                          InputDecoration(
                                                              enabledBorder:
                                                                  OutlineInputBorder(
                                                                borderSide: BorderSide(
                                                                    color: Colors
                                                                        .black26,
                                                                    width: 1),
                                                              ),
                                                              labelText:
                                                                  'โรคร่วม'),
                                                      onSaved: (value) =>
                                                          _previousIllness =
                                                              value,
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 1,
                                                  child: Container(
                                                    width: 150,
                                                    child: Text(
                                                      'ประเภทการผ่าตัด:\t\t\t',
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyText2,
                                                      textAlign: TextAlign.end,
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 1,
                                                  child:
                                                      DropdownButtonFormField(
                                                    isExpanded: true,
                                                    validator: (value) => value ==
                                                            null
                                                        ? 'กรุณาเลือกประเภทการผ่าตัด'
                                                        : null,
                                                    hint: DropdownMenuItem(
                                                      child: Text(
                                                        anSubCollection.data[
                                                            'operationMethod'],
                                                      ),
                                                      value: anSubCollection
                                                              .data[
                                                          'operationMethod'],
                                                    ),
                                                    decoration: InputDecoration(
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color:
                                                                Colors.black26,
                                                            width: 1),
                                                      ),
                                                      // labelText:
                                                      //     'ประเภทการผ่าตัด')
                                                    ),
                                                    onSaved: (value) {
                                                      _operationMethod = value;
                                                    },
                                                    items: [
                                                      'Exploration',
                                                      'LAP+Operation',
                                                    ]
                                                        .map((label) =>
                                                            DropdownMenuItem(
                                                              child:
                                                                  Text(label),
                                                              value: label,
                                                            ))
                                                        .toList(),
                                                    onChanged: (value) {
                                                      setState(() {
                                                        _operationMethod =
                                                            value;
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
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyText2,
                                                      textAlign: TextAlign.end,
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 2,
                                                  child:
                                                      DropdownButtonFormField(
                                                    isExpanded: true,
                                                    validator: (value) => value ==
                                                            null
                                                        ? 'กรุณาเลือกขั้นตอนการรักษา'
                                                        : null,
                                                    decoration: InputDecoration(
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color:
                                                                Colors.black26,
                                                            width: 1),
                                                      ),
                                                    ),
                                                    onSaved: (value) {
                                                      _state = value;
                                                    },
                                                    items: [
                                                      'Pre-Operation',
                                                      'Post-Operation@Hospital',
                                                      'Post-Operation@Home'
                                                    ]
                                                        .map((label) =>
                                                            DropdownMenuItem(
                                                              child:
                                                                  Text(label),
                                                              value: label,
                                                            ))
                                                        .toList(),
                                                    onChanged: (value) {
                                                      setState(() {
                                                        _state = value;
                                                      });
                                                    },
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                0, 8, 20, 20),
                                            child: Row(
                                              children: <Widget>[
                                                Expanded(
                                                  flex: 1,
                                                  child: Text(
                                                    'หมายเลขห้อง:\t\t\t',
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodyText2,
                                                    textAlign: TextAlign.end,
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 1,
                                                  child: Container(
                                                    width: 300,
                                                    child: TextFormField(
                                                      initialValue:
                                                          anSubCollection.data[
                                                              'bedNumber'],
                                                      validator: (value) {
                                                        return value.isEmpty
                                                            ? 'กรุณากรอกหมายเลขห้อง'
                                                            : null;
                                                      },
                                                      decoration:
                                                          InputDecoration(
                                                              enabledBorder:
                                                                  OutlineInputBorder(
                                                                borderSide: BorderSide(
                                                                    color: Colors
                                                                        .black26,
                                                                    width: 1),
                                                              ),
                                                              labelText:
                                                                  'หมายเลขห้อง'),
                                                      onSaved: (value) =>
                                                          _roomNumber = value,
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 1,
                                                  child: Text(
                                                    'หมายเลขเตียง:\t\t\t',
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodyText2,
                                                    textAlign: TextAlign.end,
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 1,
                                                  child: Container(
                                                    width: 300,
                                                    child: TextFormField(
                                                      initialValue:
                                                          anSubCollection.data[
                                                              'bedNumber'],
                                                      validator: (value) {
                                                        return value.isEmpty
                                                            ? 'กรุณากรอกหมายเลขเตียง'
                                                            : null;
                                                      },
                                                      decoration:
                                                          InputDecoration(
                                                              enabledBorder:
                                                                  OutlineInputBorder(
                                                                borderSide: BorderSide(
                                                                    color: Colors
                                                                        .black26,
                                                                    width: 1),
                                                              ),
                                                              labelText:
                                                                  'หมายเลขเตียง'),
                                                      onSaved: (value) =>
                                                          _bedNumber = value,
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                    flex: 3,
                                                    child: SizedBox(width: 0))
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
                                            borderRadius:
                                                BorderRadius.circular(7.0),
                                          ),
                                          padding: EdgeInsets.all(15),
                                          onPressed: () async {
                                            if (_formKey.currentState
                                                .validate()) {
                                              _trySubmit();
                                              Navigator.pop(context);
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
                    );
                  }
                });
          }
        });
  }
}
