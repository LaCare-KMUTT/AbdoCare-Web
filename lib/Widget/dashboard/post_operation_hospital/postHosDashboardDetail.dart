import 'package:AbdoCare_Web/Widget/dashboard/post_operation_hospital/postHosDashboardPatientDetail.dart';
import 'package:AbdoCare_Web/Widget/evaluationForms/post-hos/post-hos-day0/recovery_readiness_form.dart';
import 'package:AbdoCare_Web/page/dashboard_postHome.dart';
import 'package:AbdoCare_Web/page/dashboard_postHos.dart';
import 'package:AbdoCare_Web/page/dashboard_pre.dart';
import 'package:AbdoCare_Web/services/interfaces/firebase_service_interface.dart';
import 'package:AbdoCare_Web/services/service_locator.dart';
import 'package:AbdoCare_Web/view_models/evaluate_form/evaluationFormButton_view_model.dart';
import 'package:flutter/material.dart';
import 'package:AbdoCare_Web/Widget/evaluationForms/post-hos/post-hos-day0/respiratory_form.dart';
import 'package:AbdoCare_Web/Widget/evaluationForms/post-hos/post-hos-day0/urology_form.dart';
import 'package:AbdoCare_Web/Widget/evaluationForms/post-hos/post-hos-day1/blood_clot_form.dart';
import 'package:AbdoCare_Web/Widget/evaluationForms/post-hos/post-hos-day1/drain_form.dart';
import 'package:AbdoCare_Web/Widget/evaluationForms/post-hos/post-hos-day1/nutrition_form.dart';
import 'package:AbdoCare_Web/Widget/evaluationForms/post-hos/post-hos-day1/respiratory_form.dart';
import 'package:AbdoCare_Web/Widget/evaluationForms/post-hos/post-hos-day2-7/digestive_form.dart';
import 'package:AbdoCare_Web/Widget/evaluationForms/post-hos/post-hos-day2-7/infection_form.dart';
import 'package:AbdoCare_Web/Widget/evaluationForms/post-hos/post-hos-day2-7/pulmanary_form.dart';
import 'package:AbdoCare_Web/Widget/evaluationForms/post-hos/vital_sign_form.dart';

import '../dashboardGraph.dart';

class PostHosDashboardDetail extends StatefulWidget {
  final String hn;
  PostHosDashboardDetail({Key key, @required this.hn}) : super(key: key);
  @override
  _PostHosDashboardDetailState createState() => _PostHosDashboardDetailState();
}

class _PostHosDashboardDetailState extends State<PostHosDashboardDetail> {
  final ScrollController controller = ScrollController();
  final _firebaseService = locator<IFirebaseService>();
  final EvaluationFormViewModel _evaluationFormViewModel =
      locator<EvaluationFormViewModel>();
  var _getdayInCurrentState;
  var dayInCurrentState;
  @override
  void initState() {
    super.initState();
    initData();
  }

  initData() async {
    dayInCurrentState =
        await _firebaseService.getDayInCurrentState(hn: widget.hn);
    print('dayInCurrentState: $dayInCurrentState');
    setState(() {
      _getdayInCurrentState = dayInCurrentState;
    });
  }

  Container virtalSignFormCard(String heading, String hn) {
    return Container(
      width: 400,
      height: 420,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
        child: Card(
          child: Wrap(
            children: [
              ListTile(
                title: Text(
                  heading,
                  style: TextStyle(fontSize: 18),
                  textAlign: TextAlign.center,
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  margin: EdgeInsets.only(bottom: 5),
                  child: (() {
                    if (heading == 'แบบประเมินสัญญาณชีพ') {
                      return Column(
                        children: [
                          Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: AbsorbPointer(
                                absorbing: !_evaluationFormViewModel
                                    .disableVitalSignButton1(false),
                                child: VitalSignForm(
                                    hn: widget.hn,
                                    formTime: '02:00 น.',
                                    state: 'Post-op',
                                    dayInCurrentState: _getdayInCurrentState),
                              )),
                          Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: AbsorbPointer(
                                absorbing: !_evaluationFormViewModel
                                    .disableVitalSignButton2(false),
                                child: VitalSignForm(
                                    hn: widget.hn,
                                    formTime: '06:00 น.',
                                    state: 'Post-op',
                                    dayInCurrentState: _getdayInCurrentState),
                              )),
                          Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: AbsorbPointer(
                                absorbing: !_evaluationFormViewModel
                                    .disableVitalSignButton3(false),
                                child: VitalSignForm(
                                    hn: widget.hn,
                                    formTime: '10:00 น.',
                                    state: 'Post-op',
                                    dayInCurrentState: _getdayInCurrentState),
                              )),
                          Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: AbsorbPointer(
                                absorbing: !_evaluationFormViewModel
                                    .disableVitalSignButton4(false),
                                child: VitalSignForm(
                                    hn: widget.hn,
                                    formTime: '14:00 น.',
                                    state: 'Post-op',
                                    dayInCurrentState: _getdayInCurrentState),
                              )),
                          Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: AbsorbPointer(
                                absorbing: !_evaluationFormViewModel
                                    .disableVitalSignButton5(false),
                                child: VitalSignForm(
                                    hn: widget.hn,
                                    formTime: '18:00 น.',
                                    state: 'Post-op',
                                    dayInCurrentState: _getdayInCurrentState),
                              )),
                          Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: AbsorbPointer(
                                absorbing: !_evaluationFormViewModel
                                    .disableVitalSignButton6(false),
                                child: VitalSignForm(
                                    hn: widget.hn,
                                    formTime: '22:00 น.',
                                    state: 'Post-op',
                                    dayInCurrentState: _getdayInCurrentState),
                              )),
                        ],
                      );
                    }
                  }()),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container postHosDay0FormCard(String heading) {
    return Container(
      width: 400,
      height: 140,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Card(
          child: Wrap(
            children: [
              ListTile(
                title: Text(
                  heading,
                  style: TextStyle(fontSize: 18),
                  textAlign: TextAlign.center,
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  margin: EdgeInsets.only(bottom: 5),
                  child: (() {
                    if (heading ==
                        'แบบประเมินภาวะแทรกซ้อนระบบทางเดินหายใจ (Day0)') {
                      return AbsorbPointer(
                          absorbing: !_evaluationFormViewModel
                              .disableRespiratoryDay0Button(
                                  false), //true to disable the button
                          child: RespiratoryDay0Form(hn: widget.hn));
                    } else if (heading == 'แบบประเมินระบบปัสสาวะ') {
                      return AbsorbPointer(
                          absorbing: !_evaluationFormViewModel
                              .disableUrologyButton(false),
                          child: UrologyForm(hn: widget.hn));
                    } else if (heading ==
                        'แบบประเมินความพร้อมการฟื้นสภาพหลังผ่าตัด') {
                      return AbsorbPointer(
                          absorbing: !_evaluationFormViewModel
                              .disableRecoveryReadinessButton(false),
                          child: RecoveryReadinessForm(hn: widget.hn));
                    } else {
                      print('form not match');
                      return null;
                    }
                  }()),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container postHosDay1FormCard(String heading) {
    return Container(
      width: 400,
      height: 140,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Card(
          child: Wrap(
            children: [
              ListTile(
                title: Text(
                  heading,
                  style: TextStyle(fontSize: 18),
                  textAlign: TextAlign.center,
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  margin: EdgeInsets.only(bottom: 5),
                  child: (() {
                    if (heading == 'แบบประเมินการเกิดภาวะลิ่มเลือดอุดตัน') {
                      return AbsorbPointer(
                          absorbing: !_evaluationFormViewModel
                              .disableBloodClotButton(false),
                          child: BloodClotForm(hn: widget.hn));
                    } else if (heading ==
                        'แบบประเมินการจัดการแผลผ่าตัดและสายระบาย') {
                      return AbsorbPointer(
                          absorbing: !_evaluationFormViewModel
                              .disableDrainButton(false),
                          child: DrainForm(hn: widget.hn));
                    } else if (heading == 'แบบประเมินการจัดการภาวะโภชนาการ') {
                      return AbsorbPointer(
                          absorbing: !_evaluationFormViewModel
                              .disableNutritionButton(false),
                          child: NutritionForm(hn: widget.hn));
                    } else if (heading ==
                        'แบบประเมินภาวะแทรกซ้อนระบบทางเดินหายใจ') {
                      return AbsorbPointer(
                          absorbing: !_evaluationFormViewModel
                              .disableRespiratoryDay1Button(false),
                          child: RespiratoryDay1Form(hn: widget.hn));
                    } else {
                      print('form not match');
                      return null;
                    }
                  }()),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container postHosDay2FormCard(String heading) {
    return Container(
      width: 400,
      height: 140,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Card(
          child: Wrap(
            children: [
              ListTile(
                title: Text(
                  heading,
                  style: TextStyle(fontSize: 18),
                  textAlign: TextAlign.center,
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  margin: EdgeInsets.only(bottom: 5),
                  child: (() {
                    if (heading == 'แบบประเมินการฟื้นฟูระบบทางเดินอาหาร') {
                      return AbsorbPointer(
                          absorbing: !_evaluationFormViewModel
                              .disableDigestiveButton(false),
                          child: DigestiveForm(hn: widget.hn));
                    } else if (heading ==
                        'แบบประเมินการเฝ้าระวังภาวะแทรกซ้อน') {
                      return AbsorbPointer(
                          absorbing: !_evaluationFormViewModel
                              .disableInfectionButton(false),
                          child: InfectionForm(hn: widget.hn));
                    } else if (heading == 'แบบประเมินการฟื้นฟูสมรรถภาพของปอด') {
                      return AbsorbPointer(
                          absorbing: !_evaluationFormViewModel
                              .disablePulmanaryButton(false),
                          child: PulmanaryForm(hn: widget.hn));
                    } else {
                      print('form not match');
                      return null;
                    }
                  }()),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String dropdownValue = 'Post-Operation@Hospital';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView(
          children: [
            Column(
              children: <Widget>[
                SizedBox(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                    child: Container(
                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.white,
                          border: Border.all(color: Colors.black26)),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton(
                          isExpanded: true,
                          value: dropdownValue,
                          items: <String>[
                            'Pre-Operation',
                            'Post-Operation@Hospital',
                            'Post-Operation@Home'
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Center(
                                  child: Text(value,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: Color(0xFFC37447)))),
                            );
                          }).toList(),
                          onChanged: (String newValue) {
                            setState(() {
                              dropdownValue = newValue;

                              switch (newValue) {
                                case "Pre-Operation":
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              PreDashboardPage(hn: widget.hn)));
                                  break;
                                case "Post-Operation@Hospital":
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              PostHosDashboardPage(
                                                  hn: widget.hn)));
                                  break;
                                case "Post-Operation@Home":
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              PostHomeDashboardPage(
                                                  hn: widget.hn)));
                                  break;
                              }
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(child: PostHosPatientDetail()),
                SizedBox(
                  height: 500,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Card(
                      child: Scrollbar(
                        isAlwaysShown: false,
                        controller: controller,
                        child: ListView(
                          controller: controller,
                          scrollDirection: Axis.horizontal,
                          children: <Widget>[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Text(
                                    'แบบประเมิน',
                                    style: TextStyle(
                                        fontSize: 18, color: Color(0xFFC37447)),
                                  ),
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Column(
                                          children: [
                                            virtalSignFormCard(
                                                'แบบประเมินสัญญาณชีพ',
                                                widget.hn),
                                          ],
                                        ),
                                        (() {
                                          print("Day: $_getdayInCurrentState");
                                          if (dayInCurrentState == 0) {
                                            return Column(
                                              children: [
                                                postHosDay0FormCard(
                                                    'แบบประเมินความพร้อมการฟื้นสภาพหลังผ่าตัด'),
                                                postHosDay0FormCard(
                                                    'แบบประเมินภาวะแทรกซ้อนระบบทางเดินหายใจ (Day0)'),
                                                postHosDay0FormCard(
                                                    'แบบประเมินระบบปัสสาวะ'),
                                              ],
                                            );
                                          } else if (dayInCurrentState == 1) {
                                            return Column(
                                              children: [
                                                Row(
                                                  children: [
                                                    postHosDay1FormCard(
                                                        'แบบประเมินภาวะแทรกซ้อนระบบทางเดินหายใจ'),
                                                    postHosDay1FormCard(
                                                        'แบบประเมินการจัดการแผลผ่าตัดและสายระบาย'),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    postHosDay1FormCard(
                                                        'แบบประเมินการจัดการภาวะโภชนาการ'),
                                                    postHosDay1FormCard(
                                                        'แบบประเมินการเกิดภาวะลิ่มเลือดอุดตัน'),
                                                  ],
                                                ),
                                              ],
                                            );
                                          } else if (dayInCurrentState != 1 &&
                                              dayInCurrentState != 0) {
                                            return Column(
                                              children: [
                                                postHosDay2FormCard(
                                                    'แบบประเมินการฟื้นฟูระบบทางเดินอาหาร'),
                                                postHosDay2FormCard(
                                                    'แบบประเมินการเฝ้าระวังภาวะแทรกซ้อน'),
                                                postHosDay2FormCard(
                                                    'แบบประเมินการฟื้นฟูสมรรถภาพของปอด')
                                              ],
                                            );
                                          }
                                        }())
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  child: ShowDashboard(patientstate: 'Post-Operation@Hospital'),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
