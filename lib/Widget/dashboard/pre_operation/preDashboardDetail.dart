import 'package:AbdoCare_Web/Widget/dashboard/state_dropdown.dart';
import 'package:AbdoCare_Web/services/interfaces/firebase_service_interface.dart';
import 'package:flutter/material.dart';

import '../../../services/service_locator.dart';
import '../../../view_models/evaluate_form/evaluationFormButton_view_model.dart';
import '../../evaluationForms/post-hos/vital_sign_form.dart';
import '../../evaluationForms/previsitForm/generalForm/generalForm.dart';
import '../dashboardGraph.dart';
import 'preDashboardPatientDetail.dart';

class PreDashboardDetail extends StatefulWidget {
  final String hn;
  PreDashboardDetail({Key key, @required this.hn}) : super(key: key);
  @override
  _PreDashboardDetailState createState() => _PreDashboardDetailState();
}

class _PreDashboardDetailState extends State<PreDashboardDetail> {
  final ScrollController controller = ScrollController();
  final _firebaseService = locator<IFirebaseService>();
  final EvaluationFormViewModel _evaluationFormViewModel =
      locator<EvaluationFormViewModel>();
  var patientState;
  @override
  void initState() {
    super.initState();
    initData();
  }

  initData() async {
    patientState = await _firebaseService.getPatientState(hn: widget.hn);
    print(' patientState: $patientState');
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
                                    state: 'Pre-Operation'),
                              )),
                          Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: AbsorbPointer(
                                absorbing: !_evaluationFormViewModel
                                    .disableVitalSignButton2(false),
                                child: VitalSignForm(
                                    hn: widget.hn,
                                    formTime: '06:00 น.',
                                    state: 'Pre-Operation'),
                              )),
                          Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: AbsorbPointer(
                                absorbing: !_evaluationFormViewModel
                                    .disableVitalSignButton3(false),
                                child: VitalSignForm(
                                    hn: widget.hn,
                                    formTime: '10:00 น.',
                                    state: 'Pre-Operation'),
                              )),
                          Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: AbsorbPointer(
                                absorbing: !_evaluationFormViewModel
                                    .disableVitalSignButton4(false),
                                child: VitalSignForm(
                                    hn: widget.hn,
                                    formTime: '14:00 น.',
                                    state: 'Pre-Operation'),
                              )),
                          Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: AbsorbPointer(
                                absorbing: !_evaluationFormViewModel
                                    .disableVitalSignButton5(false),
                                child: VitalSignForm(
                                    hn: widget.hn,
                                    formTime: '18:00 น.',
                                    state: 'Pre-Operation'),
                              )),
                          Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: AbsorbPointer(
                                absorbing: !_evaluationFormViewModel
                                    .disableVitalSignButton6(false),
                                child: VitalSignForm(
                                    hn: widget.hn,
                                    formTime: '22:00 น.',
                                    state: 'Pre-Operation'),
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

  Container preVisitFormCard(String heading) {
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
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    width: double.infinity,
                    margin: EdgeInsets.only(left: 10, right: 10, bottom: 5),
                    child: RaisedButton(
                      padding: EdgeInsets.fromLTRB(40, 15, 40, 15),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                      textColor: Colors.black,
                      color: Color(0xFFEBEBEB),
                      child: Text('แบบประเมิน', style: TextStyle(fontSize: 15)),
                      onPressed: () {
                        print('$heading : ${widget.hn}');
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => GeneralForm(
                                hn: widget.hn,
                              ),
                            ));
                      },
                    ),
                  ),
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
                          dropdownValue: 'Pre-Operation', hn: widget.hn)),
                ),
                SizedBox(
                  child: PrePatientDetail(
                    hn: widget.hn,
                  ),
                ),
                SizedBox(
                  height: 500,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
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
                                        Column(
                                          children: [
                                            preVisitFormCard(
                                                'แบบประเมิน Pre-Visit'),
                                          ],
                                        ),
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
                  child: ShowDashboard(patientstate: 'Pre-Operation'),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
