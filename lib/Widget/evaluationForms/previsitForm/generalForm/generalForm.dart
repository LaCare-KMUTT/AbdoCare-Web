import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../models/evalutate_form/pre_visit/generalForm_model.dart';
import '../../../../services/service_locator.dart';
import '../../../../view_models/evaluate_form/generalForm_view_model.dart';
import '../../../appbar.dart';
import '../../../material.dart';
import '../../../shared/rounded_date_picker.dart';
import '../../../sidebar.dart';
import '../adlForm/adlForm.dart';
import 'allergy_medication.dart';
import 'allergy_to_latex.dart';
import 'antiPlatelet.dart';
import 'asaClass.dart';
import 'consent_sign.dart';
import 'drug_and_substance.dart';
import 'previous_illness.dart';
import 'psychologicalStatus.dart';
import 'sleep_disorder.dart';
import 'type_of_anesthesia.dart';

class GeneralForm extends StatefulWidget {
  final String hn;
  GeneralForm({Key key, @required this.hn}) : super(key: key);
  @override
  _GeneralFormState createState() => _GeneralFormState();
}

class _GeneralFormState extends State<GeneralForm> {
  final CustomMaterial _customMaterial = locator<CustomMaterial>();
  final _formKey = GlobalKey<FormState>();

  String _hn = '';
  String _an = '';
  String _patientName = '';
  String _patientSurname = '';
  DateTime _dob;
  DateTime _operationDate;
  String _gender = '';
  String _ward = '';
  String _operationMethod = '';
  String _diagnosis = '';
  String _consentSigned = '';
  String _preMedication = '';
  String _typeOfAnesthesia = '';
  String _previousIllness = '';
  String _drugUsed = '';
  String _asaClass = '';
  String _bw = '';
  String _high = '';
  String _weight = '';
  String _previousSurgery = '';
  String _antiPlateletReason = '';
  String _antiPlateletDays = '';
  String _allergyMedication = '';
  String _allergySymptoms = '';
  String _allergyLatex = '';
  String _psychologicalStatus = '';
  String _drugAndSubstance = '';
  String _sleepDisorder = '';
  String _sleepDisorderDuration = '';
  String _sleepDisorderDurationAvg = '';

  var date;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    final format = DateFormat('dd/MM/yyyy');
    return Scaffold(
      appBar: BaseAppBar(
        title: Text('แบบประเมิน'),
        appBar: AppBar(),
      ),
      drawer: SideBar(),
      body: Container(
        child: GestureDetector(
          onTap: () {
            FocusScopeNode currentFocus = FocusScope.of(context);
            if (!currentFocus.hasPrimaryFocus) {
              currentFocus.unfocus();
            }
          },
          child: LayoutBuilder(builder: (context, constraints) {
            return ListView(
              children: [
                Padding(
                  padding: EdgeInsets.all(screenSize.height / 70),
                  child: Container(
                    child: Center(
                      child: Text(
                        'บันทึกการเยี่ยมผู้รับบริการสูงอายุก่อนผ่าตัด(Pre-visit)',
                        style: TextStyle(
                          fontSize: 20,
                          color: Color(0xFFC37447),
                        ),
                      ),
                    ),
                  ),
                ),
                Center(
                  child: SafeArea(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Form(
                        key: _formKey,
                        child: Container(
                          child: ConstrainedBox(
                            constraints: BoxConstraints(
                                minWidth: constraints.minWidth,
                                minHeight: constraints.minHeight),
                            child: IntrinsicWidth(
                              child: Column(
                                children: [
                                  Card(
                                    child: FutureBuilder<GeneralFormModel>(
                                        future: GeneralFormViewModel.getModel(
                                            widget.hn),
                                        builder: (context, snapshot) {
                                          if (!snapshot.hasData) {
                                            return Padding(
                                              padding:
                                                  const EdgeInsets.all(10.0),
                                              child: CircularProgressIndicator(
                                                  strokeWidth: 4),
                                            );
                                          }
                                          return Column(
                                            children: [
                                              Container(
                                                child: Column(
                                                  children: [
                                                    Container(
                                                      child: Padding(
                                                        padding: _customMaterial
                                                            .getEdgeInsetLTRB7070700(
                                                                context),
                                                        child: Row(
                                                          children: [
                                                            Expanded(
                                                                child: Text(
                                                                    'General Information',
                                                                    style: TextStyle(
                                                                        fontWeight:
                                                                            FontWeight.w600))),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      child: Padding(
                                                        padding: EdgeInsets.all(
                                                            screenSize.height /
                                                                70),
                                                        child: Row(
                                                          children: <Widget>[
                                                            Expanded(
                                                                child: Text(
                                                              'Name:\t\t\t',
                                                              textAlign:
                                                                  TextAlign.end,
                                                            )),
                                                            Expanded(
                                                              flex: 2,
                                                              child:
                                                                  TextFormField(
                                                                initialValue:
                                                                    snapshot
                                                                        .data
                                                                        .patientName,
                                                                enabled: false,
                                                                validator:
                                                                    (value) {
                                                                  return value
                                                                          .isEmpty
                                                                      ? 'กรุณากรอกชื่อผู้ป่วย'
                                                                      : null;
                                                                },
                                                                decoration:
                                                                    InputDecoration(
                                                                        contentPadding: new EdgeInsets.symmetric(
                                                                            vertical:
                                                                                8.0,
                                                                            horizontal:
                                                                                10.0),
                                                                        enabledBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide: BorderSide(
                                                                              color: Colors.black26,
                                                                              width: 1),
                                                                        ),
                                                                        labelText:
                                                                            'Name'),
                                                                onSaved: (value) =>
                                                                    _patientName =
                                                                        value,
                                                              ),
                                                            ),
                                                            Expanded(
                                                                child: Text(
                                                                    'Surname:\t\t\t',
                                                                    textAlign:
                                                                        TextAlign
                                                                            .end)),
                                                            Expanded(
                                                              flex: 2,
                                                              child:
                                                                  TextFormField(
                                                                initialValue:
                                                                    snapshot
                                                                        .data
                                                                        .patientSurname,
                                                                enabled: false,
                                                                validator:
                                                                    (value) {
                                                                  return value
                                                                          .isEmpty
                                                                      ? 'กรุณากรอกนามสกุลผู้ป่วย'
                                                                      : null;
                                                                },
                                                                decoration:
                                                                    InputDecoration(
                                                                        contentPadding: new EdgeInsets.symmetric(
                                                                            vertical:
                                                                                8.0,
                                                                            horizontal:
                                                                                10.0),
                                                                        enabledBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide: BorderSide(
                                                                              color: Colors.black26,
                                                                              width: 1),
                                                                        ),
                                                                        labelText:
                                                                            'Surname'),
                                                                onSaved: (value) =>
                                                                    _patientSurname =
                                                                        value,
                                                              ),
                                                            ),
                                                            Expanded(
                                                                child: Text(
                                                                    'HN:\t\t\t',
                                                                    textAlign:
                                                                        TextAlign
                                                                            .end)),
                                                            Expanded(
                                                              child:
                                                                  TextFormField(
                                                                initialValue:
                                                                    snapshot
                                                                        .data
                                                                        .hn,
                                                                enabled: false,
                                                                validator:
                                                                    (value) {
                                                                  return value
                                                                          .isEmpty
                                                                      ? 'กรุณากรอกHN'
                                                                      : null;
                                                                },
                                                                decoration:
                                                                    InputDecoration(
                                                                        contentPadding: new EdgeInsets.symmetric(
                                                                            vertical:
                                                                                8.0,
                                                                            horizontal:
                                                                                10.0),
                                                                        enabledBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide: BorderSide(
                                                                              color: Colors.black26,
                                                                              width: 1),
                                                                        ),
                                                                        labelText:
                                                                            'HN'),
                                                                onSaved:
                                                                    (value) =>
                                                                        _hn =
                                                                            value,
                                                              ),
                                                            ),
                                                            Expanded(
                                                                child: Text(
                                                                    'AN:\t\t\t',
                                                                    textAlign:
                                                                        TextAlign
                                                                            .end)),
                                                            Expanded(
                                                              child:
                                                                  TextFormField(
                                                                initialValue:
                                                                    snapshot
                                                                        .data
                                                                        .an,
                                                                enabled: false,
                                                                validator:
                                                                    (value) {
                                                                  return value
                                                                          .isEmpty
                                                                      ? 'กรุณากรอกAN'
                                                                      : null;
                                                                },
                                                                decoration:
                                                                    InputDecoration(
                                                                        contentPadding: new EdgeInsets.symmetric(
                                                                            vertical:
                                                                                8.0,
                                                                            horizontal:
                                                                                10.0),
                                                                        enabledBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide: BorderSide(
                                                                              color: Colors.black26,
                                                                              width: 1),
                                                                        ),
                                                                        labelText:
                                                                            'AN'),
                                                                onSaved:
                                                                    (value) =>
                                                                        _an =
                                                                            value,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Row(
                                                          children: <Widget>[
                                                            Expanded(
                                                                child: Text(
                                                                    'Gender:\t\t\t',
                                                                    textAlign:
                                                                        TextAlign
                                                                            .end)),
                                                            Expanded(
                                                              flex: 2,
                                                              child:
                                                                  TextFormField(
                                                                initialValue:
                                                                    snapshot
                                                                        .data
                                                                        .gender,
                                                                enabled: false,
                                                                validator:
                                                                    (value) {
                                                                  return value
                                                                          .isEmpty
                                                                      ? 'กรุณากรอกเพศ'
                                                                      : null;
                                                                },
                                                                decoration:
                                                                    InputDecoration(
                                                                        contentPadding: new EdgeInsets.symmetric(
                                                                            vertical:
                                                                                8.0,
                                                                            horizontal:
                                                                                10.0),
                                                                        enabledBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide: BorderSide(
                                                                              color: Colors.black26,
                                                                              width: 1),
                                                                        ),
                                                                        labelText:
                                                                            'Gender'),
                                                                onSaved: (value) =>
                                                                    _gender =
                                                                        value,
                                                              ),
                                                            ),
                                                            Expanded(
                                                                flex: 1,
                                                                child: Text(
                                                                    'Ward:\t\t\t',
                                                                    textAlign:
                                                                        TextAlign
                                                                            .end)),
                                                            Expanded(
                                                              flex: 2,
                                                              child:
                                                                  DropdownButtonFormField(
                                                                // value: snapshot
                                                                //     .data.ward,
                                                                hint:
                                                                    DropdownMenuItem(
                                                                  child: Text(
                                                                      snapshot
                                                                          .data
                                                                          .ward),
                                                                ),
                                                                isExpanded:
                                                                    true,
                                                                validator: (value) =>
                                                                    value ==
                                                                            null
                                                                        ? 'กรุณาเลือกWard'
                                                                        : null,
                                                                decoration:
                                                                    InputDecoration(
                                                                  contentPadding: new EdgeInsets
                                                                          .symmetric(
                                                                      vertical:
                                                                          8.0,
                                                                      horizontal:
                                                                          10.0),
                                                                  enabledBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide: BorderSide(
                                                                        color: Colors
                                                                            .black26,
                                                                        width:
                                                                            1),
                                                                  ),
                                                                ),
                                                                onSaved:
                                                                    (value) {
                                                                  _ward = value;
                                                                },
                                                                items: [
                                                                  '1',
                                                                  '2',
                                                                  '3',
                                                                  '4'
                                                                ]
                                                                    .map((label) =>
                                                                        DropdownMenuItem(
                                                                          child:
                                                                              Text(label),
                                                                          value:
                                                                              label,
                                                                        ))
                                                                    .toList(),
                                                                onChanged:
                                                                    (value) {
                                                                  setState(() {
                                                                    _ward =
                                                                        value;
                                                                  });
                                                                },
                                                              ),
                                                            ),
                                                            Expanded(
                                                                flex: 2,
                                                                child: Text(
                                                                    'Date of Birth:\t\t\t',
                                                                    textAlign:
                                                                        TextAlign
                                                                            .end)),
                                                            Expanded(
                                                              flex: 2,
                                                              child: Container(
                                                                width: 300,
                                                                child: DateTimeField(
                                                                    initialValue: snapshot.data.dob,
                                                                    enabled: false,
                                                                    validator: (DateTime dateTime) {
                                                                      if (dateTime ==
                                                                          null) {
                                                                        return "กรุณากรอกวันเกิด";
                                                                      }
                                                                      return null;
                                                                    },
                                                                    format: format,
                                                                    readOnly: false,
                                                                    decoration: InputDecoration(
                                                                        contentPadding: new EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
                                                                        enabledBorder: OutlineInputBorder(
                                                                          borderSide: BorderSide(
                                                                              color: Colors.black26,
                                                                              width: 1),
                                                                        ),
                                                                        labelText: 'Date of Birth'),
                                                                    onShowPicker: (context, currentValue) {
                                                                      FocusScope.of(
                                                                              context)
                                                                          .requestFocus(
                                                                              new FocusNode());
                                                                      return date = RoundedDatePicker().selectDate(
                                                                          context,
                                                                          currentValue);
                                                                    },
                                                                    onSaved: (date) {
                                                                      setState(
                                                                        () {
                                                                          _dob =
                                                                              date;
                                                                        },
                                                                      );
                                                                    }),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Row(
                                                          children: <Widget>[
                                                            Expanded(
                                                                child: Text(
                                                                    'Diagnosis:\t\t\t',
                                                                    textAlign:
                                                                        TextAlign
                                                                            .end)),
                                                            Expanded(
                                                              flex: 2,
                                                              child:
                                                                  TextFormField(
                                                                initialValue:
                                                                    snapshot.data
                                                                            .diagnosis ??
                                                                        '-',
                                                                validator:
                                                                    (value) {
                                                                  return value
                                                                          .isEmpty
                                                                      ? 'กรุณากรอกDiagnosis'
                                                                      : null;
                                                                },
                                                                decoration:
                                                                    InputDecoration(
                                                                        contentPadding: new EdgeInsets.symmetric(
                                                                            vertical:
                                                                                8.0,
                                                                            horizontal:
                                                                                10.0),
                                                                        enabledBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide: BorderSide(
                                                                              color: Colors.black26,
                                                                              width: 1),
                                                                        ),
                                                                        labelText:
                                                                            'Diagnosis'),
                                                                onSaved: (value) =>
                                                                    _diagnosis =
                                                                        value,
                                                              ),
                                                            ),
                                                            Expanded(
                                                                child: Text(
                                                                    'Operation:\t\t\t',
                                                                    textAlign:
                                                                        TextAlign
                                                                            .end)),
                                                            Expanded(
                                                              flex: 2,
                                                              child: TextFormField(
                                                                  initialValue: snapshot.data.operationMethod ?? '-',
                                                                  enabled: false,
                                                                  validator: (value) {
                                                                    return value
                                                                            .isEmpty
                                                                        ? 'กรุณากรอกOperation'
                                                                        : null;
                                                                  },
                                                                  decoration: InputDecoration(
                                                                      contentPadding: new EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
                                                                      enabledBorder: OutlineInputBorder(
                                                                        borderSide: BorderSide(
                                                                            color:
                                                                                Colors.black26,
                                                                            width: 1),
                                                                      ),
                                                                      labelText: 'Operation'),
                                                                  onSaved: (value) {
                                                                    _operationMethod =
                                                                        value ??
                                                                            '-';
                                                                  }),
                                                            ),
                                                            Expanded(
                                                                flex: 2,
                                                                child: Text(
                                                                    'Operation date:\t\t\t',
                                                                    textAlign:
                                                                        TextAlign
                                                                            .end)),
                                                            Expanded(
                                                              flex: 2,
                                                              child: Container(
                                                                width: 300,
                                                                child: DateTimeField(
                                                                    initialValue: snapshot.data.operationDate,
                                                                    enabled: false,
                                                                    validator: (DateTime dateTime) {
                                                                      if (dateTime ==
                                                                          null) {
                                                                        return "กรุณากรอกวันที่รับการรักษา";
                                                                      }
                                                                      return null;
                                                                    },
                                                                    format: format,
                                                                    readOnly: false,
                                                                    decoration: InputDecoration(
                                                                        contentPadding: new EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
                                                                        enabledBorder: OutlineInputBorder(
                                                                          borderSide: BorderSide(
                                                                              color: Colors.black26,
                                                                              width: 1),
                                                                        ),
                                                                        labelText: 'Operation date'),
                                                                    onShowPicker: (context, currentValue) {
                                                                      FocusScope.of(
                                                                              context)
                                                                          .requestFocus(
                                                                              new FocusNode());
                                                                      return date = RoundedDatePicker().selectDate(
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
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      child: Padding(
                                                        padding: _customMaterial
                                                            .getEdgeInsetLTRB7070700(
                                                                context),
                                                        child: ConsentSign(
                                                            onSaved: (value) =>
                                                                _consentSigned =
                                                                    value,
                                                            consentFromDb: snapshot
                                                                .data
                                                                .consentSigned),
                                                      ),
                                                    ),
                                                    Container(
                                                      child: Padding(
                                                        padding: _customMaterial
                                                            .getEdgeInsetLTRB7070700(
                                                                context),
                                                        child: Row(
                                                          children: <Widget>[
                                                            Expanded(
                                                                flex: screenSize
                                                                        .height ~/
                                                                    400,
                                                                child: Text(
                                                                    'Pre-medication',
                                                                    style: TextStyle(
                                                                        fontWeight:
                                                                            FontWeight.w600))),
                                                            Expanded(
                                                              flex: screenSize
                                                                      .height ~/
                                                                  150,
                                                              child:
                                                                  TextFormField(
                                                                keyboardType:
                                                                    TextInputType
                                                                        .multiline,
                                                                minLines: 1,
                                                                maxLines: 5,
                                                                validator:
                                                                    (value) {
                                                                  return value
                                                                          .isEmpty
                                                                      ? 'กรุณากรอกPre-medication'
                                                                      : null;
                                                                },
                                                                decoration:
                                                                    InputDecoration(
                                                                        contentPadding: new EdgeInsets.symmetric(
                                                                            vertical:
                                                                                8.0,
                                                                            horizontal:
                                                                                10.0),
                                                                        enabledBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide: BorderSide(
                                                                              color: Colors.black26,
                                                                              width: 1),
                                                                        ),
                                                                        labelText:
                                                                            'Pre-medication'),
                                                                onSaved: (value) =>
                                                                    _preMedication =
                                                                        value,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      child: Padding(
                                                        padding: _customMaterial
                                                            .getEdgeInsetLTRB7070700(
                                                                context),
                                                        child: TypeOfAnesthesia(
                                                            onSaved: (value) =>
                                                                _typeOfAnesthesia =
                                                                    value),
                                                      ),
                                                    ),
                                                    PreviousIllness(
                                                        onSaved: (value) =>
                                                            _previousIllness =
                                                                value),
                                                    Container(
                                                      child: Padding(
                                                        padding: _customMaterial
                                                            .getEdgeInsetLTRB7070700(
                                                                context),
                                                        child: Row(
                                                          children: <Widget>[
                                                            Expanded(
                                                                flex: screenSize
                                                                        .height ~/
                                                                    400,
                                                                child: Text(
                                                                    'Drug used(ระบุ)',
                                                                    style: TextStyle(
                                                                        fontWeight:
                                                                            FontWeight.w600))),
                                                            Expanded(
                                                              flex: screenSize
                                                                      .height ~/
                                                                  150,
                                                              child:
                                                                  TextFormField(
                                                                keyboardType:
                                                                    TextInputType
                                                                        .multiline,
                                                                minLines: 1,
                                                                maxLines: 5,
                                                                validator:
                                                                    (value) {
                                                                  return value
                                                                          .isEmpty
                                                                      ? 'กรุณากรอกDrug used'
                                                                      : null;
                                                                },
                                                                decoration:
                                                                    InputDecoration(
                                                                        contentPadding: new EdgeInsets.symmetric(
                                                                            vertical:
                                                                                8.0,
                                                                            horizontal:
                                                                                10.0),
                                                                        enabledBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide: BorderSide(
                                                                              color: Colors.black26,
                                                                              width: 1),
                                                                        ),
                                                                        labelText:
                                                                            'Drug used'),
                                                                onSaved: (value) =>
                                                                    _drugUsed =
                                                                        value,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      child: Padding(
                                                        padding: _customMaterial
                                                            .getEdgeInsetLTRB7070700(
                                                                context),
                                                        child: Row(
                                                          children: <Widget>[
                                                            Expanded(
                                                                child: Text(
                                                                    'ASA Classification',
                                                                    style: TextStyle(
                                                                        fontWeight:
                                                                            FontWeight.w600))),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    ASAClass(
                                                      onSaved: (value) =>
                                                          _asaClass = value,
                                                    ),
                                                    Container(
                                                      child: Padding(
                                                        padding: _customMaterial
                                                            .getEdgeInsetLTRB7070700(
                                                                context),
                                                        child: Row(
                                                          children: <Widget>[
                                                            Expanded(
                                                                flex: 3,
                                                                child: Text(
                                                                    'Nutrition',
                                                                    style: TextStyle(
                                                                        fontWeight:
                                                                            FontWeight.w600))),
                                                            Flexible(
                                                                child: Text(
                                                                    'BW:\t\t\t',
                                                                    textAlign:
                                                                        TextAlign
                                                                            .end)),
                                                            Expanded(
                                                              flex: 2,
                                                              child:
                                                                  TextFormField(
                                                                validator:
                                                                    (value) {
                                                                  return value
                                                                          .isEmpty
                                                                      ? 'กรุณากรอกBW'
                                                                      : null;
                                                                },
                                                                decoration:
                                                                    InputDecoration(
                                                                        contentPadding: new EdgeInsets.symmetric(
                                                                            vertical:
                                                                                8.0,
                                                                            horizontal:
                                                                                10.0),
                                                                        enabledBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide: BorderSide(
                                                                              color: Colors.black26,
                                                                              width: 1),
                                                                        ),
                                                                        labelText:
                                                                            'BW'),
                                                                onSaved:
                                                                    (value) =>
                                                                        _bw =
                                                                            value,
                                                              ),
                                                            ),
                                                            Expanded(
                                                                child: Text(
                                                                    ' Kg.')),
                                                            Expanded(
                                                                flex: 1,
                                                                child: Text(
                                                                    'High:\t\t\t',
                                                                    textAlign:
                                                                        TextAlign
                                                                            .end)),
                                                            Expanded(
                                                              flex: 2,
                                                              child:
                                                                  TextFormField(
                                                                validator:
                                                                    (value) {
                                                                  return value
                                                                          .isEmpty
                                                                      ? 'กรุณากรอกHigh'
                                                                      : null;
                                                                },
                                                                decoration:
                                                                    InputDecoration(
                                                                        contentPadding: new EdgeInsets.symmetric(
                                                                            vertical:
                                                                                8.0,
                                                                            horizontal:
                                                                                10.0),
                                                                        enabledBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide: BorderSide(
                                                                              color: Colors.black26,
                                                                              width: 1),
                                                                        ),
                                                                        labelText:
                                                                            'High'),
                                                                onSaved:
                                                                    (value) =>
                                                                        _high =
                                                                            value,
                                                              ),
                                                            ),
                                                            Flexible(
                                                                child: Text(
                                                                    ' Cm.')),
                                                            Expanded(
                                                                flex: 3,
                                                                child: Text(
                                                                    'Last (1,3,6) month:\t\t\t',
                                                                    textAlign:
                                                                        TextAlign
                                                                            .end)),
                                                            Expanded(
                                                              flex: 2,
                                                              child:
                                                                  TextFormField(
                                                                validator:
                                                                    (value) {
                                                                  return value
                                                                          .isEmpty
                                                                      ? 'กรุณากรอกWeight'
                                                                      : null;
                                                                },
                                                                decoration:
                                                                    InputDecoration(
                                                                        contentPadding: new EdgeInsets.symmetric(
                                                                            vertical:
                                                                                8.0,
                                                                            horizontal:
                                                                                10.0),
                                                                        enabledBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide: BorderSide(
                                                                              color: Colors.black26,
                                                                              width: 1),
                                                                        ),
                                                                        labelText:
                                                                            'Weight'),
                                                                onSaved: (value) =>
                                                                    _weight =
                                                                        value,
                                                              ),
                                                            ),
                                                            Flexible(
                                                                child: Text(
                                                                    ' Kg.')),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      child: Padding(
                                                        padding: _customMaterial
                                                            .getEdgeInsetLTRB7070700(
                                                                context),
                                                        child: Row(
                                                          children: <Widget>[
                                                            Expanded(
                                                                flex: screenSize
                                                                        .height ~/
                                                                    400,
                                                                child: Text(
                                                                    'Previous surgery',
                                                                    style: TextStyle(
                                                                        fontWeight:
                                                                            FontWeight.w600))),
                                                            Expanded(
                                                              flex: screenSize
                                                                      .height ~/
                                                                  150,
                                                              child:
                                                                  TextFormField(
                                                                keyboardType:
                                                                    TextInputType
                                                                        .multiline,
                                                                minLines: 1,
                                                                maxLines: 5,
                                                                validator:
                                                                    (value) {
                                                                  return value
                                                                          .isEmpty
                                                                      ? 'กรุณากรอกPrevious surgery'
                                                                      : null;
                                                                },
                                                                decoration:
                                                                    InputDecoration(
                                                                        contentPadding: new EdgeInsets.symmetric(
                                                                            vertical:
                                                                                8.0,
                                                                            horizontal:
                                                                                10.0),
                                                                        enabledBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide: BorderSide(
                                                                              color: Colors.black26,
                                                                              width: 1),
                                                                        ),
                                                                        labelText:
                                                                            'Previous surgery'),
                                                                onSaved: (value) =>
                                                                    _previousSurgery =
                                                                        value,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      child: Padding(
                                                        padding: _customMaterial
                                                            .getEdgeInsetLTRB7070700(
                                                                context),
                                                        child: AntiPlatelet(
                                                          onSavedDay: (value) =>
                                                              _antiPlateletDays =
                                                                  value,
                                                          onSavedReason: (value) =>
                                                              _antiPlateletReason =
                                                                  value,
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      child: Padding(
                                                        padding: _customMaterial
                                                            .getEdgeInsetLTRB7070700(
                                                                context),
                                                        child:
                                                            AllergyMedication(
                                                          onSavedAllergy:
                                                              (newValue) =>
                                                                  _allergyMedication =
                                                                      newValue,
                                                          onSavedSymptomps:
                                                              (newValue) =>
                                                                  _allergySymptoms =
                                                                      newValue,
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      child: Padding(
                                                        padding: _customMaterial
                                                            .getEdgeInsetLTRB7070700(
                                                                context),
                                                        child: AllergyToLatex(
                                                          onSavedAllergyLatex:
                                                              (newValue) =>
                                                                  _allergyLatex =
                                                                      newValue,
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      child: Padding(
                                                          padding: _customMaterial
                                                              .getEdgeInsetLTRB7070700(
                                                                  context),
                                                          child:
                                                              PsychologicalStatus(
                                                            onSavedPsychologicalStatus:
                                                                (newValue) =>
                                                                    _psychologicalStatus =
                                                                        newValue,
                                                          )),
                                                    ),
                                                    Container(
                                                      child: Padding(
                                                        padding: _customMaterial
                                                            .getEdgeInsetLTRB7070700(
                                                                context),
                                                        child: DrugAndSubstance(
                                                          onSavedDrugAndSubstance:
                                                              (newValue) =>
                                                                  _drugAndSubstance =
                                                                      newValue,
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsets.fromLTRB(
                                                                screenSize
                                                                        .height /
                                                                    70,
                                                                screenSize
                                                                        .height /
                                                                    70,
                                                                screenSize
                                                                        .height /
                                                                    70,
                                                                screenSize
                                                                        .height /
                                                                    70),
                                                        child: SleepDisorder(
                                                          onSavedSleepDisorder:
                                                              (newValue) =>
                                                                  _sleepDisorder =
                                                                      newValue,
                                                          onSavedSleepDisorderAvg:
                                                              (newValue) =>
                                                                  _sleepDisorderDurationAvg =
                                                                      newValue,
                                                          onSavedSleepDisorderDuration:
                                                              (newValue) =>
                                                                  _sleepDisorderDuration =
                                                                      newValue,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          );
                                        }),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 100,
                        margin: EdgeInsets.all(20),
                        child: RaisedButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(7.0),
                            ),
                            padding: EdgeInsets.all(15),
                            textColor: Colors.white,
                            color: Color(0xFF2ED47A),
                            child:
                                Text('ถัดไป', style: TextStyle(fontSize: 18)),
                            onPressed: () {
                              _formKey.currentState.save();
                              Map<String, dynamic> formDataToDB = {
                                'hn': _hn,
                                'an': _an,
                                'patientName': _patientName,
                                'patientSurname': _patientSurname,
                                'dob': _dob,
                                'operationDate': _operationDate,
                                'gender': _gender,
                                'ward': _ward,
                                'operationMethod': _operationMethod,
                                'diagnosis': _diagnosis,
                                'consentSigned': _consentSigned,
                                'preMedication': _preMedication,
                                'typeOfAnesthesia': _typeOfAnesthesia,
                                'previousIllness': _previousIllness,
                                'drugUsed': _drugUsed,
                                'asaClass': _asaClass,
                                'bw': int.parse(_bw),
                                'high': int.parse(_high),
                                'weight': int.parse(_weight),
                                'previousSurgery': _previousSurgery,
                                'antiPlateletReason': _antiPlateletReason,
                                'antiPlateletDays': _antiPlateletDays,
                                'allergyMedication': _allergyMedication,
                                'allergySymptoms': _allergySymptoms,
                                'allergyLatex': _allergyLatex,
                                'psychologicalStatus': _psychologicalStatus,
                                'drugAndSubstance': _drugAndSubstance,
                                'sleepDisorder': _sleepDisorder,
                                'sleepDisorderDuration': _sleepDisorderDuration,
                                'sleepDisorderDurationAvg':
                                    _sleepDisorderDurationAvg,
                              };
                              var model =
                                  GeneralFormViewModel.getGeneralFormModel();
                              model.fromMap(formDataToDB);
                              var map = model.toMap();
                              print('Model =  : $map');
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ADLForm(
                                        hn: widget.hn,
                                        generalForm: formDataToDB),
                                  ));
                              //}
                            }),
                      ),
                    ],
                  ),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
