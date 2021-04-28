import 'package:AbdoCare_Web/services/service_locator.dart';
import 'package:AbdoCare_Web/view_models/evaluate_form/pre_visit_view_model.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

import '../../../../models/evalutate_form/pre_visit/generalForm_model.dart';
import '../../../../view_models/evaluate_form/generalForm_view_model.dart';
import '../../../appbar.dart';
import '../../../shared/alert_style.dart';
import '../../../shared/progress_bar.dart';
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
  final _formKey = GlobalKey<FormState>();

  final _preVisitViewModel = locator<PreVisitViewModel>();

  String _hn;
  String _an;
  String _patientName;
  String _patientSurname;
  DateTime _dob;
  DateTime _operationDate;
  String _gender;
  String _ward;
  String _operationMethod;
  String _diagnosis;
  String _consentSigned;
  String _preMedication;
  String _typeOfAnesthesia;
  String _previousIllness;
  String _drugUsed;
  String _asaClass;
  String _bw;
  String _high;
  String _weight;
  String _previousSurgery;
  String _antiPlateletReason;
  String _antiPlateletDays;
  String _allergyMedication;
  String _allergySymptoms;
  String _allergyLatex;
  String _psychologicalStatus;
  String _drugAndSubstance;
  String _sleepDisorder;
  String _sleepDisorderDuration;
  String _sleepDisorderDurationAvg;

  var date;
  // Function to validate the number
  bool isNumber(String value) {
    if (value == null) {
      return true;
    }
    final n = num.tryParse(value);
    return n != null;
  }

  @override
  Widget build(BuildContext context) {
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
                  padding: EdgeInsets.all(10),
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
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Card(
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
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 10, right: 10),
                                        child: FutureBuilder<GeneralFormModel>(
                                            future:
                                                GeneralFormViewModel.getModel(
                                                    widget.hn),
                                            builder: (context, snapshot) {
                                              if (!snapshot.hasData) {
                                                return ProgressBar
                                                    .circularProgressIndicator(
                                                        context);
                                              }
                                              return Column(
                                                children: [
                                                  Container(
                                                    child: Column(
                                                      children: [
                                                        Container(
                                                          child: Padding(
                                                            padding: EdgeInsets
                                                                .fromLTRB(10,
                                                                    10, 10, 0),
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
                                                            padding:
                                                                EdgeInsets.all(
                                                                    10),
                                                            child: Row(
                                                              children: <
                                                                  Widget>[
                                                                Expanded(
                                                                    child: Text(
                                                                  'Name:\t\t\t',
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          16),
                                                                  textAlign:
                                                                      TextAlign
                                                                          .end,
                                                                )),
                                                                Expanded(
                                                                  child:
                                                                      TextFormField(
                                                                    initialValue:
                                                                        snapshot
                                                                            .data
                                                                            .patientName,
                                                                    enabled:
                                                                        false,
                                                                    validator:
                                                                        (value) {
                                                                      return value
                                                                              .isEmpty
                                                                          ? 'กรุณากรอกชื่อผู้ป่วย'
                                                                          : null;
                                                                    },
                                                                    decoration: InputDecoration(
                                                                        contentPadding: new EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
                                                                        enabledBorder: OutlineInputBorder(
                                                                          borderSide: BorderSide(
                                                                              color: Colors.black26,
                                                                              width: 1),
                                                                        ),
                                                                        labelText: 'Name'),
                                                                    onSaved: (value) =>
                                                                        _patientName =
                                                                            value,
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                    child: Text(
                                                                        'Surname:\t\t\t',
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                16),
                                                                        textAlign:
                                                                            TextAlign.end)),
                                                                Expanded(
                                                                  child:
                                                                      TextFormField(
                                                                    initialValue:
                                                                        snapshot
                                                                            .data
                                                                            .patientSurname,
                                                                    enabled:
                                                                        false,
                                                                    validator:
                                                                        (value) {
                                                                      return value
                                                                              .isEmpty
                                                                          ? 'กรุณากรอกนามสกุลผู้ป่วย'
                                                                          : null;
                                                                    },
                                                                    decoration: InputDecoration(
                                                                        contentPadding: new EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
                                                                        enabledBorder: OutlineInputBorder(
                                                                          borderSide: BorderSide(
                                                                              color: Colors.black26,
                                                                              width: 1),
                                                                        ),
                                                                        labelText: 'Surname'),
                                                                    onSaved: (value) =>
                                                                        _patientSurname =
                                                                            value,
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                    child: Text(
                                                                        'HN:\t\t\t',
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                16),
                                                                        textAlign:
                                                                            TextAlign.end)),
                                                                Expanded(
                                                                  child:
                                                                      TextFormField(
                                                                    initialValue:
                                                                        snapshot
                                                                            .data
                                                                            .hn,
                                                                    enabled:
                                                                        false,
                                                                    validator:
                                                                        (value) {
                                                                      return value
                                                                              .isEmpty
                                                                          ? 'กรุณากรอกHN'
                                                                          : null;
                                                                    },
                                                                    decoration: InputDecoration(
                                                                        contentPadding: new EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
                                                                        enabledBorder: OutlineInputBorder(
                                                                          borderSide: BorderSide(
                                                                              color: Colors.black26,
                                                                              width: 1),
                                                                        ),
                                                                        labelText: 'HN'),
                                                                    onSaved: (value) =>
                                                                        _hn =
                                                                            value,
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                    child: Text(
                                                                        'AN:\t\t\t',
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                16),
                                                                        textAlign:
                                                                            TextAlign.end)),
                                                                Expanded(
                                                                  child:
                                                                      TextFormField(
                                                                    initialValue:
                                                                        snapshot
                                                                            .data
                                                                            .an,
                                                                    enabled:
                                                                        false,
                                                                    validator:
                                                                        (value) {
                                                                      return value
                                                                              .isEmpty
                                                                          ? 'กรุณากรอกAN'
                                                                          : null;
                                                                    },
                                                                    decoration: InputDecoration(
                                                                        contentPadding: new EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
                                                                        enabledBorder: OutlineInputBorder(
                                                                          borderSide: BorderSide(
                                                                              color: Colors.black26,
                                                                              width: 1),
                                                                        ),
                                                                        labelText: 'AN'),
                                                                    onSaved: (value) =>
                                                                        _an =
                                                                            value,
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                    child:
                                                                        SizedBox())
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
                                                              children: <
                                                                  Widget>[
                                                                Expanded(
                                                                    child: Text(
                                                                        'Gender:\t\t\t',
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                16),
                                                                        textAlign:
                                                                            TextAlign.end)),
                                                                Expanded(
                                                                  child:
                                                                      TextFormField(
                                                                    initialValue:
                                                                        snapshot
                                                                            .data
                                                                            .gender,
                                                                    enabled:
                                                                        false,
                                                                    validator:
                                                                        (value) {
                                                                      return value
                                                                              .isEmpty
                                                                          ? 'กรุณากรอกเพศ'
                                                                          : null;
                                                                    },
                                                                    decoration: InputDecoration(
                                                                        contentPadding: new EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
                                                                        enabledBorder: OutlineInputBorder(
                                                                          borderSide: BorderSide(
                                                                              color: Colors.black26,
                                                                              width: 1),
                                                                        ),
                                                                        labelText: 'Gender'),
                                                                    onSaved: (value) =>
                                                                        _gender =
                                                                            value,
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                    child: Text(
                                                                        'Ward:\t\t\t',
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                16),
                                                                        textAlign:
                                                                            TextAlign.end)),
                                                                Expanded(
                                                                  child:
                                                                      DropdownButtonFormField(
                                                                    value: snapshot
                                                                        .data
                                                                        .ward,
                                                                    hint:
                                                                        DropdownMenuItem(
                                                                      child: Text(snapshot
                                                                          .data
                                                                          .ward),
                                                                    ),
                                                                    validator: (value) => value ==
                                                                            null
                                                                        ? 'กรุณาเลือกWard'
                                                                        : null,
                                                                    decoration: InputDecoration(
                                                                        contentPadding: new EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
                                                                        enabledBorder: OutlineInputBorder(
                                                                          borderSide: BorderSide(
                                                                              color: Colors.black26,
                                                                              width: 1),
                                                                        ),
                                                                        labelText: 'Ward'),
                                                                    onSaved:
                                                                        (value) {
                                                                      _ward =
                                                                          value;
                                                                    },
                                                                    items: [
                                                                      '1',
                                                                      '2',
                                                                      '3',
                                                                      '4'
                                                                    ]
                                                                        .map((label) =>
                                                                            DropdownMenuItem(
                                                                              child: Text(label),
                                                                              value: label,
                                                                            ))
                                                                        .toList(),
                                                                    onChanged:
                                                                        (value) {
                                                                      setState(
                                                                          () {
                                                                        _ward =
                                                                            value;
                                                                      });
                                                                    },
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                    child: Text(
                                                                        'Date of Birth:\t\t\t',
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                16),
                                                                        textAlign:
                                                                            TextAlign.end)),
                                                                Expanded(
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
                                                                            borderSide:
                                                                                BorderSide(color: Colors.black26, width: 1),
                                                                          ),
                                                                          labelText: 'Date of Birth'),
                                                                      onShowPicker: (context, currentValue) {
                                                                        FocusScope.of(context)
                                                                            .requestFocus(new FocusNode());
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
                                                                Expanded(
                                                                    child:
                                                                        SizedBox())
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
                                                              children: <
                                                                  Widget>[
                                                                Expanded(
                                                                    child: Text(
                                                                        'Diagnosis:\t\t\t',
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                16),
                                                                        textAlign:
                                                                            TextAlign.end)),
                                                                Expanded(
                                                                  child:
                                                                      TextFormField(
                                                                    initialValue:
                                                                        snapshot.data.diagnosis ??
                                                                            '-',
                                                                    validator:
                                                                        (value) {
                                                                      return value
                                                                              .isEmpty
                                                                          ? 'กรุณากรอกDiagnosis'
                                                                          : null;
                                                                    },
                                                                    decoration: InputDecoration(
                                                                        contentPadding: new EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
                                                                        enabledBorder: OutlineInputBorder(
                                                                          borderSide: BorderSide(
                                                                              color: Colors.black26,
                                                                              width: 1),
                                                                        ),
                                                                        labelText: 'Diagnosis'),
                                                                    onSaved: (value) =>
                                                                        _diagnosis =
                                                                            value,
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                    child: Text(
                                                                        'Operation:\t\t\t',
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                16),
                                                                        textAlign:
                                                                            TextAlign.end)),
                                                                Expanded(
                                                                  child: TextFormField(
                                                                      initialValue: snapshot.data.operationMethod ?? '-',
                                                                      enabled: false,
                                                                      validator: (value) {
                                                                        return value.isEmpty
                                                                            ? 'กรุณากรอกOperation'
                                                                            : null;
                                                                      },
                                                                      decoration: InputDecoration(
                                                                          contentPadding: new EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
                                                                          enabledBorder: OutlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide(color: Colors.black26, width: 1),
                                                                          ),
                                                                          labelText: 'Operation'),
                                                                      onSaved: (value) {
                                                                        _operationMethod =
                                                                            value ??
                                                                                '-';
                                                                      }),
                                                                ),
                                                                Expanded(
                                                                    child: Text(
                                                                        'Operation date:\t\t\t',
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                16),
                                                                        textAlign:
                                                                            TextAlign.end)),
                                                                Expanded(
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
                                                                            borderSide:
                                                                                BorderSide(color: Colors.black26, width: 1),
                                                                          ),
                                                                          labelText: 'Operation date'),
                                                                      onShowPicker: (context, currentValue) {
                                                                        FocusScope.of(context)
                                                                            .requestFocus(new FocusNode());
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
                                                                Expanded(
                                                                    child:
                                                                        SizedBox())
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        // ConsentSign
                                                        Container(
                                                          child: Padding(
                                                            padding: EdgeInsets
                                                                .fromLTRB(10,
                                                                    10, 10, 0),
                                                            child: ConsentSign(
                                                                onSaved:
                                                                    (value) {
                                                                  print(
                                                                      "Value in Consent $value");
                                                                  _consentSigned =
                                                                      value;
                                                                },
                                                                consentFromDb:
                                                                    snapshot
                                                                        .data
                                                                        .consentSigned),
                                                          ),
                                                        ),
                                                        // Pre-medication
                                                        Container(
                                                          child: Padding(
                                                            padding: EdgeInsets
                                                                .fromLTRB(10,
                                                                    10, 10, 0),
                                                            child: Row(
                                                              children: <
                                                                  Widget>[
                                                                Expanded(
                                                                    child: Text(
                                                                        'Pre-medication',
                                                                        style: TextStyle(
                                                                            fontWeight:
                                                                                FontWeight.w600))),
                                                                Expanded(
                                                                  flex: 4,
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
                                                                    decoration: InputDecoration(
                                                                        contentPadding: new EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
                                                                        enabledBorder: OutlineInputBorder(
                                                                          borderSide: BorderSide(
                                                                              color: Colors.black26,
                                                                              width: 1),
                                                                        ),
                                                                        labelText: 'Pre-medication'),
                                                                    onSaved: (value) =>
                                                                        _preMedication =
                                                                            value,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        //TypeOfAnesthesia
                                                        Container(
                                                          child: Padding(
                                                              padding:
                                                                  EdgeInsets
                                                                      .fromLTRB(
                                                                          10,
                                                                          10,
                                                                          10,
                                                                          0),
                                                              child: TypeOfAnesthesia(
                                                                  onSaved:
                                                                      (value) {
                                                                _typeOfAnesthesia =
                                                                    value;
                                                              })),
                                                        ),

                                                        PreviousIllness(
                                                            onSaved: (value) {
                                                          print(
                                                              "Value in previous Illness $value");
                                                          _previousIllness =
                                                              value;
                                                        }),
                                                        //Drug used
                                                        Container(
                                                          child: Padding(
                                                            padding: EdgeInsets
                                                                .fromLTRB(10,
                                                                    10, 10, 0),
                                                            child: Row(
                                                              children: <
                                                                  Widget>[
                                                                Expanded(
                                                                    child: Text(
                                                                        'Drug used(ระบุ)',
                                                                        style: TextStyle(
                                                                            fontWeight:
                                                                                FontWeight.w600))),
                                                                Expanded(
                                                                  flex: 4,
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
                                                                    decoration: InputDecoration(
                                                                        contentPadding: new EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
                                                                        enabledBorder: OutlineInputBorder(
                                                                          borderSide: BorderSide(
                                                                              color: Colors.black26,
                                                                              width: 1),
                                                                        ),
                                                                        labelText: 'Drug used'),
                                                                    onSaved: (value) =>
                                                                        _drugUsed =
                                                                            value,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        //ASAClass
                                                        Container(
                                                          child: Padding(
                                                            padding: EdgeInsets
                                                                .fromLTRB(10,
                                                                    10, 10, 0),
                                                            child: Row(
                                                              children: <
                                                                  Widget>[
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
                                                        //Nutrition
                                                        Container(
                                                          child: Padding(
                                                            padding: EdgeInsets
                                                                .fromLTRB(10,
                                                                    10, 10, 0),
                                                            child: Row(
                                                              children: <
                                                                  Widget>[
                                                                Expanded(
                                                                    child: Text(
                                                                        'Nutrition',
                                                                        style: TextStyle(
                                                                            fontWeight:
                                                                                FontWeight.w600))),
                                                                Flexible(
                                                                    child: Text(
                                                                        'BW:\t\t\t',
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                16),
                                                                        textAlign:
                                                                            TextAlign.end)),
                                                                Expanded(
                                                                  child:
                                                                      TextFormField(
                                                                    validator:
                                                                        (value) {
                                                                      return value
                                                                              .isEmpty
                                                                          ? 'กรุณากรอกBW'
                                                                          : null;
                                                                    },
                                                                    keyboardType:
                                                                        TextInputType
                                                                            .number,
                                                                    inputFormatters: <
                                                                        TextInputFormatter>[
                                                                      FilteringTextInputFormatter
                                                                          .digitsOnly
                                                                    ], // Only numbers can be entered
                                                                    decoration: InputDecoration(
                                                                        contentPadding: new EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
                                                                        enabledBorder: OutlineInputBorder(
                                                                          borderSide: BorderSide(
                                                                              color: Colors.black26,
                                                                              width: 1),
                                                                        ),
                                                                        labelText: 'BW'),
                                                                    onSaved: (value) =>
                                                                        _bw =
                                                                            value,
                                                                  ),
                                                                ),
                                                                Flexible(
                                                                    child: Text(
                                                                  ' Kg.',
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          16),
                                                                )),
                                                                Expanded(
                                                                    child: Text(
                                                                        'High:\t\t\t',
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                16),
                                                                        textAlign:
                                                                            TextAlign.end)),
                                                                Expanded(
                                                                  child:
                                                                      TextFormField(
                                                                    validator:
                                                                        (value) {
                                                                      return value
                                                                              .isEmpty
                                                                          ? 'กรุณากรอกHigh'
                                                                          : null;
                                                                    },
                                                                    keyboardType:
                                                                        TextInputType
                                                                            .number,
                                                                    inputFormatters: <
                                                                        TextInputFormatter>[
                                                                      FilteringTextInputFormatter
                                                                          .digitsOnly
                                                                    ],
                                                                    decoration: InputDecoration(
                                                                        contentPadding: new EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
                                                                        enabledBorder: OutlineInputBorder(
                                                                          borderSide: BorderSide(
                                                                              color: Colors.black26,
                                                                              width: 1),
                                                                        ),
                                                                        labelText: 'High'),
                                                                    onSaved: (value) =>
                                                                        _high =
                                                                            value,
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                    child: Text(
                                                                  ' Cm.',
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          16),
                                                                )),
                                                                Expanded(
                                                                    child: Text(
                                                                        'Last (1,3,6) month:\t\t\t',
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                16),
                                                                        textAlign:
                                                                            TextAlign.end)),
                                                                Expanded(
                                                                  child:
                                                                      TextFormField(
                                                                    validator:
                                                                        (value) {
                                                                      return value
                                                                              .isEmpty
                                                                          ? 'กรุณากรอกWeight'
                                                                          : null;
                                                                    },
                                                                    keyboardType:
                                                                        TextInputType
                                                                            .number,
                                                                    inputFormatters: <
                                                                        TextInputFormatter>[
                                                                      FilteringTextInputFormatter
                                                                          .digitsOnly
                                                                    ],
                                                                    decoration: InputDecoration(
                                                                        contentPadding: new EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
                                                                        enabledBorder: OutlineInputBorder(
                                                                          borderSide: BorderSide(
                                                                              color: Colors.black26,
                                                                              width: 1),
                                                                        ),
                                                                        labelText: 'Weight'),
                                                                    onSaved: (value) =>
                                                                        _weight =
                                                                            value,
                                                                  ),
                                                                ),
                                                                Flexible(
                                                                    child: Text(
                                                                  ' Kg.',
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          16),
                                                                )),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        //Previous surgery
                                                        Container(
                                                          child: Padding(
                                                            padding: EdgeInsets
                                                                .fromLTRB(10,
                                                                    10, 10, 0),
                                                            child: Row(
                                                              children: <
                                                                  Widget>[
                                                                Expanded(
                                                                    child: Text(
                                                                        'Previous surgery',
                                                                        style: TextStyle(
                                                                            fontWeight:
                                                                                FontWeight.w600))),
                                                                Expanded(
                                                                  flex: 4,
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
                                                                    decoration: InputDecoration(
                                                                        contentPadding: new EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
                                                                        enabledBorder: OutlineInputBorder(
                                                                          borderSide: BorderSide(
                                                                              color: Colors.black26,
                                                                              width: 1),
                                                                        ),
                                                                        labelText: 'Previous surgery'),
                                                                    onSaved: (value) =>
                                                                        _previousSurgery =
                                                                            value,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        //AntiPlatelet
                                                        Container(
                                                          child: Padding(
                                                            padding: EdgeInsets
                                                                .fromLTRB(10,
                                                                    10, 10, 0),
                                                            child: AntiPlatelet(
                                                              onSavedDay: (value) =>
                                                                  _antiPlateletDays =
                                                                      value,
                                                              onSavedReason:
                                                                  (value) =>
                                                                      _antiPlateletReason =
                                                                          value,
                                                            ),
                                                          ),
                                                        ),
                                                        //AllergyMedication
                                                        Container(
                                                          child: Padding(
                                                            padding: EdgeInsets
                                                                .fromLTRB(10,
                                                                    10, 10, 0),
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
                                                        //AllergyToLatex
                                                        Container(
                                                          child: Padding(
                                                            padding: EdgeInsets
                                                                .fromLTRB(10,
                                                                    10, 10, 0),
                                                            child:
                                                                AllergyToLatex(
                                                              onSavedAllergyLatex:
                                                                  (newValue) =>
                                                                      _allergyLatex =
                                                                          newValue,
                                                            ),
                                                          ),
                                                        ),
                                                        //PsychologicalStatus
                                                        Container(
                                                          child: Padding(
                                                              padding:
                                                                  EdgeInsets
                                                                      .fromLTRB(
                                                                          10,
                                                                          10,
                                                                          10,
                                                                          0),
                                                              child:
                                                                  PsychologicalStatus(
                                                                onSavedPsychologicalStatus:
                                                                    (newValue) =>
                                                                        _psychologicalStatus =
                                                                            newValue,
                                                              )),
                                                        ),
                                                        //DrugAndSubstance
                                                        Container(
                                                          child: Padding(
                                                            padding: EdgeInsets
                                                                .fromLTRB(10,
                                                                    10, 10, 0),
                                                            child:
                                                                DrugAndSubstance(
                                                              onSavedDrugAndSubstance:
                                                                  (newValue) =>
                                                                      _drugAndSubstance =
                                                                          newValue,
                                                            ),
                                                          ),
                                                        ),
                                                        //SleepDisorder
                                                        Container(
                                                          child: Padding(
                                                            padding: EdgeInsets
                                                                .fromLTRB(10,
                                                                    10, 10, 10),
                                                            child:
                                                                SleepDisorder(
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
                              if (_formKey.currentState.validate()) {
                                _formKey.currentState.save();
                                if (_typeOfAnesthesia == null ||
                                    _consentSigned == null ||
                                    _previousIllness == null ||
                                    _asaClass == null ||
                                    _antiPlateletReason == null ||
                                    _allergyMedication == null ||
                                    _allergyLatex == null ||
                                    _psychologicalStatus == null ||
                                    _drugAndSubstance == null ||
                                    _sleepDisorder == null) {
                                  Dialogs.alertToCompleteEvalutation(context);
                                } else {
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
                                    'weight': int.parse(_bw),
                                    'height': int.parse(_high),
                                    'oldWeight': int.parse(_weight),
                                    'previousSurgery': _previousSurgery,
                                    'antiPlateletReason': _antiPlateletReason,
                                    'antiPlateletDays': _antiPlateletDays,
                                    'allergyMedication': _allergyMedication,
                                    'allergySymptoms': _allergySymptoms,
                                    'allergyLatex': _allergyLatex,
                                    'psychologicalStatus': _psychologicalStatus,
                                    'drugAndSubstance': _drugAndSubstance,
                                    'sleepDisorder': _sleepDisorder,
                                    'sleepDisorderDuration':
                                        _sleepDisorderDuration,
                                    'sleepDisorderDurationAvg':
                                        _sleepDisorderDurationAvg,
                                  };
                                  var model = GeneralFormViewModel
                                      .getGeneralFormModel();
                                  model.fromMap(formDataToDB);
                                  _preVisitViewModel
                                      .saveGeneralForm(formDataToDB);
                                  _preVisitViewModel
                                      .saveMapUpdateToDatabase(model.toMap());
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => ADLForm(
                                            hn: widget.hn,
                                            generalForm: formDataToDB),
                                      ));
                                }
                              } else {
                                Dialogs.alertToCompleteEvalutation(context);
                              }
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
