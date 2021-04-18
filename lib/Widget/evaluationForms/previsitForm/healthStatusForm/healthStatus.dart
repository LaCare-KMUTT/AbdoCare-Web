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
                                                        onSaved: (value) => snapshot
                                                                .data
                                                                .abnormalDetails =
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

                                      _firebaseService.addDataToFormsCollection(
                                          data: widget.generalForm,
                                          formName: 'General',
                                          hn: widget.hn);

                                      _firebaseService.addDataToFormsCollection(
                                          data: widget.adlForm,
                                          formName: 'ADL',
                                          hn: widget.hn);

                                      _firebaseService.addDataToFormsCollection(
                                          hn: widget.hn,
                                          formName: 'Health Status',
                                          data: model.toMap());

                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                PreDashboardPage(hn: widget.hn),
                                          ));
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
