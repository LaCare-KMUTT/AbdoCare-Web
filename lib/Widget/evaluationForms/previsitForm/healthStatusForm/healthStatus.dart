import 'package:AbdoCare_Web/Widget/evaluationForms/previsitForm/healthStatusForm/endocrine.dart';
import 'package:AbdoCare_Web/Widget/evaluationForms/previsitForm/healthStatusForm/gi.dart';
import 'package:AbdoCare_Web/Widget/evaluationForms/previsitForm/healthStatusForm/gyn_uro.dart';
import 'package:AbdoCare_Web/Widget/evaluationForms/previsitForm/healthStatusForm/heme_lymph.dart';
import 'package:AbdoCare_Web/Widget/evaluationForms/previsitForm/healthStatusForm/ms.dart';
import 'package:AbdoCare_Web/Widget/evaluationForms/previsitForm/healthStatusForm/neuro.dart';
import 'package:flutter/material.dart';

import '../../../../models/evalutate_form/pre_visit/healthStatusForm_model.dart';
import '../../../../page/dashboard_pre.dart';
import '../../../../services/interfaces/calculation_service_interface.dart';
import '../../../../services/interfaces/firebase_service_interface.dart';
import '../../../../services/service_locator.dart';
import '../../../../view_models/evaluate_form/%E0%B9%89healthStatusForm_view_model.dart';
import '../../../appbar.dart';
import '../../../sidebar.dart';
import 'cv.dart';
import 'general.dart';
import 'heent.dart';
import 'pulmonary.dart';

class HealthStatusForm extends StatefulWidget {
  HealthStatusForm({Key key, this.generalForm, this.adlForm, this.hn})
      : super(key: key);
  final Map<String, dynamic> adlForm;
  final String hn;
  final Map<String, dynamic> generalForm;
  @override
  _HealthStatusFormState createState() => _HealthStatusFormState();
}

class _HealthStatusFormState extends State<HealthStatusForm> {
  final IFirebaseService _firebaseService = locator<IFirebaseService>();
  ICalculationService _calculationService = locator<ICalculationService>();
  final _formKey = GlobalKey<FormState>();

  DateTime date = DateTime.now();

  String _general = '';
  String _heent = '';
  String _cv = '';
  String _pulmonary = '';
  String _gyn = '';
  String _neuro = '';
  String _gi = '';
  String _ms = '';
  String _endocrine = '';
  String _lymph = '';
  String _abnormalDetails = '';

  bool _generalValue1 = false;
  bool _generalValue2 = false;
  bool _generalValue3 = false;
  bool _generalValue4 = false;
  bool _generalValue5 = false;
  bool _generalValue6 = false;
  bool _generalValue7 = false;

  bool _heentValue1 = false;
  bool _heentValue2 = false;
  bool _heentValue3 = false;
  bool _heentValue4 = false;
  bool _heentValue5 = false;
  bool _heentValue6 = false;
  bool _heentValue7 = false;

  bool _cvValue1 = false;
  bool _cvValue2 = false;
  bool _cvValue3 = false;
  bool _cvValue4 = false;
  bool _cvValue5 = false;
  bool _cvValue6 = false;
  bool _cvValue7 = false;

  bool _pulmonaryValue1 = false;
  bool _pulmonaryValue2 = false;
  bool _pulmonaryValue3 = false;
  bool _pulmonaryValue4 = false;
  bool _pulmonaryValue5 = false;
  bool _pulmonaryValue6 = false;
  bool _pulmonaryValue7 = false;

  bool _gynValue1 = false;
  bool _gynValue2 = false;
  bool _gynValue3 = false;
  bool _gynValue4 = false;
  bool _gynValue5 = false;
  bool _gynValue6 = false;
  bool _gynValue7 = false;

  bool _neuroValue1 = false;
  bool _neuroValue2 = false;
  bool _neuroValue3 = false;
  bool _neuroValue4 = false;
  bool _neuroValue5 = false;
  bool _neuroValue6 = false;
  bool _neuroValue7 = false;

  bool _giValue1 = false;
  bool _giValue2 = false;
  bool _giValue3 = false;
  bool _giValue4 = false;
  bool _giValue5 = false;
  bool _giValue6 = false;
  bool _giValue7 = false;

  bool _msValue1 = false;
  bool _msValue2 = false;
  bool _msValue3 = false;
  bool _msValue4 = false;
  bool _msValue5 = false;
  bool _msValue6 = false;
  bool _msValue7 = false;

  bool _endocrineValue1 = false;
  bool _endocrineValue2 = false;
  bool _endocrineValue3 = false;
  bool _endocrineValue4 = false;
  bool _endocrineValue5 = false;
  bool _endocrineValue6 = false;
  bool _endocrineValue7 = false;

  bool _lymphValue1 = false;
  bool _lymphValue2 = false;
  bool _lymphValue3 = false;
  bool _lymphValue4 = false;
  bool _lymphValue5 = false;
  bool _lymphValue6 = false;
  bool _lymphValue7 = false;

  void healthStatusData(int page) {
    Map<String, dynamic> healthStatusForm = {
      'generalNormal': _generalValue1,
      'generalAbnormalWeightLoss': _generalValue2,
      'generalAbnormalWeightGain': _generalValue3,
      'generalFever': _generalValue4,
      'generalFatigue': _generalValue5,
      'generalChillsSweats': _generalValue6,
      'generalOther': _generalValue7,
      'generalOtherDetail': _general,
      'heentValue1': _heentValue1,
      'heentValue2': _heentValue2,
      'heentValue3': _heentValue3,
      'heentValue4': _heentValue4,
      'heentValue5': _heentValue5,
      'heentValue6': _heentValue6,
      'heentValue7': _heentValue7,
      'heentOtherDetail': _heent,
      'cvValue1': _cvValue1,
      'cvValue2': _cvValue2,
      'cvValue3': _cvValue3,
      'cvValue4': _cvValue4,
      'cvValue5': _cvValue5,
      'cvValue6': _cvValue6,
      'cvValue7': _cvValue7,
      'cvOtherDetail': _cv,
      'pulmonaryValue1': _pulmonaryValue1,
      'pulmonaryValue2': _pulmonaryValue2,
      'pulmonaryValue3': _pulmonaryValue3,
      'pulmonaryValue4': _pulmonaryValue4,
      'pulmonaryValue5': _pulmonaryValue5,
      'pulmonaryValue6': _pulmonaryValue6,
      'pulmonaryValue7': _pulmonaryValue7,
      'pulmonaryOtherDetail': _pulmonary,
      '_gynValue1': _gynValue1,
      '_gynValue2': _gynValue2,
      '_gynValue3': _gynValue3,
      '_gynValue4': _gynValue4,
      '_gynValue5': _gynValue5,
      '_gynValue6': _gynValue6,
      '_gynValue7': _gynValue7,
      'gynOtherDetail': _gyn,
      '_neuroValue1': _neuroValue1,
      '_neuroValue2': _neuroValue2,
      '_neuroValue3': _neuroValue3,
      '_neuroValue4': _neuroValue4,
      '_neuroValue5': _neuroValue5,
      '_neuroValue6': _neuroValue6,
      '_neuroValue7': _neuroValue7,
      '_neuroOtherDetail': _neuro,
      '_giValue1': _giValue1,
      '_giValue2': _giValue2,
      '_giValue3': _giValue3,
      '_giValue4': _giValue4,
      '_giValue5': _giValue5,
      '_giValue6': _giValue6,
      '_giValue7': _giValue7,
      'giOtherDetail': _gi,
      'msValue1': _msValue1,
      'msValue2': _msValue2,
      'msValue3': _msValue3,
      'msValue4': _msValue4,
      'msValue5': _msValue5,
      'msValue6': _msValue6,
      'msValue7': _msValue7,
      'msOtherDetail': _ms,
      'endocrineValue1': _endocrineValue1,
      'endocrineValue2': _endocrineValue2,
      'endocrineValue3': _endocrineValue3,
      'endocrineValue4': _endocrineValue4,
      'endocrineValue5': _endocrineValue5,
      'endocrineValue6': _endocrineValue6,
      'endocrineValue7': _endocrineValue7,
      'endocrineOtherDetail': _endocrine,
      'lymphValue1': _lymphValue1,
      'lymphValue2': _lymphValue2,
      'lymphValue3': _lymphValue3,
      'lymphValue4': _lymphValue4,
      'lymphValue5': _lymphValue5,
      'lymphValue6': _lymphValue6,
      'lymphValue7': _lymphValue7,
      'lymphOtherDetail': _lymph,
      'abnormalDetails': _abnormalDetails
    };
    if (page == 0) {
      //back to previous page
    } else {
      // Map<String, dynamic> mapToDb = {
      //   ...widget.generalForm,
      //   ...widget.adlForm,
      //   ...healthStatusForm,
      // };
      // print('hn in healthStatus = ${widget.hn}');

      // _firebaseService.addDataToFormsCollection(
      //     hn: widget.hn, formName: 'Pre-visit', data: mapToDb);
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PreDashboardPage(hn: widget.hn),
          ));
    }
  }

  @override
  Widget build(BuildContext context) {
    var toShow = _calculationService.formatDateToThaiString(
        date: date, isBuddhist: false);
    var screenSize = MediaQuery.of(context).size;
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
            return FutureBuilder<HealthStatusFormModel>(
                future: HealthStatusFormViewModel.getModel(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData)
                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: CircularProgressIndicator(strokeWidth: 4),
                    );
                  return Form(
                    key: _formKey,
                    child: ListView(
                      children: <Widget>[
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
                              child: Container(
                                child: ConstrainedBox(
                                  constraints: BoxConstraints(
                                      minWidth: constraints.minWidth,
                                      minHeight: constraints.minHeight),
                                  child: IntrinsicWidth(
                                    child: Column(
                                      children: <Widget>[
                                        Card(
                                          child: Column(
                                            children: [
                                              Container(
                                                child: Padding(
                                                  padding: EdgeInsets.fromLTRB(
                                                      screenSize.height / 70,
                                                      screenSize.height / 70,
                                                      screenSize.height / 70,
                                                      0),
                                                  child: Row(
                                                    children: [
                                                      Expanded(
                                                          child: Text(
                                                              'Health Status',
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600))),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Row(
                                                children: <Widget>[
                                                  GeneralHealthStatus(
                                                    healthStatusModel:
                                                        snapshot.data,
                                                  ),
                                                  HeentHealthStatus(
                                                    healthStatusModel:
                                                        snapshot.data,
                                                  ),
                                                  //CV
                                                  CVHealthStatus(
                                                    healthStatusModel:
                                                        snapshot.data,
                                                  ),
                                                  //PULMONARY
                                                  PulmonaryHealthStatus(
                                                    healthStatusModel:
                                                        snapshot.data,
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: <Widget>[
                                                  //GYN/URO
                                                  GYNUROHealthStatus(
                                                    healthStatusModel:
                                                        snapshot.data,
                                                  ),
                                                  //NEURO
                                                  NeuroHealthStatus(
                                                    healthStatusModel:
                                                        snapshot.data,
                                                  ),
                                                  //GI
                                                  GIHealthStatus(
                                                    healthStatusModel:
                                                        snapshot.data,
                                                  ),
                                                  //MS
                                                  MSHealthStatus(
                                                    healthStatusModel:
                                                        snapshot.data,
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: <Widget>[
                                                  //ENDOCRINE
                                                  EndocrineHealthStatus(
                                                    healthStatusModel:
                                                        snapshot.data,
                                                  ),
                                                  //HEME/LYMPH
                                                  HemeLymphHealthStatus(
                                                    healthStatusModel:
                                                        snapshot.data,
                                                  ),
                                                ],
                                              ),
                                              //abnormalDetails
                                              Row(
                                                children: [
                                                  Padding(
                                                    padding: EdgeInsets.all(
                                                        screenSize.height / 70),
                                                    child: Container(
                                                      child: Center(
                                                        child: Text(
                                                            'Details for Abnormal'),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Expanded(
                                                    child: Padding(
                                                      padding: EdgeInsets.all(
                                                          screenSize.height /
                                                              70),
                                                      child: TextFormField(
                                                        keyboardType:
                                                            TextInputType
                                                                .multiline,
                                                        maxLines: null,
                                                        validator: (value) {
                                                          return value.isEmpty
                                                              ? 'กรุณากรอก Details for Abnormal'
                                                              : null;
                                                        },
                                                        decoration:
                                                            InputDecoration(
                                                                contentPadding:
                                                                    new EdgeInsets
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
                                                                      width: 1),
                                                                ),
                                                                labelText:
                                                                    ' Details for Abnormal'),
                                                        onSaved: (value) =>
                                                            _abnormalDetails =
                                                                value,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: <Widget>[
                                                  Expanded(
                                                    flex: 2,
                                                    child: Padding(
                                                      padding: EdgeInsets.all(
                                                          screenSize.height /
                                                              70),
                                                      child: Container(
                                                        child: FutureBuilder<
                                                                String>(
                                                            future: _firebaseService
                                                                .getMedicalTeamSignature(),
                                                            builder: (context,
                                                                signature) {
                                                              if (!signature
                                                                  .hasData) {
                                                                return CircularProgressIndicator(
                                                                  strokeWidth:
                                                                      4,
                                                                );
                                                              } else {
                                                                return Text(
                                                                    'R.N. Signature: ${signature.data}');
                                                              }
                                                            }),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                              Row(
                                                children: <Widget>[
                                                  Padding(
                                                    padding: EdgeInsets.all(
                                                        screenSize.height / 70),
                                                    child: Container(
                                                      child: Center(
                                                        child: Text(
                                                            'Date: $toShow'),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 20, bottom: 15),
                          child: Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 100,
                                  child: RaisedButton(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(7.0),
                                    ),
                                    padding: EdgeInsets.all(15),
                                    textColor: Colors.black,
                                    color: Color(0xFFEBEBEB),
                                    child: Text(
                                      'ย้อนกลับ',
                                      style: TextStyle(fontSize: 18),
                                    ),
                                    onPressed: () {
                                      Navigator.pop(context);
                                      // healthStatusData(0);
                                    },
                                  ),
                                ),
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
                                    child: Text(
                                      'ยืนยัน',
                                      style: TextStyle(fontSize: 18),
                                    ),
                                    onPressed: () {
                                      _formKey.currentState.save();
                                      var model = HealthStatusFormViewModel
                                          .getHealthStatusFormModel();
                                      print(
                                          'MODEL HEALTH STATUS ${model.toMap()}');
                                      healthStatusData(1);
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                });
          }),
        ),
      ),
    );
  }
}
