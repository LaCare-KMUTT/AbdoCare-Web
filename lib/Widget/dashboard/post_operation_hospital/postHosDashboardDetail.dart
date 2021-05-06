import 'package:AbdoCare_Web/Widget/dashboard/post_operation_hospital/postHosDashboardPatientDetail.dart';
import 'package:AbdoCare_Web/Widget/dashboard/state_dropdown.dart';
import 'package:AbdoCare_Web/Widget/shared/progress_bar.dart';
import 'package:AbdoCare_Web/services/interfaces/firebase_service_interface.dart';
import 'package:AbdoCare_Web/services/service_locator.dart';
import 'package:AbdoCare_Web/view_models/evaluate_form/evaluationFormButton_view_model.dart';
import 'package:AbdoCare_Web/view_models/evaluate_form/evaluation_view_model.dart';
import 'package:flutter/material.dart';
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
  final EvaluationViewModel _evaluationViewModel =
      locator<EvaluationViewModel>();
  var _getdayInCurrentState;
  var dayInCurrentState;
  var patientState;
  @override
  void initState() {
    super.initState();
    initData();
  }

  initData() async {
    dayInCurrentState =
        await _firebaseService.getDayInCurrentState(hn: widget.hn);
    patientState = await _firebaseService.getPatientState(hn: widget.hn);
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
                      child: Dropdown(
                          dropdownValue: 'Post-Operation@Hospital',
                          hn: widget.hn)),
                ),
                SizedBox(
                    child: PostHosPatientDetail(
                  hn: widget.hn,
                )),
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
                                FutureBuilder<Map<String, Widget>>(
                                    future: _evaluationViewModel.getevaluations(
                                        context,
                                        widget.hn,
                                        "Post-Operation@Hospital"),
                                    builder: (context, snapshot) {
                                      if (!snapshot.hasData) {
                                        return ProgressBar
                                            .circularProgressIndicator(context);
                                      }
                                      return Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
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
                                              snapshot.data['mustShow'],
                                            ],
                                          ),
                                        ],
                                      );
                                    }),
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
