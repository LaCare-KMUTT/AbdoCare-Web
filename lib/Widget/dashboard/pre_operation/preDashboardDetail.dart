import 'package:AbdoCare_Web/Widget/dashboard/state_dropdown.dart';
import 'package:AbdoCare_Web/Widget/shared/progress_bar.dart';
import 'package:AbdoCare_Web/services/interfaces/firebase_service_interface.dart';
import 'package:AbdoCare_Web/view_models/evaluate_form/evaluation_view_model.dart';
import 'package:flutter/material.dart';
import '../../../services/service_locator.dart';
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

  final EvaluationViewModel _evaluationViewModel =
      locator<EvaluationViewModel>();
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
                                FutureBuilder<Map<String, Widget>>(
                                    future: _evaluationViewModel.getevaluations(
                                        context, widget.hn, "Pre-Operation"),
                                    builder: (context, snapshot) {
                                      if (!snapshot.hasData) {
                                        return ProgressBar
                                            .circularProgressIndicator(context);
                                      }
                                      return Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              width: 400,
                                              height: 420,
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      30, 10, 30, 10),
                                              child: Card(
                                                child: Column(
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              10.0),
                                                      child: Text(
                                                        "แบบประเมินสัญญาณชีพ",
                                                        style: TextStyle(
                                                            fontSize: 18),
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                    ),
                                                    snapshot
                                                        .data['vitalSignShow'],
                                                  ],
                                                ),
                                              ),
                                            ),
                                            snapshot.data['mustShow'],
                                          ]);
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
                  child: ShowDashboard(
                      patientstate: 'Pre-Operation', hn: widget.hn),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
