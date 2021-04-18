import 'package:AbdoCare_Web/Widget/evaluationForms/previsitForm/healthStatusForm/gyn_uro.dart';
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
                                      children: [
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
                                                children: [
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
                                                children: [
                                                  //GYN/URO
                                                  GYNUROHealthStatus(
                                                    healthStatusModel:
                                                        snapshot.data,
                                                  ),
                                                  //NEURO
                                                  Container(
                                                    margin:
                                                        const EdgeInsets.all(
                                                            15.0),
                                                    padding:
                                                        const EdgeInsets.all(
                                                            3.0),
                                                    decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color: Colors
                                                                .grey[300])),
                                                    child: Column(
                                                      children: [
                                                        Container(
                                                          margin:
                                                              const EdgeInsets
                                                                  .all(15.0),
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(3.0),
                                                          height:
                                                              screenSize.width /
                                                                  4,
                                                          width:
                                                              screenSize.width /
                                                                  5,
                                                          child: ListView(
                                                            children: [
                                                              Container(
                                                                child: Align(
                                                                  alignment:
                                                                      Alignment
                                                                          .centerLeft,
                                                                  child: Text(
                                                                      'NEURO'),
                                                                ),
                                                              ),
                                                              Container(
                                                                child:
                                                                    CheckboxListTile(
                                                                  contentPadding:
                                                                      EdgeInsets
                                                                          .zero,
                                                                  value:
                                                                      _neuroValue1,
                                                                  selected:
                                                                      _neuroValue1,
                                                                  controlAffinity:
                                                                      ListTileControlAffinity
                                                                          .leading,
                                                                  activeColor:
                                                                      Color(
                                                                          0xFFC37447),
                                                                  onChanged:
                                                                      (value) {
                                                                    setState(
                                                                        () {
                                                                      _neuroValue1 =
                                                                          value;
                                                                    });
                                                                  },
                                                                  title: Text(
                                                                      'Normal'),
                                                                ),
                                                              ),
                                                              Container(
                                                                child:
                                                                    CheckboxListTile(
                                                                  contentPadding:
                                                                      EdgeInsets
                                                                          .zero,
                                                                  value:
                                                                      _neuroValue2,
                                                                  selected:
                                                                      _neuroValue2,
                                                                  controlAffinity:
                                                                      ListTileControlAffinity
                                                                          .leading,
                                                                  activeColor:
                                                                      Color(
                                                                          0xFFC37447),
                                                                  onChanged:
                                                                      (value) {
                                                                    setState(
                                                                        () {
                                                                      _neuroValue2 =
                                                                          value;
                                                                    });
                                                                  },
                                                                  title: Text(
                                                                      'Migraine'),
                                                                ),
                                                              ),
                                                              Container(
                                                                child:
                                                                    CheckboxListTile(
                                                                  contentPadding:
                                                                      EdgeInsets
                                                                          .zero,
                                                                  value:
                                                                      _neuroValue3,
                                                                  selected:
                                                                      _neuroValue3,
                                                                  controlAffinity:
                                                                      ListTileControlAffinity
                                                                          .leading,
                                                                  activeColor:
                                                                      Color(
                                                                          0xFFC37447),
                                                                  onChanged:
                                                                      (value) {
                                                                    setState(
                                                                        () {
                                                                      _neuroValue3 =
                                                                          value;
                                                                    });
                                                                  },
                                                                  title: Text(
                                                                      'Seizure'),
                                                                ),
                                                              ),
                                                              Container(
                                                                child:
                                                                    CheckboxListTile(
                                                                  contentPadding:
                                                                      EdgeInsets
                                                                          .zero,
                                                                  value:
                                                                      _neuroValue4,
                                                                  selected:
                                                                      _neuroValue4,
                                                                  controlAffinity:
                                                                      ListTileControlAffinity
                                                                          .leading,
                                                                  activeColor:
                                                                      Color(
                                                                          0xFFC37447),
                                                                  onChanged:
                                                                      (value) {
                                                                    setState(
                                                                        () {
                                                                      _neuroValue4 =
                                                                          value;
                                                                    });
                                                                  },
                                                                  title: Text(
                                                                      'TIA/Stroke'),
                                                                ),
                                                              ),
                                                              Container(
                                                                child:
                                                                    CheckboxListTile(
                                                                  contentPadding:
                                                                      EdgeInsets
                                                                          .zero,
                                                                  value:
                                                                      _neuroValue5,
                                                                  selected:
                                                                      _neuroValue5,
                                                                  controlAffinity:
                                                                      ListTileControlAffinity
                                                                          .leading,
                                                                  activeColor:
                                                                      Color(
                                                                          0xFFC37447),
                                                                  onChanged:
                                                                      (value) {
                                                                    setState(
                                                                        () {
                                                                      _neuroValue5 =
                                                                          value;
                                                                    });
                                                                  },
                                                                  title: Text(
                                                                      'Weakness/Syncope'),
                                                                ),
                                                              ),
                                                              Container(
                                                                child:
                                                                    CheckboxListTile(
                                                                  contentPadding:
                                                                      EdgeInsets
                                                                          .zero,
                                                                  value:
                                                                      _neuroValue6,
                                                                  selected:
                                                                      _neuroValue6,
                                                                  controlAffinity:
                                                                      ListTileControlAffinity
                                                                          .leading,
                                                                  activeColor:
                                                                      Color(
                                                                          0xFFC37447),
                                                                  onChanged:
                                                                      (value) {
                                                                    setState(
                                                                        () {
                                                                      _neuroValue6 =
                                                                          value;
                                                                    });
                                                                  },
                                                                  title: Text(
                                                                      'Sensory impairment'),
                                                                ),
                                                              ),
                                                              Container(
                                                                  child: Row(
                                                                children: [
                                                                  Expanded(
                                                                    flex: 1,
                                                                    child:
                                                                        CheckboxListTile(
                                                                      contentPadding:
                                                                          EdgeInsets
                                                                              .zero,
                                                                      value:
                                                                          _neuroValue7,
                                                                      selected:
                                                                          _neuroValue7,
                                                                      controlAffinity:
                                                                          ListTileControlAffinity
                                                                              .leading,
                                                                      activeColor:
                                                                          Color(
                                                                              0xFFC37447),
                                                                      onChanged:
                                                                          (value) {
                                                                        setState(
                                                                            () {
                                                                          _neuroValue7 =
                                                                              value;
                                                                          if (_neuroValue7 ==
                                                                              false) {
                                                                            _neuro =
                                                                                '-';
                                                                          }
                                                                        });
                                                                      },
                                                                      title: Text(
                                                                          'Other:'),
                                                                    ),
                                                                  ),
                                                                  Expanded(
                                                                    flex: 2,
                                                                    child:
                                                                        TextFormField(
                                                                      enabled:
                                                                          _neuroValue7,
                                                                      validator:
                                                                          (value) {
                                                                        return value.isEmpty
                                                                            ? 'กรุณากรอก Other'
                                                                            : null;
                                                                      },
                                                                      decoration: InputDecoration(
                                                                          contentPadding: new EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
                                                                          enabledBorder: OutlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide(color: Colors.black26, width: 1),
                                                                          ),
                                                                          labelText: ' Other'),
                                                                      onSaved: (value) =>
                                                                          _neuro =
                                                                              value,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ))
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  //GI
                                                  Container(
                                                    margin:
                                                        const EdgeInsets.all(
                                                            15.0),
                                                    padding:
                                                        const EdgeInsets.all(
                                                            3.0),
                                                    decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color: Colors
                                                                .grey[300])),
                                                    child: Column(
                                                      children: [
                                                        Container(
                                                          margin:
                                                              const EdgeInsets
                                                                  .all(15.0),
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(3.0),
                                                          height:
                                                              screenSize.width /
                                                                  4,
                                                          width:
                                                              screenSize.width /
                                                                  5,
                                                          child: ListView(
                                                            children: [
                                                              Container(
                                                                child: Align(
                                                                  alignment:
                                                                      Alignment
                                                                          .centerLeft,
                                                                  child: Text(
                                                                      'GI'),
                                                                ),
                                                              ),
                                                              Container(
                                                                child:
                                                                    CheckboxListTile(
                                                                  contentPadding:
                                                                      EdgeInsets
                                                                          .zero,
                                                                  value:
                                                                      _giValue1,
                                                                  selected:
                                                                      _giValue1,
                                                                  controlAffinity:
                                                                      ListTileControlAffinity
                                                                          .leading,
                                                                  activeColor:
                                                                      Color(
                                                                          0xFFC37447),
                                                                  onChanged:
                                                                      (value) {
                                                                    setState(
                                                                        () {
                                                                      _giValue1 =
                                                                          value;
                                                                    });
                                                                  },
                                                                  title: Text(
                                                                      'Normal'),
                                                                ),
                                                              ),
                                                              Container(
                                                                child:
                                                                    CheckboxListTile(
                                                                  contentPadding:
                                                                      EdgeInsets
                                                                          .zero,
                                                                  value:
                                                                      _giValue2,
                                                                  selected:
                                                                      _giValue2,
                                                                  controlAffinity:
                                                                      ListTileControlAffinity
                                                                          .leading,
                                                                  activeColor:
                                                                      Color(
                                                                          0xFFC37447),
                                                                  onChanged:
                                                                      (value) {
                                                                    setState(
                                                                        () {
                                                                      _giValue2 =
                                                                          value;
                                                                    });
                                                                  },
                                                                  title: Text(
                                                                      'GERD'),
                                                                ),
                                                              ),
                                                              Container(
                                                                child:
                                                                    CheckboxListTile(
                                                                  contentPadding:
                                                                      EdgeInsets
                                                                          .zero,
                                                                  value:
                                                                      _giValue3,
                                                                  selected:
                                                                      _giValue3,
                                                                  controlAffinity:
                                                                      ListTileControlAffinity
                                                                          .leading,
                                                                  activeColor:
                                                                      Color(
                                                                          0xFFC37447),
                                                                  onChanged:
                                                                      (value) {
                                                                    setState(
                                                                        () {
                                                                      _giValue3 =
                                                                          value;
                                                                    });
                                                                  },
                                                                  title: Text(
                                                                      'Nausea/Vomiting'),
                                                                ),
                                                              ),
                                                              Container(
                                                                child:
                                                                    CheckboxListTile(
                                                                  contentPadding:
                                                                      EdgeInsets
                                                                          .zero,
                                                                  value:
                                                                      _giValue4,
                                                                  selected:
                                                                      _giValue4,
                                                                  controlAffinity:
                                                                      ListTileControlAffinity
                                                                          .leading,
                                                                  activeColor:
                                                                      Color(
                                                                          0xFFC37447),
                                                                  onChanged:
                                                                      (value) {
                                                                    setState(
                                                                        () {
                                                                      _giValue4 =
                                                                          value;
                                                                    });
                                                                  },
                                                                  title: Text(
                                                                      'Diarrhea/Constipation'),
                                                                ),
                                                              ),
                                                              Container(
                                                                child:
                                                                    CheckboxListTile(
                                                                  contentPadding:
                                                                      EdgeInsets
                                                                          .zero,
                                                                  value:
                                                                      _giValue5,
                                                                  selected:
                                                                      _giValue5,
                                                                  controlAffinity:
                                                                      ListTileControlAffinity
                                                                          .leading,
                                                                  activeColor:
                                                                      Color(
                                                                          0xFFC37447),
                                                                  onChanged:
                                                                      (value) {
                                                                    setState(
                                                                        () {
                                                                      _giValue5 =
                                                                          value;
                                                                    });
                                                                  },
                                                                  title: Text(
                                                                      'Bowel habit changes'),
                                                                ),
                                                              ),
                                                              Container(
                                                                child:
                                                                    CheckboxListTile(
                                                                  contentPadding:
                                                                      EdgeInsets
                                                                          .zero,
                                                                  value:
                                                                      _giValue6,
                                                                  selected:
                                                                      _giValue6,
                                                                  controlAffinity:
                                                                      ListTileControlAffinity
                                                                          .leading,
                                                                  activeColor:
                                                                      Color(
                                                                          0xFFC37447),
                                                                  onChanged:
                                                                      (value) {
                                                                    setState(
                                                                        () {
                                                                      _giValue6 =
                                                                          value;
                                                                    });
                                                                  },
                                                                  title: Text(
                                                                      'Melena'),
                                                                ),
                                                              ),
                                                              Container(
                                                                  child: Row(
                                                                children: [
                                                                  Expanded(
                                                                    flex: 1,
                                                                    child:
                                                                        CheckboxListTile(
                                                                      contentPadding:
                                                                          EdgeInsets
                                                                              .zero,
                                                                      value:
                                                                          _giValue7,
                                                                      selected:
                                                                          _giValue7,
                                                                      controlAffinity:
                                                                          ListTileControlAffinity
                                                                              .leading,
                                                                      activeColor:
                                                                          Color(
                                                                              0xFFC37447),
                                                                      onChanged:
                                                                          (value) {
                                                                        setState(
                                                                            () {
                                                                          _giValue7 =
                                                                              value;
                                                                          if (_giValue7 ==
                                                                              false) {
                                                                            _gi =
                                                                                '-';
                                                                          }
                                                                        });
                                                                      },
                                                                      title: Text(
                                                                          'Other:'),
                                                                    ),
                                                                  ),
                                                                  Expanded(
                                                                    flex: 2,
                                                                    child:
                                                                        TextFormField(
                                                                      enabled:
                                                                          _giValue7,
                                                                      validator:
                                                                          (value) {
                                                                        return value.isEmpty
                                                                            ? 'กรุณากรอก Other'
                                                                            : null;
                                                                      },
                                                                      decoration: InputDecoration(
                                                                          contentPadding: new EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
                                                                          enabledBorder: OutlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide(color: Colors.black26, width: 1),
                                                                          ),
                                                                          labelText: ' Other'),
                                                                      onSaved: (value) =>
                                                                          _gi =
                                                                              value,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ))
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  //MS
                                                  Container(
                                                    margin:
                                                        const EdgeInsets.all(
                                                            15.0),
                                                    padding:
                                                        const EdgeInsets.all(
                                                            3.0),
                                                    decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color: Colors
                                                                .grey[300])),
                                                    child: Column(
                                                      children: [
                                                        Container(
                                                          margin:
                                                              const EdgeInsets
                                                                  .all(15.0),
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(3.0),
                                                          height:
                                                              screenSize.width /
                                                                  4,
                                                          width:
                                                              screenSize.width /
                                                                  5,
                                                          child: ListView(
                                                            children: [
                                                              Container(
                                                                child: Align(
                                                                  alignment:
                                                                      Alignment
                                                                          .centerLeft,
                                                                  child: Text(
                                                                      'MS'),
                                                                ),
                                                              ),
                                                              Container(
                                                                child:
                                                                    CheckboxListTile(
                                                                  contentPadding:
                                                                      EdgeInsets
                                                                          .zero,
                                                                  value:
                                                                      _msValue1,
                                                                  selected:
                                                                      _msValue1,
                                                                  controlAffinity:
                                                                      ListTileControlAffinity
                                                                          .leading,
                                                                  activeColor:
                                                                      Color(
                                                                          0xFFC37447),
                                                                  onChanged:
                                                                      (value) {
                                                                    setState(
                                                                        () {
                                                                      _msValue1 =
                                                                          value;
                                                                    });
                                                                  },
                                                                  title: Text(
                                                                      'Normal'),
                                                                ),
                                                              ),
                                                              Container(
                                                                child:
                                                                    CheckboxListTile(
                                                                  contentPadding:
                                                                      EdgeInsets
                                                                          .zero,
                                                                  value:
                                                                      _msValue2,
                                                                  selected:
                                                                      _msValue2,
                                                                  controlAffinity:
                                                                      ListTileControlAffinity
                                                                          .leading,
                                                                  activeColor:
                                                                      Color(
                                                                          0xFFC37447),
                                                                  onChanged:
                                                                      (value) {
                                                                    setState(
                                                                        () {
                                                                      _msValue2 =
                                                                          value;
                                                                    });
                                                                  },
                                                                  title: Text(
                                                                      'Joint swelling/pain'),
                                                                ),
                                                              ),
                                                              Container(
                                                                child:
                                                                    CheckboxListTile(
                                                                  contentPadding:
                                                                      EdgeInsets
                                                                          .zero,
                                                                  value:
                                                                      _msValue3,
                                                                  selected:
                                                                      _msValue3,
                                                                  controlAffinity:
                                                                      ListTileControlAffinity
                                                                          .leading,
                                                                  activeColor:
                                                                      Color(
                                                                          0xFFC37447),
                                                                  onChanged:
                                                                      (value) {
                                                                    setState(
                                                                        () {
                                                                      _msValue3 =
                                                                          value;
                                                                    });
                                                                  },
                                                                  title: Text(
                                                                      'Limitations/neck mobility'),
                                                                ),
                                                              ),
                                                              Container(
                                                                child:
                                                                    CheckboxListTile(
                                                                  contentPadding:
                                                                      EdgeInsets
                                                                          .zero,
                                                                  value:
                                                                      _msValue4,
                                                                  selected:
                                                                      _msValue4,
                                                                  controlAffinity:
                                                                      ListTileControlAffinity
                                                                          .leading,
                                                                  activeColor:
                                                                      Color(
                                                                          0xFFC37447),
                                                                  onChanged:
                                                                      (value) {
                                                                    setState(
                                                                        () {
                                                                      _msValue4 =
                                                                          value;
                                                                    });
                                                                  },
                                                                  title: Text(
                                                                      'Gait difficulty'),
                                                                ),
                                                              ),
                                                              Container(
                                                                child:
                                                                    CheckboxListTile(
                                                                  contentPadding:
                                                                      EdgeInsets
                                                                          .zero,
                                                                  value:
                                                                      _msValue5,
                                                                  selected:
                                                                      _msValue5,
                                                                  controlAffinity:
                                                                      ListTileControlAffinity
                                                                          .leading,
                                                                  activeColor:
                                                                      Color(
                                                                          0xFFC37447),
                                                                  onChanged:
                                                                      (value) {
                                                                    setState(
                                                                        () {
                                                                      _msValue5 =
                                                                          value;
                                                                    });
                                                                  },
                                                                  title: Text(
                                                                      'Deformity'),
                                                                ),
                                                              ),
                                                              Container(
                                                                child:
                                                                    CheckboxListTile(
                                                                  contentPadding:
                                                                      EdgeInsets
                                                                          .zero,
                                                                  value:
                                                                      _msValue6,
                                                                  selected:
                                                                      _msValue6,
                                                                  controlAffinity:
                                                                      ListTileControlAffinity
                                                                          .leading,
                                                                  activeColor:
                                                                      Color(
                                                                          0xFFC37447),
                                                                  onChanged:
                                                                      (value) {
                                                                    setState(
                                                                        () {
                                                                      _msValue6 =
                                                                          value;
                                                                    });
                                                                  },
                                                                  title: Text(
                                                                      'Prosthetic devices'),
                                                                ),
                                                              ),
                                                              Container(
                                                                  child: Row(
                                                                children: [
                                                                  Expanded(
                                                                    flex: 1,
                                                                    child:
                                                                        CheckboxListTile(
                                                                      contentPadding:
                                                                          EdgeInsets
                                                                              .zero,
                                                                      value:
                                                                          _msValue7,
                                                                      selected:
                                                                          _msValue7,
                                                                      controlAffinity:
                                                                          ListTileControlAffinity
                                                                              .leading,
                                                                      activeColor:
                                                                          Color(
                                                                              0xFFC37447),
                                                                      onChanged:
                                                                          (value) {
                                                                        setState(
                                                                            () {
                                                                          _msValue7 =
                                                                              value;
                                                                          if (_msValue7 ==
                                                                              false) {
                                                                            _ms =
                                                                                '-';
                                                                          }
                                                                        });
                                                                      },
                                                                      title: Text(
                                                                          'Other:'),
                                                                    ),
                                                                  ),
                                                                  Expanded(
                                                                    flex: 2,
                                                                    child:
                                                                        TextFormField(
                                                                      enabled:
                                                                          _msValue7,
                                                                      validator:
                                                                          (value) {
                                                                        return value.isEmpty
                                                                            ? 'กรุณากรอก Other'
                                                                            : null;
                                                                      },
                                                                      decoration: InputDecoration(
                                                                          contentPadding: new EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
                                                                          enabledBorder: OutlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide(color: Colors.black26, width: 1),
                                                                          ),
                                                                          labelText: ' Other'),
                                                                      onSaved: (value) =>
                                                                          _ms =
                                                                              value,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ))
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  //ENDOCRINE
                                                  Container(
                                                    margin:
                                                        const EdgeInsets.all(
                                                            15.0),
                                                    padding:
                                                        const EdgeInsets.all(
                                                            3.0),
                                                    decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color: Colors
                                                                .grey[300])),
                                                    child: Column(
                                                      children: [
                                                        Container(
                                                          margin:
                                                              const EdgeInsets
                                                                  .all(15.0),
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(3.0),
                                                          height:
                                                              screenSize.width /
                                                                  4,
                                                          width:
                                                              screenSize.width /
                                                                  5,
                                                          child: ListView(
                                                            children: [
                                                              Container(
                                                                child: Align(
                                                                  alignment:
                                                                      Alignment
                                                                          .centerLeft,
                                                                  child: Text(
                                                                      'ENDOCRINE'),
                                                                ),
                                                              ),
                                                              Container(
                                                                child:
                                                                    CheckboxListTile(
                                                                  contentPadding:
                                                                      EdgeInsets
                                                                          .zero,
                                                                  value:
                                                                      _endocrineValue1,
                                                                  selected:
                                                                      _endocrineValue1,
                                                                  controlAffinity:
                                                                      ListTileControlAffinity
                                                                          .leading,
                                                                  activeColor:
                                                                      Color(
                                                                          0xFFC37447),
                                                                  onChanged:
                                                                      (value) {
                                                                    setState(
                                                                        () {
                                                                      _endocrineValue1 =
                                                                          value;
                                                                    });
                                                                  },
                                                                  title: Text(
                                                                      'Normal'),
                                                                ),
                                                              ),
                                                              Container(
                                                                child:
                                                                    CheckboxListTile(
                                                                        contentPadding:
                                                                            EdgeInsets
                                                                                .zero,
                                                                        value:
                                                                            _endocrineValue2,
                                                                        selected:
                                                                            _endocrineValue2,
                                                                        controlAffinity:
                                                                            ListTileControlAffinity
                                                                                .leading,
                                                                        activeColor:
                                                                            Color(
                                                                                0xFFC37447),
                                                                        onChanged:
                                                                            (value) {
                                                                          setState(
                                                                              () {
                                                                            _endocrineValue2 =
                                                                                value;
                                                                          });
                                                                        },
                                                                        title: Text(
                                                                            'Hair loss')),
                                                              ),
                                                              Container(
                                                                child:
                                                                    CheckboxListTile(
                                                                        contentPadding:
                                                                            EdgeInsets
                                                                                .zero,
                                                                        value:
                                                                            _endocrineValue3,
                                                                        selected:
                                                                            _endocrineValue3,
                                                                        controlAffinity:
                                                                            ListTileControlAffinity
                                                                                .leading,
                                                                        activeColor:
                                                                            Color(
                                                                                0xFFC37447),
                                                                        onChanged:
                                                                            (value) {
                                                                          setState(
                                                                              () {
                                                                            _endocrineValue3 =
                                                                                value;
                                                                          });
                                                                        },
                                                                        title: Text(
                                                                            'Excessive sweat')),
                                                              ),
                                                              Container(
                                                                child:
                                                                    CheckboxListTile(
                                                                        contentPadding:
                                                                            EdgeInsets
                                                                                .zero,
                                                                        value:
                                                                            _endocrineValue4,
                                                                        selected:
                                                                            _endocrineValue4,
                                                                        controlAffinity:
                                                                            ListTileControlAffinity
                                                                                .leading,
                                                                        activeColor:
                                                                            Color(
                                                                                0xFFC37447),
                                                                        onChanged:
                                                                            (value) {
                                                                          setState(
                                                                              () {
                                                                            _endocrineValue4 =
                                                                                value;
                                                                          });
                                                                        },
                                                                        title: Text(
                                                                            'Excessive thirst')),
                                                              ),
                                                              Container(
                                                                child:
                                                                    CheckboxListTile(
                                                                        contentPadding:
                                                                            EdgeInsets
                                                                                .zero,
                                                                        value:
                                                                            _endocrineValue5,
                                                                        selected:
                                                                            _endocrineValue5,
                                                                        controlAffinity:
                                                                            ListTileControlAffinity
                                                                                .leading,
                                                                        activeColor:
                                                                            Color(
                                                                                0xFFC37447),
                                                                        onChanged:
                                                                            (value) {
                                                                          setState(
                                                                              () {
                                                                            _endocrineValue5 =
                                                                                value;
                                                                          });
                                                                        },
                                                                        title: Text(
                                                                            'Heat intolerance')),
                                                              ),
                                                              Container(
                                                                child:
                                                                    CheckboxListTile(
                                                                        contentPadding:
                                                                            EdgeInsets
                                                                                .zero,
                                                                        value:
                                                                            _endocrineValue6,
                                                                        selected:
                                                                            _endocrineValue6,
                                                                        controlAffinity:
                                                                            ListTileControlAffinity
                                                                                .leading,
                                                                        activeColor:
                                                                            Color(
                                                                                0xFFC37447),
                                                                        onChanged:
                                                                            (value) {
                                                                          setState(
                                                                              () {
                                                                            _endocrineValue6 =
                                                                                value;
                                                                          });
                                                                        },
                                                                        title: Text(
                                                                            'Cold intolerance')),
                                                              ),
                                                              Container(
                                                                child: Row(
                                                                  children: [
                                                                    Expanded(
                                                                      flex: 1,
                                                                      child:
                                                                          CheckboxListTile(
                                                                        contentPadding:
                                                                            EdgeInsets.zero,
                                                                        value:
                                                                            _endocrineValue7,
                                                                        selected:
                                                                            _endocrineValue7,
                                                                        controlAffinity:
                                                                            ListTileControlAffinity.leading,
                                                                        activeColor:
                                                                            Color(0xFFC37447),
                                                                        onChanged:
                                                                            (value) {
                                                                          setState(
                                                                              () {
                                                                            _endocrineValue7 =
                                                                                value;
                                                                            if (_endocrineValue7 ==
                                                                                false) {
                                                                              _endocrine = '-';
                                                                            }
                                                                          });
                                                                        },
                                                                        title: Text(
                                                                            'Other:'),
                                                                      ),
                                                                    ),
                                                                    Expanded(
                                                                      flex: 2,
                                                                      child:
                                                                          TextFormField(
                                                                        enabled:
                                                                            _endocrineValue7,
                                                                        validator:
                                                                            (value) {
                                                                          return value.isEmpty
                                                                              ? 'กรุณากรอก Other'
                                                                              : null;
                                                                        },
                                                                        decoration: InputDecoration(
                                                                            contentPadding: new EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
                                                                            enabledBorder: OutlineInputBorder(
                                                                              borderSide: BorderSide(color: Colors.black26, width: 1),
                                                                            ),
                                                                            labelText: ' Other'),
                                                                        onSaved:
                                                                            (value) =>
                                                                                _endocrine = value,
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  //HEME/LYMPH
                                                  Container(
                                                    margin:
                                                        const EdgeInsets.all(
                                                            15.0),
                                                    padding:
                                                        const EdgeInsets.all(
                                                            3.0),
                                                    decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color: Colors
                                                                .grey[300])),
                                                    child: Column(
                                                      children: [
                                                        Container(
                                                          margin:
                                                              const EdgeInsets
                                                                  .all(15.0),
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(3.0),
                                                          height:
                                                              screenSize.width /
                                                                  4,
                                                          width:
                                                              screenSize.width /
                                                                  5,
                                                          child: ListView(
                                                            children: [
                                                              Container(
                                                                child: Align(
                                                                  alignment:
                                                                      Alignment
                                                                          .centerLeft,
                                                                  child: Text(
                                                                      'HEME/LYMPH'),
                                                                ),
                                                              ),
                                                              Container(
                                                                child:
                                                                    CheckboxListTile(
                                                                        contentPadding:
                                                                            EdgeInsets
                                                                                .zero,
                                                                        value:
                                                                            _lymphValue1,
                                                                        selected:
                                                                            _lymphValue1,
                                                                        controlAffinity:
                                                                            ListTileControlAffinity
                                                                                .leading,
                                                                        activeColor:
                                                                            Color(
                                                                                0xFFC37447),
                                                                        onChanged:
                                                                            (value) {
                                                                          setState(
                                                                              () {
                                                                            _lymphValue1 =
                                                                                value;
                                                                          });
                                                                        },
                                                                        title: Text(
                                                                            'Normal')),
                                                              ),
                                                              Container(
                                                                child:
                                                                    CheckboxListTile(
                                                                        contentPadding:
                                                                            EdgeInsets
                                                                                .zero,
                                                                        value:
                                                                            _lymphValue2,
                                                                        selected:
                                                                            _lymphValue2,
                                                                        controlAffinity:
                                                                            ListTileControlAffinity
                                                                                .leading,
                                                                        activeColor:
                                                                            Color(
                                                                                0xFFC37447),
                                                                        onChanged:
                                                                            (value) {
                                                                          setState(
                                                                              () {
                                                                            _lymphValue2 =
                                                                                value;
                                                                          });
                                                                        },
                                                                        title: Text(
                                                                            'Bleeding tendency')),
                                                              ),
                                                              Container(
                                                                child:
                                                                    CheckboxListTile(
                                                                        contentPadding:
                                                                            EdgeInsets
                                                                                .zero,
                                                                        value:
                                                                            _lymphValue3,
                                                                        selected:
                                                                            _lymphValue3,
                                                                        controlAffinity:
                                                                            ListTileControlAffinity
                                                                                .leading,
                                                                        activeColor:
                                                                            Color(
                                                                                0xFFC37447),
                                                                        onChanged:
                                                                            (value) {
                                                                          setState(
                                                                              () {
                                                                            _lymphValue3 =
                                                                                value;
                                                                          });
                                                                        },
                                                                        title: Text(
                                                                            'DVT history')),
                                                              ),
                                                              Container(
                                                                child:
                                                                    CheckboxListTile(
                                                                        contentPadding:
                                                                            EdgeInsets
                                                                                .zero,
                                                                        value:
                                                                            _lymphValue4,
                                                                        selected:
                                                                            _lymphValue4,
                                                                        controlAffinity:
                                                                            ListTileControlAffinity
                                                                                .leading,
                                                                        activeColor:
                                                                            Color(
                                                                                0xFFC37447),
                                                                        onChanged:
                                                                            (value) {
                                                                          setState(
                                                                              () {
                                                                            _lymphValue4 =
                                                                                value;
                                                                          });
                                                                        },
                                                                        title: Text(
                                                                            'Enlarged nodes')),
                                                              ),
                                                              Container(
                                                                child:
                                                                    CheckboxListTile(
                                                                        contentPadding:
                                                                            EdgeInsets
                                                                                .zero,
                                                                        value:
                                                                            _lymphValue5,
                                                                        selected:
                                                                            _lymphValue5,
                                                                        controlAffinity:
                                                                            ListTileControlAffinity
                                                                                .leading,
                                                                        activeColor:
                                                                            Color(
                                                                                0xFFC37447),
                                                                        onChanged:
                                                                            (value) {
                                                                          setState(
                                                                              () {
                                                                            _lymphValue5 =
                                                                                value;
                                                                          });
                                                                        },
                                                                        title: Text(
                                                                            'Immunosuppression')),
                                                              ),
                                                              Container(
                                                                child:
                                                                    CheckboxListTile(
                                                                  contentPadding:
                                                                      EdgeInsets
                                                                          .zero,
                                                                  value:
                                                                      _lymphValue6,
                                                                  selected:
                                                                      _lymphValue6,
                                                                  controlAffinity:
                                                                      ListTileControlAffinity
                                                                          .leading,
                                                                  activeColor:
                                                                      Color(
                                                                          0xFFC37447),
                                                                  onChanged:
                                                                      (value) {
                                                                    setState(
                                                                        () {
                                                                      _lymphValue6 =
                                                                          value;
                                                                    });
                                                                  },
                                                                  title: Text(
                                                                      'Recent steroid use'),
                                                                ),
                                                              ),
                                                              Container(
                                                                child: Row(
                                                                  children: [
                                                                    Expanded(
                                                                      flex: 1,
                                                                      child:
                                                                          CheckboxListTile(
                                                                        contentPadding:
                                                                            EdgeInsets.zero,
                                                                        value:
                                                                            _lymphValue7,
                                                                        selected:
                                                                            _lymphValue7,
                                                                        controlAffinity:
                                                                            ListTileControlAffinity.leading,
                                                                        activeColor:
                                                                            Color(0xFFC37447),
                                                                        onChanged:
                                                                            (value) {
                                                                          setState(
                                                                              () {
                                                                            _lymphValue7 =
                                                                                value;
                                                                            if (_lymphValue7 ==
                                                                                false) {
                                                                              _lymph = '-';
                                                                            }
                                                                          });
                                                                        },
                                                                        title: Text(
                                                                            'Other:'),
                                                                      ),
                                                                    ),
                                                                    Expanded(
                                                                      flex: 2,
                                                                      child:
                                                                          TextFormField(
                                                                        enabled:
                                                                            _lymphValue7,
                                                                        validator:
                                                                            (value) {
                                                                          return value.isEmpty
                                                                              ? 'กรุณากรอก Other'
                                                                              : null;
                                                                        },
                                                                        decoration: InputDecoration(
                                                                            contentPadding: new EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
                                                                            enabledBorder: OutlineInputBorder(
                                                                              borderSide: BorderSide(color: Colors.black26, width: 1),
                                                                            ),
                                                                            labelText: ' Other'),
                                                                        onSaved:
                                                                            (value) =>
                                                                                _lymph = value,
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
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
